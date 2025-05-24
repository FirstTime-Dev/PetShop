package service;

import dao.RevenueDAO;
import model.Revenue;

import java.util.List;

public class RevenueService {
    private RevenueDAO revenueDAO = new RevenueDAO();

    public List<Revenue> getAll() {
        return revenueDAO.getAllRevenues();
    }
}
