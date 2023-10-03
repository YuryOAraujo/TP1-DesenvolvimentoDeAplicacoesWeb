package yoa.cardiology.hospital.logic;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Random;

import com.itextpdf.io.image.ImageData;
import com.itextpdf.io.image.ImageDataFactory;
import com.itextpdf.io.source.ByteArrayOutputStream;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Image;
import com.itextpdf.layout.element.Paragraph;

import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import yoa.cardiology.hospital.dao.ExamDAO;
import yoa.cardiology.hospital.model.Doctor;
import yoa.cardiology.hospital.model.Exam;
import yoa.cardiology.hospital.utilities.ExamStatus;

public class PerformExam implements Logic{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    Long id = Long.parseLong(request.getParameter("id"));
	    String url = "performExamList.jsp";
	    ExamDAO examDAO = new ExamDAO();
	    Exam exam = examDAO.obtainExamById(id);
	    if (exam != null) {
	        generatePDF(exam, request);
	        exam.setStatus(ExamStatus.WAITING_REPORT.toString());
	        examDAO.update(exam);
	        request.setAttribute("successMessage", "O Exame foi realizado com sucesso!");
	    }
	    return url;
	}


	private void generatePDF(Exam exam, HttpServletRequest request) throws java.io.IOException {
	    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
	    PdfWriter writer = new PdfWriter(byteArrayOutputStream);
	    PdfDocument pdf = new PdfDocument(writer);
	    Document document = new Document(pdf);

	    document.add(new Paragraph("Paciente: " + exam.getPatientCpf()));
	    document.add(new Paragraph("Exam Type: " + exam.getExamType()));
	    document.add(new Paragraph("Hipótese: " + exam.getHypothesis()));
	    SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
	    String formattedDate = dateFormat.format(exam.getDateRequested().getTime());
	    document.add(new Paragraph("Data Prevista: " + formattedDate));

	    Calendar currentDate = Calendar.getInstance();
	    exam.setDatePerformed(currentDate);

	    formattedDate = dateFormat.format(currentDate.getTime());
	    document.add(new Paragraph("Exame Realizado em: " + formattedDate));

	    HttpSession session = request.getSession();
	    Doctor sessionDoctor = (Doctor) session.getAttribute("doctor");
	    if (sessionDoctor != null) {
	        document.add(new Paragraph("Médico: " + sessionDoctor.getCrm()));
	    }

	    ServletContext context = request.getServletContext();
	    String relativePath = "/images/" + exam.getExamType() + "/" + generateRandomNumber(1, exam.getExamType().equals("eletrocardiograma") ? 9 : 10) + ".jpg";
	    String absolutePath = context.getRealPath(relativePath);
	    ImageData data = ImageDataFactory.create(absolutePath);
	    Image image = new Image(data);

	    document.add(image);

	    document.close();
	    byte[] pdfBytes = byteArrayOutputStream.toByteArray();
	    exam.setPdfData(pdfBytes);
	}



	
	private int generateRandomNumber(int min, int max) {
        Random random = new Random();
        int randomNumber = random.nextInt(max - min) + min;
        return randomNumber;
    }
}
