import ru.credit.calculator.library.application.Calculator;
import ru.credit.calculator.library.model.Credit;
import ru.credit.calculator.library.model.InitialParameters;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.time.YearMonth;
import java.util.List;

public class ParameterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        HttpSession session = request.getSession();

        InitialParameters parameter = (InitialParameters) session.getAttribute("parameter");
        String modelCredit = request.getParameter("model");
        BigDecimal loanSum = new BigDecimal(request.getParameter("sum"));
        BigDecimal numberOfPeriods = new BigDecimal(request.getParameter("period"));
        BigDecimal interestRate = new BigDecimal(request.getParameter("rate"));
        YearMonth date = YearMonth.parse(request.getParameter("date"));


        //http://localhost:8080//parameter?model=authentic&sum=120000&period=12&rate=7.9&date=2020-07


        parameter = new InitialParameters();
        parameter.setModelCredit(modelCredit);
        parameter.setLoanSum(loanSum);
        parameter.setNumberOfPeriods(numberOfPeriods);
        parameter.setInterestRate(interestRate);
        parameter.setDate(date);
        System.out.println(parameter);


        List<Credit> credits = Calculator.calculateSchedule(parameter);
        session.setAttribute("parameter", parameter);
        session.setAttribute("credits", credits);
        getServletContext().getRequestDispatcher("/parameter.jsp").forward(request, response);
    }

}
