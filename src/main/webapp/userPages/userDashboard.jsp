<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.lang.*, dao.Test"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Dashboard</title>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f2f2f2;
	background-color: #ffffff;
}

header {
	background-color: #92afd7    ;
	color: #fff;
	padding: 10px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}
h1{
	color:#1e2a5e  ;
}

header h1 {
	margin: 0;
}

.header-buttons {
	display: flex;
	align-items: center;
	justify-content: flex-end;
	flex-grow: 1;
}

#displaymsg{
	font-size: 20px;
}

.header-buttons a {
	color: #fff;
	text-decoration: none;
	padding: 5px 10px;
	margin-left: 10px;
	border: 1px solid #fff;
	border-radius: 5px;
}

.header-buttons a:hover {
	background-color: #1e2a5e ;
	color: #fff;
	border: 1px solid #fff  ;
	border-radius: 5px;
}

.container {
	background-color: lightgray;
	width: 80vw;
	margin: 80px auto 20px;
	padding: 20px;
	background-color: #f2f2f2;
	border-radius: 10px;
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	border: 1px solid #ddd;
	border: 1px solid darkgray;
	padding: 8px;
	text-align: left;
}

th {
	background-color: #333;
	color: #fff;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

.btn {
	padding: 6px 10px;
	background-color: #3a6d8c  ;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	border: 1px solid #fff;
	
}

.logout-btn {
	padding: 6px 10px;
	background-color: #3a6d8c   ;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.btn:hover {
	background-color: #1e2a5e ;
	border: 1px solid #fff;
	color:#fff;
}

.btn:disabled {
	cursor: none !important;
	opacity: 0.6;
}

.modal {
	display: none;
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
	backdrop-filter: blur(5px);
	-webkit-backdrop-filter: blur(5px);
	padding-top: 60px; /* Space for close button */
}

.modal-content {
	background-color: #fefefe;
	margin: 10% auto;
	padding: 20px;
	border: 1px solid #888;
	width: 50%;
    border-radius: 10px; /* Rounded corners */
    box-shadow: 0 0 10px rgba(0,0,0,0.3); /* Box shadow */
    max-width: 600px; /* Max width */
}

.close-button {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
}

.close-button:hover, .close-button:focus {
	color: black;
	text-decoration: none;
	cursor: pointer;
}

#testInstructionsList {
            margin-bottom: 20px;
        }



