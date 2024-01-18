
//add to cart
function add_to_cart(pid, pname, price) {

	let cart = localStorage.getItem("cart");

	if (cart == null) {
		//no cart yet
		let products = [];

		let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price }

		products.push(product);

		localStorage.setItem("cart", JSON.stringify(products));
		//console.log("product added firts time.")
		showToast("Item is added to cart!")
	} else {
		// cart is already present
		let pcart = JSON.parse(cart);
		let oldProduct = pcart.find((item) => item.productId == pid)

		if (oldProduct) {
			// only we have to incrementquantity
			oldProduct.productQuantity = oldProduct.productQuantity + 1;
			pcart.map((item) => {
				if (item.productId == oldProduct.productId) {

					item.productQuantity = oldProduct.productQuantity;
				}
			})
			localStorage.setItem("cart", JSON.stringify(pcart));
			//console.log("product quantity increased.")
			showToast(oldProduct.productName + " quantity increased!")
		} else {
			let product = { productId: pid, productName: pname, productQuantity: 1, productPrice: price }
			pcart.push(product)
			localStorage.setItem("cart", JSON.stringify(pcart));

			//console.log("product is added.")
			showToast("product is added!")
		}

	}

	updateCart();
}



//update cart

function updateCart() {
	let cartString = localStorage.getItem("cart");
	let cart = JSON.parse(cartString);

	if (cart == null || cart.length == 0) {
		console.log("Cart is empty !!")

		$(".cart-items").html("( 0 )");

		$(".cart-body").html("<h3>Cart does not have any items </h3>");
		$(".checkout-btn").attr('disabled', true)

	} else {

		console.log(cart)
		$(".cart-items").html(`( ${cart.length} )`);

		let table = `

      <table class='table  table-light'>

      <thead class='thead-light'>
        <tr>
          <th scope='col'> Item Name </th>
          <th scope='col'> Price </th>
          <th scope='col'> Quantity </th>
          <th scope='col'> Total Price </th>
          <th scope='col'> Action</th>

        </tr>
      </thead>


    `;

		let totalPrice = 0;
		cart.map((item) => {

			table += `

        <tr>
          <td> ${item.productName} </td>
          <td> ${item.productPrice} </td>
          <td> ${item.productQuantity} </td>
          <td> ${item.productQuantity * item.productPrice} </td>
          <td> <button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'>Remove</button> </td>
        </tr>

      `
			totalPrice += item.productPrice * item.productQuantity;
		})

		table = table + `
        <tr> <th colspan='5' class='text-right font-weight-bold m-5'> Total Price: ${totalPrice}</th> </tr>
        </table>`

		if (sessionStorage.getItem("loggedIn") === "false") {
			// User is logged out, empty the cart
			$(".cart-items").html("( 0 )");
			$(".cart-body").html("<h3>Cart does not have any items </h3>");
			$(".checkout-btn").attr('disabled', true);
		} else {
			// User is logged in, display cart items
			$(".cart-body").html(table);
			$(".checkout-btn").attr('disabled', false);
		}
	}
}


function deleteItemFromCart(pid) {
	let cart = JSON.parse(localStorage.getItem('cart'));

	// Find the index of the item to be removed
	const index = cart.findIndex((item) => item.productId == pid);

	if (index !== -1) {
		// Remove the item from the cart array
		cart.splice(index, 1);

		// Update localStorage with the new cart array
		localStorage.setItem('cart', JSON.stringify(cart));

		// Update the cart display
		updateCart();

		showToast('Item is removed from cart!');
	}
}

$(document).ready(function() {

	updateCart();

})

// toggle password
function togglePasswordVisibility() {
	var password = document.getElementById("password");
	if (password.type === "password") {
		password.type = "text";
	} else {
		password.type = "password";
	}
}

// toast message
function showToast(content) {
	$("#toast").addClass("display")
	$("#toast").html(content)

	setTimeout(() => {

		$("#toast").removeClass("display")

	}, 2000);
}

// place order function

function goToPlaceOrder() {
	window.location = "placeorder.jsp";
}
function goToCategory() {
	window.location = "home.jsp";
}
function goToPayment() {
	window.location = "payment.jsp";
}

// slideshow function
var index = 0;
showSlides();

function showSlides() {
	var i;
	var slides = document.getElementsByClassName("slides");
	for (i = 0; i < slides.length; i++) {
		slides[i].style.opacity = "0";
	}
	index++;
	if (index > slides.length) { index = 1 }
	slides[index - 1].style.opacity = "1";
	setTimeout(showSlides, 3000); // Change image every 5 seconds
}
















