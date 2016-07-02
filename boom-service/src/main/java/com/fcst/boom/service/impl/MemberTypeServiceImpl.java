package com.fcst.boom.service.impl;


import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.fcst.boom.dao.MemberTypeDao;
import com.fcst.boom.domain.MemberType;
import com.fcst.boom.service.MemberTypeService;

/**
 * Created by codegeneratorplugin
 * User: yankun
 * Date: 2016�?3�?4�?
 * Time: 23:06:12
 * 功能:T_MEMBER_TYPE表Service接口实现�?
 */

public class MemberTypeServiceImpl implements MemberTypeService {
    @javax.annotation.Resource
    private MemberTypeDao memberTypeDao;


    @Override
    public MemberType get(MemberType memberType) throws Exception {
        return memberTypeDao.get(memberType);
    }


    @Override
    @Transactional
    public int insert(MemberType memberType) throws Exception {
        return memberTypeDao.insert(memberType);
    }

    @Override
    @Transactional
    public int delete(MemberType memberType) throws Exception {
        return memberTypeDao.delete(memberType);
    }

    @Override
    @Transactional
    public int update(MemberType memberType) throws Exception {
        return memberTypeDao.update(memberType);
    }

    @Override
    public List<MemberType> query(MemberType memberType) throws Exception {
        return memberTypeDao.query(memberType);
    }

    @Override
    public Integer queryCount(MemberType memberType) throws Exception {
        return memberTypeDao.queryCount(memberType);
    }

}