</style>
</head>
<body>
	<%
	HttpSession session2 = request.getSession(false);
	if (session2 != null && session2.getAttribute("user_id") != null) {
		int user_id = (int) session2.getAttribute("user_id");
		String name = (String) session2.getAttribute("name");
		ArrayList<Test> tests = (ArrayList<Test>) request.getAttribute("tests");
		ArrayList<String> allTopics = (ArrayList<String>) request.getAttribute("allTopics");
		ArrayList<String> allLang = (ArrayList<String>) request.getAttribute("allLang");
	%>

	<header>
		<h1>
			Welcome,
			<%=name%>!
		</h1>
		<div class="header-buttons">
		
			<a href="/mind_gauge/UserProfile"> My Profile</a> 
			<a href="/mind_gauge/Logout" onclick="return confirmLogout();"
				class="logout-btn">Logout</a>
		</div>
	</header>

	<div class="container">
		<h2>Take your Test</h2>
		
		<div style="margin-bottom: 10px;">
		<form action="/mind_gauge/FilterTest" method="post">
	
            <input type="hidden" id="person" name="person" value="user" >
			<label for="languageSelect">Select Language:</label> <select id="languageSelect" name="languageSelect">
			<option value="all" selected>All</option>
			<% 
				for(String lang: allLang){
			%>
				<option value = "<%= lang%>"> <%= lang%>  </option>
			<%
				}
			%>
			
			</select> <label for="topicSelect" style="margin-left: 10px;">Select Topic:</label> <select id="topicSelect" name="topicSelect">
			<option value="all" selected>All</option>
			
			<% 
				for(String topic: allTopics){
			%>
				<option value = "<%= topic%>"> <%= topic%>  </option>
			<%
				}
			%>
			</select>
			<label for="DifficultyLevel" style="margin-left: 10px;">Select Difficulty Level:</label> <select id="DifficultyLevel" name="DifficultyLevel">
			<option value="all" selected>All</option>
			<option value = "easy"> Easy </option>
			<option value = "medium"> Medium  </option>
			<option value = "hard"> Hard </option>
			</select>

			<button class="btn" onclick="searchTests()" style="margin-left: 15px;">Search</button>
			</form>
		</div>
		
		<%
		if (tests.size() != 0) {
		%>
		
		<table>
			<tr>
				<th>S. No</th>
				<th>Tag</th>
				<th>No of Questions</th>
				<th>Language</th>
				<th>Topic</th>
				<th>Difficulty Level</th>
				<th>Action</th>
			</tr>
			<%
			int serialNumber = 1;
			for (Test test : tests) {
			%>
			<tr>
				<td><%=serialNumber++%></td>
				<td><%=test.getTestTag()%></td>
				<td><%=test.getNoOfQuestions()%></td>
				<td><%=test.getLang()%></td>
				<td><%=test.getTopic()%></td>
				<td><%=test.getLevel() %></td>
				<td>
					<button class="btn"
						onclick="showTestInstructions(<%=test.getTestId()%>, <%=test.getNoOfQuestions()%>)">Take
						Test</button>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<%
		} else {
		%>

		<p id = "displaymsg">No tests available.</p>

		<%
		}
		%>
	</div>

	<%
	} else{
	response.sendRedirect("/mind_gauge/userPages/userLogin.jsp");
	}
	%>

	<div id="testInstructionsModal" class="modal">
		<div class="modal-content">
			<span class="close-button" onclick="closeTestInstructionsModal()">&times;</span>
			<h2 style="padding-left: 15px;" > Test Instructions</h2>
			<ul id="testInstructionsList"></ul>
			<label> <input type="checkbox"
				id="termsAndConditionsCheckbox"> I have read and agreed with
				the terms and conditions provided.
			</label>
			<button class="btn" id="takeTestButton" disabled>Take Test</button>
		</div>
	</div>

	<script>

   
    function generateTestInstructions() {
        const instructions = [
            "You must maintain a professional and ethical conduct throughout the test.",
        	"Avoid any external aids or resources while taking the test to maintain integrity.",
        	"Double-check your answers before submitting to ensure accuracy.",
            "Please ensure that you grant access to your webcam for the test.",
            "You are required to take the test in fullscreen mode.",
            "Excessive switching between tabs during the test will result in failure.",
			"Notify the administrator immediately if you encounter any technical issues.",
			"Double-check your answers before submitting to ensure accuracy.",
			"Respect the confidentiality and security of the test content."
        ];
        return instructions;
    }   
   
    function showTestInstructions(testId, quesNum) {

    	const testInstructions = generateTestInstructions();

        const modal = document.getElementById("testInstructionsModal");
        const instructionsList = document.getElementById("testInstructionsList");
        instructionsList.innerHTML = "";

        testInstructions.forEach(instruction => {
            const li = document.createElement("li");
            li.textContent = instruction;
            instructionsList.appendChild(li);
        });

        modal.style.display = "block";

        const termsCheckbox = document.getElementById("termsAndConditionsCheckbox");
        const takeTestButton = document.getElementById("takeTestButton");

        termsCheckbox.addEventListener("change", () => {
            takeTestButton.disabled = !termsCheckbox.checked;
        });
        
        document.getElementById("takeTestButton").addEventListener("click", ()=>{
        	document.requestFullscreen()
        	.then(()=>{ startTest(testId, quesNum) })
        	.catch((e) => console.log(e));
        })

       	takeTestButton.addEventListener("click", () => {
            startTest(testId, quesNum);
        });
    }
   
    //-----------------------------------------------------------------------------------

    function closeTestInstructionsModal() {
        document.getElementById("testInstructionsModal").style.display = "none";
    }

    function startTest(testId, quesNum) {
        window.location.href = "/mind_gauge/TestLive?test_id=" + testId + "&ques_num=" + quesNum;
    }

    function confirmLogout() {
        return confirm("Do you want to log out?");
    }
	
	document.addEventListener("dblclick", ()=>{
		document.documentElement.requestFullscreen()
        .then(() => {
            console.log("Full-screen mode enabled.");
        })
        .catch((e) => console.log("Error enabling full-screen mode:", e));
	})
</script>

</body>
</html>
