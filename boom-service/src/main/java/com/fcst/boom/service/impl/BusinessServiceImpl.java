package com.fcst.boom.service.impl;



import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.fcst.boom.dao.BusinessDao;
import com.fcst.boom.domain.Business;
import com.fcst.boom.service.BusinessService;

/**
 * Created by codegeneratorplugin
 * User: yankun
 * Date: 2016�?3�?4�?
 * Time: 23:06:12
 * 功能:T_BUSINESS表Service接口实现�?
 */

public class BusinessServiceImpl implements BusinessService {
    @javax.annotation.Resource
    private BusinessDao businessDao;


    @Override
    public Business get(Business business) throws Exception {
        return businessDao.get(business);
    }


    @Override
    @Transactional
    public int insert(Business business) throws Exception {
        return businessDao.insert(business);
    }

    @Override
    @Transactional
    public int delete(Business business) throws Exception {
        return businessDao.delete(business);
    }

    @Override
    @Transactional
    public int update(Business business) throws Exception {
        return businessDao.update(business);
    }

    @Override
    public List<Business> query(Business business) throws Exception {
        return businessDao.query(business);
    }

    @Override
    public Integer queryCount(Business business) throws Exception {
        return businessDao.queryCount(business);
    }

}
