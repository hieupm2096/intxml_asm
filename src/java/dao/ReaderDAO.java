/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Reader;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.net.URLConnection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 *
 * @author oswal
 */
public class ReaderDAO {

    private final String XML_URL = "http://localhost:8080/INTXML_ASM/data/reader.xml";
    private final String XML_URI = "reader.xml";

    public ArrayList<Reader> getReader() {
        ArrayList<Reader> readers = new ArrayList<>();
        try {
            Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(XML_URL);
            XPath xPath = XPathFactory.newInstance().newXPath();
            NodeList nl = (NodeList) xPath.evaluate("//reader", doc, XPathConstants.NODESET);
            for (int i = 0; i < nl.getLength(); i++) {
                NodeList child = nl.item(i).getChildNodes();
                Reader reader = new Reader();
                for (int j = 0; j < child.getLength(); j++) {
                    if (child.item(j).getNodeType() == Node.ELEMENT_NODE) {
                        Element e = (Element) child.item(j);
                        String textContent = child.item(j).getTextContent();
                        switch (e.getTagName()) {
                            case "id":
                                reader.setId(Integer.parseInt(textContent));
                                break;
                            case "name":
                                reader.setName(textContent);
                                break;
                            case "email":
                                reader.setEmail(textContent);
                                break;
                            case "phone":
                                reader.setEmail(textContent);
                                break;
                            case "dob":
                                Date date = new SimpleDateFormat("yyyy-MM-dd").parse(textContent);
                                reader.setDob(date);
                                break;
                            case "address":
                                reader.setAddress(textContent);
                                break;
                            case "gender":
                                reader.setGender(Boolean.parseBoolean(textContent));
                                break;
                            case "status":
                                reader.setStatus(Boolean.parseBoolean(textContent));
                                break;
                        }
                    }
                }
                readers.add(reader);
            }
        } catch (ParserConfigurationException | SAXException | IOException | XPathExpressionException | ParseException ex) {
            Logger.getLogger(ReaderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return readers;
    }

    public boolean createReader(Reader reader) {
        try {
            Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(XML_URL);
//            Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(new File(XML_URI));


            Element root = doc.getDocumentElement();
            Element newReader = doc.createElement("reader");

            Element id = doc.createElement("id");
            id.appendChild(doc.createTextNode(String.valueOf(reader.getId())));
            newReader.appendChild(id);

            Element name = doc.createElement("name");
            name.appendChild(doc.createTextNode(reader.getName()));
            newReader.appendChild(name);

            Element email = doc.createElement("email");
            email.appendChild(doc.createTextNode(reader.getEmail()));
            newReader.appendChild(email);

            Element phone = doc.createElement("phone");
            phone.appendChild(doc.createTextNode(reader.getPhone()));
            newReader.appendChild(phone);

            Element dob = doc.createElement("dob");
            dob.appendChild(doc.createTextNode(new SimpleDateFormat("yyyy-MM-dd").format(reader.getDob())));
            newReader.appendChild(dob);

            Element address = doc.createElement("address");
            address.appendChild(doc.createTextNode(reader.getAddress()));
            newReader.appendChild(address);

            Element gender = doc.createElement("gender");
            gender.appendChild(doc.createTextNode(String.valueOf(reader.isGender())));
            newReader.appendChild(gender);

            Element status = doc.createElement("status");
            status.appendChild(doc.createTextNode(String.valueOf(reader.isStatus())));
            newReader.appendChild(status);

            root.appendChild(newReader);
            
            DOMSource source = new DOMSource(doc);
            Transformer tf = TransformerFactory.newInstance().newTransformer();
            
            URL site = new URL(XML_URL);
            URLConnection urlc = site.openConnection();
            urlc.setDoOutput(true);
            
            StreamResult result = new StreamResult(urlc.getOutputStream());

//            StreamResult result = new StreamResult(XML_URI);
            tf.transform(source, result);
            
        } catch (SAXException | IOException | ParserConfigurationException | TransformerConfigurationException ex) {
            Logger.getLogger(ReaderDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (TransformerException ex) {
            Logger.getLogger(ReaderDAO.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
        return true;
    }

    public static void main(String[] args) {
        Reader reader = new Reader(1234567, "test", "test", "test", new Date(), true, "test", true);
        System.out.println(new ReaderDAO().createReader(reader));
    }
}
