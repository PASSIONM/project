package com.kte.project;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kte.project.VO.HostVO;
import com.kte.project.VO.HostchkVO;
import com.kte.project.dao.HostDAO;

@Controller
public class HostController {
	
	@Autowired
	private HostDAO hDAO = null;
	
	@RequestMapping(value="/host_create.do", method=RequestMethod.GET)
	public String hostcreate(Model model, HttpSession httpsession) {
		
		System.out.println(httpsession.getAttribute("room_code"));
		httpsession.removeAttribute("room_code"); // 세션에 있는 것 삭제

		HostVO vo = new HostVO();
		
		int room_code = hDAO.selectRoomCode();
		vo.setRoom_code(room_code+1);
		
		model.addAttribute("vo", vo);
		
		return "host_create";
	}
	
	@RequestMapping(value="/host_create.do", method=RequestMethod.POST)
	public String hostcreate(@ModelAttribute("vo") HostVO vo,
							 HttpSession httpsession) {
		
		int room_code = vo.getRoom_code();
		httpsession.setAttribute("room_code", room_code);
		System.out.println(httpsession.getAttribute("room_code"));
		hDAO.insertHostCreate(vo);
		
		return "redirect:/host_name.do";
	}
	
	@RequestMapping(value="/host_name.do", method=RequestMethod.GET)
	public String hostname(Model model, HttpSession httpsession) {
		
		int room_code = (Integer) httpsession.getAttribute("room_code");
		
		HostVO vo = new HostVO();
		vo.setRoom_code(room_code);
		
		model.addAttribute("vo", vo);
		
		return "host_name";
	}
	
	@RequestMapping(value="/host_name.do", method=RequestMethod.POST)
	public String hostname(@ModelAttribute("vo") HostVO vo) {
		
		hDAO.updateHostName(vo);
		
		return "redirect:/host_basic.do";
	}
	
	@RequestMapping(value="/host_basic.do", method=RequestMethod.GET)
	public String hostbasic(Model model, HttpSession httpsession) {
		
		int room_code = (Integer) httpsession.getAttribute("room_code");
		
		HostVO vo = hDAO.selectHostBasic(room_code);
		String[] str = {"원룸","1.5룸","투룸(방1개 + 거실1)","투룸(방2개)","쓰리룸이상","복층","호텔","리조트"};
		String[] str1 = {"빌라","원룸","펜션","민박","아파트","오피스텔","레지던스","쉐어하우스","단독주택(독채)","단독주택(일부 사용)","게스트하우스(개인실)","게스트하우스(도미토리)"};
		
		model.addAttribute("str",str);
		model.addAttribute("str1",str1);
		model.addAttribute("vo", vo);
		
		return "host_basic";
	}
	
	@RequestMapping(value="/host_basic.do", method=RequestMethod.POST)
	public String hostbasic(@ModelAttribute("vo") HostVO vo) {
		
		
		hDAO.updateHostBasic(vo);
		
		return "redirect:/host_location.do";
	}
	
	@RequestMapping(value="/host_location.do", method=RequestMethod.GET)
	public String hostlocation(Model model) {
		
		HostVO vo = new HostVO();
		
		model.addAttribute("vo", vo);
		
		return "host_location";
	}
	
	@RequestMapping(value="/host_amenity.do", method=RequestMethod.GET)
	public String hostamenity(Model model) {
		
		HostVO vo = new HostVO();
		String[] str = {"TV","케이블TV","에어콘","난방","부엌(개인)","부엌(공용)","인터넷","와이파이","전기포트","전자렌지","밥솥","수건","식기(그릇)","다리미","헤어드라이기","냉장고"};
		String[] str1 = {"욕조","세탁기(개인)","수영장","건조기","아침식사","무료 주차 포함","무료 헬스장","엘리베이터","초인종/인터폰","도어락","샴푸","취사","바비큐","대중교통","마당","세탁기(공용)","테라스","바다"};
		String[] str2 = {"가족/어린이 환영","애완동물 가능","애완/반려동물 키우고 있음","휠체어 사용 가능"};
		String[] str3 = {"화재감지기","구급 상자","안전 카드","소화기","실내흡연불가능"};
		model.addAttribute("str", str);
		model.addAttribute("str1", str1);
		model.addAttribute("str2", str2);
		model.addAttribute("str3", str3);
		model.addAttribute("vo", vo);
		
		return "host_amenity";
	}
	
