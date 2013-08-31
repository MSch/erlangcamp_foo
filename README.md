# Releasing OTP apps from ErlangCamp Amsterdam 2013

```
systools:make_script("foo-0.1.0", [local, {path, ["./ebin"]}]).
systools:make_tar("foo-0.1.0", [{erts, code:root_dir()}, {path, ["./ebin", "."]}]).
```
