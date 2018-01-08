/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entity.Librarian;
import java.io.IOException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 *
 * @author oswal
 */
public class LibrarianDAO {
    
    public final String XML_URL = "http://localhost:8080/INTXML_ASM/data/librarian.xml";

    public LibrarianDAO() {
        
    }

    public ArrayList<Librarian> getLibrarians() {
        ArrayList<Librarian> librarians = new ArrayList<>();

        return librarians;
    }

    public boolean checkLogin(String username, String password) {
        try {
            Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(XML_URL);
            XPath xPath = XPathFactory.newInstance().newXPath();
            NodeList nl = (NodeList) xPath.evaluate("//status", doc, XPathConstants.NODESET);
            for (int i = 0; i < nl.getLength(); i++) {
                if (nl.item(i).getTextContent().equals("true")) {
                    NodeList nl2 = (NodeList) xPath.evaluate("//username", doc, XPathConstants.NODESET);
                    for (int j = 0; j < nl2.getLength(); j++) {
                        if (nl2.item(j).getTextContent().equals(username)) {
                            NodeList nl3 = (NodeList) xPath.evaluate("//password", doc, XPathConstants.NODESET);
                            for (int k = 0; k < nl3.getLength(); k++) {
                                if (nl3.item(k).getTextContent().equals(password)) {
                                    return true;
                                }
                            }
                        }
                    }
                }
            }
        } catch (XPathExpressionException | ParserConfigurationException | SAXException | IOException ex) {
            Logger.getLogger(LibrarianDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

}
