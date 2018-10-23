!_TAG_FILE_FORMAT	2	/extended format; --format=1 will not append ;" to lines/
!_TAG_FILE_SORTED	1	/0=unsorted, 1=sorted, 2=foldcase/
!_TAG_PROGRAM_AUTHOR	Darren Hiebert	/dhiebert@users.sourceforge.net/
!_TAG_PROGRAM_NAME	Exuberant Ctags	//
!_TAG_PROGRAM_URL	http://ctags.sourceforge.net	/official site/
!_TAG_PROGRAM_VERSION	5.8	//
CREATE_NEW_CONSOLE	/usr/lib/python3.7/subprocess.py	/^    from _winapi import (CREATE_NEW_CONSOLE, CREATE_NEW_PROCESS_GROUP,$/;"	i
CREATE_NEW_PROCESS_GROUP	/usr/lib/python3.7/subprocess.py	/^    from _winapi import (CREATE_NEW_CONSOLE, CREATE_NEW_PROCESS_GROUP,$/;"	i
CalledProcessError	/usr/lib/python3.7/subprocess.py	/^class CalledProcessError(SubprocessError):$/;"	c
Close	/usr/lib/python3.7/subprocess.py	/^        def Close(self, CloseHandle=_winapi.CloseHandle):$/;"	m	class:.Handle
CompletedProcess	/usr/lib/python3.7/subprocess.py	/^class CompletedProcess(object):$/;"	c
DEVNULL	/usr/lib/python3.7/subprocess.py	/^DEVNULL = -3$/;"	v
Detach	/usr/lib/python3.7/subprocess.py	/^        def Detach(self):$/;"	m	class:.Handle
Handle	/usr/lib/python3.7/subprocess.py	/^    class Handle(int):$/;"	c
PIPE	/usr/lib/python3.7/subprocess.py	/^PIPE = -1$/;"	v
Popen	/usr/lib/python3.7/subprocess.py	/^class Popen(object):$/;"	c
STARTUPINFO	/usr/lib/python3.7/subprocess.py	/^    class STARTUPINFO:$/;"	c
STDOUT	/usr/lib/python3.7/subprocess.py	/^STDOUT = -2$/;"	v
SubprocessError	/usr/lib/python3.7/subprocess.py	/^class SubprocessError(Exception): pass$/;"	c
TimeoutExpired	/usr/lib/python3.7/subprocess.py	/^class TimeoutExpired(SubprocessError):$/;"	c
_PIPE_BUF	/usr/lib/python3.7/subprocess.py	/^    _PIPE_BUF = getattr(select, 'PIPE_BUF', 512)$/;"	v
_PopenSelector	/usr/lib/python3.7/subprocess.py	/^        _PopenSelector = selectors.PollSelector$/;"	v	class:.STARTUPINFO
_PopenSelector	/usr/lib/python3.7/subprocess.py	/^        _PopenSelector = selectors.SelectSelector$/;"	v	class:.STARTUPINFO
__all__	/usr/lib/python3.7/subprocess.py	/^__all__ = ["Popen", "PIPE", "STDOUT", "call", "check_call", "getstatusoutput",$/;"	v
__del__	/usr/lib/python3.7/subprocess.py	/^        __del__ = Close$/;"	v	class:.Handle
__del__	/usr/lib/python3.7/subprocess.py	/^    def __del__(self, _maxsize=sys.maxsize, _warn=warnings.warn):$/;"	m	class:Popen	file:
__enter__	/usr/lib/python3.7/subprocess.py	/^    def __enter__(self):$/;"	m	class:Popen	file:
__exit__	/usr/lib/python3.7/subprocess.py	/^    def __exit__(self, exc_type, value, traceback):$/;"	m	class:Popen	file:
__init__	/usr/lib/python3.7/subprocess.py	/^        def __init__(self, *, dwFlags=0, hStdInput=None, hStdOutput=None,$/;"	m	class:.STARTUPINFO
__init__	/usr/lib/python3.7/subprocess.py	/^    def __init__(self, args, bufsize=-1, executable=None,$/;"	m	class:Popen
__init__	/usr/lib/python3.7/subprocess.py	/^    def __init__(self, args, returncode, stdout=None, stderr=None):$/;"	m	class:CompletedProcess
__init__	/usr/lib/python3.7/subprocess.py	/^    def __init__(self, cmd, timeout, output=None, stderr=None):$/;"	m	class:TimeoutExpired
__init__	/usr/lib/python3.7/subprocess.py	/^    def __init__(self, returncode, cmd, output=None, stderr=None):$/;"	m	class:CalledProcessError
__repr__	/usr/lib/python3.7/subprocess.py	/^        def __repr__(self):$/;"	m	class:.Handle	file:
__repr__	/usr/lib/python3.7/subprocess.py	/^    def __repr__(self):$/;"	m	class:CompletedProcess	file:
__str__	/usr/lib/python3.7/subprocess.py	/^        __str__ = __repr__$/;"	v	class:.Handle
__str__	/usr/lib/python3.7/subprocess.py	/^    def __str__(self):$/;"	m	class:CalledProcessError	file:
__str__	/usr/lib/python3.7/subprocess.py	/^    def __str__(self):$/;"	m	class:TimeoutExpired	file:
_active	/usr/lib/python3.7/subprocess.py	/^_active = []$/;"	v
_args_from_interpreter_flags	/usr/lib/python3.7/subprocess.py	/^def _args_from_interpreter_flags():$/;"	f
_check_timeout	/usr/lib/python3.7/subprocess.py	/^    def _check_timeout(self, endtime, orig_timeout):$/;"	m	class:Popen
_child_created	/usr/lib/python3.7/subprocess.py	/^    _child_created = False  # Set here since __del__ checks it$/;"	v	class:Popen
_cleanup	/usr/lib/python3.7/subprocess.py	/^def _cleanup():$/;"	f
_communicate	/usr/lib/python3.7/subprocess.py	/^        def _communicate(self, input, endtime, orig_timeout):$/;"	f	function:Popen.wait
_execute_child	/usr/lib/python3.7/subprocess.py	/^        def _execute_child(self, args, executable, preexec_fn, close_fds,$/;"	f	function:Popen.wait
_filter_handle_list	/usr/lib/python3.7/subprocess.py	/^        def _filter_handle_list(self, handle_list):$/;"	f	function:Popen.wait
_get_devnull	/usr/lib/python3.7/subprocess.py	/^    def _get_devnull(self):$/;"	m	class:Popen
_get_handles	/usr/lib/python3.7/subprocess.py	/^        def _get_handles(self, stdin, stdout, stderr):$/;"	f	function:Popen.wait
_handle_exitstatus	/usr/lib/python3.7/subprocess.py	/^        def _handle_exitstatus(self, sts, _WIFSIGNALED=os.WIFSIGNALED,$/;"	f	function:Popen.wait
_internal_poll	/usr/lib/python3.7/subprocess.py	/^        def _internal_poll(self, _deadstate=None, _waitpid=os.waitpid,$/;"	f	function:Popen.wait
_internal_poll	/usr/lib/python3.7/subprocess.py	/^        def _internal_poll(self, _deadstate=None,$/;"	f	function:Popen.wait
_make_inheritable	/usr/lib/python3.7/subprocess.py	/^        def _make_inheritable(self, handle):$/;"	f	function:Popen.wait
_mswindows	/usr/lib/python3.7/subprocess.py	/^_mswindows = (sys.platform == "win32")$/;"	v
_optim_args_from_interpreter_flags	/usr/lib/python3.7/subprocess.py	/^def _optim_args_from_interpreter_flags():$/;"	f
_posixsubprocess	/usr/lib/python3.7/subprocess.py	/^    import _posixsubprocess$/;"	i
_readerthread	/usr/lib/python3.7/subprocess.py	/^        def _readerthread(self, fh, buffer):$/;"	f	function:Popen.wait
_remaining_time	/usr/lib/python3.7/subprocess.py	/^    def _remaining_time(self, endtime):$/;"	m	class:Popen
_save_input	/usr/lib/python3.7/subprocess.py	/^        def _save_input(self, input):$/;"	f	function:Popen.wait
_stdin_write	/usr/lib/python3.7/subprocess.py	/^    def _stdin_write(self, input):$/;"	m	class:Popen
_time	/usr/lib/python3.7/subprocess.py	/^from time import monotonic as _time$/;"	i
_translate_newlines	/usr/lib/python3.7/subprocess.py	/^    def _translate_newlines(self, data, encoding, errors):$/;"	m	class:Popen
_try_wait	/usr/lib/python3.7/subprocess.py	/^        def _try_wait(self, wait_flags):$/;"	f	function:Popen.wait
_wait	/usr/lib/python3.7/subprocess.py	/^        def _wait(self, timeout):$/;"	f	function:Popen.wait
_winapi	/usr/lib/python3.7/subprocess.py	/^    import _winapi$/;"	i
builtins	/usr/lib/python3.7/subprocess.py	/^import builtins$/;"	i
call	/usr/lib/python3.7/subprocess.py	/^def call(*popenargs, timeout=None, **kwargs):$/;"	f
check_call	/usr/lib/python3.7/subprocess.py	/^def check_call(*popenargs, **kwargs):$/;"	f
check_output	/usr/lib/python3.7/subprocess.py	/^def check_output(*popenargs, timeout=None, **kwargs):$/;"	f
check_returncode	/usr/lib/python3.7/subprocess.py	/^    def check_returncode(self):$/;"	m	class:CompletedProcess
closed	/usr/lib/python3.7/subprocess.py	/^        closed = False$/;"	v	class:.Handle
communicate	/usr/lib/python3.7/subprocess.py	/^    def communicate(self, input=None, timeout=None):$/;"	m	class:Popen
errno	/usr/lib/python3.7/subprocess.py	/^import errno$/;"	i
getoutput	/usr/lib/python3.7/subprocess.py	/^def getoutput(cmd):$/;"	f
getstatusoutput	/usr/lib/python3.7/subprocess.py	/^def getstatusoutput(cmd):$/;"	f
io	/usr/lib/python3.7/subprocess.py	/^import io$/;"	i
kill	/usr/lib/python3.7/subprocess.py	/^        def kill(self):$/;"	f	function:Popen.wait
list2cmdline	/usr/lib/python3.7/subprocess.py	/^def list2cmdline(seq):$/;"	f
msvcrt	/usr/lib/python3.7/subprocess.py	/^    import msvcrt$/;"	i
os	/usr/lib/python3.7/subprocess.py	/^import os$/;"	i
poll	/usr/lib/python3.7/subprocess.py	/^    def poll(self):$/;"	m	class:Popen
run	/usr/lib/python3.7/subprocess.py	/^def run(*popenargs,$/;"	f
select	/usr/lib/python3.7/subprocess.py	/^    import select$/;"	i
selectors	/usr/lib/python3.7/subprocess.py	/^    import selectors$/;"	i
send_signal	/usr/lib/python3.7/subprocess.py	/^        def send_signal(self, sig):$/;"	f	function:Popen.wait
signal	/usr/lib/python3.7/subprocess.py	/^import signal$/;"	i
stdout	/usr/lib/python3.7/subprocess.py	/^    def stdout(self):$/;"	m	class:CalledProcessError
stdout	/usr/lib/python3.7/subprocess.py	/^    def stdout(self):$/;"	m	class:TimeoutExpired
stdout	/usr/lib/python3.7/subprocess.py	/^    def stdout(self, value):$/;"	m	class:CalledProcessError
stdout	/usr/lib/python3.7/subprocess.py	/^    def stdout(self, value):$/;"	m	class:TimeoutExpired
sys	/usr/lib/python3.7/subprocess.py	/^import sys$/;"	i
terminate	/usr/lib/python3.7/subprocess.py	/^        def terminate(self):$/;"	f	function:Popen.wait
threading	/usr/lib/python3.7/subprocess.py	/^    import threading$/;"	i
time	/usr/lib/python3.7/subprocess.py	/^import time$/;"	i
universal_newlines	/usr/lib/python3.7/subprocess.py	/^    def universal_newlines(self):$/;"	m	class:Popen
universal_newlines	/usr/lib/python3.7/subprocess.py	/^    def universal_newlines(self, universal_newlines):$/;"	m	class:Popen
wait	/usr/lib/python3.7/subprocess.py	/^    def wait(self, timeout=None):$/;"	m	class:Popen
warnings	/usr/lib/python3.7/subprocess.py	/^import warnings$/;"	i
