package com.fcst.boom.service.impl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.fcst.boom.dao.MemberDao;
import com.fcst.boom.domain.Member;
import com.fcst.boom.service.MemberService;

/**
 * Created by codegeneratorplugin
 * User: yankun
 * Date: 2016�?3�?4�?
 * Time: 23:06:12
 * 功能:T_MEMBER表Service接口实现�?
 */

public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberDao memberDao;


    @Override
    public Member get(Member member) throws Exception {
        return memberDao.get(member);
    }


    @Override
    @Transactional
    public int insert(Member member) throws Exception {
        return memberDao.insert(member);
    }

    @Override
    @Transactional
    public int delete(Member member) throws Exception {
        return memberDao.delete(member);
    }

    @Override
    @Transactional
    public int update(Member member) throws Exception {
        return memberDao.update(member);
    }

    @Override
    public List<Member> query(Member member) throws Exception {
        return memberDao.query(member);
    }

    @Override
    public Integer queryCount(Member member) throws Exception {
        return memberDao.queryCount(member);
    }

}
