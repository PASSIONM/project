package com.kte.project;

import static org.junit.Assert.fail;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

public class ajaxSearchControllerTest {
	
	private MockMvc mockMvc = null;

	@Before // �׽�Ʈ ���� ��
	public void setup() {
		// �׽�Ʈ �ϰ��� �ϴ� controller��ü ����
		mockMvc = MockMvcBuilders.standaloneSetup(new ajaxSearchController()).build();
	}

	
	@Test // �׽�Ʈ
	public void test() throws Exception {
	MockHttpServletRequestBuilder msrb = post("/changeTab.do")
		.param("active_tab", "detail-1").param("day_type", "1��");
		
// �׽�Ʈ ����
		mockMvc.perform(msrb).andDo(print()).andExpect(status().is3xxRedirection());
	}


}
