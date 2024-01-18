<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Baby Name Suggestion</title>
<%@include file="components/common_CSS_JS.jsp"%>


</head>
<body>
	<%@include file="components/navbar.jsp"%>

	<div class="container text-center">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card mt-3">
					<div style="display: flex; justify-content: center;"
						class="custom-bg">
						<h1>Baby Name Suggestion</h1>

					</div>

					<div class="card-body">

						<form onsubmit="suggestNames(); return false;">
							<div class="mb-3">
								<label for="birthDate" class="form-label">Birth Date:</label> <input
									type="date" id="birthDate" name="birthDate">
							</div>
							<div class="mb-3">
								<label for="birthTime" class="form-label">Birth Time:</label> <input
									type="time" id="birthTime" name="birthTime">
							</div>
							<button type="submit" class="btn btn-primary custom-bg border-0">Suggest
								Names</button>
						</form>
						<div class="container mt-3 mb-3">
							<ul type="circle" id="nameList" style="max-height: 100%;">
						</ul>
						</div>
						
					</div>

				</div>
			</div>
		</div>
	</div>
	<script>
		function suggestNames() {
			// Get the user's birth date and time
			var birthDate = document.getElementById("birthDate").value;
			var birthTime = document.getElementById("birthTime").value;

			// Calculate the user's zodiac sign based on their birth date
			var date = new Date(birthDate + "T" + birthTime);
			var month = date.getMonth();
			var day = date.getDate();
			var zodiacSign;

			if ((month == 11 && day >= 22) || (month == 0 && day <= 19)) {
				zodiacSign = "Capricorn";
			} else if ((month == 0 && day >= 20) || (month == 1 && day <= 18)) {
				zodiacSign = "Aquarius";
			} else if ((month == 1 && day >= 19) || (month == 2 && day <= 20)) {
				zodiacSign = "Pisces";
			} else if ((month == 2 && day >= 21) || (month == 3 && day <= 19)) {
				zodiacSign = "Aries";
			} else if ((month == 3 && day >= 20) || (month == 4 && day <= 20)) {
				zodiacSign = "Taurus";
			} else if ((month == 4 && day >= 21) || (month == 5 && day <= 20)) {
				zodiacSign = "Gemini";
			} else if ((month == 5 && day >= 21) || (month == 6 && day <= 22)) {
				zodiacSign = "Cancer";
			} else if ((month == 6 && day >= 23) || (month == 7 && day <= 22)) {
				zodiacSign = "Leo";
			} else if ((month == 7 && day >= 23) || (month == 8 && day <= 22)) {
				zodiacSign = "Virgo";
			} else if ((month == 8 && day >= 23) || (month == 9 && day <= 22)) {
				zodiacSign = "Libra";
			} else if ((month == 9 && day >= 23) || (month == 10 && day <= 21)) {
				zodiacSign = "Scorpio";
			} else if ((month == 10 && day >= 22) || (month == 11 && day <= 21)) {
				zodiacSign = "Sagittarius";
			}

			// Suggest names based on the user's zodiac sign

			var names;
			if (zodiacSign == "Capricorn") {
				names = [ "Aarav", "Aryan", "Advait", "Jagadeesh", "Jagrav", "Jaishankar", "Kamran", "Khailash", "Khsitij", "Jaganmohini",
					      "Jagati", "Jagruti", "Jamuna", "Janaki", "Khyati", "Khushmita"];
			} else if (zodiacSign == "Aquarius") {
				names = [ "Gagan", "Garvik", "Gaurang", "Gaurav", "Gautham", "Saarth", "Sachin", "Sachit", "Sahil",
					"Sahishnu", "Saish", "Saksham", "Samarvir"];
			} else if (zodiacSign == "Pisces") {
				names = [ "Chaitanya", "Chanakya", "Charvik", "Daksh", "Daivat", "Dakshith",
					"Darpit", "Chaitali", "Chaitravi", "Charu", "Daksha", "Danvi", "Darshi", "Thanishka", "Tharunika", "Thejal", "Thrisha"];
			} else if (zodiacSign == "Aries") {
				names = [ "Aryan", "Aarav", "Aarush", "Ansh", "Abha", "Adhira", "Aadvika", "Aravi", "Aarti", "Astha", "Ekanshi", "Eshanika", "Ishank", "Lavesh", "Lavin", "Lavit", "Lavyansh",
						"Luv", "Lokesh"];
			} else if (zodiacSign == "Taurus") {
				names = [ "Baadal", "Baala", "Baani", "Babita", "Ubika", "Ucchal",
						"Uchit", "Udai", "Udantika", "Udayan", "Udaybhan"];
			} else if (zodiacSign == "Gemini") {
				names = [ "Ghanish", "Kairav", "Kajish", "Kalp", "Kalpak", "Kanav",
						"Chhaya", "Ghanavi", "Ghanika", "Ghehna", "Kajal"];
			} else if (zodiacSign == "Cancer") {
				names = [ "Dakshya", "Darshik", "Deekshant", "Deepak", "Hansal", "Hansraj",
						"Hardik", "Hari", "Debisha", "Deekshita", "Hansika", "Harali", "Harika"];
			} else if (zodiacSign == "Leo") {
				names = [ "Manish", "Maahir", "Madhav", "Mahesh", "Tarak", "Tarun",
						"Tejaswi", "Maalini", "Madhavi", "Muskan", "Mahek", "Tanisha", "Tanushri"];
			} else if (zodiacSign == "Virgo") {
				names = [ "Padmakar", "Panav", "Pankaj", "Paramdeep", "Shankar", "Sharad",
						"Sharan", "Padmini", "Pallavi", "Pankaja", "Shakshi", "Shalini", "Shamika", "Sharadini"];
			} else if (zodiacSign == "Libra") {
				names = [ "Raghav", "Raghu", "Rajdeep", "Rajesh", "Raju", "Taarush",
						"Tanmay", "Tejas", "Rekha", "Reshma", "Richa", "Rihana", "Tanima", "Tripti"];
			} else if (zodiacSign == "Scorpio") {
				names = [ "Nalin", "Naman", "Nachiket", "Yaksh", "Nainika", "Naisha",
						"Navya", "Yasmita", "Yojana", "Yukthi", "Nalin", "Naman", "Nachiket", "Yaksh", "Nainika", "Naisha" ];
			} else if (zodiacSign == "Sagittarius") {
				names = [ "Bhairav", "Bhanu", "Bharat", "Dherya", "Dhikshit", "Dhishan",
						"Falgun", "Bhadrakali", "Dhanyasree", "Dharmavati", "Dharshika", "Falguni", "Fenna", "Dhruti" ];
			}

			//Display the name suggestions in the HTML document
			var nameList = document.getElementById("nameList");
			nameList.innerHTML = ""; // Clear any previous suggestions
			nameList.innerHTML += "<b>Zodiac Sign: " + zodiacSign + "</b>"
			for (var i = 0; i < names.length; i++) {
				nameList.innerHTML += "<li>" + names[i] + "</li>";
			}
		}
	</script>
	<%@include file="components/common_modal.jsp"%>
	<%@include file="components/common_modal2.jsp"%>
</body>
</html>