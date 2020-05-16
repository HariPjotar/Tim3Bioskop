package com.bioskop.controller;

import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.bioskop.repository.KartaRepository;

import model.Karta;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

@Controller
@RequestMapping(value = "/izvestajController")
public class IzvestajController {
	
	@Autowired
	KartaRepository kr;

	@RequestMapping(value="profit.pdf", method=RequestMethod.GET) 
	public void generisiIzvestaj(HttpServletRequest request, HttpServletResponse response) throws Exception { 
		
		List<Karta> karte = (List<Karta>) request.getSession().getAttribute("karte");
	
		response.setContentType("text/html");
		JRBeanCollectionDataSource dataSource = new JRBeanCollectionDataSource(karte);
		InputStream inputStream = this.getClass().getResourceAsStream("/izvestaji/PregledProfita.jrxml");
		JasperReport jasperReport = JasperCompileManager.compileReport(inputStream);
		Map<String, Object> params = new HashMap<String, Object>();	
		//params.put("startDate", startDate);
		//params.put("endDate", endDate);
		/*if(karte!=null && karte.size()>0) {
			params.put("startDate", startDate);
			params.put("endDate", endDate);
		}*/
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, dataSource);
		inputStream.close();
		
		
		response.setContentType("application/x-download");
		response.addHeader("Content-disposition", "attachment; filename=PregledProfita.pdf");
		OutputStream out = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint,out);
	}
}
