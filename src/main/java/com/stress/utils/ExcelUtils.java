/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.stress.utils;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import javax.servlet.ServletOutputStream;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author MinhQuang
 */
public class ExcelUtils {

    public String getFileName(String baseName) {
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
        String dateTimeInfo = dateFormat.format(new Date(System.currentTimeMillis()));
        return baseName.concat(String.format("_%s.xlsx", dateTimeInfo));
    }

    public String export(String table, ServletOutputStream fos, String fileName) throws ClassNotFoundException {

        String excelFilePath = fileName;

        try ( Connection connection = DBConnection.getConnection()) {
            String sql = "SELECT * FROM ".concat(table);

            Statement statement = connection.createStatement();

            ResultSet result = statement.executeQuery(sql);

            XSSFWorkbook workbook = new XSSFWorkbook();
            XSSFSheet sheet = workbook.createSheet(table);

            writeHeaderLine(result, sheet);

            writeDataLines(result, workbook, sheet);

            workbook.write(fos);
            workbook.close();

            statement.close();

        } catch (SQLException e) {
            System.out.println("Datababse error:");
            e.printStackTrace();
        } catch (IOException e) {
            System.out.println("File IO error:");
            e.printStackTrace();
        }
        return excelFilePath;
    }

    public String exportFeedBack(String table, ServletOutputStream fos, String fileName) throws ClassNotFoundException {

        String excelFilePath = fileName;

        try ( Connection connection = DBConnection.getConnection()) {
            String sql = "SELECT tr.TripID AS [TripID],tr.TripName AS [TripName], r.RouteName AS RouteName,tr.SeatRemain AS [SeatRemain], AVG(fb.Rating) AS [Rating]"
                    + "  FROM tblTrips tr INNER JOIN tblFeedbacks fb \n"
                    + " ON tr.TripID = fb.TripID INNER JOIN tblRoutes r ON tr.RouteID = r.RouteID \n"
                    + " GROUP BY tr.TripID, tr.TripName, r.RouteName, tr.SeatRemain";

            Statement statement = connection.createStatement();

            ResultSet result = statement.executeQuery(sql);

            XSSFWorkbook workbook = new XSSFWorkbook();
            XSSFSheet sheet = workbook.createSheet(table);

            writeHeaderLine(result, sheet);

            writeDataLines(result, workbook, sheet);

            workbook.write(fos);
            workbook.close();

            statement.close();

        } catch (SQLException e) {
            System.out.println("Datababse error:");
            e.printStackTrace();
        } catch (IOException e) {
            System.out.println("File IO error:");
            e.printStackTrace();
        }
        return excelFilePath;
    }

    private void writeHeaderLine(ResultSet result, XSSFSheet sheet) throws SQLException {
        // write header line containing column names
        ResultSetMetaData metaData = result.getMetaData();
        int numberOfColumns = metaData.getColumnCount();

        Row headerRow = sheet.createRow(0);

        // exclude the first column which is the ID field
        for (int i = 2; i <= numberOfColumns; i++) {
            String columnName = metaData.getColumnName(i);
            Cell headerCell = headerRow.createCell(i - 2);
            headerCell.setCellValue(columnName);
        }
    }

    private void writeDataLines(ResultSet result, XSSFWorkbook workbook, XSSFSheet sheet)
            throws SQLException {
        ResultSetMetaData metaData = result.getMetaData();
        int numberOfColumns = metaData.getColumnCount();

        int rowCount = 1;

        while (result.next()) {
            Row row = sheet.createRow(rowCount++);

            for (int i = 2; i <= numberOfColumns; i++) {
                Object valueObject = result.getObject(i);

                Cell cell = row.createCell(i - 2);

                if (valueObject instanceof Boolean) {
                    cell.setCellValue((Boolean) valueObject);
                } else if (valueObject instanceof Double) {
                    cell.setCellValue((double) valueObject);
                } else if (valueObject instanceof Float) {
                    cell.setCellValue((float) valueObject);
                } else if (valueObject instanceof Date) {
                    cell.setCellValue((Date) valueObject);
                    formatDateCell(workbook, cell);
                } else if (valueObject instanceof Integer) {
                    cell.setCellValue((int) valueObject);
                } else if (valueObject instanceof Timestamp) {
                    cell.setCellValue((Timestamp) valueObject);
                    formatDateCell(workbook, cell);
                } else {
                    cell.setCellValue((String) valueObject);
                }

            }

        }
    }

    private void formatDateCell(XSSFWorkbook workbook, Cell cell) {
        CellStyle cellStyle = workbook.createCellStyle();
        CreationHelper creationHelper = workbook.getCreationHelper();
        cellStyle.setDataFormat(creationHelper.createDataFormat().getFormat("yyyy-MM-dd HH:mm:ss"));
        cell.setCellStyle(cellStyle);
    }
}
