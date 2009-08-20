;; source files
(set @m_files     (filelist "^objc/.*.m$"))
(set @nu_files 	  (filelist "^nu/.*nu$"))


(set SYSTEM ((NSString stringWithShellCommand:"uname") chomp))
(case SYSTEM
      ("Darwin"
               (set @cflags "-g -std=gnu99 -DDARWIN")
               (set @ldflags "-lcurl -framework Foundation -framework Nu "))
      ("Linux"
              (set @arch (list "i386"))
              (set gnustep_flags ((NSString stringWithShellCommand:"gnustep-config --objc-flags") chomp))
              (set gnustep_libs ((NSString stringWithShellCommand:"gnustep-config --base-libs") chomp))
              (set @cflags "-g -DLINUX -I/usr/local/include #{gnustep_flags}")
              (set @ldflags "#{gnustep_libs} -lNu -lcurl"))
      (else nil))


;; framework description
(set @framework "NuCURL")
(set @framework_identifier "nu.programming.nucurl")
(set @framework_creator_code "????")

(compilation-tasks)
(framework-tasks)

(task "clobber" => "clean" is
      (SH "rm -rf #{@framework_dir}"))

(task "default" => "framework")

(task "doc" is (SH "nudoc"))

(task "install" => "framework" is
      (SH "sudo rm -rf /Library/Frameworks/#{@framework}.framework")
      (SH "sudo cp -rp #{@framework}.framework /Library/Frameworks/#{@framework}.framework"))

(task "test" => "framework" is
      (SH "nutest test/test_*.nu"))

(load "template")

