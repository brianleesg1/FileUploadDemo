package sg.com.ncs.demo;

import org.springframework.web.multipart.MultipartFile;


public class UploadItem {

     private MultipartFile file;
     private int chunk;
     private int chunks;
     
     
     
     public int getChunks() {
		return chunks;
	}

	public void setChunks(int chunks) {
		this.chunks = chunks;
	}

	public int getChunk() {
		return chunk;
	}

	public void setChunk(int chunk) {
		this.chunk = chunk;
	}

	

     public MultipartFile getFile() {
             return file;
     }

     public void setFile(MultipartFile file) {
             this.file = file;
     }
}
