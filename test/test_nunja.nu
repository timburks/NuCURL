;; test_nunja.nu
;;  tests calls to the Nunja test server.
;;
;;  Copyright (c) 2009 Tim Burks, Neon Design Technology, Inc.
(load "NuCURL")

;; These tests assume that the Nunja test server has already been started.
;; Do that by running "nunjad -s sample" in the Nunja project directory.

(class TestNunja is NuTestCase
     
     (- testServer is
        (set c ((NuCURL alloc) init))
        
        ;; test a simple get
        (set result (c get:"http://localhost:3000/hello"))
        (assert_equal "hello" (NSString stringWithData:(result "body") encoding:NSUTF8StringEncoding))
        
        ;; test post
        (set result (c post:"http://localhost:3000/post" withForm:(dict a:123 b:456 c:789)))
        (assert_equal "a:123,b:456,c:789" (NSString stringWithData:(result "body") encoding:NSUTF8StringEncoding))))








