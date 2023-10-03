package yoa.cardiology.hospital.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import yoa.cardiology.hospital.db.DatabaseFactory;
import yoa.cardiology.hospital.model.Exam;
import yoa.cardiology.hospital.model.Report;
import yoa.cardiology.hospital.utilities.ReportStatus;

public class ReportDAO {
    private Connection connection;

    public ReportDAO() {
        this.connection = DatabaseFactory.getConnection();
    }

    public void add(Report report) {
        String sql = "INSERT INTO reports (id_exam, crm, description, conclusion, status) " +
                "VALUES (?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, report.getExamId());
            statement.setString(2, report.getCrm());
            statement.setString(3, report.getDescription());
            statement.setString(4, report.getConclusion());
            statement.setString(5, report.getStatus());

            statement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void update(Report report) {
        String sql = "UPDATE reports SET status = ? WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, report.getStatus());
            statement.setLong(2, report.getId());

            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public List<Report> obtainReportsByStatus(ReportStatus status) {
        List<Report> reportList = new ArrayList<Report>();

        String sql = "SELECT * FROM reports WHERE status = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, status.toString());

            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                Report report = new Report();
                report.setId(resultSet.getLong("id"));
                report.setExamId(resultSet.getLong("id_exam"));
                report.setCrm(resultSet.getString("crm"));
                report.setDescription(resultSet.getString("description"));
                report.setConclusion(resultSet.getString("conclusion"));
                report.setStatus(resultSet.getString("status"));

                reportList.add(report);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reportList;
    }
    
    public List<Report> obtainReportsByPatient(String cpf) {
        List<Report> reportList = new ArrayList<Report>();

        List<Exam> examList = new ExamDAO().obtainExamsByCpf(cpf);

        String sql = "SELECT * FROM reports WHERE id_exam = ? AND status = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            for (Exam exam : examList) {
                statement.setLong(1, exam.getId());
                statement.setString(2, ReportStatus.DEFINITIVE.toString());

                ResultSet resultSet = statement.executeQuery();
                while (resultSet.next()) {
                    Report report = new Report();
                    report.setId(resultSet.getLong("id"));
                    report.setExamId(resultSet.getLong("id_exam"));
                    report.setCrm(resultSet.getString("crm"));
                    report.setDescription(resultSet.getString("description"));
                    report.setConclusion(resultSet.getString("conclusion"));
                    report.setStatus(resultSet.getString("status"));

                    reportList.add(report);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reportList;
    }


    public Report obtainReportById(Long id) {
        String sql = "SELECT * FROM reports WHERE id = ?";
        Report report = null;
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                report = new Report();
                report.setId(resultSet.getLong("id"));
                report.setExamId(resultSet.getLong("id_exam"));
                report.setCrm(resultSet.getString("crm"));
                report.setDescription(resultSet.getString("description"));
                report.setConclusion(resultSet.getString("conclusion"));
                report.setStatus(resultSet.getString("status"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return report;
    }


}
