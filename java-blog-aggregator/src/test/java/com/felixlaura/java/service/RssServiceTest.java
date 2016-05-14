package com.felixlaura.java.service;

import static org.junit.Assert.*;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import com.felixlaura.java.entity.Item;
import com.felixlaura.java.exception.RssException;

public class RssServiceTest {
	
	private RssService rssService;

	@Before
	public void setUp() throws Exception {
		rssService = new RssService();
	}

	@Test
	public void testGetItemsFile() throws RssException {
		List<Item> items = rssService.getItems(new File("test-rss/javavids.xml"));
		Item itemFirst = items.get(0);
		
		assertEquals(10, items.size());
		assertEquals("How to solve Source not found error during debug in Eclipse", itemFirst.getTitle());
		assertEquals("22 06 2014 16:35:49", new SimpleDateFormat("dd MM yyyy HH:mm:ss").format(itemFirst.getPublished()));
	}

}
