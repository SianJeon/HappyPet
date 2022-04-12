package com.happypet.animal.Service;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.happypet.animal.Entity.AnimalReviewVo;
import com.happypet.animal.Entity.FileDataVo;
import com.happypet.animal.Repository.FileDao;
import com.happypet.animal.Repository.FileDataDao;

@Service
public class FileService {

	
	@Autowired
	FileDao fileDao;
	@Autowired
	FileDataDao fileDataDao;
	
public boolean registerOne(AnimalReviewVo vo, MultipartFile[] attach) {
		
		int r = fileDao.fileBoard(vo);
		
		if(r!=1)
			return false;
		
		System.out.println("obtained no = " +vo.getNo());
		
		if(attach == null) {
				throw new RuntimeException();
			
		}
		
		
		
		File base = new File("/Users/upload");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		File savedir = new File(base,sdf.format(System.currentTimeMillis()));
		
		
		
		if( !savedir.exists())
			savedir.mkdirs();
		
		for(MultipartFile file : attach) {
			if(file ==null || file.isEmpty())
				continue;
			
			
			File dest = new File(savedir, UUID.randomUUID().toString());
			
			
			try {
				file.transferTo(dest);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			FileDataVo fdv = new FileDataVo();
			fdv.setName(file.getOriginalFilename());
			fdv.setLen(file.getSize());
			fdv.setType(file.getContentType());
			fdv.setOwner(vo.getNo());
			fdv.setPath(dest.getAbsolutePath());
			
			
			fileDataDao.fileData(fdv);
			System.out.println(fdv);
		}
		
		
		
		
		return true;
		
	}

	public FileDataVo filedownload(int no){
		
		return fileDataDao.fileDownload(no);
	}
	

}


