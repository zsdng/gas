package cn.fy.service;

import cn.fy.domain.Picture;

import java.util.List;

/**
 * @author: Fy
 *用户头像的service
 * @create: 2020-04-23 10:23
 */
public interface PictureService {

    public List<Picture> findAllPicture();


    public void addPicture(Picture picture);

    public Integer findCount();
}
