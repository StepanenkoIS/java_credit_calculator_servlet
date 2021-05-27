<%@ page import="java.util.Date" %>
<%@ page import="ru.credit.calculator.library.model.InitialParameters" %>
<%@ page import="ru.credit.calculator.library.model.Credit" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <title>InitialParameters</title>
</head>
<body>
<%=new Date().toString()%>

<%
            InitialParameters parameter =  new InitialParameters();
            parameter = (InitialParameters) session.getAttribute("parameter");
%>

<p><%="Модель кредита: " + parameter.getModelCredit()%></p>
<p><%="Первоначальная сумма кредита: " + parameter.getLoanSum() + " руб."%></p>
<p><%="Срок кредита: " + parameter.getNumberOfPeriods() + " мес."%></p>
<p><%="Годовая процентная ставка: " + parameter.getInterestRate() + " %"%></p>
<p><%="Дата платежа: " + parameter.getDate()%></p>

<p><a href="parameter">Назад</a></p>

<table border="1" width="50%" cellpadding="5">
    <tr>
        <th>номер платежа</th>
        <th>дата платежа</th>
        <th>сумма платежа</th>
        <th>сумма на погашение основного долга</th>
        <th>сумма на погашение процентов</th>
        <th>остаток задолженностив</th>
    </tr>
<%
        List<Credit> credits = new ArrayList<Credit>();
        credits = (List<Credit>) session.getAttribute("credits");
        for (int i = 0; i < credits.size(); i++) {%>
    <tr>
    <th><%=credits.get(i).getIndex()%></th>
    <th><%=credits.get(i).getDate()%></th>
    <th><%=credits.get(i).getPayment()%></th>
    <th><%=credits.get(i).getRepayment()%></th>
    <th><%=credits.get(i).getRepaymentRate()%></th>
    <th><%=credits.get(i).getOutstandingBalance()%></th>
    </tr>
<%}%>
</table>


</body>
</html>
