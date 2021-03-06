<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CS Jobs - Reviewer</title>
</head>
<body>
<h2>CS Jobs (Exam Edition)</h2>

<p>You are logged in as <em><security:authentication property="principal.name" /></em>.</p>
<form action="<c:url value='/logout' />" method="post">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
  <input name="submit" type="submit" value="Logout" />
</form>
<p>
  <security:authorize access="hasRole('ROLE_ADMIN')">
    [<a href="<c:url value='/admin.html' />">Admin Home</a>]
  </security:authorize>
  <security:authorize access="hasRole('ROLE_REVIEWER')">
    [Reviewer Home]
  </security:authorize>
    [<a href="<c:url value='/applicant.html' />">Applicant Home</a>]
</p>

<table border='1'>

<c:forEach items="${reviewerJobs}" var="reviewerJobs">
<tr><td><a href="<c:url value='/reviewer/applications.html?id=${reviewerJobs.id}' />">${reviewerJobs.title}</a></td>
<td><a href="<c:url value='/reviewer/applications.html?id=${reviewerJobs.id}&roundId=0' />">Round 1</a></td>
<td><a href="<c:url value='/reviewer/applicationsr2.html?id=${reviewerJobs.id}&roundId=1' />">Round 2</a></td>
<td><a href="<c:url value='/reviewer/applicationsr3.html?id=${reviewerJobs.id}&roundId=2' />">Round 3</a></td></tr>
		</c:forEach></table>



<table border='1'>
<c:forEach items="${reviewerJobs}" var="reviewerJobs">
<%-- <p>Chair: ${reviewerJobs.committeeChair.email}</p>
<p>${authenticatedUser.email}</p> --%>

<c:if test="${reviewerJobs.committeeChair.email eq authenticatedUser.email}">

Jobs you are chair in!
<tr><td><a href="<c:url value='/reviewer/chairview.html?id=${reviewerJobs.id}' />">${reviewerJobs.title}</a></td>
<td><a href="<c:url value='/reviewer/chairview.html?id=${reviewerJobs.id}&roundId=0' />">Round 1</a></td>
<td><a href="<c:url value='/reviewer/chairviewr2.html?id=${reviewerJobs.id}&roundId=1' />">Round 2</a></td>
<td><a href="<c:url value='/reviewer/chairviewr3.html?id=${reviewerJobs.id}&roundId=2' />">Round 3</a></td></tr>
</c:if>
		</c:forEach></table>

</body>
</html>
