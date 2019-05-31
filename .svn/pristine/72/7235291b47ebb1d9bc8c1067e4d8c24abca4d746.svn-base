package com.icia.blueballoon.service;

import java.io.*;
import java.security.*;

import javax.mail.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.*;
import org.springframework.web.multipart.*;

import com.icia.blueballoon.dao.*;
import com.icia.blueballoon.entity.*;
import com.icia.blueballoon.exception.*;

@Service
public class ImageService {
	@Autowired
	private ImageDao iDao;
	@Value("#{config['upload.sajin.folder']}")
	private String sajinFolder;
	@Value("#{config['download.sajin.uri']}")
	private String sajinPath;

	
	// 섬작성시 섬이름.jpg로 저장
	@Transactional
	public void insertIslandImage(Island island, Principal principal,Image image, MultipartFile picture) throws IllegalStateException, IOException, MessagingException {
		
		// 프사의 파일명은 사용자 아이디와 같지만 이미지의 확장자는 여러 종류가 있다
		// 즉 아이디가 hasaway일 경우 프사는 hasaway.jpg일 수도 hasaway.png 일 수도 있다
		// 확장자를 잘라낸다
		int lastIndexOfDot =  picture.getOriginalFilename().lastIndexOf('.');
		String extension = picture.getOriginalFilename().substring(lastIndexOfDot+1);
		
		// 파일 객체 생성 -> d:/service/sajin에 비어있는 파일이 생성된다
		// 섬이름.jpg로 변경
		File file = new File(sajinFolder, island.getIsName() + "." + extension);
					
		picture.transferTo(file);
		image.setImageName(file.getName());

		iDao.insert(image);
		
	}	
	
	// 숙박 작성시 memBrand.jpg로 저장
	@Transactional
	public void insertAccomImage(Accommodation accom, Principal principal,Image image, MultipartFile picture) throws IllegalStateException, IOException, MessagingException {
		
		// 프사의 파일명은 사용자 아이디와 같지만 이미지의 확장자는 여러 종류가 있다
		// 즉 아이디가 hasaway일 경우 프사는 hasaway.jpg일 수도 hasaway.png 일 수도 있다
		// 확장자를 잘라낸다
		int lastIndexOfDot =  picture.getOriginalFilename().lastIndexOf('.');
		String extension = picture.getOriginalFilename().substring(lastIndexOfDot+1);
		

		// memBrand.jpg로 변경
		File file = new File(sajinFolder, accom.getMemBrand() + "." + extension);
					
		picture.transferTo(file);
		image.setImageName(file.getName());

		iDao.insert(image);
		
	}	
	
	// 선박 작성시 shipName.jpg로 저장
	@Transactional
	public void insertShipImage(Ship ship, Principal principal,Image image, MultipartFile picture) throws IllegalStateException, IOException, MessagingException {
		
		// 확장자를 잘라낸다
		int lastIndexOfDot =  picture.getOriginalFilename().lastIndexOf('.');
		String extension = picture.getOriginalFilename().substring(lastIndexOfDot+1);

		// shipName.jpg로 변경
		File file = new File(sajinFolder, ship.getShipName() + "." + extension);
					
		picture.transferTo(file);
		image.setImageName(file.getName());

		iDao.insert(image);
		
	}	
	
	// 명소 작성시 attrTitle.jpg로 저장
	@Transactional
	public void insertAttrImage(Attraction attr, Principal principal,Image image, MultipartFile picture) throws IllegalStateException, IOException, MessagingException {

		// 확장자를 잘라낸다
		int lastIndexOfDot =  picture.getOriginalFilename().lastIndexOf('.');
		String extension = picture.getOriginalFilename().substring(lastIndexOfDot+1);

		// attrTitle.jpg로 변경
		File file = new File(sajinFolder, attr.getAttrTitle() + "." + extension);
					
		picture.transferTo(file);
		image.setImageName(file.getName());

		iDao.insert(image);
		
	}	
	
	// 선박 사진 업데이트
	public void updateShipImage(Ship ship, Principal principal, Image image, MultipartFile picture) throws IllegalStateException, IOException, MessagingException {
		
		int lastIndexOfDot =  picture.getOriginalFilename().lastIndexOf('.');
		String extension = picture.getOriginalFilename().substring(lastIndexOfDot+1);
			
		File file = new File(sajinFolder, ship.getShipName() + "." + extension);
		picture.transferTo(file);
		image.setImageName(file.getName());		

		iDao.update(image);
	}
	
	// 숙박 사진 업데이트
	public void updateAccomImage(Accommodation accom, Principal principal, Image image, MultipartFile picture) throws IllegalStateException, IOException, MessagingException {
		
		int lastIndexOfDot =  picture.getOriginalFilename().lastIndexOf('.');
		String extension = picture.getOriginalFilename().substring(lastIndexOfDot+1);
			
		File file = new File(sajinFolder, accom.getMemBrand() + "." + extension);
		picture.transferTo(file);
		image.setImageName(file.getName());		

		iDao.update(image);
	}	
	
	public void updateImage(Principal principal, Image image, MultipartFile picture) throws IllegalStateException, IOException, MessagingException {
		
		int lastIndexOfDot =  picture.getOriginalFilename().lastIndexOf('.');
		String extension = picture.getOriginalFilename().substring(lastIndexOfDot+1);
			
		File file = new File(sajinFolder, principal.getName() + "." + extension);
		picture.transferTo(file);
		image.setImageName(file.getName());		

		iDao.update(image);
	}

	public void insertPackageImage(Package1 package1,Principal principal, Image image, MultipartFile picture) throws IllegalStateException, IOException {
		
		// 확장자를 잘라낸다
		int lastIndexOfDot =  picture.getOriginalFilename().lastIndexOf('.');
		String extension = picture.getOriginalFilename().substring(lastIndexOfDot+1);

		// attrTitle.jpg로 변경
		File file = new File(sajinFolder, package1.getPkgName() + "." + extension);
					
		picture.transferTo(file);
		image.setImageName(file.getName());

		iDao.insert(image);
	}
	
}