	@RequestMapping(value="/host_amenity.do", method=RequestMethod.POST)
	public String hostamenity(@ModelAttribute("vo") HostVO vo,
							  @RequestParam("str[]") String[] chk,
							  @RequestParam("str1[]") String[] chk1,
							  @RequestParam("str2[]") String[] chk2,
							  @RequestParam("str3[]") String[] chk3,
							  HttpSession httpsession) {
		
		int room_code = (Integer) httpsession.getAttribute("room_code");
		
		List<HostchkVO> list = new ArrayList<HostchkVO>();
		for(String tmp : chk) {
			HostchkVO vo1 = new HostchkVO();
			vo1.setRoom_code(room_code);
			vo1.setRoom_option(tmp);
		}
		
		return "redirect:/host_imgs.do";
	}
	
	@RequestMapping(value="/host_imgs.do", method=RequestMethod.GET)
	public String hostimgs(Model model,HttpSession httpsession) {
		
		int room_img_code = hDAO.selectRoomImgCode();
		
		System.out.println(httpsession.getAttribute("room_code"));
		
		HostVO vo = new HostVO();
		vo.setRoom_img_code(room_img_code+1);
		
		int room_code = (Integer) httpsession.getAttribute("room_code");
		
		List<HostVO> list = hDAO.selectRoomImgList(room_code);
		
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		
		return "host_imgs";
	}
	
	@RequestMapping(value = "/host_imgs_img.do", method = RequestMethod.GET)
	   public ResponseEntity<byte[]> selectEventImg(@RequestParam("room_img_code") int room_img_code){
	     
	      HostVO vo = hDAO.selectRoomImg(room_img_code);
	      
	      byte[] roomImg = vo.getRoom_img();
	      
	      try {
	         final HttpHeaders headers = new HttpHeaders();
	         headers.setContentType(MediaType.IMAGE_JPEG);
	         
	         return new ResponseEntity<byte[]>(roomImg, headers, HttpStatus.OK);
	         
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	         return null;
	      }
	   }
	   
	@RequestMapping(value="/host_imgs.do", method=RequestMethod.POST)
	public String hostimgs(MultipartHttpServletRequest request,
						   HttpSession httpsession,
						   @ModelAttribute("vo") HostVO vo) {
		
		try {
			int room_code = (Integer) httpsession.getAttribute("room_code");
			System.out.println("ROOM:"+ room_code);
			
			vo.setRoom_code(room_code);
			
			MultipartFile file = request.getFile("img1");
			
			if(file != null && !file.getOriginalFilename().equals("")) {
				vo.setRoom_img(file.getBytes());
			}
			
			System.out.println(vo.getRoom_img_code());
			
			hDAO.insertHostImg(vo);
			
			return "redirect:host_imgs.do";
			
		} catch (Exception e) {
			System.out.println("bb");
			return "redirect:host_imgs.do";
		}
	}
	
	@RequestMapping(value="/host_price.do", method=RequestMethod.GET)
	public String hostprice(Model model) {
		
		HostVO vo = new HostVO();
		
		model.addAttribute("vo", vo);
		
		return "host_price";
	}
	
	@RequestMapping(value="/host_inout.do", method=RequestMethod.GET)
	public String hostcalendar(Model model) {
		
		HostVO vo = new HostVO();
		
		model.addAttribute("vo", vo);
		
		return "host_inout";
	}
	
}
