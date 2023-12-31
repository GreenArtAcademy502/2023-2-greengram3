package com.green.greengram3;

import org.junit.jupiter.api.*;

public class Exam2 {

    @BeforeAll
    public static void beforeAll() {
        System.out.println("beforeAll");
    }

    @AfterAll
    public static void afterAll() {
        System.out.println("afterAll");
    }

    @BeforeEach
    public void beforeEach() {
        System.out.println("--beforeEach");
    }

    @AfterEach
    public void afterEach() {
        System.out.println("--afterEach");
    }

    @Test
    public void test1() {

        Assertions.assertEquals(1, 1);
        System.out.println("test1");
    }

    @Test
    public void test2() { System.out.println("test2"); }

    @Test
    public void test3() { System.out.println("test3"); }
}
