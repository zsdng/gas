package cn.fy.service.impl;

import cn.fy.dao.PictureDao;
import cn.fy.domain.Picture;
import cn.fy.service.PictureService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PictureServiceImpl implements PictureService {
    @Autowired
    private PictureDao pictureDao;

    public void setPictureDao(PictureDao pictureDao) {
        this.pictureDao = pictureDao;
    }

    @Override
    public List<Picture> findAllPicture() {
        return pictureDao.findAllPicture();
    }

    @Override
    public void addPicture(Picture picture) {
        pictureDao.addPicture(picture);
    }

    @Override
    public Integer findCount() {
        return pictureDao.findCount();
    }
}
