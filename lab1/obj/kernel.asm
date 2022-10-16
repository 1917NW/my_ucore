
bin/kernel:     file format elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	f3 0f 1e fb          	endbr32 
  100004:	55                   	push   %ebp
  100005:	89 e5                	mov    %esp,%ebp
  100007:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  10000a:	b8 80 1d 11 00       	mov    $0x111d80,%eax
  10000f:	2d 16 0a 11 00       	sub    $0x110a16,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 0a 11 00 	movl   $0x110a16,(%esp)
  100027:	e8 50 2f 00 00       	call   102f7c <memset>

    cons_init();                // init the console
  10002c:	e8 17 16 00 00       	call   101648 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 a0 37 10 00 	movl   $0x1037a0,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 bc 37 10 00 	movl   $0x1037bc,(%esp)
  100046:	e8 48 02 00 00       	call   100293 <cprintf>

    print_kerninfo();
  10004b:	e8 06 09 00 00       	call   100956 <print_kerninfo>

    grade_backtrace();
  100050:	e8 9a 00 00 00       	call   1000ef <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 d1 2b 00 00       	call   102c2b <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 3e 17 00 00       	call   10179d <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 e3 18 00 00       	call   101947 <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 64 0d 00 00       	call   100dcd <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 7b 18 00 00       	call   1018e9 <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    lab1_switch_test();
  10006e:	e8 86 01 00 00       	call   1001f9 <lab1_switch_test>

    /* do nothing */
    while (1);
  100073:	eb fe                	jmp    100073 <kern_init+0x73>

00100075 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100075:	f3 0f 1e fb          	endbr32 
  100079:	55                   	push   %ebp
  10007a:	89 e5                	mov    %esp,%ebp
  10007c:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  10007f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100086:	00 
  100087:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10008e:	00 
  10008f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100096:	e8 1c 0d 00 00       	call   100db7 <mon_backtrace>
}
  10009b:	90                   	nop
  10009c:	c9                   	leave  
  10009d:	c3                   	ret    

0010009e <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  10009e:	f3 0f 1e fb          	endbr32 
  1000a2:	55                   	push   %ebp
  1000a3:	89 e5                	mov    %esp,%ebp
  1000a5:	53                   	push   %ebx
  1000a6:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000a9:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  1000ac:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000af:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000b2:	8b 45 08             	mov    0x8(%ebp),%eax
  1000b5:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000b9:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000bd:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000c1:	89 04 24             	mov    %eax,(%esp)
  1000c4:	e8 ac ff ff ff       	call   100075 <grade_backtrace2>
}
  1000c9:	90                   	nop
  1000ca:	83 c4 14             	add    $0x14,%esp
  1000cd:	5b                   	pop    %ebx
  1000ce:	5d                   	pop    %ebp
  1000cf:	c3                   	ret    

001000d0 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000d0:	f3 0f 1e fb          	endbr32 
  1000d4:	55                   	push   %ebp
  1000d5:	89 e5                	mov    %esp,%ebp
  1000d7:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000da:	8b 45 10             	mov    0x10(%ebp),%eax
  1000dd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000e1:	8b 45 08             	mov    0x8(%ebp),%eax
  1000e4:	89 04 24             	mov    %eax,(%esp)
  1000e7:	e8 b2 ff ff ff       	call   10009e <grade_backtrace1>
}
  1000ec:	90                   	nop
  1000ed:	c9                   	leave  
  1000ee:	c3                   	ret    

001000ef <grade_backtrace>:

void
grade_backtrace(void) {
  1000ef:	f3 0f 1e fb          	endbr32 
  1000f3:	55                   	push   %ebp
  1000f4:	89 e5                	mov    %esp,%ebp
  1000f6:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000f9:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000fe:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  100105:	ff 
  100106:	89 44 24 04          	mov    %eax,0x4(%esp)
  10010a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100111:	e8 ba ff ff ff       	call   1000d0 <grade_backtrace0>
}
  100116:	90                   	nop
  100117:	c9                   	leave  
  100118:	c3                   	ret    

00100119 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100119:	f3 0f 1e fb          	endbr32 
  10011d:	55                   	push   %ebp
  10011e:	89 e5                	mov    %esp,%ebp
  100120:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  100123:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100126:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100129:	8c 45 f2             	mov    %es,-0xe(%ebp)
  10012c:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  10012f:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100133:	83 e0 03             	and    $0x3,%eax
  100136:	89 c2                	mov    %eax,%edx
  100138:	a1 20 0a 11 00       	mov    0x110a20,%eax
  10013d:	89 54 24 08          	mov    %edx,0x8(%esp)
  100141:	89 44 24 04          	mov    %eax,0x4(%esp)
  100145:	c7 04 24 c1 37 10 00 	movl   $0x1037c1,(%esp)
  10014c:	e8 42 01 00 00       	call   100293 <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  100151:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100155:	89 c2                	mov    %eax,%edx
  100157:	a1 20 0a 11 00       	mov    0x110a20,%eax
  10015c:	89 54 24 08          	mov    %edx,0x8(%esp)
  100160:	89 44 24 04          	mov    %eax,0x4(%esp)
  100164:	c7 04 24 cf 37 10 00 	movl   $0x1037cf,(%esp)
  10016b:	e8 23 01 00 00       	call   100293 <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  100170:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100174:	89 c2                	mov    %eax,%edx
  100176:	a1 20 0a 11 00       	mov    0x110a20,%eax
  10017b:	89 54 24 08          	mov    %edx,0x8(%esp)
  10017f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100183:	c7 04 24 dd 37 10 00 	movl   $0x1037dd,(%esp)
  10018a:	e8 04 01 00 00       	call   100293 <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10018f:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100193:	89 c2                	mov    %eax,%edx
  100195:	a1 20 0a 11 00       	mov    0x110a20,%eax
  10019a:	89 54 24 08          	mov    %edx,0x8(%esp)
  10019e:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001a2:	c7 04 24 eb 37 10 00 	movl   $0x1037eb,(%esp)
  1001a9:	e8 e5 00 00 00       	call   100293 <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  1001ae:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  1001b2:	89 c2                	mov    %eax,%edx
  1001b4:	a1 20 0a 11 00       	mov    0x110a20,%eax
  1001b9:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001bd:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001c1:	c7 04 24 f9 37 10 00 	movl   $0x1037f9,(%esp)
  1001c8:	e8 c6 00 00 00       	call   100293 <cprintf>
    round ++;
  1001cd:	a1 20 0a 11 00       	mov    0x110a20,%eax
  1001d2:	40                   	inc    %eax
  1001d3:	a3 20 0a 11 00       	mov    %eax,0x110a20
}
  1001d8:	90                   	nop
  1001d9:	c9                   	leave  
  1001da:	c3                   	ret    

001001db <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001db:	f3 0f 1e fb          	endbr32 
  1001df:	55                   	push   %ebp
  1001e0:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 : TODO
    //开始之前ebp和esp相同
    asm volatile (
  1001e2:	16                   	push   %ss
  1001e3:	54                   	push   %esp
  1001e4:	cd 78                	int    $0x78
  1001e6:	89 ec                	mov    %ebp,%esp
        //经过调试发现，iret后的esp与ebp不同，所以必需要用ebp的值来恢复esp
	    "movl %%ebp, %%esp"
	    : 
	    : "i"(T_SWITCH_TOU)
	);
}
  1001e8:	90                   	nop
  1001e9:	5d                   	pop    %ebp
  1001ea:	c3                   	ret    

001001eb <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001eb:	f3 0f 1e fb          	endbr32 
  1001ef:	55                   	push   %ebp
  1001f0:	89 e5                	mov    %esp,%ebp
    //LAB1 CHALLENGE 1 :  TODO
    
    asm volatile (
  1001f2:	cd 79                	int    $0x79
  1001f4:	89 ec                	mov    %ebp,%esp
	    "movl %%ebp, %%esp \n"
	    :
	    : "i"(T_SWITCH_TOK)
	);
   
}
  1001f6:	90                   	nop
  1001f7:	5d                   	pop    %ebp
  1001f8:	c3                   	ret    

001001f9 <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001f9:	f3 0f 1e fb          	endbr32 
  1001fd:	55                   	push   %ebp
  1001fe:	89 e5                	mov    %esp,%ebp
  100200:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  100203:	e8 11 ff ff ff       	call   100119 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  100208:	c7 04 24 08 38 10 00 	movl   $0x103808,(%esp)
  10020f:	e8 7f 00 00 00       	call   100293 <cprintf>
    lab1_switch_to_user();
  100214:	e8 c2 ff ff ff       	call   1001db <lab1_switch_to_user>
    lab1_print_cur_status();
  100219:	e8 fb fe ff ff       	call   100119 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  10021e:	c7 04 24 28 38 10 00 	movl   $0x103828,(%esp)
  100225:	e8 69 00 00 00       	call   100293 <cprintf>
    lab1_switch_to_kernel();
  10022a:	e8 bc ff ff ff       	call   1001eb <lab1_switch_to_kernel>
    lab1_print_cur_status();
  10022f:	e8 e5 fe ff ff       	call   100119 <lab1_print_cur_status>
}
  100234:	90                   	nop
  100235:	c9                   	leave  
  100236:	c3                   	ret    

00100237 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100237:	f3 0f 1e fb          	endbr32 
  10023b:	55                   	push   %ebp
  10023c:	89 e5                	mov    %esp,%ebp
  10023e:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100241:	8b 45 08             	mov    0x8(%ebp),%eax
  100244:	89 04 24             	mov    %eax,(%esp)
  100247:	e8 2d 14 00 00       	call   101679 <cons_putc>
    (*cnt) ++;
  10024c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10024f:	8b 00                	mov    (%eax),%eax
  100251:	8d 50 01             	lea    0x1(%eax),%edx
  100254:	8b 45 0c             	mov    0xc(%ebp),%eax
  100257:	89 10                	mov    %edx,(%eax)
}
  100259:	90                   	nop
  10025a:	c9                   	leave  
  10025b:	c3                   	ret    

0010025c <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  10025c:	f3 0f 1e fb          	endbr32 
  100260:	55                   	push   %ebp
  100261:	89 e5                	mov    %esp,%ebp
  100263:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  100266:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  10026d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100270:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100274:	8b 45 08             	mov    0x8(%ebp),%eax
  100277:	89 44 24 08          	mov    %eax,0x8(%esp)
  10027b:	8d 45 f4             	lea    -0xc(%ebp),%eax
  10027e:	89 44 24 04          	mov    %eax,0x4(%esp)
  100282:	c7 04 24 37 02 10 00 	movl   $0x100237,(%esp)
  100289:	e8 5a 30 00 00       	call   1032e8 <vprintfmt>
    return cnt;
  10028e:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100291:	c9                   	leave  
  100292:	c3                   	ret    

00100293 <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  100293:	f3 0f 1e fb          	endbr32 
  100297:	55                   	push   %ebp
  100298:	89 e5                	mov    %esp,%ebp
  10029a:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10029d:	8d 45 0c             	lea    0xc(%ebp),%eax
  1002a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  1002a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1002a6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1002aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1002ad:	89 04 24             	mov    %eax,(%esp)
  1002b0:	e8 a7 ff ff ff       	call   10025c <vcprintf>
  1002b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  1002b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1002bb:	c9                   	leave  
  1002bc:	c3                   	ret    

001002bd <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  1002bd:	f3 0f 1e fb          	endbr32 
  1002c1:	55                   	push   %ebp
  1002c2:	89 e5                	mov    %esp,%ebp
  1002c4:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  1002c7:	8b 45 08             	mov    0x8(%ebp),%eax
  1002ca:	89 04 24             	mov    %eax,(%esp)
  1002cd:	e8 a7 13 00 00       	call   101679 <cons_putc>
}
  1002d2:	90                   	nop
  1002d3:	c9                   	leave  
  1002d4:	c3                   	ret    

001002d5 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  1002d5:	f3 0f 1e fb          	endbr32 
  1002d9:	55                   	push   %ebp
  1002da:	89 e5                	mov    %esp,%ebp
  1002dc:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002df:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  1002e6:	eb 13                	jmp    1002fb <cputs+0x26>
        cputch(c, &cnt);
  1002e8:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  1002ec:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1002ef:	89 54 24 04          	mov    %edx,0x4(%esp)
  1002f3:	89 04 24             	mov    %eax,(%esp)
  1002f6:	e8 3c ff ff ff       	call   100237 <cputch>
    while ((c = *str ++) != '\0') {
  1002fb:	8b 45 08             	mov    0x8(%ebp),%eax
  1002fe:	8d 50 01             	lea    0x1(%eax),%edx
  100301:	89 55 08             	mov    %edx,0x8(%ebp)
  100304:	0f b6 00             	movzbl (%eax),%eax
  100307:	88 45 f7             	mov    %al,-0x9(%ebp)
  10030a:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  10030e:	75 d8                	jne    1002e8 <cputs+0x13>
    }
    cputch('\n', &cnt);
  100310:	8d 45 f0             	lea    -0x10(%ebp),%eax
  100313:	89 44 24 04          	mov    %eax,0x4(%esp)
  100317:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  10031e:	e8 14 ff ff ff       	call   100237 <cputch>
    return cnt;
  100323:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  100326:	c9                   	leave  
  100327:	c3                   	ret    

00100328 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  100328:	f3 0f 1e fb          	endbr32 
  10032c:	55                   	push   %ebp
  10032d:	89 e5                	mov    %esp,%ebp
  10032f:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  100332:	90                   	nop
  100333:	e8 6f 13 00 00       	call   1016a7 <cons_getc>
  100338:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10033b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10033f:	74 f2                	je     100333 <getchar+0xb>
        /* do nothing */;
    return c;
  100341:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100344:	c9                   	leave  
  100345:	c3                   	ret    

00100346 <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  100346:	f3 0f 1e fb          	endbr32 
  10034a:	55                   	push   %ebp
  10034b:	89 e5                	mov    %esp,%ebp
  10034d:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100350:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100354:	74 13                	je     100369 <readline+0x23>
        cprintf("%s", prompt);
  100356:	8b 45 08             	mov    0x8(%ebp),%eax
  100359:	89 44 24 04          	mov    %eax,0x4(%esp)
  10035d:	c7 04 24 47 38 10 00 	movl   $0x103847,(%esp)
  100364:	e8 2a ff ff ff       	call   100293 <cprintf>
    }
    int i = 0, c;
  100369:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100370:	e8 b3 ff ff ff       	call   100328 <getchar>
  100375:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  100378:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  10037c:	79 07                	jns    100385 <readline+0x3f>
            return NULL;
  10037e:	b8 00 00 00 00       	mov    $0x0,%eax
  100383:	eb 78                	jmp    1003fd <readline+0xb7>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100385:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  100389:	7e 28                	jle    1003b3 <readline+0x6d>
  10038b:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100392:	7f 1f                	jg     1003b3 <readline+0x6d>
            cputchar(c);
  100394:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100397:	89 04 24             	mov    %eax,(%esp)
  10039a:	e8 1e ff ff ff       	call   1002bd <cputchar>
            buf[i ++] = c;
  10039f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003a2:	8d 50 01             	lea    0x1(%eax),%edx
  1003a5:	89 55 f4             	mov    %edx,-0xc(%ebp)
  1003a8:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1003ab:	88 90 40 0a 11 00    	mov    %dl,0x110a40(%eax)
  1003b1:	eb 45                	jmp    1003f8 <readline+0xb2>
        }
        else if (c == '\b' && i > 0) {
  1003b3:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  1003b7:	75 16                	jne    1003cf <readline+0x89>
  1003b9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1003bd:	7e 10                	jle    1003cf <readline+0x89>
            cputchar(c);
  1003bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003c2:	89 04 24             	mov    %eax,(%esp)
  1003c5:	e8 f3 fe ff ff       	call   1002bd <cputchar>
            i --;
  1003ca:	ff 4d f4             	decl   -0xc(%ebp)
  1003cd:	eb 29                	jmp    1003f8 <readline+0xb2>
        }
        else if (c == '\n' || c == '\r') {
  1003cf:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  1003d3:	74 06                	je     1003db <readline+0x95>
  1003d5:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  1003d9:	75 95                	jne    100370 <readline+0x2a>
            cputchar(c);
  1003db:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003de:	89 04 24             	mov    %eax,(%esp)
  1003e1:	e8 d7 fe ff ff       	call   1002bd <cputchar>
            buf[i] = '\0';
  1003e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003e9:	05 40 0a 11 00       	add    $0x110a40,%eax
  1003ee:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1003f1:	b8 40 0a 11 00       	mov    $0x110a40,%eax
  1003f6:	eb 05                	jmp    1003fd <readline+0xb7>
        c = getchar();
  1003f8:	e9 73 ff ff ff       	jmp    100370 <readline+0x2a>
        }
    }
}
  1003fd:	c9                   	leave  
  1003fe:	c3                   	ret    

001003ff <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003ff:	f3 0f 1e fb          	endbr32 
  100403:	55                   	push   %ebp
  100404:	89 e5                	mov    %esp,%ebp
  100406:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  100409:	a1 40 0e 11 00       	mov    0x110e40,%eax
  10040e:	85 c0                	test   %eax,%eax
  100410:	75 5b                	jne    10046d <__panic+0x6e>
        goto panic_dead;
    }
    is_panic = 1;
  100412:	c7 05 40 0e 11 00 01 	movl   $0x1,0x110e40
  100419:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  10041c:	8d 45 14             	lea    0x14(%ebp),%eax
  10041f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  100422:	8b 45 0c             	mov    0xc(%ebp),%eax
  100425:	89 44 24 08          	mov    %eax,0x8(%esp)
  100429:	8b 45 08             	mov    0x8(%ebp),%eax
  10042c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100430:	c7 04 24 4a 38 10 00 	movl   $0x10384a,(%esp)
  100437:	e8 57 fe ff ff       	call   100293 <cprintf>
    vcprintf(fmt, ap);
  10043c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10043f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100443:	8b 45 10             	mov    0x10(%ebp),%eax
  100446:	89 04 24             	mov    %eax,(%esp)
  100449:	e8 0e fe ff ff       	call   10025c <vcprintf>
    cprintf("\n");
  10044e:	c7 04 24 66 38 10 00 	movl   $0x103866,(%esp)
  100455:	e8 39 fe ff ff       	call   100293 <cprintf>
    
    cprintf("stack trackback:\n");
  10045a:	c7 04 24 68 38 10 00 	movl   $0x103868,(%esp)
  100461:	e8 2d fe ff ff       	call   100293 <cprintf>
    print_stackframe();
  100466:	e8 3d 06 00 00       	call   100aa8 <print_stackframe>
  10046b:	eb 01                	jmp    10046e <__panic+0x6f>
        goto panic_dead;
  10046d:	90                   	nop
    
    va_end(ap);

panic_dead:
    intr_disable();
  10046e:	e8 82 14 00 00       	call   1018f5 <intr_disable>
    while (1) {
        kmonitor(NULL);
  100473:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10047a:	e8 5f 08 00 00       	call   100cde <kmonitor>
  10047f:	eb f2                	jmp    100473 <__panic+0x74>

00100481 <__warn>:
    }
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100481:	f3 0f 1e fb          	endbr32 
  100485:	55                   	push   %ebp
  100486:	89 e5                	mov    %esp,%ebp
  100488:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  10048b:	8d 45 14             	lea    0x14(%ebp),%eax
  10048e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  100491:	8b 45 0c             	mov    0xc(%ebp),%eax
  100494:	89 44 24 08          	mov    %eax,0x8(%esp)
  100498:	8b 45 08             	mov    0x8(%ebp),%eax
  10049b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10049f:	c7 04 24 7a 38 10 00 	movl   $0x10387a,(%esp)
  1004a6:	e8 e8 fd ff ff       	call   100293 <cprintf>
    vcprintf(fmt, ap);
  1004ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1004ae:	89 44 24 04          	mov    %eax,0x4(%esp)
  1004b2:	8b 45 10             	mov    0x10(%ebp),%eax
  1004b5:	89 04 24             	mov    %eax,(%esp)
  1004b8:	e8 9f fd ff ff       	call   10025c <vcprintf>
    cprintf("\n");
  1004bd:	c7 04 24 66 38 10 00 	movl   $0x103866,(%esp)
  1004c4:	e8 ca fd ff ff       	call   100293 <cprintf>
    va_end(ap);
}
  1004c9:	90                   	nop
  1004ca:	c9                   	leave  
  1004cb:	c3                   	ret    

001004cc <is_kernel_panic>:

bool
is_kernel_panic(void) {
  1004cc:	f3 0f 1e fb          	endbr32 
  1004d0:	55                   	push   %ebp
  1004d1:	89 e5                	mov    %esp,%ebp
    return is_panic;
  1004d3:	a1 40 0e 11 00       	mov    0x110e40,%eax
}
  1004d8:	5d                   	pop    %ebp
  1004d9:	c3                   	ret    

001004da <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  1004da:	f3 0f 1e fb          	endbr32 
  1004de:	55                   	push   %ebp
  1004df:	89 e5                	mov    %esp,%ebp
  1004e1:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  1004e4:	8b 45 0c             	mov    0xc(%ebp),%eax
  1004e7:	8b 00                	mov    (%eax),%eax
  1004e9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1004ec:	8b 45 10             	mov    0x10(%ebp),%eax
  1004ef:	8b 00                	mov    (%eax),%eax
  1004f1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1004f4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1004fb:	e9 ca 00 00 00       	jmp    1005ca <stab_binsearch+0xf0>
        int true_m = (l + r) / 2, m = true_m;
  100500:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100503:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100506:	01 d0                	add    %edx,%eax
  100508:	89 c2                	mov    %eax,%edx
  10050a:	c1 ea 1f             	shr    $0x1f,%edx
  10050d:	01 d0                	add    %edx,%eax
  10050f:	d1 f8                	sar    %eax
  100511:	89 45 ec             	mov    %eax,-0x14(%ebp)
  100514:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100517:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  10051a:	eb 03                	jmp    10051f <stab_binsearch+0x45>
            m --;
  10051c:	ff 4d f0             	decl   -0x10(%ebp)
        while (m >= l && stabs[m].n_type != type) {
  10051f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100522:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100525:	7c 1f                	jl     100546 <stab_binsearch+0x6c>
  100527:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10052a:	89 d0                	mov    %edx,%eax
  10052c:	01 c0                	add    %eax,%eax
  10052e:	01 d0                	add    %edx,%eax
  100530:	c1 e0 02             	shl    $0x2,%eax
  100533:	89 c2                	mov    %eax,%edx
  100535:	8b 45 08             	mov    0x8(%ebp),%eax
  100538:	01 d0                	add    %edx,%eax
  10053a:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10053e:	0f b6 c0             	movzbl %al,%eax
  100541:	39 45 14             	cmp    %eax,0x14(%ebp)
  100544:	75 d6                	jne    10051c <stab_binsearch+0x42>
        }
        if (m < l) {    // no match in [l, m]
  100546:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100549:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  10054c:	7d 09                	jge    100557 <stab_binsearch+0x7d>
            l = true_m + 1;
  10054e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100551:	40                   	inc    %eax
  100552:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100555:	eb 73                	jmp    1005ca <stab_binsearch+0xf0>
        }

        // actual binary search
        any_matches = 1;
  100557:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  10055e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100561:	89 d0                	mov    %edx,%eax
  100563:	01 c0                	add    %eax,%eax
  100565:	01 d0                	add    %edx,%eax
  100567:	c1 e0 02             	shl    $0x2,%eax
  10056a:	89 c2                	mov    %eax,%edx
  10056c:	8b 45 08             	mov    0x8(%ebp),%eax
  10056f:	01 d0                	add    %edx,%eax
  100571:	8b 40 08             	mov    0x8(%eax),%eax
  100574:	39 45 18             	cmp    %eax,0x18(%ebp)
  100577:	76 11                	jbe    10058a <stab_binsearch+0xb0>
            *region_left = m;
  100579:	8b 45 0c             	mov    0xc(%ebp),%eax
  10057c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10057f:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100581:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100584:	40                   	inc    %eax
  100585:	89 45 fc             	mov    %eax,-0x4(%ebp)
  100588:	eb 40                	jmp    1005ca <stab_binsearch+0xf0>
        } else if (stabs[m].n_value > addr) {
  10058a:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10058d:	89 d0                	mov    %edx,%eax
  10058f:	01 c0                	add    %eax,%eax
  100591:	01 d0                	add    %edx,%eax
  100593:	c1 e0 02             	shl    $0x2,%eax
  100596:	89 c2                	mov    %eax,%edx
  100598:	8b 45 08             	mov    0x8(%ebp),%eax
  10059b:	01 d0                	add    %edx,%eax
  10059d:	8b 40 08             	mov    0x8(%eax),%eax
  1005a0:	39 45 18             	cmp    %eax,0x18(%ebp)
  1005a3:	73 14                	jae    1005b9 <stab_binsearch+0xdf>
            *region_right = m - 1;
  1005a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005a8:	8d 50 ff             	lea    -0x1(%eax),%edx
  1005ab:	8b 45 10             	mov    0x10(%ebp),%eax
  1005ae:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  1005b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005b3:	48                   	dec    %eax
  1005b4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1005b7:	eb 11                	jmp    1005ca <stab_binsearch+0xf0>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  1005b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005bc:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1005bf:	89 10                	mov    %edx,(%eax)
            l = m;
  1005c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1005c4:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  1005c7:	ff 45 18             	incl   0x18(%ebp)
    while (l <= r) {
  1005ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1005cd:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  1005d0:	0f 8e 2a ff ff ff    	jle    100500 <stab_binsearch+0x26>
        }
    }

    if (!any_matches) {
  1005d6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1005da:	75 0f                	jne    1005eb <stab_binsearch+0x111>
        *region_right = *region_left - 1;
  1005dc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005df:	8b 00                	mov    (%eax),%eax
  1005e1:	8d 50 ff             	lea    -0x1(%eax),%edx
  1005e4:	8b 45 10             	mov    0x10(%ebp),%eax
  1005e7:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  1005e9:	eb 3e                	jmp    100629 <stab_binsearch+0x14f>
        l = *region_right;
  1005eb:	8b 45 10             	mov    0x10(%ebp),%eax
  1005ee:	8b 00                	mov    (%eax),%eax
  1005f0:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1005f3:	eb 03                	jmp    1005f8 <stab_binsearch+0x11e>
  1005f5:	ff 4d fc             	decl   -0x4(%ebp)
  1005f8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005fb:	8b 00                	mov    (%eax),%eax
  1005fd:	39 45 fc             	cmp    %eax,-0x4(%ebp)
  100600:	7e 1f                	jle    100621 <stab_binsearch+0x147>
  100602:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100605:	89 d0                	mov    %edx,%eax
  100607:	01 c0                	add    %eax,%eax
  100609:	01 d0                	add    %edx,%eax
  10060b:	c1 e0 02             	shl    $0x2,%eax
  10060e:	89 c2                	mov    %eax,%edx
  100610:	8b 45 08             	mov    0x8(%ebp),%eax
  100613:	01 d0                	add    %edx,%eax
  100615:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100619:	0f b6 c0             	movzbl %al,%eax
  10061c:	39 45 14             	cmp    %eax,0x14(%ebp)
  10061f:	75 d4                	jne    1005f5 <stab_binsearch+0x11b>
        *region_left = l;
  100621:	8b 45 0c             	mov    0xc(%ebp),%eax
  100624:	8b 55 fc             	mov    -0x4(%ebp),%edx
  100627:	89 10                	mov    %edx,(%eax)
}
  100629:	90                   	nop
  10062a:	c9                   	leave  
  10062b:	c3                   	ret    

0010062c <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  10062c:	f3 0f 1e fb          	endbr32 
  100630:	55                   	push   %ebp
  100631:	89 e5                	mov    %esp,%ebp
  100633:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  100636:	8b 45 0c             	mov    0xc(%ebp),%eax
  100639:	c7 00 98 38 10 00    	movl   $0x103898,(%eax)
    info->eip_line = 0;
  10063f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100642:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  100649:	8b 45 0c             	mov    0xc(%ebp),%eax
  10064c:	c7 40 08 98 38 10 00 	movl   $0x103898,0x8(%eax)
    info->eip_fn_namelen = 9;
  100653:	8b 45 0c             	mov    0xc(%ebp),%eax
  100656:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10065d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100660:	8b 55 08             	mov    0x8(%ebp),%edx
  100663:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100666:	8b 45 0c             	mov    0xc(%ebp),%eax
  100669:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100670:	c7 45 f4 ec 40 10 00 	movl   $0x1040ec,-0xc(%ebp)
    stab_end = __STAB_END__;
  100677:	c7 45 f0 30 cf 10 00 	movl   $0x10cf30,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10067e:	c7 45 ec 31 cf 10 00 	movl   $0x10cf31,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100685:	c7 45 e8 57 f0 10 00 	movl   $0x10f057,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10068c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10068f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100692:	76 0b                	jbe    10069f <debuginfo_eip+0x73>
  100694:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100697:	48                   	dec    %eax
  100698:	0f b6 00             	movzbl (%eax),%eax
  10069b:	84 c0                	test   %al,%al
  10069d:	74 0a                	je     1006a9 <debuginfo_eip+0x7d>
        return -1;
  10069f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006a4:	e9 ab 02 00 00       	jmp    100954 <debuginfo_eip+0x328>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  1006a9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  1006b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1006b3:	2b 45 f4             	sub    -0xc(%ebp),%eax
  1006b6:	c1 f8 02             	sar    $0x2,%eax
  1006b9:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  1006bf:	48                   	dec    %eax
  1006c0:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  1006c3:	8b 45 08             	mov    0x8(%ebp),%eax
  1006c6:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006ca:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  1006d1:	00 
  1006d2:	8d 45 e0             	lea    -0x20(%ebp),%eax
  1006d5:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006d9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  1006dc:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006e3:	89 04 24             	mov    %eax,(%esp)
  1006e6:	e8 ef fd ff ff       	call   1004da <stab_binsearch>
    if (lfile == 0)
  1006eb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006ee:	85 c0                	test   %eax,%eax
  1006f0:	75 0a                	jne    1006fc <debuginfo_eip+0xd0>
        return -1;
  1006f2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006f7:	e9 58 02 00 00       	jmp    100954 <debuginfo_eip+0x328>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1006fc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006ff:	89 45 dc             	mov    %eax,-0x24(%ebp)
  100702:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100705:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  100708:	8b 45 08             	mov    0x8(%ebp),%eax
  10070b:	89 44 24 10          	mov    %eax,0x10(%esp)
  10070f:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  100716:	00 
  100717:	8d 45 d8             	lea    -0x28(%ebp),%eax
  10071a:	89 44 24 08          	mov    %eax,0x8(%esp)
  10071e:	8d 45 dc             	lea    -0x24(%ebp),%eax
  100721:	89 44 24 04          	mov    %eax,0x4(%esp)
  100725:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100728:	89 04 24             	mov    %eax,(%esp)
  10072b:	e8 aa fd ff ff       	call   1004da <stab_binsearch>

    if (lfun <= rfun) {
  100730:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100733:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100736:	39 c2                	cmp    %eax,%edx
  100738:	7f 78                	jg     1007b2 <debuginfo_eip+0x186>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  10073a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10073d:	89 c2                	mov    %eax,%edx
  10073f:	89 d0                	mov    %edx,%eax
  100741:	01 c0                	add    %eax,%eax
  100743:	01 d0                	add    %edx,%eax
  100745:	c1 e0 02             	shl    $0x2,%eax
  100748:	89 c2                	mov    %eax,%edx
  10074a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10074d:	01 d0                	add    %edx,%eax
  10074f:	8b 10                	mov    (%eax),%edx
  100751:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100754:	2b 45 ec             	sub    -0x14(%ebp),%eax
  100757:	39 c2                	cmp    %eax,%edx
  100759:	73 22                	jae    10077d <debuginfo_eip+0x151>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  10075b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10075e:	89 c2                	mov    %eax,%edx
  100760:	89 d0                	mov    %edx,%eax
  100762:	01 c0                	add    %eax,%eax
  100764:	01 d0                	add    %edx,%eax
  100766:	c1 e0 02             	shl    $0x2,%eax
  100769:	89 c2                	mov    %eax,%edx
  10076b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10076e:	01 d0                	add    %edx,%eax
  100770:	8b 10                	mov    (%eax),%edx
  100772:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100775:	01 c2                	add    %eax,%edx
  100777:	8b 45 0c             	mov    0xc(%ebp),%eax
  10077a:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  10077d:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100780:	89 c2                	mov    %eax,%edx
  100782:	89 d0                	mov    %edx,%eax
  100784:	01 c0                	add    %eax,%eax
  100786:	01 d0                	add    %edx,%eax
  100788:	c1 e0 02             	shl    $0x2,%eax
  10078b:	89 c2                	mov    %eax,%edx
  10078d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100790:	01 d0                	add    %edx,%eax
  100792:	8b 50 08             	mov    0x8(%eax),%edx
  100795:	8b 45 0c             	mov    0xc(%ebp),%eax
  100798:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  10079b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10079e:	8b 40 10             	mov    0x10(%eax),%eax
  1007a1:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  1007a4:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1007a7:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  1007aa:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1007ad:	89 45 d0             	mov    %eax,-0x30(%ebp)
  1007b0:	eb 15                	jmp    1007c7 <debuginfo_eip+0x19b>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  1007b2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007b5:	8b 55 08             	mov    0x8(%ebp),%edx
  1007b8:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  1007bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1007be:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  1007c1:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1007c4:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  1007c7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007ca:	8b 40 08             	mov    0x8(%eax),%eax
  1007cd:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  1007d4:	00 
  1007d5:	89 04 24             	mov    %eax,(%esp)
  1007d8:	e8 13 26 00 00       	call   102df0 <strfind>
  1007dd:	8b 55 0c             	mov    0xc(%ebp),%edx
  1007e0:	8b 52 08             	mov    0x8(%edx),%edx
  1007e3:	29 d0                	sub    %edx,%eax
  1007e5:	89 c2                	mov    %eax,%edx
  1007e7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007ea:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1007ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1007f0:	89 44 24 10          	mov    %eax,0x10(%esp)
  1007f4:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1007fb:	00 
  1007fc:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1007ff:	89 44 24 08          	mov    %eax,0x8(%esp)
  100803:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  100806:	89 44 24 04          	mov    %eax,0x4(%esp)
  10080a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10080d:	89 04 24             	mov    %eax,(%esp)
  100810:	e8 c5 fc ff ff       	call   1004da <stab_binsearch>
    if (lline <= rline) {
  100815:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100818:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10081b:	39 c2                	cmp    %eax,%edx
  10081d:	7f 23                	jg     100842 <debuginfo_eip+0x216>
        info->eip_line = stabs[rline].n_desc;
  10081f:	8b 45 d0             	mov    -0x30(%ebp),%eax
  100822:	89 c2                	mov    %eax,%edx
  100824:	89 d0                	mov    %edx,%eax
  100826:	01 c0                	add    %eax,%eax
  100828:	01 d0                	add    %edx,%eax
  10082a:	c1 e0 02             	shl    $0x2,%eax
  10082d:	89 c2                	mov    %eax,%edx
  10082f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100832:	01 d0                	add    %edx,%eax
  100834:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  100838:	89 c2                	mov    %eax,%edx
  10083a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10083d:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  100840:	eb 11                	jmp    100853 <debuginfo_eip+0x227>
        return -1;
  100842:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100847:	e9 08 01 00 00       	jmp    100954 <debuginfo_eip+0x328>
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  10084c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10084f:	48                   	dec    %eax
  100850:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    while (lline >= lfile
  100853:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  100856:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100859:	39 c2                	cmp    %eax,%edx
  10085b:	7c 56                	jl     1008b3 <debuginfo_eip+0x287>
           && stabs[lline].n_type != N_SOL
  10085d:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100860:	89 c2                	mov    %eax,%edx
  100862:	89 d0                	mov    %edx,%eax
  100864:	01 c0                	add    %eax,%eax
  100866:	01 d0                	add    %edx,%eax
  100868:	c1 e0 02             	shl    $0x2,%eax
  10086b:	89 c2                	mov    %eax,%edx
  10086d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100870:	01 d0                	add    %edx,%eax
  100872:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100876:	3c 84                	cmp    $0x84,%al
  100878:	74 39                	je     1008b3 <debuginfo_eip+0x287>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  10087a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10087d:	89 c2                	mov    %eax,%edx
  10087f:	89 d0                	mov    %edx,%eax
  100881:	01 c0                	add    %eax,%eax
  100883:	01 d0                	add    %edx,%eax
  100885:	c1 e0 02             	shl    $0x2,%eax
  100888:	89 c2                	mov    %eax,%edx
  10088a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10088d:	01 d0                	add    %edx,%eax
  10088f:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100893:	3c 64                	cmp    $0x64,%al
  100895:	75 b5                	jne    10084c <debuginfo_eip+0x220>
  100897:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10089a:	89 c2                	mov    %eax,%edx
  10089c:	89 d0                	mov    %edx,%eax
  10089e:	01 c0                	add    %eax,%eax
  1008a0:	01 d0                	add    %edx,%eax
  1008a2:	c1 e0 02             	shl    $0x2,%eax
  1008a5:	89 c2                	mov    %eax,%edx
  1008a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008aa:	01 d0                	add    %edx,%eax
  1008ac:	8b 40 08             	mov    0x8(%eax),%eax
  1008af:	85 c0                	test   %eax,%eax
  1008b1:	74 99                	je     10084c <debuginfo_eip+0x220>
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  1008b3:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1008b9:	39 c2                	cmp    %eax,%edx
  1008bb:	7c 42                	jl     1008ff <debuginfo_eip+0x2d3>
  1008bd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008c0:	89 c2                	mov    %eax,%edx
  1008c2:	89 d0                	mov    %edx,%eax
  1008c4:	01 c0                	add    %eax,%eax
  1008c6:	01 d0                	add    %edx,%eax
  1008c8:	c1 e0 02             	shl    $0x2,%eax
  1008cb:	89 c2                	mov    %eax,%edx
  1008cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008d0:	01 d0                	add    %edx,%eax
  1008d2:	8b 10                	mov    (%eax),%edx
  1008d4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1008d7:	2b 45 ec             	sub    -0x14(%ebp),%eax
  1008da:	39 c2                	cmp    %eax,%edx
  1008dc:	73 21                	jae    1008ff <debuginfo_eip+0x2d3>
        info->eip_file = stabstr + stabs[lline].n_strx;
  1008de:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008e1:	89 c2                	mov    %eax,%edx
  1008e3:	89 d0                	mov    %edx,%eax
  1008e5:	01 c0                	add    %eax,%eax
  1008e7:	01 d0                	add    %edx,%eax
  1008e9:	c1 e0 02             	shl    $0x2,%eax
  1008ec:	89 c2                	mov    %eax,%edx
  1008ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008f1:	01 d0                	add    %edx,%eax
  1008f3:	8b 10                	mov    (%eax),%edx
  1008f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1008f8:	01 c2                	add    %eax,%edx
  1008fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008fd:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1008ff:	8b 55 dc             	mov    -0x24(%ebp),%edx
  100902:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100905:	39 c2                	cmp    %eax,%edx
  100907:	7d 46                	jge    10094f <debuginfo_eip+0x323>
        for (lline = lfun + 1;
  100909:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10090c:	40                   	inc    %eax
  10090d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  100910:	eb 16                	jmp    100928 <debuginfo_eip+0x2fc>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  100912:	8b 45 0c             	mov    0xc(%ebp),%eax
  100915:	8b 40 14             	mov    0x14(%eax),%eax
  100918:	8d 50 01             	lea    0x1(%eax),%edx
  10091b:	8b 45 0c             	mov    0xc(%ebp),%eax
  10091e:	89 50 14             	mov    %edx,0x14(%eax)
             lline ++) {
  100921:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100924:	40                   	inc    %eax
  100925:	89 45 d4             	mov    %eax,-0x2c(%ebp)
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100928:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10092b:	8b 45 d8             	mov    -0x28(%ebp),%eax
        for (lline = lfun + 1;
  10092e:	39 c2                	cmp    %eax,%edx
  100930:	7d 1d                	jge    10094f <debuginfo_eip+0x323>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  100932:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100935:	89 c2                	mov    %eax,%edx
  100937:	89 d0                	mov    %edx,%eax
  100939:	01 c0                	add    %eax,%eax
  10093b:	01 d0                	add    %edx,%eax
  10093d:	c1 e0 02             	shl    $0x2,%eax
  100940:	89 c2                	mov    %eax,%edx
  100942:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100945:	01 d0                	add    %edx,%eax
  100947:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10094b:	3c a0                	cmp    $0xa0,%al
  10094d:	74 c3                	je     100912 <debuginfo_eip+0x2e6>
        }
    }
    return 0;
  10094f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100954:	c9                   	leave  
  100955:	c3                   	ret    

00100956 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100956:	f3 0f 1e fb          	endbr32 
  10095a:	55                   	push   %ebp
  10095b:	89 e5                	mov    %esp,%ebp
  10095d:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100960:	c7 04 24 a2 38 10 00 	movl   $0x1038a2,(%esp)
  100967:	e8 27 f9 ff ff       	call   100293 <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  10096c:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  100973:	00 
  100974:	c7 04 24 bb 38 10 00 	movl   $0x1038bb,(%esp)
  10097b:	e8 13 f9 ff ff       	call   100293 <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100980:	c7 44 24 04 a0 37 10 	movl   $0x1037a0,0x4(%esp)
  100987:	00 
  100988:	c7 04 24 d3 38 10 00 	movl   $0x1038d3,(%esp)
  10098f:	e8 ff f8 ff ff       	call   100293 <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  100994:	c7 44 24 04 16 0a 11 	movl   $0x110a16,0x4(%esp)
  10099b:	00 
  10099c:	c7 04 24 eb 38 10 00 	movl   $0x1038eb,(%esp)
  1009a3:	e8 eb f8 ff ff       	call   100293 <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  1009a8:	c7 44 24 04 80 1d 11 	movl   $0x111d80,0x4(%esp)
  1009af:	00 
  1009b0:	c7 04 24 03 39 10 00 	movl   $0x103903,(%esp)
  1009b7:	e8 d7 f8 ff ff       	call   100293 <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  1009bc:	b8 80 1d 11 00       	mov    $0x111d80,%eax
  1009c1:	2d 00 00 10 00       	sub    $0x100000,%eax
  1009c6:	05 ff 03 00 00       	add    $0x3ff,%eax
  1009cb:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  1009d1:	85 c0                	test   %eax,%eax
  1009d3:	0f 48 c2             	cmovs  %edx,%eax
  1009d6:	c1 f8 0a             	sar    $0xa,%eax
  1009d9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009dd:	c7 04 24 1c 39 10 00 	movl   $0x10391c,(%esp)
  1009e4:	e8 aa f8 ff ff       	call   100293 <cprintf>
}
  1009e9:	90                   	nop
  1009ea:	c9                   	leave  
  1009eb:	c3                   	ret    

001009ec <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1009ec:	f3 0f 1e fb          	endbr32 
  1009f0:	55                   	push   %ebp
  1009f1:	89 e5                	mov    %esp,%ebp
  1009f3:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1009f9:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1009fc:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a00:	8b 45 08             	mov    0x8(%ebp),%eax
  100a03:	89 04 24             	mov    %eax,(%esp)
  100a06:	e8 21 fc ff ff       	call   10062c <debuginfo_eip>
  100a0b:	85 c0                	test   %eax,%eax
  100a0d:	74 15                	je     100a24 <print_debuginfo+0x38>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  100a0f:	8b 45 08             	mov    0x8(%ebp),%eax
  100a12:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a16:	c7 04 24 46 39 10 00 	movl   $0x103946,(%esp)
  100a1d:	e8 71 f8 ff ff       	call   100293 <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  100a22:	eb 6c                	jmp    100a90 <print_debuginfo+0xa4>
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100a24:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100a2b:	eb 1b                	jmp    100a48 <print_debuginfo+0x5c>
            fnname[j] = info.eip_fn_name[j];
  100a2d:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  100a30:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a33:	01 d0                	add    %edx,%eax
  100a35:	0f b6 10             	movzbl (%eax),%edx
  100a38:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a41:	01 c8                	add    %ecx,%eax
  100a43:	88 10                	mov    %dl,(%eax)
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  100a45:	ff 45 f4             	incl   -0xc(%ebp)
  100a48:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a4b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
  100a4e:	7c dd                	jl     100a2d <print_debuginfo+0x41>
        fnname[j] = '\0';
  100a50:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100a56:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a59:	01 d0                	add    %edx,%eax
  100a5b:	c6 00 00             	movb   $0x0,(%eax)
                fnname, eip - info.eip_fn_addr);
  100a5e:	8b 45 ec             	mov    -0x14(%ebp),%eax
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100a61:	8b 55 08             	mov    0x8(%ebp),%edx
  100a64:	89 d1                	mov    %edx,%ecx
  100a66:	29 c1                	sub    %eax,%ecx
  100a68:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100a6b:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a6e:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100a72:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a78:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100a7c:	89 54 24 08          	mov    %edx,0x8(%esp)
  100a80:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a84:	c7 04 24 62 39 10 00 	movl   $0x103962,(%esp)
  100a8b:	e8 03 f8 ff ff       	call   100293 <cprintf>
}
  100a90:	90                   	nop
  100a91:	c9                   	leave  
  100a92:	c3                   	ret    

00100a93 <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a93:	f3 0f 1e fb          	endbr32 
  100a97:	55                   	push   %ebp
  100a98:	89 e5                	mov    %esp,%ebp
  100a9a:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    //在父函数中调用read_eip(),返回父函数中当前正在执行的call read_eip的下一条指令的地址
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a9d:	8b 45 04             	mov    0x4(%ebp),%eax
  100aa0:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100aa3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100aa6:	c9                   	leave  
  100aa7:	c3                   	ret    

00100aa8 <print_stackframe>:
 * */



void
print_stackframe(void) {
  100aa8:	f3 0f 1e fb          	endbr32 
  100aac:	55                   	push   %ebp
  100aad:	89 e5                	mov    %esp,%ebp
  100aaf:	83 ec 48             	sub    $0x48,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100ab2:	89 e8                	mov    %ebp,%eax
  100ab4:	89 45 d8             	mov    %eax,-0x28(%ebp)
    return ebp;
  100ab7:	8b 45 d8             	mov    -0x28(%ebp),%eax
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */

      uint32_t ebp=read_ebp();
  100aba:	89 45 f4             	mov    %eax,-0xc(%ebp)
      uint32_t eip=read_eip();
  100abd:	e8 d1 ff ff ff       	call   100a93 <read_eip>
  100ac2:	89 45 f0             	mov    %eax,-0x10(%ebp)
      for(int i=0;ebp!=0 && i<STACKFRAME_DEPTH;i++){
  100ac5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100acc:	e9 86 00 00 00       	jmp    100b57 <print_stackframe+0xaf>
      cprintf("ebp:0x%08x eip:0x%08x ",ebp,eip);
  100ad1:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100ad4:	89 44 24 08          	mov    %eax,0x8(%esp)
  100ad8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100adb:	89 44 24 04          	mov    %eax,0x4(%esp)
  100adf:	c7 04 24 74 39 10 00 	movl   $0x103974,(%esp)
  100ae6:	e8 a8 f7 ff ff       	call   100293 <cprintf>
      uint32_t arg1,arg2,arg3,arg4;
      asm volatile("movl 8(%0), %1\n\t"
  100aeb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100aee:	8b 40 08             	mov    0x8(%eax),%eax
  100af1:	89 45 e8             	mov    %eax,-0x18(%ebp)
                   :"=r" (arg1)
                   :"r"(ebp)
                    );
      asm volatile("movl 12(%0), %1\n\t"
  100af4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100af7:	8b 40 0c             	mov    0xc(%eax),%eax
  100afa:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                   :"=r" (arg2)
                   :"r"(ebp)
                    );
      asm volatile("movl 16(%0), %1\n\t"
  100afd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b00:	8b 40 10             	mov    0x10(%eax),%eax
  100b03:	89 45 e0             	mov    %eax,-0x20(%ebp)
                   :"=r" (arg3)
                   :"r"(ebp)
                    );
      asm volatile("movl 20(%0), %1\n\t"
  100b06:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b09:	8b 40 14             	mov    0x14(%eax),%eax
  100b0c:	89 45 dc             	mov    %eax,-0x24(%ebp)
                   :"=r" (arg4)
                   :"r"(ebp)
                    );
                 
      cprintf("args:0x%08x 0x%08x 0x%08x 0x%08x\n",arg1,arg2,arg3,arg4);
  100b0f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100b12:	89 44 24 10          	mov    %eax,0x10(%esp)
  100b16:	8b 45 e0             	mov    -0x20(%ebp),%eax
  100b19:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100b1d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100b20:	89 44 24 08          	mov    %eax,0x8(%esp)
  100b24:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100b27:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b2b:	c7 04 24 8c 39 10 00 	movl   $0x10398c,(%esp)
  100b32:	e8 5c f7 ff ff       	call   100293 <cprintf>
      print_debuginfo(eip-1);
  100b37:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100b3a:	48                   	dec    %eax
  100b3b:	89 04 24             	mov    %eax,(%esp)
  100b3e:	e8 a9 fe ff ff       	call   1009ec <print_debuginfo>
      
      asm volatile(
  100b43:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b46:	8b 40 04             	mov    0x4(%eax),%eax
  100b49:	89 45 f0             	mov    %eax,-0x10(%ebp)
        "movl 4(%0), %1\n\t"
        :"=r" (eip)
        :"r"(ebp)
    ); 
      asm volatile(
  100b4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b4f:	8b 00                	mov    (%eax),%eax
  100b51:	89 45 f4             	mov    %eax,-0xc(%ebp)
      for(int i=0;ebp!=0 && i<STACKFRAME_DEPTH;i++){
  100b54:	ff 45 ec             	incl   -0x14(%ebp)
  100b57:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100b5b:	74 0a                	je     100b67 <print_stackframe+0xbf>
  100b5d:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100b61:	0f 8e 6a ff ff ff    	jle    100ad1 <print_stackframe+0x29>
                :"r"(ebp)
             );       
      }
 

}
  100b67:	90                   	nop
  100b68:	c9                   	leave  
  100b69:	c3                   	ret    

00100b6a <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100b6a:	f3 0f 1e fb          	endbr32 
  100b6e:	55                   	push   %ebp
  100b6f:	89 e5                	mov    %esp,%ebp
  100b71:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100b74:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b7b:	eb 0c                	jmp    100b89 <parse+0x1f>
            *buf ++ = '\0';
  100b7d:	8b 45 08             	mov    0x8(%ebp),%eax
  100b80:	8d 50 01             	lea    0x1(%eax),%edx
  100b83:	89 55 08             	mov    %edx,0x8(%ebp)
  100b86:	c6 00 00             	movb   $0x0,(%eax)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b89:	8b 45 08             	mov    0x8(%ebp),%eax
  100b8c:	0f b6 00             	movzbl (%eax),%eax
  100b8f:	84 c0                	test   %al,%al
  100b91:	74 1d                	je     100bb0 <parse+0x46>
  100b93:	8b 45 08             	mov    0x8(%ebp),%eax
  100b96:	0f b6 00             	movzbl (%eax),%eax
  100b99:	0f be c0             	movsbl %al,%eax
  100b9c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100ba0:	c7 04 24 30 3a 10 00 	movl   $0x103a30,(%esp)
  100ba7:	e8 0e 22 00 00       	call   102dba <strchr>
  100bac:	85 c0                	test   %eax,%eax
  100bae:	75 cd                	jne    100b7d <parse+0x13>
        }
        if (*buf == '\0') {
  100bb0:	8b 45 08             	mov    0x8(%ebp),%eax
  100bb3:	0f b6 00             	movzbl (%eax),%eax
  100bb6:	84 c0                	test   %al,%al
  100bb8:	74 65                	je     100c1f <parse+0xb5>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100bba:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100bbe:	75 14                	jne    100bd4 <parse+0x6a>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100bc0:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100bc7:	00 
  100bc8:	c7 04 24 35 3a 10 00 	movl   $0x103a35,(%esp)
  100bcf:	e8 bf f6 ff ff       	call   100293 <cprintf>
        }
        argv[argc ++] = buf;
  100bd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100bd7:	8d 50 01             	lea    0x1(%eax),%edx
  100bda:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100bdd:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100be4:	8b 45 0c             	mov    0xc(%ebp),%eax
  100be7:	01 c2                	add    %eax,%edx
  100be9:	8b 45 08             	mov    0x8(%ebp),%eax
  100bec:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100bee:	eb 03                	jmp    100bf3 <parse+0x89>
            buf ++;
  100bf0:	ff 45 08             	incl   0x8(%ebp)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100bf3:	8b 45 08             	mov    0x8(%ebp),%eax
  100bf6:	0f b6 00             	movzbl (%eax),%eax
  100bf9:	84 c0                	test   %al,%al
  100bfb:	74 8c                	je     100b89 <parse+0x1f>
  100bfd:	8b 45 08             	mov    0x8(%ebp),%eax
  100c00:	0f b6 00             	movzbl (%eax),%eax
  100c03:	0f be c0             	movsbl %al,%eax
  100c06:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c0a:	c7 04 24 30 3a 10 00 	movl   $0x103a30,(%esp)
  100c11:	e8 a4 21 00 00       	call   102dba <strchr>
  100c16:	85 c0                	test   %eax,%eax
  100c18:	74 d6                	je     100bf0 <parse+0x86>
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100c1a:	e9 6a ff ff ff       	jmp    100b89 <parse+0x1f>
            break;
  100c1f:	90                   	nop
        }
    }
    return argc;
  100c20:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100c23:	c9                   	leave  
  100c24:	c3                   	ret    

00100c25 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100c25:	f3 0f 1e fb          	endbr32 
  100c29:	55                   	push   %ebp
  100c2a:	89 e5                	mov    %esp,%ebp
  100c2c:	53                   	push   %ebx
  100c2d:	83 ec 64             	sub    $0x64,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100c30:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c33:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c37:	8b 45 08             	mov    0x8(%ebp),%eax
  100c3a:	89 04 24             	mov    %eax,(%esp)
  100c3d:	e8 28 ff ff ff       	call   100b6a <parse>
  100c42:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100c45:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100c49:	75 0a                	jne    100c55 <runcmd+0x30>
        return 0;
  100c4b:	b8 00 00 00 00       	mov    $0x0,%eax
  100c50:	e9 83 00 00 00       	jmp    100cd8 <runcmd+0xb3>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c55:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c5c:	eb 5a                	jmp    100cb8 <runcmd+0x93>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100c5e:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100c61:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c64:	89 d0                	mov    %edx,%eax
  100c66:	01 c0                	add    %eax,%eax
  100c68:	01 d0                	add    %edx,%eax
  100c6a:	c1 e0 02             	shl    $0x2,%eax
  100c6d:	05 00 00 11 00       	add    $0x110000,%eax
  100c72:	8b 00                	mov    (%eax),%eax
  100c74:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100c78:	89 04 24             	mov    %eax,(%esp)
  100c7b:	e8 96 20 00 00       	call   102d16 <strcmp>
  100c80:	85 c0                	test   %eax,%eax
  100c82:	75 31                	jne    100cb5 <runcmd+0x90>
            return commands[i].func(argc - 1, argv + 1, tf);
  100c84:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c87:	89 d0                	mov    %edx,%eax
  100c89:	01 c0                	add    %eax,%eax
  100c8b:	01 d0                	add    %edx,%eax
  100c8d:	c1 e0 02             	shl    $0x2,%eax
  100c90:	05 08 00 11 00       	add    $0x110008,%eax
  100c95:	8b 10                	mov    (%eax),%edx
  100c97:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c9a:	83 c0 04             	add    $0x4,%eax
  100c9d:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100ca0:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100ca3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100ca6:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100caa:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cae:	89 1c 24             	mov    %ebx,(%esp)
  100cb1:	ff d2                	call   *%edx
  100cb3:	eb 23                	jmp    100cd8 <runcmd+0xb3>
    for (i = 0; i < NCOMMANDS; i ++) {
  100cb5:	ff 45 f4             	incl   -0xc(%ebp)
  100cb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cbb:	83 f8 02             	cmp    $0x2,%eax
  100cbe:	76 9e                	jbe    100c5e <runcmd+0x39>
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100cc0:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100cc3:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cc7:	c7 04 24 53 3a 10 00 	movl   $0x103a53,(%esp)
  100cce:	e8 c0 f5 ff ff       	call   100293 <cprintf>
    return 0;
  100cd3:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100cd8:	83 c4 64             	add    $0x64,%esp
  100cdb:	5b                   	pop    %ebx
  100cdc:	5d                   	pop    %ebp
  100cdd:	c3                   	ret    

00100cde <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100cde:	f3 0f 1e fb          	endbr32 
  100ce2:	55                   	push   %ebp
  100ce3:	89 e5                	mov    %esp,%ebp
  100ce5:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100ce8:	c7 04 24 6c 3a 10 00 	movl   $0x103a6c,(%esp)
  100cef:	e8 9f f5 ff ff       	call   100293 <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100cf4:	c7 04 24 94 3a 10 00 	movl   $0x103a94,(%esp)
  100cfb:	e8 93 f5 ff ff       	call   100293 <cprintf>

    if (tf != NULL) {
  100d00:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100d04:	74 0b                	je     100d11 <kmonitor+0x33>
        print_trapframe(tf);
  100d06:	8b 45 08             	mov    0x8(%ebp),%eax
  100d09:	89 04 24             	mov    %eax,(%esp)
  100d0c:	e8 79 0e 00 00       	call   101b8a <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100d11:	c7 04 24 b9 3a 10 00 	movl   $0x103ab9,(%esp)
  100d18:	e8 29 f6 ff ff       	call   100346 <readline>
  100d1d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100d20:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100d24:	74 eb                	je     100d11 <kmonitor+0x33>
            if (runcmd(buf, tf) < 0) {
  100d26:	8b 45 08             	mov    0x8(%ebp),%eax
  100d29:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d30:	89 04 24             	mov    %eax,(%esp)
  100d33:	e8 ed fe ff ff       	call   100c25 <runcmd>
  100d38:	85 c0                	test   %eax,%eax
  100d3a:	78 02                	js     100d3e <kmonitor+0x60>
        if ((buf = readline("K> ")) != NULL) {
  100d3c:	eb d3                	jmp    100d11 <kmonitor+0x33>
                break;
  100d3e:	90                   	nop
            }
        }
    }
}
  100d3f:	90                   	nop
  100d40:	c9                   	leave  
  100d41:	c3                   	ret    

00100d42 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100d42:	f3 0f 1e fb          	endbr32 
  100d46:	55                   	push   %ebp
  100d47:	89 e5                	mov    %esp,%ebp
  100d49:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100d4c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100d53:	eb 3d                	jmp    100d92 <mon_help+0x50>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100d55:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d58:	89 d0                	mov    %edx,%eax
  100d5a:	01 c0                	add    %eax,%eax
  100d5c:	01 d0                	add    %edx,%eax
  100d5e:	c1 e0 02             	shl    $0x2,%eax
  100d61:	05 04 00 11 00       	add    $0x110004,%eax
  100d66:	8b 08                	mov    (%eax),%ecx
  100d68:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d6b:	89 d0                	mov    %edx,%eax
  100d6d:	01 c0                	add    %eax,%eax
  100d6f:	01 d0                	add    %edx,%eax
  100d71:	c1 e0 02             	shl    $0x2,%eax
  100d74:	05 00 00 11 00       	add    $0x110000,%eax
  100d79:	8b 00                	mov    (%eax),%eax
  100d7b:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100d7f:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d83:	c7 04 24 bd 3a 10 00 	movl   $0x103abd,(%esp)
  100d8a:	e8 04 f5 ff ff       	call   100293 <cprintf>
    for (i = 0; i < NCOMMANDS; i ++) {
  100d8f:	ff 45 f4             	incl   -0xc(%ebp)
  100d92:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d95:	83 f8 02             	cmp    $0x2,%eax
  100d98:	76 bb                	jbe    100d55 <mon_help+0x13>
    }
    return 0;
  100d9a:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d9f:	c9                   	leave  
  100da0:	c3                   	ret    

00100da1 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100da1:	f3 0f 1e fb          	endbr32 
  100da5:	55                   	push   %ebp
  100da6:	89 e5                	mov    %esp,%ebp
  100da8:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100dab:	e8 a6 fb ff ff       	call   100956 <print_kerninfo>
    return 0;
  100db0:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100db5:	c9                   	leave  
  100db6:	c3                   	ret    

00100db7 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100db7:	f3 0f 1e fb          	endbr32 
  100dbb:	55                   	push   %ebp
  100dbc:	89 e5                	mov    %esp,%ebp
  100dbe:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100dc1:	e8 e2 fc ff ff       	call   100aa8 <print_stackframe>
    return 0;
  100dc6:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100dcb:	c9                   	leave  
  100dcc:	c3                   	ret    

00100dcd <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100dcd:	f3 0f 1e fb          	endbr32 
  100dd1:	55                   	push   %ebp
  100dd2:	89 e5                	mov    %esp,%ebp
  100dd4:	83 ec 28             	sub    $0x28,%esp
  100dd7:	66 c7 45 ee 43 00    	movw   $0x43,-0x12(%ebp)
  100ddd:	c6 45 ed 34          	movb   $0x34,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100de1:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100de5:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100de9:	ee                   	out    %al,(%dx)
}
  100dea:	90                   	nop
  100deb:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100df1:	c6 45 f1 9c          	movb   $0x9c,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100df5:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100df9:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100dfd:	ee                   	out    %al,(%dx)
}
  100dfe:	90                   	nop
  100dff:	66 c7 45 f6 40 00    	movw   $0x40,-0xa(%ebp)
  100e05:	c6 45 f5 2e          	movb   $0x2e,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e09:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  100e0d:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100e11:	ee                   	out    %al,(%dx)
}
  100e12:	90                   	nop
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100e13:	c7 05 08 19 11 00 00 	movl   $0x0,0x111908
  100e1a:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100e1d:	c7 04 24 c6 3a 10 00 	movl   $0x103ac6,(%esp)
  100e24:	e8 6a f4 ff ff       	call   100293 <cprintf>
    pic_enable(IRQ_TIMER);
  100e29:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100e30:	e8 31 09 00 00       	call   101766 <pic_enable>
}
  100e35:	90                   	nop
  100e36:	c9                   	leave  
  100e37:	c3                   	ret    

00100e38 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100e38:	f3 0f 1e fb          	endbr32 
  100e3c:	55                   	push   %ebp
  100e3d:	89 e5                	mov    %esp,%ebp
  100e3f:	83 ec 10             	sub    $0x10,%esp
  100e42:	66 c7 45 f2 84 00    	movw   $0x84,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100e48:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100e4c:	89 c2                	mov    %eax,%edx
  100e4e:	ec                   	in     (%dx),%al
  100e4f:	88 45 f1             	mov    %al,-0xf(%ebp)
  100e52:	66 c7 45 f6 84 00    	movw   $0x84,-0xa(%ebp)
  100e58:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100e5c:	89 c2                	mov    %eax,%edx
  100e5e:	ec                   	in     (%dx),%al
  100e5f:	88 45 f5             	mov    %al,-0xb(%ebp)
  100e62:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100e68:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100e6c:	89 c2                	mov    %eax,%edx
  100e6e:	ec                   	in     (%dx),%al
  100e6f:	88 45 f9             	mov    %al,-0x7(%ebp)
  100e72:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
  100e78:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100e7c:	89 c2                	mov    %eax,%edx
  100e7e:	ec                   	in     (%dx),%al
  100e7f:	88 45 fd             	mov    %al,-0x3(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e82:	90                   	nop
  100e83:	c9                   	leave  
  100e84:	c3                   	ret    

00100e85 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e85:	f3 0f 1e fb          	endbr32 
  100e89:	55                   	push   %ebp
  100e8a:	89 e5                	mov    %esp,%ebp
  100e8c:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e8f:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e96:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e99:	0f b7 00             	movzwl (%eax),%eax
  100e9c:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100ea0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ea3:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100ea8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100eab:	0f b7 00             	movzwl (%eax),%eax
  100eae:	0f b7 c0             	movzwl %ax,%eax
  100eb1:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100eb6:	74 12                	je     100eca <cga_init+0x45>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100eb8:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100ebf:	66 c7 05 66 0e 11 00 	movw   $0x3b4,0x110e66
  100ec6:	b4 03 
  100ec8:	eb 13                	jmp    100edd <cga_init+0x58>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100eca:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100ecd:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100ed1:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100ed4:	66 c7 05 66 0e 11 00 	movw   $0x3d4,0x110e66
  100edb:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100edd:	0f b7 05 66 0e 11 00 	movzwl 0x110e66,%eax
  100ee4:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  100ee8:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100eec:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100ef0:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100ef4:	ee                   	out    %al,(%dx)
}
  100ef5:	90                   	nop
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100ef6:	0f b7 05 66 0e 11 00 	movzwl 0x110e66,%eax
  100efd:	40                   	inc    %eax
  100efe:	0f b7 c0             	movzwl %ax,%eax
  100f01:	66 89 45 ea          	mov    %ax,-0x16(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f05:	0f b7 45 ea          	movzwl -0x16(%ebp),%eax
  100f09:	89 c2                	mov    %eax,%edx
  100f0b:	ec                   	in     (%dx),%al
  100f0c:	88 45 e9             	mov    %al,-0x17(%ebp)
    return data;
  100f0f:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100f13:	0f b6 c0             	movzbl %al,%eax
  100f16:	c1 e0 08             	shl    $0x8,%eax
  100f19:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100f1c:	0f b7 05 66 0e 11 00 	movzwl 0x110e66,%eax
  100f23:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  100f27:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f2b:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100f2f:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f33:	ee                   	out    %al,(%dx)
}
  100f34:	90                   	nop
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100f35:	0f b7 05 66 0e 11 00 	movzwl 0x110e66,%eax
  100f3c:	40                   	inc    %eax
  100f3d:	0f b7 c0             	movzwl %ax,%eax
  100f40:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100f44:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100f48:	89 c2                	mov    %eax,%edx
  100f4a:	ec                   	in     (%dx),%al
  100f4b:	88 45 f1             	mov    %al,-0xf(%ebp)
    return data;
  100f4e:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100f52:	0f b6 c0             	movzbl %al,%eax
  100f55:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100f58:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100f5b:	a3 60 0e 11 00       	mov    %eax,0x110e60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100f60:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f63:	0f b7 c0             	movzwl %ax,%eax
  100f66:	66 a3 64 0e 11 00    	mov    %ax,0x110e64
}
  100f6c:	90                   	nop
  100f6d:	c9                   	leave  
  100f6e:	c3                   	ret    

00100f6f <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100f6f:	f3 0f 1e fb          	endbr32 
  100f73:	55                   	push   %ebp
  100f74:	89 e5                	mov    %esp,%ebp
  100f76:	83 ec 48             	sub    $0x48,%esp
  100f79:	66 c7 45 d2 fa 03    	movw   $0x3fa,-0x2e(%ebp)
  100f7f:	c6 45 d1 00          	movb   $0x0,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f83:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  100f87:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  100f8b:	ee                   	out    %al,(%dx)
}
  100f8c:	90                   	nop
  100f8d:	66 c7 45 d6 fb 03    	movw   $0x3fb,-0x2a(%ebp)
  100f93:	c6 45 d5 80          	movb   $0x80,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f97:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  100f9b:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  100f9f:	ee                   	out    %al,(%dx)
}
  100fa0:	90                   	nop
  100fa1:	66 c7 45 da f8 03    	movw   $0x3f8,-0x26(%ebp)
  100fa7:	c6 45 d9 0c          	movb   $0xc,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fab:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  100faf:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  100fb3:	ee                   	out    %al,(%dx)
}
  100fb4:	90                   	nop
  100fb5:	66 c7 45 de f9 03    	movw   $0x3f9,-0x22(%ebp)
  100fbb:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fbf:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100fc3:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  100fc7:	ee                   	out    %al,(%dx)
}
  100fc8:	90                   	nop
  100fc9:	66 c7 45 e2 fb 03    	movw   $0x3fb,-0x1e(%ebp)
  100fcf:	c6 45 e1 03          	movb   $0x3,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fd3:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  100fd7:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  100fdb:	ee                   	out    %al,(%dx)
}
  100fdc:	90                   	nop
  100fdd:	66 c7 45 e6 fc 03    	movw   $0x3fc,-0x1a(%ebp)
  100fe3:	c6 45 e5 00          	movb   $0x0,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100fe7:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  100feb:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  100fef:	ee                   	out    %al,(%dx)
}
  100ff0:	90                   	nop
  100ff1:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100ff7:	c6 45 e9 01          	movb   $0x1,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ffb:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  100fff:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101003:	ee                   	out    %al,(%dx)
}
  101004:	90                   	nop
  101005:	66 c7 45 ee fd 03    	movw   $0x3fd,-0x12(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10100b:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  10100f:	89 c2                	mov    %eax,%edx
  101011:	ec                   	in     (%dx),%al
  101012:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  101015:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  101019:	3c ff                	cmp    $0xff,%al
  10101b:	0f 95 c0             	setne  %al
  10101e:	0f b6 c0             	movzbl %al,%eax
  101021:	a3 68 0e 11 00       	mov    %eax,0x110e68
  101026:	66 c7 45 f2 fa 03    	movw   $0x3fa,-0xe(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10102c:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  101030:	89 c2                	mov    %eax,%edx
  101032:	ec                   	in     (%dx),%al
  101033:	88 45 f1             	mov    %al,-0xf(%ebp)
  101036:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  10103c:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101040:	89 c2                	mov    %eax,%edx
  101042:	ec                   	in     (%dx),%al
  101043:	88 45 f5             	mov    %al,-0xb(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  101046:	a1 68 0e 11 00       	mov    0x110e68,%eax
  10104b:	85 c0                	test   %eax,%eax
  10104d:	74 0c                	je     10105b <serial_init+0xec>
        pic_enable(IRQ_COM1);
  10104f:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  101056:	e8 0b 07 00 00       	call   101766 <pic_enable>
    }
}
  10105b:	90                   	nop
  10105c:	c9                   	leave  
  10105d:	c3                   	ret    

0010105e <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  10105e:	f3 0f 1e fb          	endbr32 
  101062:	55                   	push   %ebp
  101063:	89 e5                	mov    %esp,%ebp
  101065:	83 ec 20             	sub    $0x20,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101068:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10106f:	eb 08                	jmp    101079 <lpt_putc_sub+0x1b>
        delay();
  101071:	e8 c2 fd ff ff       	call   100e38 <delay>
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101076:	ff 45 fc             	incl   -0x4(%ebp)
  101079:	66 c7 45 fa 79 03    	movw   $0x379,-0x6(%ebp)
  10107f:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  101083:	89 c2                	mov    %eax,%edx
  101085:	ec                   	in     (%dx),%al
  101086:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101089:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10108d:	84 c0                	test   %al,%al
  10108f:	78 09                	js     10109a <lpt_putc_sub+0x3c>
  101091:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101098:	7e d7                	jle    101071 <lpt_putc_sub+0x13>
    }
    outb(LPTPORT + 0, c);
  10109a:	8b 45 08             	mov    0x8(%ebp),%eax
  10109d:	0f b6 c0             	movzbl %al,%eax
  1010a0:	66 c7 45 ee 78 03    	movw   $0x378,-0x12(%ebp)
  1010a6:	88 45 ed             	mov    %al,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010a9:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1010ad:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1010b1:	ee                   	out    %al,(%dx)
}
  1010b2:	90                   	nop
  1010b3:	66 c7 45 f2 7a 03    	movw   $0x37a,-0xe(%ebp)
  1010b9:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010bd:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  1010c1:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  1010c5:	ee                   	out    %al,(%dx)
}
  1010c6:	90                   	nop
  1010c7:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  1010cd:	c6 45 f5 08          	movb   $0x8,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1010d1:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  1010d5:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  1010d9:	ee                   	out    %al,(%dx)
}
  1010da:	90                   	nop
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  1010db:	90                   	nop
  1010dc:	c9                   	leave  
  1010dd:	c3                   	ret    

001010de <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  1010de:	f3 0f 1e fb          	endbr32 
  1010e2:	55                   	push   %ebp
  1010e3:	89 e5                	mov    %esp,%ebp
  1010e5:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1010e8:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1010ec:	74 0d                	je     1010fb <lpt_putc+0x1d>
        lpt_putc_sub(c);
  1010ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1010f1:	89 04 24             	mov    %eax,(%esp)
  1010f4:	e8 65 ff ff ff       	call   10105e <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  1010f9:	eb 24                	jmp    10111f <lpt_putc+0x41>
        lpt_putc_sub('\b');
  1010fb:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101102:	e8 57 ff ff ff       	call   10105e <lpt_putc_sub>
        lpt_putc_sub(' ');
  101107:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10110e:	e8 4b ff ff ff       	call   10105e <lpt_putc_sub>
        lpt_putc_sub('\b');
  101113:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10111a:	e8 3f ff ff ff       	call   10105e <lpt_putc_sub>
}
  10111f:	90                   	nop
  101120:	c9                   	leave  
  101121:	c3                   	ret    

00101122 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  101122:	f3 0f 1e fb          	endbr32 
  101126:	55                   	push   %ebp
  101127:	89 e5                	mov    %esp,%ebp
  101129:	53                   	push   %ebx
  10112a:	83 ec 34             	sub    $0x34,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  10112d:	8b 45 08             	mov    0x8(%ebp),%eax
  101130:	25 00 ff ff ff       	and    $0xffffff00,%eax
  101135:	85 c0                	test   %eax,%eax
  101137:	75 07                	jne    101140 <cga_putc+0x1e>
        c |= 0x0700;
  101139:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  101140:	8b 45 08             	mov    0x8(%ebp),%eax
  101143:	0f b6 c0             	movzbl %al,%eax
  101146:	83 f8 0d             	cmp    $0xd,%eax
  101149:	74 72                	je     1011bd <cga_putc+0x9b>
  10114b:	83 f8 0d             	cmp    $0xd,%eax
  10114e:	0f 8f a3 00 00 00    	jg     1011f7 <cga_putc+0xd5>
  101154:	83 f8 08             	cmp    $0x8,%eax
  101157:	74 0a                	je     101163 <cga_putc+0x41>
  101159:	83 f8 0a             	cmp    $0xa,%eax
  10115c:	74 4c                	je     1011aa <cga_putc+0x88>
  10115e:	e9 94 00 00 00       	jmp    1011f7 <cga_putc+0xd5>
    case '\b':
        if (crt_pos > 0) {
  101163:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  10116a:	85 c0                	test   %eax,%eax
  10116c:	0f 84 af 00 00 00    	je     101221 <cga_putc+0xff>
            crt_pos --;
  101172:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  101179:	48                   	dec    %eax
  10117a:	0f b7 c0             	movzwl %ax,%eax
  10117d:	66 a3 64 0e 11 00    	mov    %ax,0x110e64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  101183:	8b 45 08             	mov    0x8(%ebp),%eax
  101186:	98                   	cwtl   
  101187:	25 00 ff ff ff       	and    $0xffffff00,%eax
  10118c:	98                   	cwtl   
  10118d:	83 c8 20             	or     $0x20,%eax
  101190:	98                   	cwtl   
  101191:	8b 15 60 0e 11 00    	mov    0x110e60,%edx
  101197:	0f b7 0d 64 0e 11 00 	movzwl 0x110e64,%ecx
  10119e:	01 c9                	add    %ecx,%ecx
  1011a0:	01 ca                	add    %ecx,%edx
  1011a2:	0f b7 c0             	movzwl %ax,%eax
  1011a5:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  1011a8:	eb 77                	jmp    101221 <cga_putc+0xff>
    case '\n':
        crt_pos += CRT_COLS;
  1011aa:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  1011b1:	83 c0 50             	add    $0x50,%eax
  1011b4:	0f b7 c0             	movzwl %ax,%eax
  1011b7:	66 a3 64 0e 11 00    	mov    %ax,0x110e64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  1011bd:	0f b7 1d 64 0e 11 00 	movzwl 0x110e64,%ebx
  1011c4:	0f b7 0d 64 0e 11 00 	movzwl 0x110e64,%ecx
  1011cb:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  1011d0:	89 c8                	mov    %ecx,%eax
  1011d2:	f7 e2                	mul    %edx
  1011d4:	c1 ea 06             	shr    $0x6,%edx
  1011d7:	89 d0                	mov    %edx,%eax
  1011d9:	c1 e0 02             	shl    $0x2,%eax
  1011dc:	01 d0                	add    %edx,%eax
  1011de:	c1 e0 04             	shl    $0x4,%eax
  1011e1:	29 c1                	sub    %eax,%ecx
  1011e3:	89 c8                	mov    %ecx,%eax
  1011e5:	0f b7 c0             	movzwl %ax,%eax
  1011e8:	29 c3                	sub    %eax,%ebx
  1011ea:	89 d8                	mov    %ebx,%eax
  1011ec:	0f b7 c0             	movzwl %ax,%eax
  1011ef:	66 a3 64 0e 11 00    	mov    %ax,0x110e64
        break;
  1011f5:	eb 2b                	jmp    101222 <cga_putc+0x100>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  1011f7:	8b 0d 60 0e 11 00    	mov    0x110e60,%ecx
  1011fd:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  101204:	8d 50 01             	lea    0x1(%eax),%edx
  101207:	0f b7 d2             	movzwl %dx,%edx
  10120a:	66 89 15 64 0e 11 00 	mov    %dx,0x110e64
  101211:	01 c0                	add    %eax,%eax
  101213:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  101216:	8b 45 08             	mov    0x8(%ebp),%eax
  101219:	0f b7 c0             	movzwl %ax,%eax
  10121c:	66 89 02             	mov    %ax,(%edx)
        break;
  10121f:	eb 01                	jmp    101222 <cga_putc+0x100>
        break;
  101221:	90                   	nop
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101222:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  101229:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  10122e:	76 5d                	jbe    10128d <cga_putc+0x16b>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  101230:	a1 60 0e 11 00       	mov    0x110e60,%eax
  101235:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  10123b:	a1 60 0e 11 00       	mov    0x110e60,%eax
  101240:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  101247:	00 
  101248:	89 54 24 04          	mov    %edx,0x4(%esp)
  10124c:	89 04 24             	mov    %eax,(%esp)
  10124f:	e8 6b 1d 00 00       	call   102fbf <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  101254:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  10125b:	eb 14                	jmp    101271 <cga_putc+0x14f>
            crt_buf[i] = 0x0700 | ' ';
  10125d:	a1 60 0e 11 00       	mov    0x110e60,%eax
  101262:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101265:	01 d2                	add    %edx,%edx
  101267:	01 d0                	add    %edx,%eax
  101269:	66 c7 00 20 07       	movw   $0x720,(%eax)
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  10126e:	ff 45 f4             	incl   -0xc(%ebp)
  101271:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  101278:	7e e3                	jle    10125d <cga_putc+0x13b>
        }
        crt_pos -= CRT_COLS;
  10127a:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  101281:	83 e8 50             	sub    $0x50,%eax
  101284:	0f b7 c0             	movzwl %ax,%eax
  101287:	66 a3 64 0e 11 00    	mov    %ax,0x110e64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  10128d:	0f b7 05 66 0e 11 00 	movzwl 0x110e66,%eax
  101294:	66 89 45 e6          	mov    %ax,-0x1a(%ebp)
  101298:	c6 45 e5 0e          	movb   $0xe,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10129c:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  1012a0:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1012a4:	ee                   	out    %al,(%dx)
}
  1012a5:	90                   	nop
    outb(addr_6845 + 1, crt_pos >> 8);
  1012a6:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  1012ad:	c1 e8 08             	shr    $0x8,%eax
  1012b0:	0f b7 c0             	movzwl %ax,%eax
  1012b3:	0f b6 c0             	movzbl %al,%eax
  1012b6:	0f b7 15 66 0e 11 00 	movzwl 0x110e66,%edx
  1012bd:	42                   	inc    %edx
  1012be:	0f b7 d2             	movzwl %dx,%edx
  1012c1:	66 89 55 ea          	mov    %dx,-0x16(%ebp)
  1012c5:	88 45 e9             	mov    %al,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012c8:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  1012cc:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1012d0:	ee                   	out    %al,(%dx)
}
  1012d1:	90                   	nop
    outb(addr_6845, 15);
  1012d2:	0f b7 05 66 0e 11 00 	movzwl 0x110e66,%eax
  1012d9:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  1012dd:	c6 45 ed 0f          	movb   $0xf,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012e1:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  1012e5:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  1012e9:	ee                   	out    %al,(%dx)
}
  1012ea:	90                   	nop
    outb(addr_6845 + 1, crt_pos);
  1012eb:	0f b7 05 64 0e 11 00 	movzwl 0x110e64,%eax
  1012f2:	0f b6 c0             	movzbl %al,%eax
  1012f5:	0f b7 15 66 0e 11 00 	movzwl 0x110e66,%edx
  1012fc:	42                   	inc    %edx
  1012fd:	0f b7 d2             	movzwl %dx,%edx
  101300:	66 89 55 f2          	mov    %dx,-0xe(%ebp)
  101304:	88 45 f1             	mov    %al,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101307:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10130b:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10130f:	ee                   	out    %al,(%dx)
}
  101310:	90                   	nop
}
  101311:	90                   	nop
  101312:	83 c4 34             	add    $0x34,%esp
  101315:	5b                   	pop    %ebx
  101316:	5d                   	pop    %ebp
  101317:	c3                   	ret    

00101318 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101318:	f3 0f 1e fb          	endbr32 
  10131c:	55                   	push   %ebp
  10131d:	89 e5                	mov    %esp,%ebp
  10131f:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101322:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101329:	eb 08                	jmp    101333 <serial_putc_sub+0x1b>
        delay();
  10132b:	e8 08 fb ff ff       	call   100e38 <delay>
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  101330:	ff 45 fc             	incl   -0x4(%ebp)
  101333:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101339:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10133d:	89 c2                	mov    %eax,%edx
  10133f:	ec                   	in     (%dx),%al
  101340:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101343:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  101347:	0f b6 c0             	movzbl %al,%eax
  10134a:	83 e0 20             	and    $0x20,%eax
  10134d:	85 c0                	test   %eax,%eax
  10134f:	75 09                	jne    10135a <serial_putc_sub+0x42>
  101351:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101358:	7e d1                	jle    10132b <serial_putc_sub+0x13>
    }
    outb(COM1 + COM_TX, c);
  10135a:	8b 45 08             	mov    0x8(%ebp),%eax
  10135d:	0f b6 c0             	movzbl %al,%eax
  101360:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
  101366:	88 45 f5             	mov    %al,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101369:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10136d:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101371:	ee                   	out    %al,(%dx)
}
  101372:	90                   	nop
}
  101373:	90                   	nop
  101374:	c9                   	leave  
  101375:	c3                   	ret    

00101376 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  101376:	f3 0f 1e fb          	endbr32 
  10137a:	55                   	push   %ebp
  10137b:	89 e5                	mov    %esp,%ebp
  10137d:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  101380:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101384:	74 0d                	je     101393 <serial_putc+0x1d>
        serial_putc_sub(c);
  101386:	8b 45 08             	mov    0x8(%ebp),%eax
  101389:	89 04 24             	mov    %eax,(%esp)
  10138c:	e8 87 ff ff ff       	call   101318 <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  101391:	eb 24                	jmp    1013b7 <serial_putc+0x41>
        serial_putc_sub('\b');
  101393:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  10139a:	e8 79 ff ff ff       	call   101318 <serial_putc_sub>
        serial_putc_sub(' ');
  10139f:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1013a6:	e8 6d ff ff ff       	call   101318 <serial_putc_sub>
        serial_putc_sub('\b');
  1013ab:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1013b2:	e8 61 ff ff ff       	call   101318 <serial_putc_sub>
}
  1013b7:	90                   	nop
  1013b8:	c9                   	leave  
  1013b9:	c3                   	ret    

001013ba <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  1013ba:	f3 0f 1e fb          	endbr32 
  1013be:	55                   	push   %ebp
  1013bf:	89 e5                	mov    %esp,%ebp
  1013c1:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  1013c4:	eb 33                	jmp    1013f9 <cons_intr+0x3f>
        if (c != 0) {
  1013c6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  1013ca:	74 2d                	je     1013f9 <cons_intr+0x3f>
            cons.buf[cons.wpos ++] = c;
  1013cc:	a1 84 10 11 00       	mov    0x111084,%eax
  1013d1:	8d 50 01             	lea    0x1(%eax),%edx
  1013d4:	89 15 84 10 11 00    	mov    %edx,0x111084
  1013da:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1013dd:	88 90 80 0e 11 00    	mov    %dl,0x110e80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  1013e3:	a1 84 10 11 00       	mov    0x111084,%eax
  1013e8:	3d 00 02 00 00       	cmp    $0x200,%eax
  1013ed:	75 0a                	jne    1013f9 <cons_intr+0x3f>
                cons.wpos = 0;
  1013ef:	c7 05 84 10 11 00 00 	movl   $0x0,0x111084
  1013f6:	00 00 00 
    while ((c = (*proc)()) != -1) {
  1013f9:	8b 45 08             	mov    0x8(%ebp),%eax
  1013fc:	ff d0                	call   *%eax
  1013fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101401:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101405:	75 bf                	jne    1013c6 <cons_intr+0xc>
            }
        }
    }
}
  101407:	90                   	nop
  101408:	90                   	nop
  101409:	c9                   	leave  
  10140a:	c3                   	ret    

0010140b <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  10140b:	f3 0f 1e fb          	endbr32 
  10140f:	55                   	push   %ebp
  101410:	89 e5                	mov    %esp,%ebp
  101412:	83 ec 10             	sub    $0x10,%esp
  101415:	66 c7 45 fa fd 03    	movw   $0x3fd,-0x6(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10141b:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  10141f:	89 c2                	mov    %eax,%edx
  101421:	ec                   	in     (%dx),%al
  101422:	88 45 f9             	mov    %al,-0x7(%ebp)
    return data;
  101425:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101429:	0f b6 c0             	movzbl %al,%eax
  10142c:	83 e0 01             	and    $0x1,%eax
  10142f:	85 c0                	test   %eax,%eax
  101431:	75 07                	jne    10143a <serial_proc_data+0x2f>
        return -1;
  101433:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101438:	eb 2a                	jmp    101464 <serial_proc_data+0x59>
  10143a:	66 c7 45 f6 f8 03    	movw   $0x3f8,-0xa(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101440:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  101444:	89 c2                	mov    %eax,%edx
  101446:	ec                   	in     (%dx),%al
  101447:	88 45 f5             	mov    %al,-0xb(%ebp)
    return data;
  10144a:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  10144e:	0f b6 c0             	movzbl %al,%eax
  101451:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  101454:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  101458:	75 07                	jne    101461 <serial_proc_data+0x56>
        c = '\b';
  10145a:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  101461:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  101464:	c9                   	leave  
  101465:	c3                   	ret    

00101466 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  101466:	f3 0f 1e fb          	endbr32 
  10146a:	55                   	push   %ebp
  10146b:	89 e5                	mov    %esp,%ebp
  10146d:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  101470:	a1 68 0e 11 00       	mov    0x110e68,%eax
  101475:	85 c0                	test   %eax,%eax
  101477:	74 0c                	je     101485 <serial_intr+0x1f>
        cons_intr(serial_proc_data);
  101479:	c7 04 24 0b 14 10 00 	movl   $0x10140b,(%esp)
  101480:	e8 35 ff ff ff       	call   1013ba <cons_intr>
    }
}
  101485:	90                   	nop
  101486:	c9                   	leave  
  101487:	c3                   	ret    

00101488 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  101488:	f3 0f 1e fb          	endbr32 
  10148c:	55                   	push   %ebp
  10148d:	89 e5                	mov    %esp,%ebp
  10148f:	83 ec 38             	sub    $0x38,%esp
  101492:	66 c7 45 f0 64 00    	movw   $0x64,-0x10(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101498:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10149b:	89 c2                	mov    %eax,%edx
  10149d:	ec                   	in     (%dx),%al
  10149e:	88 45 ef             	mov    %al,-0x11(%ebp)
    return data;
  1014a1:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1014a5:	0f b6 c0             	movzbl %al,%eax
  1014a8:	83 e0 01             	and    $0x1,%eax
  1014ab:	85 c0                	test   %eax,%eax
  1014ad:	75 0a                	jne    1014b9 <kbd_proc_data+0x31>
        return -1;
  1014af:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1014b4:	e9 56 01 00 00       	jmp    10160f <kbd_proc_data+0x187>
  1014b9:	66 c7 45 ec 60 00    	movw   $0x60,-0x14(%ebp)
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1014bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1014c2:	89 c2                	mov    %eax,%edx
  1014c4:	ec                   	in     (%dx),%al
  1014c5:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1014c8:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    }

    data = inb(KBDATAP);
  1014cc:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  1014cf:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  1014d3:	75 17                	jne    1014ec <kbd_proc_data+0x64>
        // E0 escape character
        shift |= E0ESC;
  1014d5:	a1 88 10 11 00       	mov    0x111088,%eax
  1014da:	83 c8 40             	or     $0x40,%eax
  1014dd:	a3 88 10 11 00       	mov    %eax,0x111088
        return 0;
  1014e2:	b8 00 00 00 00       	mov    $0x0,%eax
  1014e7:	e9 23 01 00 00       	jmp    10160f <kbd_proc_data+0x187>
    } else if (data & 0x80) {
  1014ec:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014f0:	84 c0                	test   %al,%al
  1014f2:	79 45                	jns    101539 <kbd_proc_data+0xb1>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  1014f4:	a1 88 10 11 00       	mov    0x111088,%eax
  1014f9:	83 e0 40             	and    $0x40,%eax
  1014fc:	85 c0                	test   %eax,%eax
  1014fe:	75 08                	jne    101508 <kbd_proc_data+0x80>
  101500:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101504:	24 7f                	and    $0x7f,%al
  101506:	eb 04                	jmp    10150c <kbd_proc_data+0x84>
  101508:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10150c:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  10150f:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101513:	0f b6 80 40 00 11 00 	movzbl 0x110040(%eax),%eax
  10151a:	0c 40                	or     $0x40,%al
  10151c:	0f b6 c0             	movzbl %al,%eax
  10151f:	f7 d0                	not    %eax
  101521:	89 c2                	mov    %eax,%edx
  101523:	a1 88 10 11 00       	mov    0x111088,%eax
  101528:	21 d0                	and    %edx,%eax
  10152a:	a3 88 10 11 00       	mov    %eax,0x111088
        return 0;
  10152f:	b8 00 00 00 00       	mov    $0x0,%eax
  101534:	e9 d6 00 00 00       	jmp    10160f <kbd_proc_data+0x187>
    } else if (shift & E0ESC) {
  101539:	a1 88 10 11 00       	mov    0x111088,%eax
  10153e:	83 e0 40             	and    $0x40,%eax
  101541:	85 c0                	test   %eax,%eax
  101543:	74 11                	je     101556 <kbd_proc_data+0xce>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  101545:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  101549:	a1 88 10 11 00       	mov    0x111088,%eax
  10154e:	83 e0 bf             	and    $0xffffffbf,%eax
  101551:	a3 88 10 11 00       	mov    %eax,0x111088
    }

    shift |= shiftcode[data];
  101556:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10155a:	0f b6 80 40 00 11 00 	movzbl 0x110040(%eax),%eax
  101561:	0f b6 d0             	movzbl %al,%edx
  101564:	a1 88 10 11 00       	mov    0x111088,%eax
  101569:	09 d0                	or     %edx,%eax
  10156b:	a3 88 10 11 00       	mov    %eax,0x111088
    shift ^= togglecode[data];
  101570:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101574:	0f b6 80 40 01 11 00 	movzbl 0x110140(%eax),%eax
  10157b:	0f b6 d0             	movzbl %al,%edx
  10157e:	a1 88 10 11 00       	mov    0x111088,%eax
  101583:	31 d0                	xor    %edx,%eax
  101585:	a3 88 10 11 00       	mov    %eax,0x111088

    c = charcode[shift & (CTL | SHIFT)][data];
  10158a:	a1 88 10 11 00       	mov    0x111088,%eax
  10158f:	83 e0 03             	and    $0x3,%eax
  101592:	8b 14 85 40 05 11 00 	mov    0x110540(,%eax,4),%edx
  101599:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10159d:	01 d0                	add    %edx,%eax
  10159f:	0f b6 00             	movzbl (%eax),%eax
  1015a2:	0f b6 c0             	movzbl %al,%eax
  1015a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1015a8:	a1 88 10 11 00       	mov    0x111088,%eax
  1015ad:	83 e0 08             	and    $0x8,%eax
  1015b0:	85 c0                	test   %eax,%eax
  1015b2:	74 22                	je     1015d6 <kbd_proc_data+0x14e>
        if ('a' <= c && c <= 'z')
  1015b4:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  1015b8:	7e 0c                	jle    1015c6 <kbd_proc_data+0x13e>
  1015ba:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  1015be:	7f 06                	jg     1015c6 <kbd_proc_data+0x13e>
            c += 'A' - 'a';
  1015c0:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  1015c4:	eb 10                	jmp    1015d6 <kbd_proc_data+0x14e>
        else if ('A' <= c && c <= 'Z')
  1015c6:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  1015ca:	7e 0a                	jle    1015d6 <kbd_proc_data+0x14e>
  1015cc:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  1015d0:	7f 04                	jg     1015d6 <kbd_proc_data+0x14e>
            c += 'a' - 'A';
  1015d2:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  1015d6:	a1 88 10 11 00       	mov    0x111088,%eax
  1015db:	f7 d0                	not    %eax
  1015dd:	83 e0 06             	and    $0x6,%eax
  1015e0:	85 c0                	test   %eax,%eax
  1015e2:	75 28                	jne    10160c <kbd_proc_data+0x184>
  1015e4:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  1015eb:	75 1f                	jne    10160c <kbd_proc_data+0x184>
        cprintf("Rebooting!\n");
  1015ed:	c7 04 24 e1 3a 10 00 	movl   $0x103ae1,(%esp)
  1015f4:	e8 9a ec ff ff       	call   100293 <cprintf>
  1015f9:	66 c7 45 e8 92 00    	movw   $0x92,-0x18(%ebp)
  1015ff:	c6 45 e7 03          	movb   $0x3,-0x19(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101603:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
  101607:	8b 55 e8             	mov    -0x18(%ebp),%edx
  10160a:	ee                   	out    %al,(%dx)
}
  10160b:	90                   	nop
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  10160c:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10160f:	c9                   	leave  
  101610:	c3                   	ret    

00101611 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101611:	f3 0f 1e fb          	endbr32 
  101615:	55                   	push   %ebp
  101616:	89 e5                	mov    %esp,%ebp
  101618:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  10161b:	c7 04 24 88 14 10 00 	movl   $0x101488,(%esp)
  101622:	e8 93 fd ff ff       	call   1013ba <cons_intr>
}
  101627:	90                   	nop
  101628:	c9                   	leave  
  101629:	c3                   	ret    

0010162a <kbd_init>:

static void
kbd_init(void) {
  10162a:	f3 0f 1e fb          	endbr32 
  10162e:	55                   	push   %ebp
  10162f:	89 e5                	mov    %esp,%ebp
  101631:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  101634:	e8 d8 ff ff ff       	call   101611 <kbd_intr>
    pic_enable(IRQ_KBD);
  101639:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  101640:	e8 21 01 00 00       	call   101766 <pic_enable>
}
  101645:	90                   	nop
  101646:	c9                   	leave  
  101647:	c3                   	ret    

00101648 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101648:	f3 0f 1e fb          	endbr32 
  10164c:	55                   	push   %ebp
  10164d:	89 e5                	mov    %esp,%ebp
  10164f:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  101652:	e8 2e f8 ff ff       	call   100e85 <cga_init>
    serial_init();
  101657:	e8 13 f9 ff ff       	call   100f6f <serial_init>
    kbd_init();
  10165c:	e8 c9 ff ff ff       	call   10162a <kbd_init>
    if (!serial_exists) {
  101661:	a1 68 0e 11 00       	mov    0x110e68,%eax
  101666:	85 c0                	test   %eax,%eax
  101668:	75 0c                	jne    101676 <cons_init+0x2e>
        cprintf("serial port does not exist!!\n");
  10166a:	c7 04 24 ed 3a 10 00 	movl   $0x103aed,(%esp)
  101671:	e8 1d ec ff ff       	call   100293 <cprintf>
    }
}
  101676:	90                   	nop
  101677:	c9                   	leave  
  101678:	c3                   	ret    

00101679 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  101679:	f3 0f 1e fb          	endbr32 
  10167d:	55                   	push   %ebp
  10167e:	89 e5                	mov    %esp,%ebp
  101680:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  101683:	8b 45 08             	mov    0x8(%ebp),%eax
  101686:	89 04 24             	mov    %eax,(%esp)
  101689:	e8 50 fa ff ff       	call   1010de <lpt_putc>
    cga_putc(c);
  10168e:	8b 45 08             	mov    0x8(%ebp),%eax
  101691:	89 04 24             	mov    %eax,(%esp)
  101694:	e8 89 fa ff ff       	call   101122 <cga_putc>
    serial_putc(c);
  101699:	8b 45 08             	mov    0x8(%ebp),%eax
  10169c:	89 04 24             	mov    %eax,(%esp)
  10169f:	e8 d2 fc ff ff       	call   101376 <serial_putc>
}
  1016a4:	90                   	nop
  1016a5:	c9                   	leave  
  1016a6:	c3                   	ret    

001016a7 <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1016a7:	f3 0f 1e fb          	endbr32 
  1016ab:	55                   	push   %ebp
  1016ac:	89 e5                	mov    %esp,%ebp
  1016ae:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1016b1:	e8 b0 fd ff ff       	call   101466 <serial_intr>
    kbd_intr();
  1016b6:	e8 56 ff ff ff       	call   101611 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1016bb:	8b 15 80 10 11 00    	mov    0x111080,%edx
  1016c1:	a1 84 10 11 00       	mov    0x111084,%eax
  1016c6:	39 c2                	cmp    %eax,%edx
  1016c8:	74 36                	je     101700 <cons_getc+0x59>
        c = cons.buf[cons.rpos ++];
  1016ca:	a1 80 10 11 00       	mov    0x111080,%eax
  1016cf:	8d 50 01             	lea    0x1(%eax),%edx
  1016d2:	89 15 80 10 11 00    	mov    %edx,0x111080
  1016d8:	0f b6 80 80 0e 11 00 	movzbl 0x110e80(%eax),%eax
  1016df:	0f b6 c0             	movzbl %al,%eax
  1016e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  1016e5:	a1 80 10 11 00       	mov    0x111080,%eax
  1016ea:	3d 00 02 00 00       	cmp    $0x200,%eax
  1016ef:	75 0a                	jne    1016fb <cons_getc+0x54>
            cons.rpos = 0;
  1016f1:	c7 05 80 10 11 00 00 	movl   $0x0,0x111080
  1016f8:	00 00 00 
        }
        return c;
  1016fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1016fe:	eb 05                	jmp    101705 <cons_getc+0x5e>
    }
    return 0;
  101700:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101705:	c9                   	leave  
  101706:	c3                   	ret    

00101707 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101707:	f3 0f 1e fb          	endbr32 
  10170b:	55                   	push   %ebp
  10170c:	89 e5                	mov    %esp,%ebp
  10170e:	83 ec 14             	sub    $0x14,%esp
  101711:	8b 45 08             	mov    0x8(%ebp),%eax
  101714:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101718:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10171b:	66 a3 50 05 11 00    	mov    %ax,0x110550
    if (did_init) {
  101721:	a1 8c 10 11 00       	mov    0x11108c,%eax
  101726:	85 c0                	test   %eax,%eax
  101728:	74 39                	je     101763 <pic_setmask+0x5c>
        outb(IO_PIC1 + 1, mask);
  10172a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10172d:	0f b6 c0             	movzbl %al,%eax
  101730:	66 c7 45 fa 21 00    	movw   $0x21,-0x6(%ebp)
  101736:	88 45 f9             	mov    %al,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101739:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  10173d:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101741:	ee                   	out    %al,(%dx)
}
  101742:	90                   	nop
        outb(IO_PIC2 + 1, mask >> 8);
  101743:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101747:	c1 e8 08             	shr    $0x8,%eax
  10174a:	0f b7 c0             	movzwl %ax,%eax
  10174d:	0f b6 c0             	movzbl %al,%eax
  101750:	66 c7 45 fe a1 00    	movw   $0xa1,-0x2(%ebp)
  101756:	88 45 fd             	mov    %al,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101759:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  10175d:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  101761:	ee                   	out    %al,(%dx)
}
  101762:	90                   	nop
    }
}
  101763:	90                   	nop
  101764:	c9                   	leave  
  101765:	c3                   	ret    

00101766 <pic_enable>:

void
pic_enable(unsigned int irq) {
  101766:	f3 0f 1e fb          	endbr32 
  10176a:	55                   	push   %ebp
  10176b:	89 e5                	mov    %esp,%ebp
  10176d:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  101770:	8b 45 08             	mov    0x8(%ebp),%eax
  101773:	ba 01 00 00 00       	mov    $0x1,%edx
  101778:	88 c1                	mov    %al,%cl
  10177a:	d3 e2                	shl    %cl,%edx
  10177c:	89 d0                	mov    %edx,%eax
  10177e:	98                   	cwtl   
  10177f:	f7 d0                	not    %eax
  101781:	0f bf d0             	movswl %ax,%edx
  101784:	0f b7 05 50 05 11 00 	movzwl 0x110550,%eax
  10178b:	98                   	cwtl   
  10178c:	21 d0                	and    %edx,%eax
  10178e:	98                   	cwtl   
  10178f:	0f b7 c0             	movzwl %ax,%eax
  101792:	89 04 24             	mov    %eax,(%esp)
  101795:	e8 6d ff ff ff       	call   101707 <pic_setmask>
}
  10179a:	90                   	nop
  10179b:	c9                   	leave  
  10179c:	c3                   	ret    

0010179d <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  10179d:	f3 0f 1e fb          	endbr32 
  1017a1:	55                   	push   %ebp
  1017a2:	89 e5                	mov    %esp,%ebp
  1017a4:	83 ec 44             	sub    $0x44,%esp
    did_init = 1;
  1017a7:	c7 05 8c 10 11 00 01 	movl   $0x1,0x11108c
  1017ae:	00 00 00 
  1017b1:	66 c7 45 ca 21 00    	movw   $0x21,-0x36(%ebp)
  1017b7:	c6 45 c9 ff          	movb   $0xff,-0x37(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017bb:	0f b6 45 c9          	movzbl -0x37(%ebp),%eax
  1017bf:	0f b7 55 ca          	movzwl -0x36(%ebp),%edx
  1017c3:	ee                   	out    %al,(%dx)
}
  1017c4:	90                   	nop
  1017c5:	66 c7 45 ce a1 00    	movw   $0xa1,-0x32(%ebp)
  1017cb:	c6 45 cd ff          	movb   $0xff,-0x33(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017cf:	0f b6 45 cd          	movzbl -0x33(%ebp),%eax
  1017d3:	0f b7 55 ce          	movzwl -0x32(%ebp),%edx
  1017d7:	ee                   	out    %al,(%dx)
}
  1017d8:	90                   	nop
  1017d9:	66 c7 45 d2 20 00    	movw   $0x20,-0x2e(%ebp)
  1017df:	c6 45 d1 11          	movb   $0x11,-0x2f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017e3:	0f b6 45 d1          	movzbl -0x2f(%ebp),%eax
  1017e7:	0f b7 55 d2          	movzwl -0x2e(%ebp),%edx
  1017eb:	ee                   	out    %al,(%dx)
}
  1017ec:	90                   	nop
  1017ed:	66 c7 45 d6 21 00    	movw   $0x21,-0x2a(%ebp)
  1017f3:	c6 45 d5 20          	movb   $0x20,-0x2b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1017f7:	0f b6 45 d5          	movzbl -0x2b(%ebp),%eax
  1017fb:	0f b7 55 d6          	movzwl -0x2a(%ebp),%edx
  1017ff:	ee                   	out    %al,(%dx)
}
  101800:	90                   	nop
  101801:	66 c7 45 da 21 00    	movw   $0x21,-0x26(%ebp)
  101807:	c6 45 d9 04          	movb   $0x4,-0x27(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10180b:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  10180f:	0f b7 55 da          	movzwl -0x26(%ebp),%edx
  101813:	ee                   	out    %al,(%dx)
}
  101814:	90                   	nop
  101815:	66 c7 45 de 21 00    	movw   $0x21,-0x22(%ebp)
  10181b:	c6 45 dd 03          	movb   $0x3,-0x23(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10181f:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101823:	0f b7 55 de          	movzwl -0x22(%ebp),%edx
  101827:	ee                   	out    %al,(%dx)
}
  101828:	90                   	nop
  101829:	66 c7 45 e2 a0 00    	movw   $0xa0,-0x1e(%ebp)
  10182f:	c6 45 e1 11          	movb   $0x11,-0x1f(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101833:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  101837:	0f b7 55 e2          	movzwl -0x1e(%ebp),%edx
  10183b:	ee                   	out    %al,(%dx)
}
  10183c:	90                   	nop
  10183d:	66 c7 45 e6 a1 00    	movw   $0xa1,-0x1a(%ebp)
  101843:	c6 45 e5 28          	movb   $0x28,-0x1b(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101847:	0f b6 45 e5          	movzbl -0x1b(%ebp),%eax
  10184b:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  10184f:	ee                   	out    %al,(%dx)
}
  101850:	90                   	nop
  101851:	66 c7 45 ea a1 00    	movw   $0xa1,-0x16(%ebp)
  101857:	c6 45 e9 02          	movb   $0x2,-0x17(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10185b:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10185f:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  101863:	ee                   	out    %al,(%dx)
}
  101864:	90                   	nop
  101865:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  10186b:	c6 45 ed 03          	movb   $0x3,-0x13(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  10186f:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  101873:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101877:	ee                   	out    %al,(%dx)
}
  101878:	90                   	nop
  101879:	66 c7 45 f2 20 00    	movw   $0x20,-0xe(%ebp)
  10187f:	c6 45 f1 68          	movb   $0x68,-0xf(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101883:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  101887:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10188b:	ee                   	out    %al,(%dx)
}
  10188c:	90                   	nop
  10188d:	66 c7 45 f6 20 00    	movw   $0x20,-0xa(%ebp)
  101893:	c6 45 f5 0a          	movb   $0xa,-0xb(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101897:	0f b6 45 f5          	movzbl -0xb(%ebp),%eax
  10189b:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10189f:	ee                   	out    %al,(%dx)
}
  1018a0:	90                   	nop
  1018a1:	66 c7 45 fa a0 00    	movw   $0xa0,-0x6(%ebp)
  1018a7:	c6 45 f9 68          	movb   $0x68,-0x7(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1018ab:	0f b6 45 f9          	movzbl -0x7(%ebp),%eax
  1018af:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1018b3:	ee                   	out    %al,(%dx)
}
  1018b4:	90                   	nop
  1018b5:	66 c7 45 fe a0 00    	movw   $0xa0,-0x2(%ebp)
  1018bb:	c6 45 fd 0a          	movb   $0xa,-0x3(%ebp)
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1018bf:	0f b6 45 fd          	movzbl -0x3(%ebp),%eax
  1018c3:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1018c7:	ee                   	out    %al,(%dx)
}
  1018c8:	90                   	nop
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1018c9:	0f b7 05 50 05 11 00 	movzwl 0x110550,%eax
  1018d0:	3d ff ff 00 00       	cmp    $0xffff,%eax
  1018d5:	74 0f                	je     1018e6 <pic_init+0x149>
        pic_setmask(irq_mask);
  1018d7:	0f b7 05 50 05 11 00 	movzwl 0x110550,%eax
  1018de:	89 04 24             	mov    %eax,(%esp)
  1018e1:	e8 21 fe ff ff       	call   101707 <pic_setmask>
    }
}
  1018e6:	90                   	nop
  1018e7:	c9                   	leave  
  1018e8:	c3                   	ret    

001018e9 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  1018e9:	f3 0f 1e fb          	endbr32 
  1018ed:	55                   	push   %ebp
  1018ee:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  1018f0:	fb                   	sti    
}
  1018f1:	90                   	nop
    sti();
}
  1018f2:	90                   	nop
  1018f3:	5d                   	pop    %ebp
  1018f4:	c3                   	ret    

001018f5 <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  1018f5:	f3 0f 1e fb          	endbr32 
  1018f9:	55                   	push   %ebp
  1018fa:	89 e5                	mov    %esp,%ebp

static inline void
cli(void) {
    asm volatile ("cli");
  1018fc:	fa                   	cli    
}
  1018fd:	90                   	nop
    cli();
}
  1018fe:	90                   	nop
  1018ff:	5d                   	pop    %ebp
  101900:	c3                   	ret    

00101901 <print_ticks>:

#define TICK_NUM 100

extern uintptr_t __vectors[];
extern volatile size_t ticks;
static void print_ticks() {
  101901:	f3 0f 1e fb          	endbr32 
  101905:	55                   	push   %ebp
  101906:	89 e5                	mov    %esp,%ebp
  101908:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  10190b:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  101912:	00 
  101913:	c7 04 24 20 3b 10 00 	movl   $0x103b20,(%esp)
  10191a:	e8 74 e9 ff ff       	call   100293 <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
  10191f:	c7 04 24 2a 3b 10 00 	movl   $0x103b2a,(%esp)
  101926:	e8 68 e9 ff ff       	call   100293 <cprintf>
    panic("EOT: kernel seems ok.");
  10192b:	c7 44 24 08 38 3b 10 	movl   $0x103b38,0x8(%esp)
  101932:	00 
  101933:	c7 44 24 04 14 00 00 	movl   $0x14,0x4(%esp)
  10193a:	00 
  10193b:	c7 04 24 4e 3b 10 00 	movl   $0x103b4e,(%esp)
  101942:	e8 b8 ea ff ff       	call   1003ff <__panic>

00101947 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101947:	f3 0f 1e fb          	endbr32 
  10194b:	55                   	push   %ebp
  10194c:	89 e5                	mov    %esp,%ebp
  10194e:	83 ec 10             	sub    $0x10,%esp
      *     Can you see idt[256] in this file? Yes, it's IDT! you can use SETGATE macro to setup each item of IDT
      * (3) After setup the contents of IDT, you will let CPU know where is the IDT by using 'lidt' instruction.
      *     You don't know the meaning of this instruction? just google it! and check the libs/x86.h to know more.
      *     Notice: the argument of lidt is idt_pd. try to find it!
      */
     for(int i=0;i<sizeof(idt)/sizeof(struct gatedesc);i++){
  101951:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101958:	e9 c4 00 00 00       	jmp    101a21 <idt_init+0xda>
        SETGATE(idt[i],0,GD_KTEXT,__vectors[i],0);
  10195d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101960:	8b 04 85 e0 05 11 00 	mov    0x1105e0(,%eax,4),%eax
  101967:	0f b7 d0             	movzwl %ax,%edx
  10196a:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10196d:	66 89 14 c5 a0 10 11 	mov    %dx,0x1110a0(,%eax,8)
  101974:	00 
  101975:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101978:	66 c7 04 c5 a2 10 11 	movw   $0x8,0x1110a2(,%eax,8)
  10197f:	00 08 00 
  101982:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101985:	0f b6 14 c5 a4 10 11 	movzbl 0x1110a4(,%eax,8),%edx
  10198c:	00 
  10198d:	80 e2 e0             	and    $0xe0,%dl
  101990:	88 14 c5 a4 10 11 00 	mov    %dl,0x1110a4(,%eax,8)
  101997:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10199a:	0f b6 14 c5 a4 10 11 	movzbl 0x1110a4(,%eax,8),%edx
  1019a1:	00 
  1019a2:	80 e2 1f             	and    $0x1f,%dl
  1019a5:	88 14 c5 a4 10 11 00 	mov    %dl,0x1110a4(,%eax,8)
  1019ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019af:	0f b6 14 c5 a5 10 11 	movzbl 0x1110a5(,%eax,8),%edx
  1019b6:	00 
  1019b7:	80 e2 f0             	and    $0xf0,%dl
  1019ba:	80 ca 0e             	or     $0xe,%dl
  1019bd:	88 14 c5 a5 10 11 00 	mov    %dl,0x1110a5(,%eax,8)
  1019c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019c7:	0f b6 14 c5 a5 10 11 	movzbl 0x1110a5(,%eax,8),%edx
  1019ce:	00 
  1019cf:	80 e2 ef             	and    $0xef,%dl
  1019d2:	88 14 c5 a5 10 11 00 	mov    %dl,0x1110a5(,%eax,8)
  1019d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019dc:	0f b6 14 c5 a5 10 11 	movzbl 0x1110a5(,%eax,8),%edx
  1019e3:	00 
  1019e4:	80 e2 9f             	and    $0x9f,%dl
  1019e7:	88 14 c5 a5 10 11 00 	mov    %dl,0x1110a5(,%eax,8)
  1019ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1019f1:	0f b6 14 c5 a5 10 11 	movzbl 0x1110a5(,%eax,8),%edx
  1019f8:	00 
  1019f9:	80 ca 80             	or     $0x80,%dl
  1019fc:	88 14 c5 a5 10 11 00 	mov    %dl,0x1110a5(,%eax,8)
  101a03:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101a06:	8b 04 85 e0 05 11 00 	mov    0x1105e0(,%eax,4),%eax
  101a0d:	c1 e8 10             	shr    $0x10,%eax
  101a10:	0f b7 d0             	movzwl %ax,%edx
  101a13:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101a16:	66 89 14 c5 a6 10 11 	mov    %dx,0x1110a6(,%eax,8)
  101a1d:	00 
     for(int i=0;i<sizeof(idt)/sizeof(struct gatedesc);i++){
  101a1e:	ff 45 fc             	incl   -0x4(%ebp)
  101a21:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101a24:	3d ff 00 00 00       	cmp    $0xff,%eax
  101a29:	0f 86 2e ff ff ff    	jbe    10195d <idt_init+0x16>
     //SETGATE(gate, istrap, sel, off, dpl)\
     //由于中断程序都在内核代码段，所以sel为GD_KTEXT
     //除了T_SWITCH_TOK,T_SYSCALL，其他的dpl均设置为0
     
     //设置T_SYSCALL
     SETGATE(idt[128],0,GD_KTEXT,__vectors[128],3);
  101a2f:	a1 e0 07 11 00       	mov    0x1107e0,%eax
  101a34:	0f b7 c0             	movzwl %ax,%eax
  101a37:	66 a3 a0 14 11 00    	mov    %ax,0x1114a0
  101a3d:	66 c7 05 a2 14 11 00 	movw   $0x8,0x1114a2
  101a44:	08 00 
  101a46:	0f b6 05 a4 14 11 00 	movzbl 0x1114a4,%eax
  101a4d:	24 e0                	and    $0xe0,%al
  101a4f:	a2 a4 14 11 00       	mov    %al,0x1114a4
  101a54:	0f b6 05 a4 14 11 00 	movzbl 0x1114a4,%eax
  101a5b:	24 1f                	and    $0x1f,%al
  101a5d:	a2 a4 14 11 00       	mov    %al,0x1114a4
  101a62:	0f b6 05 a5 14 11 00 	movzbl 0x1114a5,%eax
  101a69:	24 f0                	and    $0xf0,%al
  101a6b:	0c 0e                	or     $0xe,%al
  101a6d:	a2 a5 14 11 00       	mov    %al,0x1114a5
  101a72:	0f b6 05 a5 14 11 00 	movzbl 0x1114a5,%eax
  101a79:	24 ef                	and    $0xef,%al
  101a7b:	a2 a5 14 11 00       	mov    %al,0x1114a5
  101a80:	0f b6 05 a5 14 11 00 	movzbl 0x1114a5,%eax
  101a87:	0c 60                	or     $0x60,%al
  101a89:	a2 a5 14 11 00       	mov    %al,0x1114a5
  101a8e:	0f b6 05 a5 14 11 00 	movzbl 0x1114a5,%eax
  101a95:	0c 80                	or     $0x80,%al
  101a97:	a2 a5 14 11 00       	mov    %al,0x1114a5
  101a9c:	a1 e0 07 11 00       	mov    0x1107e0,%eax
  101aa1:	c1 e8 10             	shr    $0x10,%eax
  101aa4:	0f b7 c0             	movzwl %ax,%eax
  101aa7:	66 a3 a6 14 11 00    	mov    %ax,0x1114a6

     //设置T_SWITCH_TOK
     SETGATE(idt[T_SWITCH_TOK],0,GD_KTEXT,__vectors[T_SWITCH_TOK],3);
  101aad:	a1 c4 07 11 00       	mov    0x1107c4,%eax
  101ab2:	0f b7 c0             	movzwl %ax,%eax
  101ab5:	66 a3 68 14 11 00    	mov    %ax,0x111468
  101abb:	66 c7 05 6a 14 11 00 	movw   $0x8,0x11146a
  101ac2:	08 00 
  101ac4:	0f b6 05 6c 14 11 00 	movzbl 0x11146c,%eax
  101acb:	24 e0                	and    $0xe0,%al
  101acd:	a2 6c 14 11 00       	mov    %al,0x11146c
  101ad2:	0f b6 05 6c 14 11 00 	movzbl 0x11146c,%eax
  101ad9:	24 1f                	and    $0x1f,%al
  101adb:	a2 6c 14 11 00       	mov    %al,0x11146c
  101ae0:	0f b6 05 6d 14 11 00 	movzbl 0x11146d,%eax
  101ae7:	24 f0                	and    $0xf0,%al
  101ae9:	0c 0e                	or     $0xe,%al
  101aeb:	a2 6d 14 11 00       	mov    %al,0x11146d
  101af0:	0f b6 05 6d 14 11 00 	movzbl 0x11146d,%eax
  101af7:	24 ef                	and    $0xef,%al
  101af9:	a2 6d 14 11 00       	mov    %al,0x11146d
  101afe:	0f b6 05 6d 14 11 00 	movzbl 0x11146d,%eax
  101b05:	0c 60                	or     $0x60,%al
  101b07:	a2 6d 14 11 00       	mov    %al,0x11146d
  101b0c:	0f b6 05 6d 14 11 00 	movzbl 0x11146d,%eax
  101b13:	0c 80                	or     $0x80,%al
  101b15:	a2 6d 14 11 00       	mov    %al,0x11146d
  101b1a:	a1 c4 07 11 00       	mov    0x1107c4,%eax
  101b1f:	c1 e8 10             	shr    $0x10,%eax
  101b22:	0f b7 c0             	movzwl %ax,%eax
  101b25:	66 a3 6e 14 11 00    	mov    %ax,0x11146e
  101b2b:	c7 45 f8 60 05 11 00 	movl   $0x110560,-0x8(%ebp)
    asm volatile ("lidt (%0)" :: "r" (pd));
  101b32:	8b 45 f8             	mov    -0x8(%ebp),%eax
  101b35:	0f 01 18             	lidtl  (%eax)
}
  101b38:	90                   	nop

      lidt(&idt_pd);
}
  101b39:	90                   	nop
  101b3a:	c9                   	leave  
  101b3b:	c3                   	ret    

00101b3c <trapname>:

static const char *
trapname(int trapno) {
  101b3c:	f3 0f 1e fb          	endbr32 
  101b40:	55                   	push   %ebp
  101b41:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  101b43:	8b 45 08             	mov    0x8(%ebp),%eax
  101b46:	83 f8 13             	cmp    $0x13,%eax
  101b49:	77 0c                	ja     101b57 <trapname+0x1b>
        return excnames[trapno];
  101b4b:	8b 45 08             	mov    0x8(%ebp),%eax
  101b4e:	8b 04 85 a0 3e 10 00 	mov    0x103ea0(,%eax,4),%eax
  101b55:	eb 18                	jmp    101b6f <trapname+0x33>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  101b57:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  101b5b:	7e 0d                	jle    101b6a <trapname+0x2e>
  101b5d:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  101b61:	7f 07                	jg     101b6a <trapname+0x2e>
        return "Hardware Interrupt";
  101b63:	b8 5f 3b 10 00       	mov    $0x103b5f,%eax
  101b68:	eb 05                	jmp    101b6f <trapname+0x33>
    }
    return "(unknown trap)";
  101b6a:	b8 72 3b 10 00       	mov    $0x103b72,%eax
}
  101b6f:	5d                   	pop    %ebp
  101b70:	c3                   	ret    

00101b71 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  101b71:	f3 0f 1e fb          	endbr32 
  101b75:	55                   	push   %ebp
  101b76:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  101b78:	8b 45 08             	mov    0x8(%ebp),%eax
  101b7b:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101b7f:	83 f8 08             	cmp    $0x8,%eax
  101b82:	0f 94 c0             	sete   %al
  101b85:	0f b6 c0             	movzbl %al,%eax
}
  101b88:	5d                   	pop    %ebp
  101b89:	c3                   	ret    

00101b8a <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  101b8a:	f3 0f 1e fb          	endbr32 
  101b8e:	55                   	push   %ebp
  101b8f:	89 e5                	mov    %esp,%ebp
  101b91:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  101b94:	8b 45 08             	mov    0x8(%ebp),%eax
  101b97:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b9b:	c7 04 24 b3 3b 10 00 	movl   $0x103bb3,(%esp)
  101ba2:	e8 ec e6 ff ff       	call   100293 <cprintf>
    print_regs(&tf->tf_regs);
  101ba7:	8b 45 08             	mov    0x8(%ebp),%eax
  101baa:	89 04 24             	mov    %eax,(%esp)
  101bad:	e8 8d 01 00 00       	call   101d3f <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101bb2:	8b 45 08             	mov    0x8(%ebp),%eax
  101bb5:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101bb9:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bbd:	c7 04 24 c4 3b 10 00 	movl   $0x103bc4,(%esp)
  101bc4:	e8 ca e6 ff ff       	call   100293 <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101bc9:	8b 45 08             	mov    0x8(%ebp),%eax
  101bcc:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101bd0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bd4:	c7 04 24 d7 3b 10 00 	movl   $0x103bd7,(%esp)
  101bdb:	e8 b3 e6 ff ff       	call   100293 <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101be0:	8b 45 08             	mov    0x8(%ebp),%eax
  101be3:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101be7:	89 44 24 04          	mov    %eax,0x4(%esp)
  101beb:	c7 04 24 ea 3b 10 00 	movl   $0x103bea,(%esp)
  101bf2:	e8 9c e6 ff ff       	call   100293 <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101bf7:	8b 45 08             	mov    0x8(%ebp),%eax
  101bfa:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101bfe:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c02:	c7 04 24 fd 3b 10 00 	movl   $0x103bfd,(%esp)
  101c09:	e8 85 e6 ff ff       	call   100293 <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101c0e:	8b 45 08             	mov    0x8(%ebp),%eax
  101c11:	8b 40 30             	mov    0x30(%eax),%eax
  101c14:	89 04 24             	mov    %eax,(%esp)
  101c17:	e8 20 ff ff ff       	call   101b3c <trapname>
  101c1c:	8b 55 08             	mov    0x8(%ebp),%edx
  101c1f:	8b 52 30             	mov    0x30(%edx),%edx
  101c22:	89 44 24 08          	mov    %eax,0x8(%esp)
  101c26:	89 54 24 04          	mov    %edx,0x4(%esp)
  101c2a:	c7 04 24 10 3c 10 00 	movl   $0x103c10,(%esp)
  101c31:	e8 5d e6 ff ff       	call   100293 <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101c36:	8b 45 08             	mov    0x8(%ebp),%eax
  101c39:	8b 40 34             	mov    0x34(%eax),%eax
  101c3c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c40:	c7 04 24 22 3c 10 00 	movl   $0x103c22,(%esp)
  101c47:	e8 47 e6 ff ff       	call   100293 <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101c4c:	8b 45 08             	mov    0x8(%ebp),%eax
  101c4f:	8b 40 38             	mov    0x38(%eax),%eax
  101c52:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c56:	c7 04 24 31 3c 10 00 	movl   $0x103c31,(%esp)
  101c5d:	e8 31 e6 ff ff       	call   100293 <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101c62:	8b 45 08             	mov    0x8(%ebp),%eax
  101c65:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101c69:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c6d:	c7 04 24 40 3c 10 00 	movl   $0x103c40,(%esp)
  101c74:	e8 1a e6 ff ff       	call   100293 <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101c79:	8b 45 08             	mov    0x8(%ebp),%eax
  101c7c:	8b 40 40             	mov    0x40(%eax),%eax
  101c7f:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c83:	c7 04 24 53 3c 10 00 	movl   $0x103c53,(%esp)
  101c8a:	e8 04 e6 ff ff       	call   100293 <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101c8f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101c96:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101c9d:	eb 3d                	jmp    101cdc <print_trapframe+0x152>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101c9f:	8b 45 08             	mov    0x8(%ebp),%eax
  101ca2:	8b 50 40             	mov    0x40(%eax),%edx
  101ca5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101ca8:	21 d0                	and    %edx,%eax
  101caa:	85 c0                	test   %eax,%eax
  101cac:	74 28                	je     101cd6 <print_trapframe+0x14c>
  101cae:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101cb1:	8b 04 85 80 05 11 00 	mov    0x110580(,%eax,4),%eax
  101cb8:	85 c0                	test   %eax,%eax
  101cba:	74 1a                	je     101cd6 <print_trapframe+0x14c>
            cprintf("%s,", IA32flags[i]);
  101cbc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101cbf:	8b 04 85 80 05 11 00 	mov    0x110580(,%eax,4),%eax
  101cc6:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cca:	c7 04 24 62 3c 10 00 	movl   $0x103c62,(%esp)
  101cd1:	e8 bd e5 ff ff       	call   100293 <cprintf>
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101cd6:	ff 45 f4             	incl   -0xc(%ebp)
  101cd9:	d1 65 f0             	shll   -0x10(%ebp)
  101cdc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101cdf:	83 f8 17             	cmp    $0x17,%eax
  101ce2:	76 bb                	jbe    101c9f <print_trapframe+0x115>
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101ce4:	8b 45 08             	mov    0x8(%ebp),%eax
  101ce7:	8b 40 40             	mov    0x40(%eax),%eax
  101cea:	c1 e8 0c             	shr    $0xc,%eax
  101ced:	83 e0 03             	and    $0x3,%eax
  101cf0:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cf4:	c7 04 24 66 3c 10 00 	movl   $0x103c66,(%esp)
  101cfb:	e8 93 e5 ff ff       	call   100293 <cprintf>

    if (!trap_in_kernel(tf)) {
  101d00:	8b 45 08             	mov    0x8(%ebp),%eax
  101d03:	89 04 24             	mov    %eax,(%esp)
  101d06:	e8 66 fe ff ff       	call   101b71 <trap_in_kernel>
  101d0b:	85 c0                	test   %eax,%eax
  101d0d:	75 2d                	jne    101d3c <print_trapframe+0x1b2>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101d0f:	8b 45 08             	mov    0x8(%ebp),%eax
  101d12:	8b 40 44             	mov    0x44(%eax),%eax
  101d15:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d19:	c7 04 24 6f 3c 10 00 	movl   $0x103c6f,(%esp)
  101d20:	e8 6e e5 ff ff       	call   100293 <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101d25:	8b 45 08             	mov    0x8(%ebp),%eax
  101d28:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101d2c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d30:	c7 04 24 7e 3c 10 00 	movl   $0x103c7e,(%esp)
  101d37:	e8 57 e5 ff ff       	call   100293 <cprintf>
    }
}
  101d3c:	90                   	nop
  101d3d:	c9                   	leave  
  101d3e:	c3                   	ret    

00101d3f <print_regs>:

void
print_regs(struct pushregs *regs) {
  101d3f:	f3 0f 1e fb          	endbr32 
  101d43:	55                   	push   %ebp
  101d44:	89 e5                	mov    %esp,%ebp
  101d46:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101d49:	8b 45 08             	mov    0x8(%ebp),%eax
  101d4c:	8b 00                	mov    (%eax),%eax
  101d4e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d52:	c7 04 24 91 3c 10 00 	movl   $0x103c91,(%esp)
  101d59:	e8 35 e5 ff ff       	call   100293 <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101d5e:	8b 45 08             	mov    0x8(%ebp),%eax
  101d61:	8b 40 04             	mov    0x4(%eax),%eax
  101d64:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d68:	c7 04 24 a0 3c 10 00 	movl   $0x103ca0,(%esp)
  101d6f:	e8 1f e5 ff ff       	call   100293 <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101d74:	8b 45 08             	mov    0x8(%ebp),%eax
  101d77:	8b 40 08             	mov    0x8(%eax),%eax
  101d7a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d7e:	c7 04 24 af 3c 10 00 	movl   $0x103caf,(%esp)
  101d85:	e8 09 e5 ff ff       	call   100293 <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101d8a:	8b 45 08             	mov    0x8(%ebp),%eax
  101d8d:	8b 40 0c             	mov    0xc(%eax),%eax
  101d90:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d94:	c7 04 24 be 3c 10 00 	movl   $0x103cbe,(%esp)
  101d9b:	e8 f3 e4 ff ff       	call   100293 <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101da0:	8b 45 08             	mov    0x8(%ebp),%eax
  101da3:	8b 40 10             	mov    0x10(%eax),%eax
  101da6:	89 44 24 04          	mov    %eax,0x4(%esp)
  101daa:	c7 04 24 cd 3c 10 00 	movl   $0x103ccd,(%esp)
  101db1:	e8 dd e4 ff ff       	call   100293 <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101db6:	8b 45 08             	mov    0x8(%ebp),%eax
  101db9:	8b 40 14             	mov    0x14(%eax),%eax
  101dbc:	89 44 24 04          	mov    %eax,0x4(%esp)
  101dc0:	c7 04 24 dc 3c 10 00 	movl   $0x103cdc,(%esp)
  101dc7:	e8 c7 e4 ff ff       	call   100293 <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101dcc:	8b 45 08             	mov    0x8(%ebp),%eax
  101dcf:	8b 40 18             	mov    0x18(%eax),%eax
  101dd2:	89 44 24 04          	mov    %eax,0x4(%esp)
  101dd6:	c7 04 24 eb 3c 10 00 	movl   $0x103ceb,(%esp)
  101ddd:	e8 b1 e4 ff ff       	call   100293 <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101de2:	8b 45 08             	mov    0x8(%ebp),%eax
  101de5:	8b 40 1c             	mov    0x1c(%eax),%eax
  101de8:	89 44 24 04          	mov    %eax,0x4(%esp)
  101dec:	c7 04 24 fa 3c 10 00 	movl   $0x103cfa,(%esp)
  101df3:	e8 9b e4 ff ff       	call   100293 <cprintf>
}
  101df8:	90                   	nop
  101df9:	c9                   	leave  
  101dfa:	c3                   	ret    

00101dfb <trap_dispatch>:

struct trapframe switchk2u, *switchu2k;
/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101dfb:	f3 0f 1e fb          	endbr32 
  101dff:	55                   	push   %ebp
  101e00:	89 e5                	mov    %esp,%ebp
  101e02:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101e05:	8b 45 08             	mov    0x8(%ebp),%eax
  101e08:	8b 40 30             	mov    0x30(%eax),%eax
  101e0b:	83 f8 79             	cmp    $0x79,%eax
  101e0e:	0f 84 b9 01 00 00    	je     101fcd <trap_dispatch+0x1d2>
  101e14:	83 f8 79             	cmp    $0x79,%eax
  101e17:	0f 87 ec 01 00 00    	ja     102009 <trap_dispatch+0x20e>
  101e1d:	83 f8 78             	cmp    $0x78,%eax
  101e20:	0f 84 5e 01 00 00    	je     101f84 <trap_dispatch+0x189>
  101e26:	83 f8 78             	cmp    $0x78,%eax
  101e29:	0f 87 da 01 00 00    	ja     102009 <trap_dispatch+0x20e>
  101e2f:	83 f8 2f             	cmp    $0x2f,%eax
  101e32:	0f 87 d1 01 00 00    	ja     102009 <trap_dispatch+0x20e>
  101e38:	83 f8 2e             	cmp    $0x2e,%eax
  101e3b:	0f 83 fd 01 00 00    	jae    10203e <trap_dispatch+0x243>
  101e41:	83 f8 24             	cmp    $0x24,%eax
  101e44:	74 5e                	je     101ea4 <trap_dispatch+0xa9>
  101e46:	83 f8 24             	cmp    $0x24,%eax
  101e49:	0f 87 ba 01 00 00    	ja     102009 <trap_dispatch+0x20e>
  101e4f:	83 f8 20             	cmp    $0x20,%eax
  101e52:	74 0a                	je     101e5e <trap_dispatch+0x63>
  101e54:	83 f8 21             	cmp    $0x21,%eax
  101e57:	74 74                	je     101ecd <trap_dispatch+0xd2>
  101e59:	e9 ab 01 00 00       	jmp    102009 <trap_dispatch+0x20e>
        /* handle the timer interrupt */
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
        ticks++;
  101e5e:	a1 08 19 11 00       	mov    0x111908,%eax
  101e63:	40                   	inc    %eax
  101e64:	a3 08 19 11 00       	mov    %eax,0x111908
        if(ticks%TICK_NUM==0){
  101e69:	8b 0d 08 19 11 00    	mov    0x111908,%ecx
  101e6f:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101e74:	89 c8                	mov    %ecx,%eax
  101e76:	f7 e2                	mul    %edx
  101e78:	c1 ea 05             	shr    $0x5,%edx
  101e7b:	89 d0                	mov    %edx,%eax
  101e7d:	c1 e0 02             	shl    $0x2,%eax
  101e80:	01 d0                	add    %edx,%eax
  101e82:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  101e89:	01 d0                	add    %edx,%eax
  101e8b:	c1 e0 02             	shl    $0x2,%eax
  101e8e:	29 c1                	sub    %eax,%ecx
  101e90:	89 ca                	mov    %ecx,%edx
  101e92:	85 d2                	test   %edx,%edx
  101e94:	0f 85 a7 01 00 00    	jne    102041 <trap_dispatch+0x246>
            print_ticks();
  101e9a:	e8 62 fa ff ff       	call   101901 <print_ticks>
        }
        break;
  101e9f:	e9 9d 01 00 00       	jmp    102041 <trap_dispatch+0x246>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101ea4:	e8 fe f7 ff ff       	call   1016a7 <cons_getc>
  101ea9:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101eac:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101eb0:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101eb4:	89 54 24 08          	mov    %edx,0x8(%esp)
  101eb8:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ebc:	c7 04 24 09 3d 10 00 	movl   $0x103d09,(%esp)
  101ec3:	e8 cb e3 ff ff       	call   100293 <cprintf>
        break;
  101ec8:	e9 7b 01 00 00       	jmp    102048 <trap_dispatch+0x24d>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101ecd:	e8 d5 f7 ff ff       	call   1016a7 <cons_getc>
  101ed2:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101ed5:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101ed9:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101edd:	89 54 24 08          	mov    %edx,0x8(%esp)
  101ee1:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ee5:	c7 04 24 1b 3d 10 00 	movl   $0x103d1b,(%esp)
  101eec:	e8 a2 e3 ff ff       	call   100293 <cprintf>
        print_trapframe(tf);
  101ef1:	8b 45 08             	mov    0x8(%ebp),%eax
  101ef4:	89 04 24             	mov    %eax,(%esp)
  101ef7:	e8 8e fc ff ff       	call   101b8a <print_trapframe>
        if(c=='3'){
  101efc:	80 7d f7 33          	cmpb   $0x33,-0x9(%ebp)
  101f00:	75 39                	jne    101f3b <trap_dispatch+0x140>
            tf->tf_cs=USER_CS;
  101f02:	8b 45 08             	mov    0x8(%ebp),%eax
  101f05:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
            tf->tf_ds=USER_DS;
  101f0b:	8b 45 08             	mov    0x8(%ebp),%eax
  101f0e:	66 c7 40 2c 23 00    	movw   $0x23,0x2c(%eax)
            tf->tf_es=USER_DS;
  101f14:	8b 45 08             	mov    0x8(%ebp),%eax
  101f17:	66 c7 40 28 23 00    	movw   $0x23,0x28(%eax)
            tf->tf_ss=USER_DS;
  101f1d:	8b 45 08             	mov    0x8(%ebp),%eax
  101f20:	66 c7 40 48 23 00    	movw   $0x23,0x48(%eax)
            tf->tf_eflags |=FL_IOPL_MASK;
  101f26:	8b 45 08             	mov    0x8(%ebp),%eax
  101f29:	8b 40 40             	mov    0x40(%eax),%eax
  101f2c:	0d 00 30 00 00       	or     $0x3000,%eax
  101f31:	89 c2                	mov    %eax,%edx
  101f33:	8b 45 08             	mov    0x8(%ebp),%eax
  101f36:	89 50 40             	mov    %edx,0x40(%eax)
  101f39:	eb 39                	jmp    101f74 <trap_dispatch+0x179>
       
        }else if(c=='0'){
  101f3b:	80 7d f7 30          	cmpb   $0x30,-0x9(%ebp)
  101f3f:	75 33                	jne    101f74 <trap_dispatch+0x179>
        tf->tf_cs = KERNEL_CS;
  101f41:	8b 45 08             	mov    0x8(%ebp),%eax
  101f44:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
        tf->tf_ds = tf->tf_es = KERNEL_DS;
  101f4a:	8b 45 08             	mov    0x8(%ebp),%eax
  101f4d:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101f53:	8b 45 08             	mov    0x8(%ebp),%eax
  101f56:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101f5a:	8b 45 08             	mov    0x8(%ebp),%eax
  101f5d:	66 89 50 2c          	mov    %dx,0x2c(%eax)
        tf->tf_eflags &= ~FL_IOPL_MASK;
  101f61:	8b 45 08             	mov    0x8(%ebp),%eax
  101f64:	8b 40 40             	mov    0x40(%eax),%eax
  101f67:	25 ff cf ff ff       	and    $0xffffcfff,%eax
  101f6c:	89 c2                	mov    %eax,%edx
  101f6e:	8b 45 08             	mov    0x8(%ebp),%eax
  101f71:	89 50 40             	mov    %edx,0x40(%eax)
        }
        print_trapframe(tf);
  101f74:	8b 45 08             	mov    0x8(%ebp),%eax
  101f77:	89 04 24             	mov    %eax,(%esp)
  101f7a:	e8 0b fc ff ff       	call   101b8a <print_trapframe>
        break;
  101f7f:	e9 c4 00 00 00       	jmp    102048 <trap_dispatch+0x24d>
    //LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    case T_SWITCH_TOU:
         if (tf->tf_cs != USER_CS) {
  101f84:	8b 45 08             	mov    0x8(%ebp),%eax
  101f87:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101f8b:	83 f8 1b             	cmp    $0x1b,%eax
  101f8e:	0f 84 b0 00 00 00    	je     102044 <trap_dispatch+0x249>
            // //USER_CS和KERNEL_CS对应的描述符的段基址相同
            tf->tf_cs=USER_CS;
  101f94:	8b 45 08             	mov    0x8(%ebp),%eax
  101f97:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
            tf->tf_ds=USER_DS;
  101f9d:	8b 45 08             	mov    0x8(%ebp),%eax
  101fa0:	66 c7 40 2c 23 00    	movw   $0x23,0x2c(%eax)
            tf->tf_es=USER_DS;
  101fa6:	8b 45 08             	mov    0x8(%ebp),%eax
  101fa9:	66 c7 40 28 23 00    	movw   $0x23,0x28(%eax)
            tf->tf_ss=USER_DS;
  101faf:	8b 45 08             	mov    0x8(%ebp),%eax
  101fb2:	66 c7 40 48 23 00    	movw   $0x23,0x48(%eax)
            //在低的cpl下打开IO
            tf->tf_eflags |=FL_IOPL_MASK;
  101fb8:	8b 45 08             	mov    0x8(%ebp),%eax
  101fbb:	8b 40 40             	mov    0x40(%eax),%eax
  101fbe:	0d 00 30 00 00       	or     $0x3000,%eax
  101fc3:	89 c2                	mov    %eax,%edx
  101fc5:	8b 45 08             	mov    0x8(%ebp),%eax
  101fc8:	89 50 40             	mov    %edx,0x40(%eax)
        }
        break;
  101fcb:	eb 77                	jmp    102044 <trap_dispatch+0x249>
    case T_SWITCH_TOK:
     if (tf->tf_cs != KERNEL_CS) {
  101fcd:	8b 45 08             	mov    0x8(%ebp),%eax
  101fd0:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101fd4:	83 f8 08             	cmp    $0x8,%eax
  101fd7:	74 6e                	je     102047 <trap_dispatch+0x24c>
            tf->tf_cs = KERNEL_CS;
  101fd9:	8b 45 08             	mov    0x8(%ebp),%eax
  101fdc:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
            tf->tf_ds = KERNEL_DS;
  101fe2:	8b 45 08             	mov    0x8(%ebp),%eax
  101fe5:	66 c7 40 2c 10 00    	movw   $0x10,0x2c(%eax)
            tf->tf_es = KERNEL_DS;
  101feb:	8b 45 08             	mov    0x8(%ebp),%eax
  101fee:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
            tf->tf_eflags |=FL_IOPL_MASK;
  101ff4:	8b 45 08             	mov    0x8(%ebp),%eax
  101ff7:	8b 40 40             	mov    0x40(%eax),%eax
  101ffa:	0d 00 30 00 00       	or     $0x3000,%eax
  101fff:	89 c2                	mov    %eax,%edx
  102001:	8b 45 08             	mov    0x8(%ebp),%eax
  102004:	89 50 40             	mov    %edx,0x40(%eax)
        }
    
        break;
  102007:	eb 3e                	jmp    102047 <trap_dispatch+0x24c>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  102009:	8b 45 08             	mov    0x8(%ebp),%eax
  10200c:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  102010:	83 e0 03             	and    $0x3,%eax
  102013:	85 c0                	test   %eax,%eax
  102015:	75 31                	jne    102048 <trap_dispatch+0x24d>
            print_trapframe(tf);
  102017:	8b 45 08             	mov    0x8(%ebp),%eax
  10201a:	89 04 24             	mov    %eax,(%esp)
  10201d:	e8 68 fb ff ff       	call   101b8a <print_trapframe>
            panic("unexpected trap in kernel.\n");
  102022:	c7 44 24 08 2a 3d 10 	movl   $0x103d2a,0x8(%esp)
  102029:	00 
  10202a:	c7 44 24 04 e0 00 00 	movl   $0xe0,0x4(%esp)
  102031:	00 
  102032:	c7 04 24 4e 3b 10 00 	movl   $0x103b4e,(%esp)
  102039:	e8 c1 e3 ff ff       	call   1003ff <__panic>
        break;
  10203e:	90                   	nop
  10203f:	eb 07                	jmp    102048 <trap_dispatch+0x24d>
        break;
  102041:	90                   	nop
  102042:	eb 04                	jmp    102048 <trap_dispatch+0x24d>
        break;
  102044:	90                   	nop
  102045:	eb 01                	jmp    102048 <trap_dispatch+0x24d>
        break;
  102047:	90                   	nop
        }
    }
}
  102048:	90                   	nop
  102049:	c9                   	leave  
  10204a:	c3                   	ret    

0010204b <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  10204b:	f3 0f 1e fb          	endbr32 
  10204f:	55                   	push   %ebp
  102050:	89 e5                	mov    %esp,%ebp
  102052:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  102055:	8b 45 08             	mov    0x8(%ebp),%eax
  102058:	89 04 24             	mov    %eax,(%esp)
  10205b:	e8 9b fd ff ff       	call   101dfb <trap_dispatch>
}
  102060:	90                   	nop
  102061:	c9                   	leave  
  102062:	c3                   	ret    

00102063 <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  102063:	6a 00                	push   $0x0
  pushl $0
  102065:	6a 00                	push   $0x0
  jmp __alltraps
  102067:	e9 69 0a 00 00       	jmp    102ad5 <__alltraps>

0010206c <vector1>:
.globl vector1
vector1:
  pushl $0
  10206c:	6a 00                	push   $0x0
  pushl $1
  10206e:	6a 01                	push   $0x1
  jmp __alltraps
  102070:	e9 60 0a 00 00       	jmp    102ad5 <__alltraps>

00102075 <vector2>:
.globl vector2
vector2:
  pushl $0
  102075:	6a 00                	push   $0x0
  pushl $2
  102077:	6a 02                	push   $0x2
  jmp __alltraps
  102079:	e9 57 0a 00 00       	jmp    102ad5 <__alltraps>

0010207e <vector3>:
.globl vector3
vector3:
  pushl $0
  10207e:	6a 00                	push   $0x0
  pushl $3
  102080:	6a 03                	push   $0x3
  jmp __alltraps
  102082:	e9 4e 0a 00 00       	jmp    102ad5 <__alltraps>

00102087 <vector4>:
.globl vector4
vector4:
  pushl $0
  102087:	6a 00                	push   $0x0
  pushl $4
  102089:	6a 04                	push   $0x4
  jmp __alltraps
  10208b:	e9 45 0a 00 00       	jmp    102ad5 <__alltraps>

00102090 <vector5>:
.globl vector5
vector5:
  pushl $0
  102090:	6a 00                	push   $0x0
  pushl $5
  102092:	6a 05                	push   $0x5
  jmp __alltraps
  102094:	e9 3c 0a 00 00       	jmp    102ad5 <__alltraps>

00102099 <vector6>:
.globl vector6
vector6:
  pushl $0
  102099:	6a 00                	push   $0x0
  pushl $6
  10209b:	6a 06                	push   $0x6
  jmp __alltraps
  10209d:	e9 33 0a 00 00       	jmp    102ad5 <__alltraps>

001020a2 <vector7>:
.globl vector7
vector7:
  pushl $0
  1020a2:	6a 00                	push   $0x0
  pushl $7
  1020a4:	6a 07                	push   $0x7
  jmp __alltraps
  1020a6:	e9 2a 0a 00 00       	jmp    102ad5 <__alltraps>

001020ab <vector8>:
.globl vector8
vector8:
  pushl $8
  1020ab:	6a 08                	push   $0x8
  jmp __alltraps
  1020ad:	e9 23 0a 00 00       	jmp    102ad5 <__alltraps>

001020b2 <vector9>:
.globl vector9
vector9:
  pushl $0
  1020b2:	6a 00                	push   $0x0
  pushl $9
  1020b4:	6a 09                	push   $0x9
  jmp __alltraps
  1020b6:	e9 1a 0a 00 00       	jmp    102ad5 <__alltraps>

001020bb <vector10>:
.globl vector10
vector10:
  pushl $10
  1020bb:	6a 0a                	push   $0xa
  jmp __alltraps
  1020bd:	e9 13 0a 00 00       	jmp    102ad5 <__alltraps>

001020c2 <vector11>:
.globl vector11
vector11:
  pushl $11
  1020c2:	6a 0b                	push   $0xb
  jmp __alltraps
  1020c4:	e9 0c 0a 00 00       	jmp    102ad5 <__alltraps>

001020c9 <vector12>:
.globl vector12
vector12:
  pushl $12
  1020c9:	6a 0c                	push   $0xc
  jmp __alltraps
  1020cb:	e9 05 0a 00 00       	jmp    102ad5 <__alltraps>

001020d0 <vector13>:
.globl vector13
vector13:
  pushl $13
  1020d0:	6a 0d                	push   $0xd
  jmp __alltraps
  1020d2:	e9 fe 09 00 00       	jmp    102ad5 <__alltraps>

001020d7 <vector14>:
.globl vector14
vector14:
  pushl $14
  1020d7:	6a 0e                	push   $0xe
  jmp __alltraps
  1020d9:	e9 f7 09 00 00       	jmp    102ad5 <__alltraps>

001020de <vector15>:
.globl vector15
vector15:
  pushl $0
  1020de:	6a 00                	push   $0x0
  pushl $15
  1020e0:	6a 0f                	push   $0xf
  jmp __alltraps
  1020e2:	e9 ee 09 00 00       	jmp    102ad5 <__alltraps>

001020e7 <vector16>:
.globl vector16
vector16:
  pushl $0
  1020e7:	6a 00                	push   $0x0
  pushl $16
  1020e9:	6a 10                	push   $0x10
  jmp __alltraps
  1020eb:	e9 e5 09 00 00       	jmp    102ad5 <__alltraps>

001020f0 <vector17>:
.globl vector17
vector17:
  pushl $17
  1020f0:	6a 11                	push   $0x11
  jmp __alltraps
  1020f2:	e9 de 09 00 00       	jmp    102ad5 <__alltraps>

001020f7 <vector18>:
.globl vector18
vector18:
  pushl $0
  1020f7:	6a 00                	push   $0x0
  pushl $18
  1020f9:	6a 12                	push   $0x12
  jmp __alltraps
  1020fb:	e9 d5 09 00 00       	jmp    102ad5 <__alltraps>

00102100 <vector19>:
.globl vector19
vector19:
  pushl $0
  102100:	6a 00                	push   $0x0
  pushl $19
  102102:	6a 13                	push   $0x13
  jmp __alltraps
  102104:	e9 cc 09 00 00       	jmp    102ad5 <__alltraps>

00102109 <vector20>:
.globl vector20
vector20:
  pushl $0
  102109:	6a 00                	push   $0x0
  pushl $20
  10210b:	6a 14                	push   $0x14
  jmp __alltraps
  10210d:	e9 c3 09 00 00       	jmp    102ad5 <__alltraps>

00102112 <vector21>:
.globl vector21
vector21:
  pushl $0
  102112:	6a 00                	push   $0x0
  pushl $21
  102114:	6a 15                	push   $0x15
  jmp __alltraps
  102116:	e9 ba 09 00 00       	jmp    102ad5 <__alltraps>

0010211b <vector22>:
.globl vector22
vector22:
  pushl $0
  10211b:	6a 00                	push   $0x0
  pushl $22
  10211d:	6a 16                	push   $0x16
  jmp __alltraps
  10211f:	e9 b1 09 00 00       	jmp    102ad5 <__alltraps>

00102124 <vector23>:
.globl vector23
vector23:
  pushl $0
  102124:	6a 00                	push   $0x0
  pushl $23
  102126:	6a 17                	push   $0x17
  jmp __alltraps
  102128:	e9 a8 09 00 00       	jmp    102ad5 <__alltraps>

0010212d <vector24>:
.globl vector24
vector24:
  pushl $0
  10212d:	6a 00                	push   $0x0
  pushl $24
  10212f:	6a 18                	push   $0x18
  jmp __alltraps
  102131:	e9 9f 09 00 00       	jmp    102ad5 <__alltraps>

00102136 <vector25>:
.globl vector25
vector25:
  pushl $0
  102136:	6a 00                	push   $0x0
  pushl $25
  102138:	6a 19                	push   $0x19
  jmp __alltraps
  10213a:	e9 96 09 00 00       	jmp    102ad5 <__alltraps>

0010213f <vector26>:
.globl vector26
vector26:
  pushl $0
  10213f:	6a 00                	push   $0x0
  pushl $26
  102141:	6a 1a                	push   $0x1a
  jmp __alltraps
  102143:	e9 8d 09 00 00       	jmp    102ad5 <__alltraps>

00102148 <vector27>:
.globl vector27
vector27:
  pushl $0
  102148:	6a 00                	push   $0x0
  pushl $27
  10214a:	6a 1b                	push   $0x1b
  jmp __alltraps
  10214c:	e9 84 09 00 00       	jmp    102ad5 <__alltraps>

00102151 <vector28>:
.globl vector28
vector28:
  pushl $0
  102151:	6a 00                	push   $0x0
  pushl $28
  102153:	6a 1c                	push   $0x1c
  jmp __alltraps
  102155:	e9 7b 09 00 00       	jmp    102ad5 <__alltraps>

0010215a <vector29>:
.globl vector29
vector29:
  pushl $0
  10215a:	6a 00                	push   $0x0
  pushl $29
  10215c:	6a 1d                	push   $0x1d
  jmp __alltraps
  10215e:	e9 72 09 00 00       	jmp    102ad5 <__alltraps>

00102163 <vector30>:
.globl vector30
vector30:
  pushl $0
  102163:	6a 00                	push   $0x0
  pushl $30
  102165:	6a 1e                	push   $0x1e
  jmp __alltraps
  102167:	e9 69 09 00 00       	jmp    102ad5 <__alltraps>

0010216c <vector31>:
.globl vector31
vector31:
  pushl $0
  10216c:	6a 00                	push   $0x0
  pushl $31
  10216e:	6a 1f                	push   $0x1f
  jmp __alltraps
  102170:	e9 60 09 00 00       	jmp    102ad5 <__alltraps>

00102175 <vector32>:
.globl vector32
vector32:
  pushl $0
  102175:	6a 00                	push   $0x0
  pushl $32
  102177:	6a 20                	push   $0x20
  jmp __alltraps
  102179:	e9 57 09 00 00       	jmp    102ad5 <__alltraps>

0010217e <vector33>:
.globl vector33
vector33:
  pushl $0
  10217e:	6a 00                	push   $0x0
  pushl $33
  102180:	6a 21                	push   $0x21
  jmp __alltraps
  102182:	e9 4e 09 00 00       	jmp    102ad5 <__alltraps>

00102187 <vector34>:
.globl vector34
vector34:
  pushl $0
  102187:	6a 00                	push   $0x0
  pushl $34
  102189:	6a 22                	push   $0x22
  jmp __alltraps
  10218b:	e9 45 09 00 00       	jmp    102ad5 <__alltraps>

00102190 <vector35>:
.globl vector35
vector35:
  pushl $0
  102190:	6a 00                	push   $0x0
  pushl $35
  102192:	6a 23                	push   $0x23
  jmp __alltraps
  102194:	e9 3c 09 00 00       	jmp    102ad5 <__alltraps>

00102199 <vector36>:
.globl vector36
vector36:
  pushl $0
  102199:	6a 00                	push   $0x0
  pushl $36
  10219b:	6a 24                	push   $0x24
  jmp __alltraps
  10219d:	e9 33 09 00 00       	jmp    102ad5 <__alltraps>

001021a2 <vector37>:
.globl vector37
vector37:
  pushl $0
  1021a2:	6a 00                	push   $0x0
  pushl $37
  1021a4:	6a 25                	push   $0x25
  jmp __alltraps
  1021a6:	e9 2a 09 00 00       	jmp    102ad5 <__alltraps>

001021ab <vector38>:
.globl vector38
vector38:
  pushl $0
  1021ab:	6a 00                	push   $0x0
  pushl $38
  1021ad:	6a 26                	push   $0x26
  jmp __alltraps
  1021af:	e9 21 09 00 00       	jmp    102ad5 <__alltraps>

001021b4 <vector39>:
.globl vector39
vector39:
  pushl $0
  1021b4:	6a 00                	push   $0x0
  pushl $39
  1021b6:	6a 27                	push   $0x27
  jmp __alltraps
  1021b8:	e9 18 09 00 00       	jmp    102ad5 <__alltraps>

001021bd <vector40>:
.globl vector40
vector40:
  pushl $0
  1021bd:	6a 00                	push   $0x0
  pushl $40
  1021bf:	6a 28                	push   $0x28
  jmp __alltraps
  1021c1:	e9 0f 09 00 00       	jmp    102ad5 <__alltraps>

001021c6 <vector41>:
.globl vector41
vector41:
  pushl $0
  1021c6:	6a 00                	push   $0x0
  pushl $41
  1021c8:	6a 29                	push   $0x29
  jmp __alltraps
  1021ca:	e9 06 09 00 00       	jmp    102ad5 <__alltraps>

001021cf <vector42>:
.globl vector42
vector42:
  pushl $0
  1021cf:	6a 00                	push   $0x0
  pushl $42
  1021d1:	6a 2a                	push   $0x2a
  jmp __alltraps
  1021d3:	e9 fd 08 00 00       	jmp    102ad5 <__alltraps>

001021d8 <vector43>:
.globl vector43
vector43:
  pushl $0
  1021d8:	6a 00                	push   $0x0
  pushl $43
  1021da:	6a 2b                	push   $0x2b
  jmp __alltraps
  1021dc:	e9 f4 08 00 00       	jmp    102ad5 <__alltraps>

001021e1 <vector44>:
.globl vector44
vector44:
  pushl $0
  1021e1:	6a 00                	push   $0x0
  pushl $44
  1021e3:	6a 2c                	push   $0x2c
  jmp __alltraps
  1021e5:	e9 eb 08 00 00       	jmp    102ad5 <__alltraps>

001021ea <vector45>:
.globl vector45
vector45:
  pushl $0
  1021ea:	6a 00                	push   $0x0
  pushl $45
  1021ec:	6a 2d                	push   $0x2d
  jmp __alltraps
  1021ee:	e9 e2 08 00 00       	jmp    102ad5 <__alltraps>

001021f3 <vector46>:
.globl vector46
vector46:
  pushl $0
  1021f3:	6a 00                	push   $0x0
  pushl $46
  1021f5:	6a 2e                	push   $0x2e
  jmp __alltraps
  1021f7:	e9 d9 08 00 00       	jmp    102ad5 <__alltraps>

001021fc <vector47>:
.globl vector47
vector47:
  pushl $0
  1021fc:	6a 00                	push   $0x0
  pushl $47
  1021fe:	6a 2f                	push   $0x2f
  jmp __alltraps
  102200:	e9 d0 08 00 00       	jmp    102ad5 <__alltraps>

00102205 <vector48>:
.globl vector48
vector48:
  pushl $0
  102205:	6a 00                	push   $0x0
  pushl $48
  102207:	6a 30                	push   $0x30
  jmp __alltraps
  102209:	e9 c7 08 00 00       	jmp    102ad5 <__alltraps>

0010220e <vector49>:
.globl vector49
vector49:
  pushl $0
  10220e:	6a 00                	push   $0x0
  pushl $49
  102210:	6a 31                	push   $0x31
  jmp __alltraps
  102212:	e9 be 08 00 00       	jmp    102ad5 <__alltraps>

00102217 <vector50>:
.globl vector50
vector50:
  pushl $0
  102217:	6a 00                	push   $0x0
  pushl $50
  102219:	6a 32                	push   $0x32
  jmp __alltraps
  10221b:	e9 b5 08 00 00       	jmp    102ad5 <__alltraps>

00102220 <vector51>:
.globl vector51
vector51:
  pushl $0
  102220:	6a 00                	push   $0x0
  pushl $51
  102222:	6a 33                	push   $0x33
  jmp __alltraps
  102224:	e9 ac 08 00 00       	jmp    102ad5 <__alltraps>

00102229 <vector52>:
.globl vector52
vector52:
  pushl $0
  102229:	6a 00                	push   $0x0
  pushl $52
  10222b:	6a 34                	push   $0x34
  jmp __alltraps
  10222d:	e9 a3 08 00 00       	jmp    102ad5 <__alltraps>

00102232 <vector53>:
.globl vector53
vector53:
  pushl $0
  102232:	6a 00                	push   $0x0
  pushl $53
  102234:	6a 35                	push   $0x35
  jmp __alltraps
  102236:	e9 9a 08 00 00       	jmp    102ad5 <__alltraps>

0010223b <vector54>:
.globl vector54
vector54:
  pushl $0
  10223b:	6a 00                	push   $0x0
  pushl $54
  10223d:	6a 36                	push   $0x36
  jmp __alltraps
  10223f:	e9 91 08 00 00       	jmp    102ad5 <__alltraps>

00102244 <vector55>:
.globl vector55
vector55:
  pushl $0
  102244:	6a 00                	push   $0x0
  pushl $55
  102246:	6a 37                	push   $0x37
  jmp __alltraps
  102248:	e9 88 08 00 00       	jmp    102ad5 <__alltraps>

0010224d <vector56>:
.globl vector56
vector56:
  pushl $0
  10224d:	6a 00                	push   $0x0
  pushl $56
  10224f:	6a 38                	push   $0x38
  jmp __alltraps
  102251:	e9 7f 08 00 00       	jmp    102ad5 <__alltraps>

00102256 <vector57>:
.globl vector57
vector57:
  pushl $0
  102256:	6a 00                	push   $0x0
  pushl $57
  102258:	6a 39                	push   $0x39
  jmp __alltraps
  10225a:	e9 76 08 00 00       	jmp    102ad5 <__alltraps>

0010225f <vector58>:
.globl vector58
vector58:
  pushl $0
  10225f:	6a 00                	push   $0x0
  pushl $58
  102261:	6a 3a                	push   $0x3a
  jmp __alltraps
  102263:	e9 6d 08 00 00       	jmp    102ad5 <__alltraps>

00102268 <vector59>:
.globl vector59
vector59:
  pushl $0
  102268:	6a 00                	push   $0x0
  pushl $59
  10226a:	6a 3b                	push   $0x3b
  jmp __alltraps
  10226c:	e9 64 08 00 00       	jmp    102ad5 <__alltraps>

00102271 <vector60>:
.globl vector60
vector60:
  pushl $0
  102271:	6a 00                	push   $0x0
  pushl $60
  102273:	6a 3c                	push   $0x3c
  jmp __alltraps
  102275:	e9 5b 08 00 00       	jmp    102ad5 <__alltraps>

0010227a <vector61>:
.globl vector61
vector61:
  pushl $0
  10227a:	6a 00                	push   $0x0
  pushl $61
  10227c:	6a 3d                	push   $0x3d
  jmp __alltraps
  10227e:	e9 52 08 00 00       	jmp    102ad5 <__alltraps>

00102283 <vector62>:
.globl vector62
vector62:
  pushl $0
  102283:	6a 00                	push   $0x0
  pushl $62
  102285:	6a 3e                	push   $0x3e
  jmp __alltraps
  102287:	e9 49 08 00 00       	jmp    102ad5 <__alltraps>

0010228c <vector63>:
.globl vector63
vector63:
  pushl $0
  10228c:	6a 00                	push   $0x0
  pushl $63
  10228e:	6a 3f                	push   $0x3f
  jmp __alltraps
  102290:	e9 40 08 00 00       	jmp    102ad5 <__alltraps>

00102295 <vector64>:
.globl vector64
vector64:
  pushl $0
  102295:	6a 00                	push   $0x0
  pushl $64
  102297:	6a 40                	push   $0x40
  jmp __alltraps
  102299:	e9 37 08 00 00       	jmp    102ad5 <__alltraps>

0010229e <vector65>:
.globl vector65
vector65:
  pushl $0
  10229e:	6a 00                	push   $0x0
  pushl $65
  1022a0:	6a 41                	push   $0x41
  jmp __alltraps
  1022a2:	e9 2e 08 00 00       	jmp    102ad5 <__alltraps>

001022a7 <vector66>:
.globl vector66
vector66:
  pushl $0
  1022a7:	6a 00                	push   $0x0
  pushl $66
  1022a9:	6a 42                	push   $0x42
  jmp __alltraps
  1022ab:	e9 25 08 00 00       	jmp    102ad5 <__alltraps>

001022b0 <vector67>:
.globl vector67
vector67:
  pushl $0
  1022b0:	6a 00                	push   $0x0
  pushl $67
  1022b2:	6a 43                	push   $0x43
  jmp __alltraps
  1022b4:	e9 1c 08 00 00       	jmp    102ad5 <__alltraps>

001022b9 <vector68>:
.globl vector68
vector68:
  pushl $0
  1022b9:	6a 00                	push   $0x0
  pushl $68
  1022bb:	6a 44                	push   $0x44
  jmp __alltraps
  1022bd:	e9 13 08 00 00       	jmp    102ad5 <__alltraps>

001022c2 <vector69>:
.globl vector69
vector69:
  pushl $0
  1022c2:	6a 00                	push   $0x0
  pushl $69
  1022c4:	6a 45                	push   $0x45
  jmp __alltraps
  1022c6:	e9 0a 08 00 00       	jmp    102ad5 <__alltraps>

001022cb <vector70>:
.globl vector70
vector70:
  pushl $0
  1022cb:	6a 00                	push   $0x0
  pushl $70
  1022cd:	6a 46                	push   $0x46
  jmp __alltraps
  1022cf:	e9 01 08 00 00       	jmp    102ad5 <__alltraps>

001022d4 <vector71>:
.globl vector71
vector71:
  pushl $0
  1022d4:	6a 00                	push   $0x0
  pushl $71
  1022d6:	6a 47                	push   $0x47
  jmp __alltraps
  1022d8:	e9 f8 07 00 00       	jmp    102ad5 <__alltraps>

001022dd <vector72>:
.globl vector72
vector72:
  pushl $0
  1022dd:	6a 00                	push   $0x0
  pushl $72
  1022df:	6a 48                	push   $0x48
  jmp __alltraps
  1022e1:	e9 ef 07 00 00       	jmp    102ad5 <__alltraps>

001022e6 <vector73>:
.globl vector73
vector73:
  pushl $0
  1022e6:	6a 00                	push   $0x0
  pushl $73
  1022e8:	6a 49                	push   $0x49
  jmp __alltraps
  1022ea:	e9 e6 07 00 00       	jmp    102ad5 <__alltraps>

001022ef <vector74>:
.globl vector74
vector74:
  pushl $0
  1022ef:	6a 00                	push   $0x0
  pushl $74
  1022f1:	6a 4a                	push   $0x4a
  jmp __alltraps
  1022f3:	e9 dd 07 00 00       	jmp    102ad5 <__alltraps>

001022f8 <vector75>:
.globl vector75
vector75:
  pushl $0
  1022f8:	6a 00                	push   $0x0
  pushl $75
  1022fa:	6a 4b                	push   $0x4b
  jmp __alltraps
  1022fc:	e9 d4 07 00 00       	jmp    102ad5 <__alltraps>

00102301 <vector76>:
.globl vector76
vector76:
  pushl $0
  102301:	6a 00                	push   $0x0
  pushl $76
  102303:	6a 4c                	push   $0x4c
  jmp __alltraps
  102305:	e9 cb 07 00 00       	jmp    102ad5 <__alltraps>

0010230a <vector77>:
.globl vector77
vector77:
  pushl $0
  10230a:	6a 00                	push   $0x0
  pushl $77
  10230c:	6a 4d                	push   $0x4d
  jmp __alltraps
  10230e:	e9 c2 07 00 00       	jmp    102ad5 <__alltraps>

00102313 <vector78>:
.globl vector78
vector78:
  pushl $0
  102313:	6a 00                	push   $0x0
  pushl $78
  102315:	6a 4e                	push   $0x4e
  jmp __alltraps
  102317:	e9 b9 07 00 00       	jmp    102ad5 <__alltraps>

0010231c <vector79>:
.globl vector79
vector79:
  pushl $0
  10231c:	6a 00                	push   $0x0
  pushl $79
  10231e:	6a 4f                	push   $0x4f
  jmp __alltraps
  102320:	e9 b0 07 00 00       	jmp    102ad5 <__alltraps>

00102325 <vector80>:
.globl vector80
vector80:
  pushl $0
  102325:	6a 00                	push   $0x0
  pushl $80
  102327:	6a 50                	push   $0x50
  jmp __alltraps
  102329:	e9 a7 07 00 00       	jmp    102ad5 <__alltraps>

0010232e <vector81>:
.globl vector81
vector81:
  pushl $0
  10232e:	6a 00                	push   $0x0
  pushl $81
  102330:	6a 51                	push   $0x51
  jmp __alltraps
  102332:	e9 9e 07 00 00       	jmp    102ad5 <__alltraps>

00102337 <vector82>:
.globl vector82
vector82:
  pushl $0
  102337:	6a 00                	push   $0x0
  pushl $82
  102339:	6a 52                	push   $0x52
  jmp __alltraps
  10233b:	e9 95 07 00 00       	jmp    102ad5 <__alltraps>

00102340 <vector83>:
.globl vector83
vector83:
  pushl $0
  102340:	6a 00                	push   $0x0
  pushl $83
  102342:	6a 53                	push   $0x53
  jmp __alltraps
  102344:	e9 8c 07 00 00       	jmp    102ad5 <__alltraps>

00102349 <vector84>:
.globl vector84
vector84:
  pushl $0
  102349:	6a 00                	push   $0x0
  pushl $84
  10234b:	6a 54                	push   $0x54
  jmp __alltraps
  10234d:	e9 83 07 00 00       	jmp    102ad5 <__alltraps>

00102352 <vector85>:
.globl vector85
vector85:
  pushl $0
  102352:	6a 00                	push   $0x0
  pushl $85
  102354:	6a 55                	push   $0x55
  jmp __alltraps
  102356:	e9 7a 07 00 00       	jmp    102ad5 <__alltraps>

0010235b <vector86>:
.globl vector86
vector86:
  pushl $0
  10235b:	6a 00                	push   $0x0
  pushl $86
  10235d:	6a 56                	push   $0x56
  jmp __alltraps
  10235f:	e9 71 07 00 00       	jmp    102ad5 <__alltraps>

00102364 <vector87>:
.globl vector87
vector87:
  pushl $0
  102364:	6a 00                	push   $0x0
  pushl $87
  102366:	6a 57                	push   $0x57
  jmp __alltraps
  102368:	e9 68 07 00 00       	jmp    102ad5 <__alltraps>

0010236d <vector88>:
.globl vector88
vector88:
  pushl $0
  10236d:	6a 00                	push   $0x0
  pushl $88
  10236f:	6a 58                	push   $0x58
  jmp __alltraps
  102371:	e9 5f 07 00 00       	jmp    102ad5 <__alltraps>

00102376 <vector89>:
.globl vector89
vector89:
  pushl $0
  102376:	6a 00                	push   $0x0
  pushl $89
  102378:	6a 59                	push   $0x59
  jmp __alltraps
  10237a:	e9 56 07 00 00       	jmp    102ad5 <__alltraps>

0010237f <vector90>:
.globl vector90
vector90:
  pushl $0
  10237f:	6a 00                	push   $0x0
  pushl $90
  102381:	6a 5a                	push   $0x5a
  jmp __alltraps
  102383:	e9 4d 07 00 00       	jmp    102ad5 <__alltraps>

00102388 <vector91>:
.globl vector91
vector91:
  pushl $0
  102388:	6a 00                	push   $0x0
  pushl $91
  10238a:	6a 5b                	push   $0x5b
  jmp __alltraps
  10238c:	e9 44 07 00 00       	jmp    102ad5 <__alltraps>

00102391 <vector92>:
.globl vector92
vector92:
  pushl $0
  102391:	6a 00                	push   $0x0
  pushl $92
  102393:	6a 5c                	push   $0x5c
  jmp __alltraps
  102395:	e9 3b 07 00 00       	jmp    102ad5 <__alltraps>

0010239a <vector93>:
.globl vector93
vector93:
  pushl $0
  10239a:	6a 00                	push   $0x0
  pushl $93
  10239c:	6a 5d                	push   $0x5d
  jmp __alltraps
  10239e:	e9 32 07 00 00       	jmp    102ad5 <__alltraps>

001023a3 <vector94>:
.globl vector94
vector94:
  pushl $0
  1023a3:	6a 00                	push   $0x0
  pushl $94
  1023a5:	6a 5e                	push   $0x5e
  jmp __alltraps
  1023a7:	e9 29 07 00 00       	jmp    102ad5 <__alltraps>

001023ac <vector95>:
.globl vector95
vector95:
  pushl $0
  1023ac:	6a 00                	push   $0x0
  pushl $95
  1023ae:	6a 5f                	push   $0x5f
  jmp __alltraps
  1023b0:	e9 20 07 00 00       	jmp    102ad5 <__alltraps>

001023b5 <vector96>:
.globl vector96
vector96:
  pushl $0
  1023b5:	6a 00                	push   $0x0
  pushl $96
  1023b7:	6a 60                	push   $0x60
  jmp __alltraps
  1023b9:	e9 17 07 00 00       	jmp    102ad5 <__alltraps>

001023be <vector97>:
.globl vector97
vector97:
  pushl $0
  1023be:	6a 00                	push   $0x0
  pushl $97
  1023c0:	6a 61                	push   $0x61
  jmp __alltraps
  1023c2:	e9 0e 07 00 00       	jmp    102ad5 <__alltraps>

001023c7 <vector98>:
.globl vector98
vector98:
  pushl $0
  1023c7:	6a 00                	push   $0x0
  pushl $98
  1023c9:	6a 62                	push   $0x62
  jmp __alltraps
  1023cb:	e9 05 07 00 00       	jmp    102ad5 <__alltraps>

001023d0 <vector99>:
.globl vector99
vector99:
  pushl $0
  1023d0:	6a 00                	push   $0x0
  pushl $99
  1023d2:	6a 63                	push   $0x63
  jmp __alltraps
  1023d4:	e9 fc 06 00 00       	jmp    102ad5 <__alltraps>

001023d9 <vector100>:
.globl vector100
vector100:
  pushl $0
  1023d9:	6a 00                	push   $0x0
  pushl $100
  1023db:	6a 64                	push   $0x64
  jmp __alltraps
  1023dd:	e9 f3 06 00 00       	jmp    102ad5 <__alltraps>

001023e2 <vector101>:
.globl vector101
vector101:
  pushl $0
  1023e2:	6a 00                	push   $0x0
  pushl $101
  1023e4:	6a 65                	push   $0x65
  jmp __alltraps
  1023e6:	e9 ea 06 00 00       	jmp    102ad5 <__alltraps>

001023eb <vector102>:
.globl vector102
vector102:
  pushl $0
  1023eb:	6a 00                	push   $0x0
  pushl $102
  1023ed:	6a 66                	push   $0x66
  jmp __alltraps
  1023ef:	e9 e1 06 00 00       	jmp    102ad5 <__alltraps>

001023f4 <vector103>:
.globl vector103
vector103:
  pushl $0
  1023f4:	6a 00                	push   $0x0
  pushl $103
  1023f6:	6a 67                	push   $0x67
  jmp __alltraps
  1023f8:	e9 d8 06 00 00       	jmp    102ad5 <__alltraps>

001023fd <vector104>:
.globl vector104
vector104:
  pushl $0
  1023fd:	6a 00                	push   $0x0
  pushl $104
  1023ff:	6a 68                	push   $0x68
  jmp __alltraps
  102401:	e9 cf 06 00 00       	jmp    102ad5 <__alltraps>

00102406 <vector105>:
.globl vector105
vector105:
  pushl $0
  102406:	6a 00                	push   $0x0
  pushl $105
  102408:	6a 69                	push   $0x69
  jmp __alltraps
  10240a:	e9 c6 06 00 00       	jmp    102ad5 <__alltraps>

0010240f <vector106>:
.globl vector106
vector106:
  pushl $0
  10240f:	6a 00                	push   $0x0
  pushl $106
  102411:	6a 6a                	push   $0x6a
  jmp __alltraps
  102413:	e9 bd 06 00 00       	jmp    102ad5 <__alltraps>

00102418 <vector107>:
.globl vector107
vector107:
  pushl $0
  102418:	6a 00                	push   $0x0
  pushl $107
  10241a:	6a 6b                	push   $0x6b
  jmp __alltraps
  10241c:	e9 b4 06 00 00       	jmp    102ad5 <__alltraps>

00102421 <vector108>:
.globl vector108
vector108:
  pushl $0
  102421:	6a 00                	push   $0x0
  pushl $108
  102423:	6a 6c                	push   $0x6c
  jmp __alltraps
  102425:	e9 ab 06 00 00       	jmp    102ad5 <__alltraps>

0010242a <vector109>:
.globl vector109
vector109:
  pushl $0
  10242a:	6a 00                	push   $0x0
  pushl $109
  10242c:	6a 6d                	push   $0x6d
  jmp __alltraps
  10242e:	e9 a2 06 00 00       	jmp    102ad5 <__alltraps>

00102433 <vector110>:
.globl vector110
vector110:
  pushl $0
  102433:	6a 00                	push   $0x0
  pushl $110
  102435:	6a 6e                	push   $0x6e
  jmp __alltraps
  102437:	e9 99 06 00 00       	jmp    102ad5 <__alltraps>

0010243c <vector111>:
.globl vector111
vector111:
  pushl $0
  10243c:	6a 00                	push   $0x0
  pushl $111
  10243e:	6a 6f                	push   $0x6f
  jmp __alltraps
  102440:	e9 90 06 00 00       	jmp    102ad5 <__alltraps>

00102445 <vector112>:
.globl vector112
vector112:
  pushl $0
  102445:	6a 00                	push   $0x0
  pushl $112
  102447:	6a 70                	push   $0x70
  jmp __alltraps
  102449:	e9 87 06 00 00       	jmp    102ad5 <__alltraps>

0010244e <vector113>:
.globl vector113
vector113:
  pushl $0
  10244e:	6a 00                	push   $0x0
  pushl $113
  102450:	6a 71                	push   $0x71
  jmp __alltraps
  102452:	e9 7e 06 00 00       	jmp    102ad5 <__alltraps>

00102457 <vector114>:
.globl vector114
vector114:
  pushl $0
  102457:	6a 00                	push   $0x0
  pushl $114
  102459:	6a 72                	push   $0x72
  jmp __alltraps
  10245b:	e9 75 06 00 00       	jmp    102ad5 <__alltraps>

00102460 <vector115>:
.globl vector115
vector115:
  pushl $0
  102460:	6a 00                	push   $0x0
  pushl $115
  102462:	6a 73                	push   $0x73
  jmp __alltraps
  102464:	e9 6c 06 00 00       	jmp    102ad5 <__alltraps>

00102469 <vector116>:
.globl vector116
vector116:
  pushl $0
  102469:	6a 00                	push   $0x0
  pushl $116
  10246b:	6a 74                	push   $0x74
  jmp __alltraps
  10246d:	e9 63 06 00 00       	jmp    102ad5 <__alltraps>

00102472 <vector117>:
.globl vector117
vector117:
  pushl $0
  102472:	6a 00                	push   $0x0
  pushl $117
  102474:	6a 75                	push   $0x75
  jmp __alltraps
  102476:	e9 5a 06 00 00       	jmp    102ad5 <__alltraps>

0010247b <vector118>:
.globl vector118
vector118:
  pushl $0
  10247b:	6a 00                	push   $0x0
  pushl $118
  10247d:	6a 76                	push   $0x76
  jmp __alltraps
  10247f:	e9 51 06 00 00       	jmp    102ad5 <__alltraps>

00102484 <vector119>:
.globl vector119
vector119:
  pushl $0
  102484:	6a 00                	push   $0x0
  pushl $119
  102486:	6a 77                	push   $0x77
  jmp __alltraps
  102488:	e9 48 06 00 00       	jmp    102ad5 <__alltraps>

0010248d <vector120>:
.globl vector120
vector120:
  pushl $0
  10248d:	6a 00                	push   $0x0
  pushl $120
  10248f:	6a 78                	push   $0x78
  jmp __alltraps
  102491:	e9 3f 06 00 00       	jmp    102ad5 <__alltraps>

00102496 <vector121>:
.globl vector121
vector121:
  pushl $0
  102496:	6a 00                	push   $0x0
  pushl $121
  102498:	6a 79                	push   $0x79
  jmp __alltraps
  10249a:	e9 36 06 00 00       	jmp    102ad5 <__alltraps>

0010249f <vector122>:
.globl vector122
vector122:
  pushl $0
  10249f:	6a 00                	push   $0x0
  pushl $122
  1024a1:	6a 7a                	push   $0x7a
  jmp __alltraps
  1024a3:	e9 2d 06 00 00       	jmp    102ad5 <__alltraps>

001024a8 <vector123>:
.globl vector123
vector123:
  pushl $0
  1024a8:	6a 00                	push   $0x0
  pushl $123
  1024aa:	6a 7b                	push   $0x7b
  jmp __alltraps
  1024ac:	e9 24 06 00 00       	jmp    102ad5 <__alltraps>

001024b1 <vector124>:
.globl vector124
vector124:
  pushl $0
  1024b1:	6a 00                	push   $0x0
  pushl $124
  1024b3:	6a 7c                	push   $0x7c
  jmp __alltraps
  1024b5:	e9 1b 06 00 00       	jmp    102ad5 <__alltraps>

001024ba <vector125>:
.globl vector125
vector125:
  pushl $0
  1024ba:	6a 00                	push   $0x0
  pushl $125
  1024bc:	6a 7d                	push   $0x7d
  jmp __alltraps
  1024be:	e9 12 06 00 00       	jmp    102ad5 <__alltraps>

001024c3 <vector126>:
.globl vector126
vector126:
  pushl $0
  1024c3:	6a 00                	push   $0x0
  pushl $126
  1024c5:	6a 7e                	push   $0x7e
  jmp __alltraps
  1024c7:	e9 09 06 00 00       	jmp    102ad5 <__alltraps>

001024cc <vector127>:
.globl vector127
vector127:
  pushl $0
  1024cc:	6a 00                	push   $0x0
  pushl $127
  1024ce:	6a 7f                	push   $0x7f
  jmp __alltraps
  1024d0:	e9 00 06 00 00       	jmp    102ad5 <__alltraps>

001024d5 <vector128>:
.globl vector128
vector128:
  pushl $0
  1024d5:	6a 00                	push   $0x0
  pushl $128
  1024d7:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  1024dc:	e9 f4 05 00 00       	jmp    102ad5 <__alltraps>

001024e1 <vector129>:
.globl vector129
vector129:
  pushl $0
  1024e1:	6a 00                	push   $0x0
  pushl $129
  1024e3:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  1024e8:	e9 e8 05 00 00       	jmp    102ad5 <__alltraps>

001024ed <vector130>:
.globl vector130
vector130:
  pushl $0
  1024ed:	6a 00                	push   $0x0
  pushl $130
  1024ef:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  1024f4:	e9 dc 05 00 00       	jmp    102ad5 <__alltraps>

001024f9 <vector131>:
.globl vector131
vector131:
  pushl $0
  1024f9:	6a 00                	push   $0x0
  pushl $131
  1024fb:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  102500:	e9 d0 05 00 00       	jmp    102ad5 <__alltraps>

00102505 <vector132>:
.globl vector132
vector132:
  pushl $0
  102505:	6a 00                	push   $0x0
  pushl $132
  102507:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  10250c:	e9 c4 05 00 00       	jmp    102ad5 <__alltraps>

00102511 <vector133>:
.globl vector133
vector133:
  pushl $0
  102511:	6a 00                	push   $0x0
  pushl $133
  102513:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  102518:	e9 b8 05 00 00       	jmp    102ad5 <__alltraps>

0010251d <vector134>:
.globl vector134
vector134:
  pushl $0
  10251d:	6a 00                	push   $0x0
  pushl $134
  10251f:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  102524:	e9 ac 05 00 00       	jmp    102ad5 <__alltraps>

00102529 <vector135>:
.globl vector135
vector135:
  pushl $0
  102529:	6a 00                	push   $0x0
  pushl $135
  10252b:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  102530:	e9 a0 05 00 00       	jmp    102ad5 <__alltraps>

00102535 <vector136>:
.globl vector136
vector136:
  pushl $0
  102535:	6a 00                	push   $0x0
  pushl $136
  102537:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  10253c:	e9 94 05 00 00       	jmp    102ad5 <__alltraps>

00102541 <vector137>:
.globl vector137
vector137:
  pushl $0
  102541:	6a 00                	push   $0x0
  pushl $137
  102543:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  102548:	e9 88 05 00 00       	jmp    102ad5 <__alltraps>

0010254d <vector138>:
.globl vector138
vector138:
  pushl $0
  10254d:	6a 00                	push   $0x0
  pushl $138
  10254f:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  102554:	e9 7c 05 00 00       	jmp    102ad5 <__alltraps>

00102559 <vector139>:
.globl vector139
vector139:
  pushl $0
  102559:	6a 00                	push   $0x0
  pushl $139
  10255b:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  102560:	e9 70 05 00 00       	jmp    102ad5 <__alltraps>

00102565 <vector140>:
.globl vector140
vector140:
  pushl $0
  102565:	6a 00                	push   $0x0
  pushl $140
  102567:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  10256c:	e9 64 05 00 00       	jmp    102ad5 <__alltraps>

00102571 <vector141>:
.globl vector141
vector141:
  pushl $0
  102571:	6a 00                	push   $0x0
  pushl $141
  102573:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  102578:	e9 58 05 00 00       	jmp    102ad5 <__alltraps>

0010257d <vector142>:
.globl vector142
vector142:
  pushl $0
  10257d:	6a 00                	push   $0x0
  pushl $142
  10257f:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  102584:	e9 4c 05 00 00       	jmp    102ad5 <__alltraps>

00102589 <vector143>:
.globl vector143
vector143:
  pushl $0
  102589:	6a 00                	push   $0x0
  pushl $143
  10258b:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  102590:	e9 40 05 00 00       	jmp    102ad5 <__alltraps>

00102595 <vector144>:
.globl vector144
vector144:
  pushl $0
  102595:	6a 00                	push   $0x0
  pushl $144
  102597:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  10259c:	e9 34 05 00 00       	jmp    102ad5 <__alltraps>

001025a1 <vector145>:
.globl vector145
vector145:
  pushl $0
  1025a1:	6a 00                	push   $0x0
  pushl $145
  1025a3:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  1025a8:	e9 28 05 00 00       	jmp    102ad5 <__alltraps>

001025ad <vector146>:
.globl vector146
vector146:
  pushl $0
  1025ad:	6a 00                	push   $0x0
  pushl $146
  1025af:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  1025b4:	e9 1c 05 00 00       	jmp    102ad5 <__alltraps>

001025b9 <vector147>:
.globl vector147
vector147:
  pushl $0
  1025b9:	6a 00                	push   $0x0
  pushl $147
  1025bb:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  1025c0:	e9 10 05 00 00       	jmp    102ad5 <__alltraps>

001025c5 <vector148>:
.globl vector148
vector148:
  pushl $0
  1025c5:	6a 00                	push   $0x0
  pushl $148
  1025c7:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  1025cc:	e9 04 05 00 00       	jmp    102ad5 <__alltraps>

001025d1 <vector149>:
.globl vector149
vector149:
  pushl $0
  1025d1:	6a 00                	push   $0x0
  pushl $149
  1025d3:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  1025d8:	e9 f8 04 00 00       	jmp    102ad5 <__alltraps>

001025dd <vector150>:
.globl vector150
vector150:
  pushl $0
  1025dd:	6a 00                	push   $0x0
  pushl $150
  1025df:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  1025e4:	e9 ec 04 00 00       	jmp    102ad5 <__alltraps>

001025e9 <vector151>:
.globl vector151
vector151:
  pushl $0
  1025e9:	6a 00                	push   $0x0
  pushl $151
  1025eb:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  1025f0:	e9 e0 04 00 00       	jmp    102ad5 <__alltraps>

001025f5 <vector152>:
.globl vector152
vector152:
  pushl $0
  1025f5:	6a 00                	push   $0x0
  pushl $152
  1025f7:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  1025fc:	e9 d4 04 00 00       	jmp    102ad5 <__alltraps>

00102601 <vector153>:
.globl vector153
vector153:
  pushl $0
  102601:	6a 00                	push   $0x0
  pushl $153
  102603:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  102608:	e9 c8 04 00 00       	jmp    102ad5 <__alltraps>

0010260d <vector154>:
.globl vector154
vector154:
  pushl $0
  10260d:	6a 00                	push   $0x0
  pushl $154
  10260f:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  102614:	e9 bc 04 00 00       	jmp    102ad5 <__alltraps>

00102619 <vector155>:
.globl vector155
vector155:
  pushl $0
  102619:	6a 00                	push   $0x0
  pushl $155
  10261b:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  102620:	e9 b0 04 00 00       	jmp    102ad5 <__alltraps>

00102625 <vector156>:
.globl vector156
vector156:
  pushl $0
  102625:	6a 00                	push   $0x0
  pushl $156
  102627:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  10262c:	e9 a4 04 00 00       	jmp    102ad5 <__alltraps>

00102631 <vector157>:
.globl vector157
vector157:
  pushl $0
  102631:	6a 00                	push   $0x0
  pushl $157
  102633:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102638:	e9 98 04 00 00       	jmp    102ad5 <__alltraps>

0010263d <vector158>:
.globl vector158
vector158:
  pushl $0
  10263d:	6a 00                	push   $0x0
  pushl $158
  10263f:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  102644:	e9 8c 04 00 00       	jmp    102ad5 <__alltraps>

00102649 <vector159>:
.globl vector159
vector159:
  pushl $0
  102649:	6a 00                	push   $0x0
  pushl $159
  10264b:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  102650:	e9 80 04 00 00       	jmp    102ad5 <__alltraps>

00102655 <vector160>:
.globl vector160
vector160:
  pushl $0
  102655:	6a 00                	push   $0x0
  pushl $160
  102657:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  10265c:	e9 74 04 00 00       	jmp    102ad5 <__alltraps>

00102661 <vector161>:
.globl vector161
vector161:
  pushl $0
  102661:	6a 00                	push   $0x0
  pushl $161
  102663:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  102668:	e9 68 04 00 00       	jmp    102ad5 <__alltraps>

0010266d <vector162>:
.globl vector162
vector162:
  pushl $0
  10266d:	6a 00                	push   $0x0
  pushl $162
  10266f:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  102674:	e9 5c 04 00 00       	jmp    102ad5 <__alltraps>

00102679 <vector163>:
.globl vector163
vector163:
  pushl $0
  102679:	6a 00                	push   $0x0
  pushl $163
  10267b:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  102680:	e9 50 04 00 00       	jmp    102ad5 <__alltraps>

00102685 <vector164>:
.globl vector164
vector164:
  pushl $0
  102685:	6a 00                	push   $0x0
  pushl $164
  102687:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  10268c:	e9 44 04 00 00       	jmp    102ad5 <__alltraps>

00102691 <vector165>:
.globl vector165
vector165:
  pushl $0
  102691:	6a 00                	push   $0x0
  pushl $165
  102693:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  102698:	e9 38 04 00 00       	jmp    102ad5 <__alltraps>

0010269d <vector166>:
.globl vector166
vector166:
  pushl $0
  10269d:	6a 00                	push   $0x0
  pushl $166
  10269f:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  1026a4:	e9 2c 04 00 00       	jmp    102ad5 <__alltraps>

001026a9 <vector167>:
.globl vector167
vector167:
  pushl $0
  1026a9:	6a 00                	push   $0x0
  pushl $167
  1026ab:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  1026b0:	e9 20 04 00 00       	jmp    102ad5 <__alltraps>

001026b5 <vector168>:
.globl vector168
vector168:
  pushl $0
  1026b5:	6a 00                	push   $0x0
  pushl $168
  1026b7:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  1026bc:	e9 14 04 00 00       	jmp    102ad5 <__alltraps>

001026c1 <vector169>:
.globl vector169
vector169:
  pushl $0
  1026c1:	6a 00                	push   $0x0
  pushl $169
  1026c3:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  1026c8:	e9 08 04 00 00       	jmp    102ad5 <__alltraps>

001026cd <vector170>:
.globl vector170
vector170:
  pushl $0
  1026cd:	6a 00                	push   $0x0
  pushl $170
  1026cf:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  1026d4:	e9 fc 03 00 00       	jmp    102ad5 <__alltraps>

001026d9 <vector171>:
.globl vector171
vector171:
  pushl $0
  1026d9:	6a 00                	push   $0x0
  pushl $171
  1026db:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  1026e0:	e9 f0 03 00 00       	jmp    102ad5 <__alltraps>

001026e5 <vector172>:
.globl vector172
vector172:
  pushl $0
  1026e5:	6a 00                	push   $0x0
  pushl $172
  1026e7:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  1026ec:	e9 e4 03 00 00       	jmp    102ad5 <__alltraps>

001026f1 <vector173>:
.globl vector173
vector173:
  pushl $0
  1026f1:	6a 00                	push   $0x0
  pushl $173
  1026f3:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  1026f8:	e9 d8 03 00 00       	jmp    102ad5 <__alltraps>

001026fd <vector174>:
.globl vector174
vector174:
  pushl $0
  1026fd:	6a 00                	push   $0x0
  pushl $174
  1026ff:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  102704:	e9 cc 03 00 00       	jmp    102ad5 <__alltraps>

00102709 <vector175>:
.globl vector175
vector175:
  pushl $0
  102709:	6a 00                	push   $0x0
  pushl $175
  10270b:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  102710:	e9 c0 03 00 00       	jmp    102ad5 <__alltraps>

00102715 <vector176>:
.globl vector176
vector176:
  pushl $0
  102715:	6a 00                	push   $0x0
  pushl $176
  102717:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  10271c:	e9 b4 03 00 00       	jmp    102ad5 <__alltraps>

00102721 <vector177>:
.globl vector177
vector177:
  pushl $0
  102721:	6a 00                	push   $0x0
  pushl $177
  102723:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  102728:	e9 a8 03 00 00       	jmp    102ad5 <__alltraps>

0010272d <vector178>:
.globl vector178
vector178:
  pushl $0
  10272d:	6a 00                	push   $0x0
  pushl $178
  10272f:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  102734:	e9 9c 03 00 00       	jmp    102ad5 <__alltraps>

00102739 <vector179>:
.globl vector179
vector179:
  pushl $0
  102739:	6a 00                	push   $0x0
  pushl $179
  10273b:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  102740:	e9 90 03 00 00       	jmp    102ad5 <__alltraps>

00102745 <vector180>:
.globl vector180
vector180:
  pushl $0
  102745:	6a 00                	push   $0x0
  pushl $180
  102747:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  10274c:	e9 84 03 00 00       	jmp    102ad5 <__alltraps>

00102751 <vector181>:
.globl vector181
vector181:
  pushl $0
  102751:	6a 00                	push   $0x0
  pushl $181
  102753:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  102758:	e9 78 03 00 00       	jmp    102ad5 <__alltraps>

0010275d <vector182>:
.globl vector182
vector182:
  pushl $0
  10275d:	6a 00                	push   $0x0
  pushl $182
  10275f:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  102764:	e9 6c 03 00 00       	jmp    102ad5 <__alltraps>

00102769 <vector183>:
.globl vector183
vector183:
  pushl $0
  102769:	6a 00                	push   $0x0
  pushl $183
  10276b:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102770:	e9 60 03 00 00       	jmp    102ad5 <__alltraps>

00102775 <vector184>:
.globl vector184
vector184:
  pushl $0
  102775:	6a 00                	push   $0x0
  pushl $184
  102777:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  10277c:	e9 54 03 00 00       	jmp    102ad5 <__alltraps>

00102781 <vector185>:
.globl vector185
vector185:
  pushl $0
  102781:	6a 00                	push   $0x0
  pushl $185
  102783:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  102788:	e9 48 03 00 00       	jmp    102ad5 <__alltraps>

0010278d <vector186>:
.globl vector186
vector186:
  pushl $0
  10278d:	6a 00                	push   $0x0
  pushl $186
  10278f:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  102794:	e9 3c 03 00 00       	jmp    102ad5 <__alltraps>

00102799 <vector187>:
.globl vector187
vector187:
  pushl $0
  102799:	6a 00                	push   $0x0
  pushl $187
  10279b:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  1027a0:	e9 30 03 00 00       	jmp    102ad5 <__alltraps>

001027a5 <vector188>:
.globl vector188
vector188:
  pushl $0
  1027a5:	6a 00                	push   $0x0
  pushl $188
  1027a7:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  1027ac:	e9 24 03 00 00       	jmp    102ad5 <__alltraps>

001027b1 <vector189>:
.globl vector189
vector189:
  pushl $0
  1027b1:	6a 00                	push   $0x0
  pushl $189
  1027b3:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  1027b8:	e9 18 03 00 00       	jmp    102ad5 <__alltraps>

001027bd <vector190>:
.globl vector190
vector190:
  pushl $0
  1027bd:	6a 00                	push   $0x0
  pushl $190
  1027bf:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  1027c4:	e9 0c 03 00 00       	jmp    102ad5 <__alltraps>

001027c9 <vector191>:
.globl vector191
vector191:
  pushl $0
  1027c9:	6a 00                	push   $0x0
  pushl $191
  1027cb:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  1027d0:	e9 00 03 00 00       	jmp    102ad5 <__alltraps>

001027d5 <vector192>:
.globl vector192
vector192:
  pushl $0
  1027d5:	6a 00                	push   $0x0
  pushl $192
  1027d7:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  1027dc:	e9 f4 02 00 00       	jmp    102ad5 <__alltraps>

001027e1 <vector193>:
.globl vector193
vector193:
  pushl $0
  1027e1:	6a 00                	push   $0x0
  pushl $193
  1027e3:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  1027e8:	e9 e8 02 00 00       	jmp    102ad5 <__alltraps>

001027ed <vector194>:
.globl vector194
vector194:
  pushl $0
  1027ed:	6a 00                	push   $0x0
  pushl $194
  1027ef:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  1027f4:	e9 dc 02 00 00       	jmp    102ad5 <__alltraps>

001027f9 <vector195>:
.globl vector195
vector195:
  pushl $0
  1027f9:	6a 00                	push   $0x0
  pushl $195
  1027fb:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  102800:	e9 d0 02 00 00       	jmp    102ad5 <__alltraps>

00102805 <vector196>:
.globl vector196
vector196:
  pushl $0
  102805:	6a 00                	push   $0x0
  pushl $196
  102807:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  10280c:	e9 c4 02 00 00       	jmp    102ad5 <__alltraps>

00102811 <vector197>:
.globl vector197
vector197:
  pushl $0
  102811:	6a 00                	push   $0x0
  pushl $197
  102813:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  102818:	e9 b8 02 00 00       	jmp    102ad5 <__alltraps>

0010281d <vector198>:
.globl vector198
vector198:
  pushl $0
  10281d:	6a 00                	push   $0x0
  pushl $198
  10281f:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  102824:	e9 ac 02 00 00       	jmp    102ad5 <__alltraps>

00102829 <vector199>:
.globl vector199
vector199:
  pushl $0
  102829:	6a 00                	push   $0x0
  pushl $199
  10282b:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  102830:	e9 a0 02 00 00       	jmp    102ad5 <__alltraps>

00102835 <vector200>:
.globl vector200
vector200:
  pushl $0
  102835:	6a 00                	push   $0x0
  pushl $200
  102837:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  10283c:	e9 94 02 00 00       	jmp    102ad5 <__alltraps>

00102841 <vector201>:
.globl vector201
vector201:
  pushl $0
  102841:	6a 00                	push   $0x0
  pushl $201
  102843:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  102848:	e9 88 02 00 00       	jmp    102ad5 <__alltraps>

0010284d <vector202>:
.globl vector202
vector202:
  pushl $0
  10284d:	6a 00                	push   $0x0
  pushl $202
  10284f:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  102854:	e9 7c 02 00 00       	jmp    102ad5 <__alltraps>

00102859 <vector203>:
.globl vector203
vector203:
  pushl $0
  102859:	6a 00                	push   $0x0
  pushl $203
  10285b:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102860:	e9 70 02 00 00       	jmp    102ad5 <__alltraps>

00102865 <vector204>:
.globl vector204
vector204:
  pushl $0
  102865:	6a 00                	push   $0x0
  pushl $204
  102867:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  10286c:	e9 64 02 00 00       	jmp    102ad5 <__alltraps>

00102871 <vector205>:
.globl vector205
vector205:
  pushl $0
  102871:	6a 00                	push   $0x0
  pushl $205
  102873:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  102878:	e9 58 02 00 00       	jmp    102ad5 <__alltraps>

0010287d <vector206>:
.globl vector206
vector206:
  pushl $0
  10287d:	6a 00                	push   $0x0
  pushl $206
  10287f:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  102884:	e9 4c 02 00 00       	jmp    102ad5 <__alltraps>

00102889 <vector207>:
.globl vector207
vector207:
  pushl $0
  102889:	6a 00                	push   $0x0
  pushl $207
  10288b:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  102890:	e9 40 02 00 00       	jmp    102ad5 <__alltraps>

00102895 <vector208>:
.globl vector208
vector208:
  pushl $0
  102895:	6a 00                	push   $0x0
  pushl $208
  102897:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  10289c:	e9 34 02 00 00       	jmp    102ad5 <__alltraps>

001028a1 <vector209>:
.globl vector209
vector209:
  pushl $0
  1028a1:	6a 00                	push   $0x0
  pushl $209
  1028a3:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  1028a8:	e9 28 02 00 00       	jmp    102ad5 <__alltraps>

001028ad <vector210>:
.globl vector210
vector210:
  pushl $0
  1028ad:	6a 00                	push   $0x0
  pushl $210
  1028af:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  1028b4:	e9 1c 02 00 00       	jmp    102ad5 <__alltraps>

001028b9 <vector211>:
.globl vector211
vector211:
  pushl $0
  1028b9:	6a 00                	push   $0x0
  pushl $211
  1028bb:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  1028c0:	e9 10 02 00 00       	jmp    102ad5 <__alltraps>

001028c5 <vector212>:
.globl vector212
vector212:
  pushl $0
  1028c5:	6a 00                	push   $0x0
  pushl $212
  1028c7:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  1028cc:	e9 04 02 00 00       	jmp    102ad5 <__alltraps>

001028d1 <vector213>:
.globl vector213
vector213:
  pushl $0
  1028d1:	6a 00                	push   $0x0
  pushl $213
  1028d3:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  1028d8:	e9 f8 01 00 00       	jmp    102ad5 <__alltraps>

001028dd <vector214>:
.globl vector214
vector214:
  pushl $0
  1028dd:	6a 00                	push   $0x0
  pushl $214
  1028df:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  1028e4:	e9 ec 01 00 00       	jmp    102ad5 <__alltraps>

001028e9 <vector215>:
.globl vector215
vector215:
  pushl $0
  1028e9:	6a 00                	push   $0x0
  pushl $215
  1028eb:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  1028f0:	e9 e0 01 00 00       	jmp    102ad5 <__alltraps>

001028f5 <vector216>:
.globl vector216
vector216:
  pushl $0
  1028f5:	6a 00                	push   $0x0
  pushl $216
  1028f7:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  1028fc:	e9 d4 01 00 00       	jmp    102ad5 <__alltraps>

00102901 <vector217>:
.globl vector217
vector217:
  pushl $0
  102901:	6a 00                	push   $0x0
  pushl $217
  102903:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  102908:	e9 c8 01 00 00       	jmp    102ad5 <__alltraps>

0010290d <vector218>:
.globl vector218
vector218:
  pushl $0
  10290d:	6a 00                	push   $0x0
  pushl $218
  10290f:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  102914:	e9 bc 01 00 00       	jmp    102ad5 <__alltraps>

00102919 <vector219>:
.globl vector219
vector219:
  pushl $0
  102919:	6a 00                	push   $0x0
  pushl $219
  10291b:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  102920:	e9 b0 01 00 00       	jmp    102ad5 <__alltraps>

00102925 <vector220>:
.globl vector220
vector220:
  pushl $0
  102925:	6a 00                	push   $0x0
  pushl $220
  102927:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  10292c:	e9 a4 01 00 00       	jmp    102ad5 <__alltraps>

00102931 <vector221>:
.globl vector221
vector221:
  pushl $0
  102931:	6a 00                	push   $0x0
  pushl $221
  102933:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102938:	e9 98 01 00 00       	jmp    102ad5 <__alltraps>

0010293d <vector222>:
.globl vector222
vector222:
  pushl $0
  10293d:	6a 00                	push   $0x0
  pushl $222
  10293f:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  102944:	e9 8c 01 00 00       	jmp    102ad5 <__alltraps>

00102949 <vector223>:
.globl vector223
vector223:
  pushl $0
  102949:	6a 00                	push   $0x0
  pushl $223
  10294b:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102950:	e9 80 01 00 00       	jmp    102ad5 <__alltraps>

00102955 <vector224>:
.globl vector224
vector224:
  pushl $0
  102955:	6a 00                	push   $0x0
  pushl $224
  102957:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  10295c:	e9 74 01 00 00       	jmp    102ad5 <__alltraps>

00102961 <vector225>:
.globl vector225
vector225:
  pushl $0
  102961:	6a 00                	push   $0x0
  pushl $225
  102963:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  102968:	e9 68 01 00 00       	jmp    102ad5 <__alltraps>

0010296d <vector226>:
.globl vector226
vector226:
  pushl $0
  10296d:	6a 00                	push   $0x0
  pushl $226
  10296f:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  102974:	e9 5c 01 00 00       	jmp    102ad5 <__alltraps>

00102979 <vector227>:
.globl vector227
vector227:
  pushl $0
  102979:	6a 00                	push   $0x0
  pushl $227
  10297b:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102980:	e9 50 01 00 00       	jmp    102ad5 <__alltraps>

00102985 <vector228>:
.globl vector228
vector228:
  pushl $0
  102985:	6a 00                	push   $0x0
  pushl $228
  102987:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  10298c:	e9 44 01 00 00       	jmp    102ad5 <__alltraps>

00102991 <vector229>:
.globl vector229
vector229:
  pushl $0
  102991:	6a 00                	push   $0x0
  pushl $229
  102993:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  102998:	e9 38 01 00 00       	jmp    102ad5 <__alltraps>

0010299d <vector230>:
.globl vector230
vector230:
  pushl $0
  10299d:	6a 00                	push   $0x0
  pushl $230
  10299f:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  1029a4:	e9 2c 01 00 00       	jmp    102ad5 <__alltraps>

001029a9 <vector231>:
.globl vector231
vector231:
  pushl $0
  1029a9:	6a 00                	push   $0x0
  pushl $231
  1029ab:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  1029b0:	e9 20 01 00 00       	jmp    102ad5 <__alltraps>

001029b5 <vector232>:
.globl vector232
vector232:
  pushl $0
  1029b5:	6a 00                	push   $0x0
  pushl $232
  1029b7:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  1029bc:	e9 14 01 00 00       	jmp    102ad5 <__alltraps>

001029c1 <vector233>:
.globl vector233
vector233:
  pushl $0
  1029c1:	6a 00                	push   $0x0
  pushl $233
  1029c3:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  1029c8:	e9 08 01 00 00       	jmp    102ad5 <__alltraps>

001029cd <vector234>:
.globl vector234
vector234:
  pushl $0
  1029cd:	6a 00                	push   $0x0
  pushl $234
  1029cf:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  1029d4:	e9 fc 00 00 00       	jmp    102ad5 <__alltraps>

001029d9 <vector235>:
.globl vector235
vector235:
  pushl $0
  1029d9:	6a 00                	push   $0x0
  pushl $235
  1029db:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  1029e0:	e9 f0 00 00 00       	jmp    102ad5 <__alltraps>

001029e5 <vector236>:
.globl vector236
vector236:
  pushl $0
  1029e5:	6a 00                	push   $0x0
  pushl $236
  1029e7:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  1029ec:	e9 e4 00 00 00       	jmp    102ad5 <__alltraps>

001029f1 <vector237>:
.globl vector237
vector237:
  pushl $0
  1029f1:	6a 00                	push   $0x0
  pushl $237
  1029f3:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  1029f8:	e9 d8 00 00 00       	jmp    102ad5 <__alltraps>

001029fd <vector238>:
.globl vector238
vector238:
  pushl $0
  1029fd:	6a 00                	push   $0x0
  pushl $238
  1029ff:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  102a04:	e9 cc 00 00 00       	jmp    102ad5 <__alltraps>

00102a09 <vector239>:
.globl vector239
vector239:
  pushl $0
  102a09:	6a 00                	push   $0x0
  pushl $239
  102a0b:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  102a10:	e9 c0 00 00 00       	jmp    102ad5 <__alltraps>

00102a15 <vector240>:
.globl vector240
vector240:
  pushl $0
  102a15:	6a 00                	push   $0x0
  pushl $240
  102a17:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  102a1c:	e9 b4 00 00 00       	jmp    102ad5 <__alltraps>

00102a21 <vector241>:
.globl vector241
vector241:
  pushl $0
  102a21:	6a 00                	push   $0x0
  pushl $241
  102a23:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  102a28:	e9 a8 00 00 00       	jmp    102ad5 <__alltraps>

00102a2d <vector242>:
.globl vector242
vector242:
  pushl $0
  102a2d:	6a 00                	push   $0x0
  pushl $242
  102a2f:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  102a34:	e9 9c 00 00 00       	jmp    102ad5 <__alltraps>

00102a39 <vector243>:
.globl vector243
vector243:
  pushl $0
  102a39:	6a 00                	push   $0x0
  pushl $243
  102a3b:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102a40:	e9 90 00 00 00       	jmp    102ad5 <__alltraps>

00102a45 <vector244>:
.globl vector244
vector244:
  pushl $0
  102a45:	6a 00                	push   $0x0
  pushl $244
  102a47:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  102a4c:	e9 84 00 00 00       	jmp    102ad5 <__alltraps>

00102a51 <vector245>:
.globl vector245
vector245:
  pushl $0
  102a51:	6a 00                	push   $0x0
  pushl $245
  102a53:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  102a58:	e9 78 00 00 00       	jmp    102ad5 <__alltraps>

00102a5d <vector246>:
.globl vector246
vector246:
  pushl $0
  102a5d:	6a 00                	push   $0x0
  pushl $246
  102a5f:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  102a64:	e9 6c 00 00 00       	jmp    102ad5 <__alltraps>

00102a69 <vector247>:
.globl vector247
vector247:
  pushl $0
  102a69:	6a 00                	push   $0x0
  pushl $247
  102a6b:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102a70:	e9 60 00 00 00       	jmp    102ad5 <__alltraps>

00102a75 <vector248>:
.globl vector248
vector248:
  pushl $0
  102a75:	6a 00                	push   $0x0
  pushl $248
  102a77:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  102a7c:	e9 54 00 00 00       	jmp    102ad5 <__alltraps>

00102a81 <vector249>:
.globl vector249
vector249:
  pushl $0
  102a81:	6a 00                	push   $0x0
  pushl $249
  102a83:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  102a88:	e9 48 00 00 00       	jmp    102ad5 <__alltraps>

00102a8d <vector250>:
.globl vector250
vector250:
  pushl $0
  102a8d:	6a 00                	push   $0x0
  pushl $250
  102a8f:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  102a94:	e9 3c 00 00 00       	jmp    102ad5 <__alltraps>

00102a99 <vector251>:
.globl vector251
vector251:
  pushl $0
  102a99:	6a 00                	push   $0x0
  pushl $251
  102a9b:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102aa0:	e9 30 00 00 00       	jmp    102ad5 <__alltraps>

00102aa5 <vector252>:
.globl vector252
vector252:
  pushl $0
  102aa5:	6a 00                	push   $0x0
  pushl $252
  102aa7:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102aac:	e9 24 00 00 00       	jmp    102ad5 <__alltraps>

00102ab1 <vector253>:
.globl vector253
vector253:
  pushl $0
  102ab1:	6a 00                	push   $0x0
  pushl $253
  102ab3:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102ab8:	e9 18 00 00 00       	jmp    102ad5 <__alltraps>

00102abd <vector254>:
.globl vector254
vector254:
  pushl $0
  102abd:	6a 00                	push   $0x0
  pushl $254
  102abf:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  102ac4:	e9 0c 00 00 00       	jmp    102ad5 <__alltraps>

00102ac9 <vector255>:
.globl vector255
vector255:
  pushl $0
  102ac9:	6a 00                	push   $0x0
  pushl $255
  102acb:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102ad0:	e9 00 00 00 00       	jmp    102ad5 <__alltraps>

00102ad5 <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  102ad5:	1e                   	push   %ds
    pushl %es
  102ad6:	06                   	push   %es
    pushl %fs
  102ad7:	0f a0                	push   %fs
    pushl %gs
  102ad9:	0f a8                	push   %gs
    pushal
  102adb:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  102adc:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  102ae1:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  102ae3:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  102ae5:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  102ae6:	e8 60 f5 ff ff       	call   10204b <trap>

    # pop the pushed stack pointer
    popl %esp
  102aeb:	5c                   	pop    %esp

00102aec <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  102aec:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  102aed:	0f a9                	pop    %gs
    popl %fs
  102aef:	0f a1                	pop    %fs
    popl %es
  102af1:	07                   	pop    %es
    popl %ds
  102af2:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  102af3:	83 c4 08             	add    $0x8,%esp
    //当从内核态到用户态时，会弹出esp,ss
    iret
  102af6:	cf                   	iret   

00102af7 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  102af7:	55                   	push   %ebp
  102af8:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  102afa:	8b 45 08             	mov    0x8(%ebp),%eax
  102afd:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  102b00:	b8 23 00 00 00       	mov    $0x23,%eax
  102b05:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  102b07:	b8 23 00 00 00       	mov    $0x23,%eax
  102b0c:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  102b0e:	b8 10 00 00 00       	mov    $0x10,%eax
  102b13:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  102b15:	b8 10 00 00 00       	mov    $0x10,%eax
  102b1a:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  102b1c:	b8 10 00 00 00       	mov    $0x10,%eax
  102b21:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  102b23:	ea 2a 2b 10 00 08 00 	ljmp   $0x8,$0x102b2a
}
  102b2a:	90                   	nop
  102b2b:	5d                   	pop    %ebp
  102b2c:	c3                   	ret    

00102b2d <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  102b2d:	f3 0f 1e fb          	endbr32 
  102b31:	55                   	push   %ebp
  102b32:	89 e5                	mov    %esp,%ebp
  102b34:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  102b37:	b8 80 19 11 00       	mov    $0x111980,%eax
  102b3c:	05 00 04 00 00       	add    $0x400,%eax
  102b41:	a3 a4 18 11 00       	mov    %eax,0x1118a4
    ts.ts_ss0 = KERNEL_DS;
  102b46:	66 c7 05 a8 18 11 00 	movw   $0x10,0x1118a8
  102b4d:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102b4f:	66 c7 05 08 0a 11 00 	movw   $0x68,0x110a08
  102b56:	68 00 
  102b58:	b8 a0 18 11 00       	mov    $0x1118a0,%eax
  102b5d:	0f b7 c0             	movzwl %ax,%eax
  102b60:	66 a3 0a 0a 11 00    	mov    %ax,0x110a0a
  102b66:	b8 a0 18 11 00       	mov    $0x1118a0,%eax
  102b6b:	c1 e8 10             	shr    $0x10,%eax
  102b6e:	a2 0c 0a 11 00       	mov    %al,0x110a0c
  102b73:	0f b6 05 0d 0a 11 00 	movzbl 0x110a0d,%eax
  102b7a:	24 f0                	and    $0xf0,%al
  102b7c:	0c 09                	or     $0x9,%al
  102b7e:	a2 0d 0a 11 00       	mov    %al,0x110a0d
  102b83:	0f b6 05 0d 0a 11 00 	movzbl 0x110a0d,%eax
  102b8a:	0c 10                	or     $0x10,%al
  102b8c:	a2 0d 0a 11 00       	mov    %al,0x110a0d
  102b91:	0f b6 05 0d 0a 11 00 	movzbl 0x110a0d,%eax
  102b98:	24 9f                	and    $0x9f,%al
  102b9a:	a2 0d 0a 11 00       	mov    %al,0x110a0d
  102b9f:	0f b6 05 0d 0a 11 00 	movzbl 0x110a0d,%eax
  102ba6:	0c 80                	or     $0x80,%al
  102ba8:	a2 0d 0a 11 00       	mov    %al,0x110a0d
  102bad:	0f b6 05 0e 0a 11 00 	movzbl 0x110a0e,%eax
  102bb4:	24 f0                	and    $0xf0,%al
  102bb6:	a2 0e 0a 11 00       	mov    %al,0x110a0e
  102bbb:	0f b6 05 0e 0a 11 00 	movzbl 0x110a0e,%eax
  102bc2:	24 ef                	and    $0xef,%al
  102bc4:	a2 0e 0a 11 00       	mov    %al,0x110a0e
  102bc9:	0f b6 05 0e 0a 11 00 	movzbl 0x110a0e,%eax
  102bd0:	24 df                	and    $0xdf,%al
  102bd2:	a2 0e 0a 11 00       	mov    %al,0x110a0e
  102bd7:	0f b6 05 0e 0a 11 00 	movzbl 0x110a0e,%eax
  102bde:	0c 40                	or     $0x40,%al
  102be0:	a2 0e 0a 11 00       	mov    %al,0x110a0e
  102be5:	0f b6 05 0e 0a 11 00 	movzbl 0x110a0e,%eax
  102bec:	24 7f                	and    $0x7f,%al
  102bee:	a2 0e 0a 11 00       	mov    %al,0x110a0e
  102bf3:	b8 a0 18 11 00       	mov    $0x1118a0,%eax
  102bf8:	c1 e8 18             	shr    $0x18,%eax
  102bfb:	a2 0f 0a 11 00       	mov    %al,0x110a0f
    gdt[SEG_TSS].sd_s = 0;
  102c00:	0f b6 05 0d 0a 11 00 	movzbl 0x110a0d,%eax
  102c07:	24 ef                	and    $0xef,%al
  102c09:	a2 0d 0a 11 00       	mov    %al,0x110a0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102c0e:	c7 04 24 10 0a 11 00 	movl   $0x110a10,(%esp)
  102c15:	e8 dd fe ff ff       	call   102af7 <lgdt>
  102c1a:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102c20:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102c24:	0f 00 d8             	ltr    %ax
}
  102c27:	90                   	nop

    // load the TSS
    ltr(GD_TSS);
}
  102c28:	90                   	nop
  102c29:	c9                   	leave  
  102c2a:	c3                   	ret    

00102c2b <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102c2b:	f3 0f 1e fb          	endbr32 
  102c2f:	55                   	push   %ebp
  102c30:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102c32:	e8 f6 fe ff ff       	call   102b2d <gdt_init>
}
  102c37:	90                   	nop
  102c38:	5d                   	pop    %ebp
  102c39:	c3                   	ret    

00102c3a <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102c3a:	f3 0f 1e fb          	endbr32 
  102c3e:	55                   	push   %ebp
  102c3f:	89 e5                	mov    %esp,%ebp
  102c41:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102c44:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102c4b:	eb 03                	jmp    102c50 <strlen+0x16>
        cnt ++;
  102c4d:	ff 45 fc             	incl   -0x4(%ebp)
    while (*s ++ != '\0') {
  102c50:	8b 45 08             	mov    0x8(%ebp),%eax
  102c53:	8d 50 01             	lea    0x1(%eax),%edx
  102c56:	89 55 08             	mov    %edx,0x8(%ebp)
  102c59:	0f b6 00             	movzbl (%eax),%eax
  102c5c:	84 c0                	test   %al,%al
  102c5e:	75 ed                	jne    102c4d <strlen+0x13>
    }
    return cnt;
  102c60:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102c63:	c9                   	leave  
  102c64:	c3                   	ret    

00102c65 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102c65:	f3 0f 1e fb          	endbr32 
  102c69:	55                   	push   %ebp
  102c6a:	89 e5                	mov    %esp,%ebp
  102c6c:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102c6f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102c76:	eb 03                	jmp    102c7b <strnlen+0x16>
        cnt ++;
  102c78:	ff 45 fc             	incl   -0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102c7b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102c7e:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102c81:	73 10                	jae    102c93 <strnlen+0x2e>
  102c83:	8b 45 08             	mov    0x8(%ebp),%eax
  102c86:	8d 50 01             	lea    0x1(%eax),%edx
  102c89:	89 55 08             	mov    %edx,0x8(%ebp)
  102c8c:	0f b6 00             	movzbl (%eax),%eax
  102c8f:	84 c0                	test   %al,%al
  102c91:	75 e5                	jne    102c78 <strnlen+0x13>
    }
    return cnt;
  102c93:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102c96:	c9                   	leave  
  102c97:	c3                   	ret    

00102c98 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102c98:	f3 0f 1e fb          	endbr32 
  102c9c:	55                   	push   %ebp
  102c9d:	89 e5                	mov    %esp,%ebp
  102c9f:	57                   	push   %edi
  102ca0:	56                   	push   %esi
  102ca1:	83 ec 20             	sub    $0x20,%esp
  102ca4:	8b 45 08             	mov    0x8(%ebp),%eax
  102ca7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102caa:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cad:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102cb0:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102cb3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102cb6:	89 d1                	mov    %edx,%ecx
  102cb8:	89 c2                	mov    %eax,%edx
  102cba:	89 ce                	mov    %ecx,%esi
  102cbc:	89 d7                	mov    %edx,%edi
  102cbe:	ac                   	lods   %ds:(%esi),%al
  102cbf:	aa                   	stos   %al,%es:(%edi)
  102cc0:	84 c0                	test   %al,%al
  102cc2:	75 fa                	jne    102cbe <strcpy+0x26>
  102cc4:	89 fa                	mov    %edi,%edx
  102cc6:	89 f1                	mov    %esi,%ecx
  102cc8:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102ccb:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102cce:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102cd1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102cd4:	83 c4 20             	add    $0x20,%esp
  102cd7:	5e                   	pop    %esi
  102cd8:	5f                   	pop    %edi
  102cd9:	5d                   	pop    %ebp
  102cda:	c3                   	ret    

00102cdb <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102cdb:	f3 0f 1e fb          	endbr32 
  102cdf:	55                   	push   %ebp
  102ce0:	89 e5                	mov    %esp,%ebp
  102ce2:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102ce5:	8b 45 08             	mov    0x8(%ebp),%eax
  102ce8:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102ceb:	eb 1e                	jmp    102d0b <strncpy+0x30>
        if ((*p = *src) != '\0') {
  102ced:	8b 45 0c             	mov    0xc(%ebp),%eax
  102cf0:	0f b6 10             	movzbl (%eax),%edx
  102cf3:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102cf6:	88 10                	mov    %dl,(%eax)
  102cf8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102cfb:	0f b6 00             	movzbl (%eax),%eax
  102cfe:	84 c0                	test   %al,%al
  102d00:	74 03                	je     102d05 <strncpy+0x2a>
            src ++;
  102d02:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  102d05:	ff 45 fc             	incl   -0x4(%ebp)
  102d08:	ff 4d 10             	decl   0x10(%ebp)
    while (len > 0) {
  102d0b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d0f:	75 dc                	jne    102ced <strncpy+0x12>
    }
    return dst;
  102d11:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102d14:	c9                   	leave  
  102d15:	c3                   	ret    

00102d16 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102d16:	f3 0f 1e fb          	endbr32 
  102d1a:	55                   	push   %ebp
  102d1b:	89 e5                	mov    %esp,%ebp
  102d1d:	57                   	push   %edi
  102d1e:	56                   	push   %esi
  102d1f:	83 ec 20             	sub    $0x20,%esp
  102d22:	8b 45 08             	mov    0x8(%ebp),%eax
  102d25:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d28:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d2b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    asm volatile (
  102d2e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102d31:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102d34:	89 d1                	mov    %edx,%ecx
  102d36:	89 c2                	mov    %eax,%edx
  102d38:	89 ce                	mov    %ecx,%esi
  102d3a:	89 d7                	mov    %edx,%edi
  102d3c:	ac                   	lods   %ds:(%esi),%al
  102d3d:	ae                   	scas   %es:(%edi),%al
  102d3e:	75 08                	jne    102d48 <strcmp+0x32>
  102d40:	84 c0                	test   %al,%al
  102d42:	75 f8                	jne    102d3c <strcmp+0x26>
  102d44:	31 c0                	xor    %eax,%eax
  102d46:	eb 04                	jmp    102d4c <strcmp+0x36>
  102d48:	19 c0                	sbb    %eax,%eax
  102d4a:	0c 01                	or     $0x1,%al
  102d4c:	89 fa                	mov    %edi,%edx
  102d4e:	89 f1                	mov    %esi,%ecx
  102d50:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102d53:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102d56:	89 55 e4             	mov    %edx,-0x1c(%ebp)
    return ret;
  102d59:	8b 45 ec             	mov    -0x14(%ebp),%eax
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102d5c:	83 c4 20             	add    $0x20,%esp
  102d5f:	5e                   	pop    %esi
  102d60:	5f                   	pop    %edi
  102d61:	5d                   	pop    %ebp
  102d62:	c3                   	ret    

00102d63 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102d63:	f3 0f 1e fb          	endbr32 
  102d67:	55                   	push   %ebp
  102d68:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102d6a:	eb 09                	jmp    102d75 <strncmp+0x12>
        n --, s1 ++, s2 ++;
  102d6c:	ff 4d 10             	decl   0x10(%ebp)
  102d6f:	ff 45 08             	incl   0x8(%ebp)
  102d72:	ff 45 0c             	incl   0xc(%ebp)
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102d75:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d79:	74 1a                	je     102d95 <strncmp+0x32>
  102d7b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d7e:	0f b6 00             	movzbl (%eax),%eax
  102d81:	84 c0                	test   %al,%al
  102d83:	74 10                	je     102d95 <strncmp+0x32>
  102d85:	8b 45 08             	mov    0x8(%ebp),%eax
  102d88:	0f b6 10             	movzbl (%eax),%edx
  102d8b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102d8e:	0f b6 00             	movzbl (%eax),%eax
  102d91:	38 c2                	cmp    %al,%dl
  102d93:	74 d7                	je     102d6c <strncmp+0x9>
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102d95:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d99:	74 18                	je     102db3 <strncmp+0x50>
  102d9b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d9e:	0f b6 00             	movzbl (%eax),%eax
  102da1:	0f b6 d0             	movzbl %al,%edx
  102da4:	8b 45 0c             	mov    0xc(%ebp),%eax
  102da7:	0f b6 00             	movzbl (%eax),%eax
  102daa:	0f b6 c0             	movzbl %al,%eax
  102dad:	29 c2                	sub    %eax,%edx
  102daf:	89 d0                	mov    %edx,%eax
  102db1:	eb 05                	jmp    102db8 <strncmp+0x55>
  102db3:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102db8:	5d                   	pop    %ebp
  102db9:	c3                   	ret    

00102dba <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102dba:	f3 0f 1e fb          	endbr32 
  102dbe:	55                   	push   %ebp
  102dbf:	89 e5                	mov    %esp,%ebp
  102dc1:	83 ec 04             	sub    $0x4,%esp
  102dc4:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dc7:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102dca:	eb 13                	jmp    102ddf <strchr+0x25>
        if (*s == c) {
  102dcc:	8b 45 08             	mov    0x8(%ebp),%eax
  102dcf:	0f b6 00             	movzbl (%eax),%eax
  102dd2:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102dd5:	75 05                	jne    102ddc <strchr+0x22>
            return (char *)s;
  102dd7:	8b 45 08             	mov    0x8(%ebp),%eax
  102dda:	eb 12                	jmp    102dee <strchr+0x34>
        }
        s ++;
  102ddc:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102ddf:	8b 45 08             	mov    0x8(%ebp),%eax
  102de2:	0f b6 00             	movzbl (%eax),%eax
  102de5:	84 c0                	test   %al,%al
  102de7:	75 e3                	jne    102dcc <strchr+0x12>
    }
    return NULL;
  102de9:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102dee:	c9                   	leave  
  102def:	c3                   	ret    

00102df0 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102df0:	f3 0f 1e fb          	endbr32 
  102df4:	55                   	push   %ebp
  102df5:	89 e5                	mov    %esp,%ebp
  102df7:	83 ec 04             	sub    $0x4,%esp
  102dfa:	8b 45 0c             	mov    0xc(%ebp),%eax
  102dfd:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102e00:	eb 0e                	jmp    102e10 <strfind+0x20>
        if (*s == c) {
  102e02:	8b 45 08             	mov    0x8(%ebp),%eax
  102e05:	0f b6 00             	movzbl (%eax),%eax
  102e08:	38 45 fc             	cmp    %al,-0x4(%ebp)
  102e0b:	74 0f                	je     102e1c <strfind+0x2c>
            break;
        }
        s ++;
  102e0d:	ff 45 08             	incl   0x8(%ebp)
    while (*s != '\0') {
  102e10:	8b 45 08             	mov    0x8(%ebp),%eax
  102e13:	0f b6 00             	movzbl (%eax),%eax
  102e16:	84 c0                	test   %al,%al
  102e18:	75 e8                	jne    102e02 <strfind+0x12>
  102e1a:	eb 01                	jmp    102e1d <strfind+0x2d>
            break;
  102e1c:	90                   	nop
    }
    return (char *)s;
  102e1d:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102e20:	c9                   	leave  
  102e21:	c3                   	ret    

00102e22 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102e22:	f3 0f 1e fb          	endbr32 
  102e26:	55                   	push   %ebp
  102e27:	89 e5                	mov    %esp,%ebp
  102e29:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102e2c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102e33:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102e3a:	eb 03                	jmp    102e3f <strtol+0x1d>
        s ++;
  102e3c:	ff 45 08             	incl   0x8(%ebp)
    while (*s == ' ' || *s == '\t') {
  102e3f:	8b 45 08             	mov    0x8(%ebp),%eax
  102e42:	0f b6 00             	movzbl (%eax),%eax
  102e45:	3c 20                	cmp    $0x20,%al
  102e47:	74 f3                	je     102e3c <strtol+0x1a>
  102e49:	8b 45 08             	mov    0x8(%ebp),%eax
  102e4c:	0f b6 00             	movzbl (%eax),%eax
  102e4f:	3c 09                	cmp    $0x9,%al
  102e51:	74 e9                	je     102e3c <strtol+0x1a>
    }

    // plus/minus sign
    if (*s == '+') {
  102e53:	8b 45 08             	mov    0x8(%ebp),%eax
  102e56:	0f b6 00             	movzbl (%eax),%eax
  102e59:	3c 2b                	cmp    $0x2b,%al
  102e5b:	75 05                	jne    102e62 <strtol+0x40>
        s ++;
  102e5d:	ff 45 08             	incl   0x8(%ebp)
  102e60:	eb 14                	jmp    102e76 <strtol+0x54>
    }
    else if (*s == '-') {
  102e62:	8b 45 08             	mov    0x8(%ebp),%eax
  102e65:	0f b6 00             	movzbl (%eax),%eax
  102e68:	3c 2d                	cmp    $0x2d,%al
  102e6a:	75 0a                	jne    102e76 <strtol+0x54>
        s ++, neg = 1;
  102e6c:	ff 45 08             	incl   0x8(%ebp)
  102e6f:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102e76:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102e7a:	74 06                	je     102e82 <strtol+0x60>
  102e7c:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102e80:	75 22                	jne    102ea4 <strtol+0x82>
  102e82:	8b 45 08             	mov    0x8(%ebp),%eax
  102e85:	0f b6 00             	movzbl (%eax),%eax
  102e88:	3c 30                	cmp    $0x30,%al
  102e8a:	75 18                	jne    102ea4 <strtol+0x82>
  102e8c:	8b 45 08             	mov    0x8(%ebp),%eax
  102e8f:	40                   	inc    %eax
  102e90:	0f b6 00             	movzbl (%eax),%eax
  102e93:	3c 78                	cmp    $0x78,%al
  102e95:	75 0d                	jne    102ea4 <strtol+0x82>
        s += 2, base = 16;
  102e97:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102e9b:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102ea2:	eb 29                	jmp    102ecd <strtol+0xab>
    }
    else if (base == 0 && s[0] == '0') {
  102ea4:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102ea8:	75 16                	jne    102ec0 <strtol+0x9e>
  102eaa:	8b 45 08             	mov    0x8(%ebp),%eax
  102ead:	0f b6 00             	movzbl (%eax),%eax
  102eb0:	3c 30                	cmp    $0x30,%al
  102eb2:	75 0c                	jne    102ec0 <strtol+0x9e>
        s ++, base = 8;
  102eb4:	ff 45 08             	incl   0x8(%ebp)
  102eb7:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102ebe:	eb 0d                	jmp    102ecd <strtol+0xab>
    }
    else if (base == 0) {
  102ec0:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102ec4:	75 07                	jne    102ecd <strtol+0xab>
        base = 10;
  102ec6:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102ecd:	8b 45 08             	mov    0x8(%ebp),%eax
  102ed0:	0f b6 00             	movzbl (%eax),%eax
  102ed3:	3c 2f                	cmp    $0x2f,%al
  102ed5:	7e 1b                	jle    102ef2 <strtol+0xd0>
  102ed7:	8b 45 08             	mov    0x8(%ebp),%eax
  102eda:	0f b6 00             	movzbl (%eax),%eax
  102edd:	3c 39                	cmp    $0x39,%al
  102edf:	7f 11                	jg     102ef2 <strtol+0xd0>
            dig = *s - '0';
  102ee1:	8b 45 08             	mov    0x8(%ebp),%eax
  102ee4:	0f b6 00             	movzbl (%eax),%eax
  102ee7:	0f be c0             	movsbl %al,%eax
  102eea:	83 e8 30             	sub    $0x30,%eax
  102eed:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102ef0:	eb 48                	jmp    102f3a <strtol+0x118>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102ef2:	8b 45 08             	mov    0x8(%ebp),%eax
  102ef5:	0f b6 00             	movzbl (%eax),%eax
  102ef8:	3c 60                	cmp    $0x60,%al
  102efa:	7e 1b                	jle    102f17 <strtol+0xf5>
  102efc:	8b 45 08             	mov    0x8(%ebp),%eax
  102eff:	0f b6 00             	movzbl (%eax),%eax
  102f02:	3c 7a                	cmp    $0x7a,%al
  102f04:	7f 11                	jg     102f17 <strtol+0xf5>
            dig = *s - 'a' + 10;
  102f06:	8b 45 08             	mov    0x8(%ebp),%eax
  102f09:	0f b6 00             	movzbl (%eax),%eax
  102f0c:	0f be c0             	movsbl %al,%eax
  102f0f:	83 e8 57             	sub    $0x57,%eax
  102f12:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102f15:	eb 23                	jmp    102f3a <strtol+0x118>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102f17:	8b 45 08             	mov    0x8(%ebp),%eax
  102f1a:	0f b6 00             	movzbl (%eax),%eax
  102f1d:	3c 40                	cmp    $0x40,%al
  102f1f:	7e 3b                	jle    102f5c <strtol+0x13a>
  102f21:	8b 45 08             	mov    0x8(%ebp),%eax
  102f24:	0f b6 00             	movzbl (%eax),%eax
  102f27:	3c 5a                	cmp    $0x5a,%al
  102f29:	7f 31                	jg     102f5c <strtol+0x13a>
            dig = *s - 'A' + 10;
  102f2b:	8b 45 08             	mov    0x8(%ebp),%eax
  102f2e:	0f b6 00             	movzbl (%eax),%eax
  102f31:	0f be c0             	movsbl %al,%eax
  102f34:	83 e8 37             	sub    $0x37,%eax
  102f37:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102f3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102f3d:	3b 45 10             	cmp    0x10(%ebp),%eax
  102f40:	7d 19                	jge    102f5b <strtol+0x139>
            break;
        }
        s ++, val = (val * base) + dig;
  102f42:	ff 45 08             	incl   0x8(%ebp)
  102f45:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f48:	0f af 45 10          	imul   0x10(%ebp),%eax
  102f4c:	89 c2                	mov    %eax,%edx
  102f4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102f51:	01 d0                	add    %edx,%eax
  102f53:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (1) {
  102f56:	e9 72 ff ff ff       	jmp    102ecd <strtol+0xab>
            break;
  102f5b:	90                   	nop
        // we don't properly detect overflow!
    }

    if (endptr) {
  102f5c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102f60:	74 08                	je     102f6a <strtol+0x148>
        *endptr = (char *) s;
  102f62:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f65:	8b 55 08             	mov    0x8(%ebp),%edx
  102f68:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102f6a:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102f6e:	74 07                	je     102f77 <strtol+0x155>
  102f70:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f73:	f7 d8                	neg    %eax
  102f75:	eb 03                	jmp    102f7a <strtol+0x158>
  102f77:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102f7a:	c9                   	leave  
  102f7b:	c3                   	ret    

00102f7c <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102f7c:	f3 0f 1e fb          	endbr32 
  102f80:	55                   	push   %ebp
  102f81:	89 e5                	mov    %esp,%ebp
  102f83:	57                   	push   %edi
  102f84:	83 ec 24             	sub    $0x24,%esp
  102f87:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f8a:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102f8d:	0f be 55 d8          	movsbl -0x28(%ebp),%edx
  102f91:	8b 45 08             	mov    0x8(%ebp),%eax
  102f94:	89 45 f8             	mov    %eax,-0x8(%ebp)
  102f97:	88 55 f7             	mov    %dl,-0x9(%ebp)
  102f9a:	8b 45 10             	mov    0x10(%ebp),%eax
  102f9d:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102fa0:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102fa3:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102fa7:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102faa:	89 d7                	mov    %edx,%edi
  102fac:	f3 aa                	rep stos %al,%es:(%edi)
  102fae:	89 fa                	mov    %edi,%edx
  102fb0:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102fb3:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102fb6:	8b 45 f8             	mov    -0x8(%ebp),%eax
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102fb9:	83 c4 24             	add    $0x24,%esp
  102fbc:	5f                   	pop    %edi
  102fbd:	5d                   	pop    %ebp
  102fbe:	c3                   	ret    

00102fbf <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102fbf:	f3 0f 1e fb          	endbr32 
  102fc3:	55                   	push   %ebp
  102fc4:	89 e5                	mov    %esp,%ebp
  102fc6:	57                   	push   %edi
  102fc7:	56                   	push   %esi
  102fc8:	53                   	push   %ebx
  102fc9:	83 ec 30             	sub    $0x30,%esp
  102fcc:	8b 45 08             	mov    0x8(%ebp),%eax
  102fcf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102fd2:	8b 45 0c             	mov    0xc(%ebp),%eax
  102fd5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102fd8:	8b 45 10             	mov    0x10(%ebp),%eax
  102fdb:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102fde:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fe1:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102fe4:	73 42                	jae    103028 <memmove+0x69>
  102fe6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fe9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102fec:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102fef:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102ff2:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102ff5:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102ff8:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102ffb:	c1 e8 02             	shr    $0x2,%eax
  102ffe:	89 c1                	mov    %eax,%ecx
    asm volatile (
  103000:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  103003:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103006:	89 d7                	mov    %edx,%edi
  103008:	89 c6                	mov    %eax,%esi
  10300a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  10300c:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  10300f:	83 e1 03             	and    $0x3,%ecx
  103012:	74 02                	je     103016 <memmove+0x57>
  103014:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  103016:	89 f0                	mov    %esi,%eax
  103018:	89 fa                	mov    %edi,%edx
  10301a:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  10301d:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  103020:	89 45 d0             	mov    %eax,-0x30(%ebp)
            : "memory");
    return dst;
  103023:	8b 45 e4             	mov    -0x1c(%ebp),%eax
        return __memcpy(dst, src, n);
  103026:	eb 36                	jmp    10305e <memmove+0x9f>
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  103028:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10302b:	8d 50 ff             	lea    -0x1(%eax),%edx
  10302e:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103031:	01 c2                	add    %eax,%edx
  103033:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103036:	8d 48 ff             	lea    -0x1(%eax),%ecx
  103039:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10303c:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
    asm volatile (
  10303f:	8b 45 e8             	mov    -0x18(%ebp),%eax
  103042:	89 c1                	mov    %eax,%ecx
  103044:	89 d8                	mov    %ebx,%eax
  103046:	89 d6                	mov    %edx,%esi
  103048:	89 c7                	mov    %eax,%edi
  10304a:	fd                   	std    
  10304b:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  10304d:	fc                   	cld    
  10304e:	89 f8                	mov    %edi,%eax
  103050:	89 f2                	mov    %esi,%edx
  103052:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  103055:	89 55 c8             	mov    %edx,-0x38(%ebp)
  103058:	89 45 c4             	mov    %eax,-0x3c(%ebp)
    return dst;
  10305b:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  10305e:	83 c4 30             	add    $0x30,%esp
  103061:	5b                   	pop    %ebx
  103062:	5e                   	pop    %esi
  103063:	5f                   	pop    %edi
  103064:	5d                   	pop    %ebp
  103065:	c3                   	ret    

00103066 <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  103066:	f3 0f 1e fb          	endbr32 
  10306a:	55                   	push   %ebp
  10306b:	89 e5                	mov    %esp,%ebp
  10306d:	57                   	push   %edi
  10306e:	56                   	push   %esi
  10306f:	83 ec 20             	sub    $0x20,%esp
  103072:	8b 45 08             	mov    0x8(%ebp),%eax
  103075:	89 45 f4             	mov    %eax,-0xc(%ebp)
  103078:	8b 45 0c             	mov    0xc(%ebp),%eax
  10307b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10307e:	8b 45 10             	mov    0x10(%ebp),%eax
  103081:	89 45 ec             	mov    %eax,-0x14(%ebp)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  103084:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103087:	c1 e8 02             	shr    $0x2,%eax
  10308a:	89 c1                	mov    %eax,%ecx
    asm volatile (
  10308c:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10308f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103092:	89 d7                	mov    %edx,%edi
  103094:	89 c6                	mov    %eax,%esi
  103096:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  103098:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  10309b:	83 e1 03             	and    $0x3,%ecx
  10309e:	74 02                	je     1030a2 <memcpy+0x3c>
  1030a0:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  1030a2:	89 f0                	mov    %esi,%eax
  1030a4:	89 fa                	mov    %edi,%edx
  1030a6:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  1030a9:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  1030ac:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return dst;
  1030af:	8b 45 f4             	mov    -0xc(%ebp),%eax
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  1030b2:	83 c4 20             	add    $0x20,%esp
  1030b5:	5e                   	pop    %esi
  1030b6:	5f                   	pop    %edi
  1030b7:	5d                   	pop    %ebp
  1030b8:	c3                   	ret    

001030b9 <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  1030b9:	f3 0f 1e fb          	endbr32 
  1030bd:	55                   	push   %ebp
  1030be:	89 e5                	mov    %esp,%ebp
  1030c0:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  1030c3:	8b 45 08             	mov    0x8(%ebp),%eax
  1030c6:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  1030c9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1030cc:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  1030cf:	eb 2e                	jmp    1030ff <memcmp+0x46>
        if (*s1 != *s2) {
  1030d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1030d4:	0f b6 10             	movzbl (%eax),%edx
  1030d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1030da:	0f b6 00             	movzbl (%eax),%eax
  1030dd:	38 c2                	cmp    %al,%dl
  1030df:	74 18                	je     1030f9 <memcmp+0x40>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  1030e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1030e4:	0f b6 00             	movzbl (%eax),%eax
  1030e7:	0f b6 d0             	movzbl %al,%edx
  1030ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1030ed:	0f b6 00             	movzbl (%eax),%eax
  1030f0:	0f b6 c0             	movzbl %al,%eax
  1030f3:	29 c2                	sub    %eax,%edx
  1030f5:	89 d0                	mov    %edx,%eax
  1030f7:	eb 18                	jmp    103111 <memcmp+0x58>
        }
        s1 ++, s2 ++;
  1030f9:	ff 45 fc             	incl   -0x4(%ebp)
  1030fc:	ff 45 f8             	incl   -0x8(%ebp)
    while (n -- > 0) {
  1030ff:	8b 45 10             	mov    0x10(%ebp),%eax
  103102:	8d 50 ff             	lea    -0x1(%eax),%edx
  103105:	89 55 10             	mov    %edx,0x10(%ebp)
  103108:	85 c0                	test   %eax,%eax
  10310a:	75 c5                	jne    1030d1 <memcmp+0x18>
    }
    return 0;
  10310c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  103111:	c9                   	leave  
  103112:	c3                   	ret    

00103113 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  103113:	f3 0f 1e fb          	endbr32 
  103117:	55                   	push   %ebp
  103118:	89 e5                	mov    %esp,%ebp
  10311a:	83 ec 58             	sub    $0x58,%esp
  10311d:	8b 45 10             	mov    0x10(%ebp),%eax
  103120:	89 45 d0             	mov    %eax,-0x30(%ebp)
  103123:	8b 45 14             	mov    0x14(%ebp),%eax
  103126:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  103129:	8b 45 d0             	mov    -0x30(%ebp),%eax
  10312c:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10312f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103132:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  103135:	8b 45 18             	mov    0x18(%ebp),%eax
  103138:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  10313b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10313e:	8b 55 ec             	mov    -0x14(%ebp),%edx
  103141:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103144:	89 55 f0             	mov    %edx,-0x10(%ebp)
  103147:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10314a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  10314d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  103151:	74 1c                	je     10316f <printnum+0x5c>
  103153:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103156:	ba 00 00 00 00       	mov    $0x0,%edx
  10315b:	f7 75 e4             	divl   -0x1c(%ebp)
  10315e:	89 55 f4             	mov    %edx,-0xc(%ebp)
  103161:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103164:	ba 00 00 00 00       	mov    $0x0,%edx
  103169:	f7 75 e4             	divl   -0x1c(%ebp)
  10316c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10316f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103172:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103175:	f7 75 e4             	divl   -0x1c(%ebp)
  103178:	89 45 e0             	mov    %eax,-0x20(%ebp)
  10317b:	89 55 dc             	mov    %edx,-0x24(%ebp)
  10317e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103181:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103184:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103187:	89 55 ec             	mov    %edx,-0x14(%ebp)
  10318a:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10318d:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  103190:	8b 45 18             	mov    0x18(%ebp),%eax
  103193:	ba 00 00 00 00       	mov    $0x0,%edx
  103198:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
  10319b:	39 45 d0             	cmp    %eax,-0x30(%ebp)
  10319e:	19 d1                	sbb    %edx,%ecx
  1031a0:	72 4c                	jb     1031ee <printnum+0xdb>
        printnum(putch, putdat, result, base, width - 1, padc);
  1031a2:	8b 45 1c             	mov    0x1c(%ebp),%eax
  1031a5:	8d 50 ff             	lea    -0x1(%eax),%edx
  1031a8:	8b 45 20             	mov    0x20(%ebp),%eax
  1031ab:	89 44 24 18          	mov    %eax,0x18(%esp)
  1031af:	89 54 24 14          	mov    %edx,0x14(%esp)
  1031b3:	8b 45 18             	mov    0x18(%ebp),%eax
  1031b6:	89 44 24 10          	mov    %eax,0x10(%esp)
  1031ba:	8b 45 e8             	mov    -0x18(%ebp),%eax
  1031bd:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1031c0:	89 44 24 08          	mov    %eax,0x8(%esp)
  1031c4:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1031c8:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031cb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1031cf:	8b 45 08             	mov    0x8(%ebp),%eax
  1031d2:	89 04 24             	mov    %eax,(%esp)
  1031d5:	e8 39 ff ff ff       	call   103113 <printnum>
  1031da:	eb 1b                	jmp    1031f7 <printnum+0xe4>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  1031dc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1031df:	89 44 24 04          	mov    %eax,0x4(%esp)
  1031e3:	8b 45 20             	mov    0x20(%ebp),%eax
  1031e6:	89 04 24             	mov    %eax,(%esp)
  1031e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1031ec:	ff d0                	call   *%eax
        while (-- width > 0)
  1031ee:	ff 4d 1c             	decl   0x1c(%ebp)
  1031f1:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  1031f5:	7f e5                	jg     1031dc <printnum+0xc9>
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  1031f7:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1031fa:	05 70 3f 10 00       	add    $0x103f70,%eax
  1031ff:	0f b6 00             	movzbl (%eax),%eax
  103202:	0f be c0             	movsbl %al,%eax
  103205:	8b 55 0c             	mov    0xc(%ebp),%edx
  103208:	89 54 24 04          	mov    %edx,0x4(%esp)
  10320c:	89 04 24             	mov    %eax,(%esp)
  10320f:	8b 45 08             	mov    0x8(%ebp),%eax
  103212:	ff d0                	call   *%eax
}
  103214:	90                   	nop
  103215:	c9                   	leave  
  103216:	c3                   	ret    

00103217 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  103217:	f3 0f 1e fb          	endbr32 
  10321b:	55                   	push   %ebp
  10321c:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  10321e:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  103222:	7e 14                	jle    103238 <getuint+0x21>
        return va_arg(*ap, unsigned long long);
  103224:	8b 45 08             	mov    0x8(%ebp),%eax
  103227:	8b 00                	mov    (%eax),%eax
  103229:	8d 48 08             	lea    0x8(%eax),%ecx
  10322c:	8b 55 08             	mov    0x8(%ebp),%edx
  10322f:	89 0a                	mov    %ecx,(%edx)
  103231:	8b 50 04             	mov    0x4(%eax),%edx
  103234:	8b 00                	mov    (%eax),%eax
  103236:	eb 30                	jmp    103268 <getuint+0x51>
    }
    else if (lflag) {
  103238:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10323c:	74 16                	je     103254 <getuint+0x3d>
        return va_arg(*ap, unsigned long);
  10323e:	8b 45 08             	mov    0x8(%ebp),%eax
  103241:	8b 00                	mov    (%eax),%eax
  103243:	8d 48 04             	lea    0x4(%eax),%ecx
  103246:	8b 55 08             	mov    0x8(%ebp),%edx
  103249:	89 0a                	mov    %ecx,(%edx)
  10324b:	8b 00                	mov    (%eax),%eax
  10324d:	ba 00 00 00 00       	mov    $0x0,%edx
  103252:	eb 14                	jmp    103268 <getuint+0x51>
    }
    else {
        return va_arg(*ap, unsigned int);
  103254:	8b 45 08             	mov    0x8(%ebp),%eax
  103257:	8b 00                	mov    (%eax),%eax
  103259:	8d 48 04             	lea    0x4(%eax),%ecx
  10325c:	8b 55 08             	mov    0x8(%ebp),%edx
  10325f:	89 0a                	mov    %ecx,(%edx)
  103261:	8b 00                	mov    (%eax),%eax
  103263:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  103268:	5d                   	pop    %ebp
  103269:	c3                   	ret    

0010326a <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  10326a:	f3 0f 1e fb          	endbr32 
  10326e:	55                   	push   %ebp
  10326f:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  103271:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  103275:	7e 14                	jle    10328b <getint+0x21>
        return va_arg(*ap, long long);
  103277:	8b 45 08             	mov    0x8(%ebp),%eax
  10327a:	8b 00                	mov    (%eax),%eax
  10327c:	8d 48 08             	lea    0x8(%eax),%ecx
  10327f:	8b 55 08             	mov    0x8(%ebp),%edx
  103282:	89 0a                	mov    %ecx,(%edx)
  103284:	8b 50 04             	mov    0x4(%eax),%edx
  103287:	8b 00                	mov    (%eax),%eax
  103289:	eb 28                	jmp    1032b3 <getint+0x49>
    }
    else if (lflag) {
  10328b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  10328f:	74 12                	je     1032a3 <getint+0x39>
        return va_arg(*ap, long);
  103291:	8b 45 08             	mov    0x8(%ebp),%eax
  103294:	8b 00                	mov    (%eax),%eax
  103296:	8d 48 04             	lea    0x4(%eax),%ecx
  103299:	8b 55 08             	mov    0x8(%ebp),%edx
  10329c:	89 0a                	mov    %ecx,(%edx)
  10329e:	8b 00                	mov    (%eax),%eax
  1032a0:	99                   	cltd   
  1032a1:	eb 10                	jmp    1032b3 <getint+0x49>
    }
    else {
        return va_arg(*ap, int);
  1032a3:	8b 45 08             	mov    0x8(%ebp),%eax
  1032a6:	8b 00                	mov    (%eax),%eax
  1032a8:	8d 48 04             	lea    0x4(%eax),%ecx
  1032ab:	8b 55 08             	mov    0x8(%ebp),%edx
  1032ae:	89 0a                	mov    %ecx,(%edx)
  1032b0:	8b 00                	mov    (%eax),%eax
  1032b2:	99                   	cltd   
    }
}
  1032b3:	5d                   	pop    %ebp
  1032b4:	c3                   	ret    

001032b5 <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  1032b5:	f3 0f 1e fb          	endbr32 
  1032b9:	55                   	push   %ebp
  1032ba:	89 e5                	mov    %esp,%ebp
  1032bc:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  1032bf:	8d 45 14             	lea    0x14(%ebp),%eax
  1032c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  1032c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1032c8:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1032cc:	8b 45 10             	mov    0x10(%ebp),%eax
  1032cf:	89 44 24 08          	mov    %eax,0x8(%esp)
  1032d3:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032d6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032da:	8b 45 08             	mov    0x8(%ebp),%eax
  1032dd:	89 04 24             	mov    %eax,(%esp)
  1032e0:	e8 03 00 00 00       	call   1032e8 <vprintfmt>
    va_end(ap);
}
  1032e5:	90                   	nop
  1032e6:	c9                   	leave  
  1032e7:	c3                   	ret    

001032e8 <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  1032e8:	f3 0f 1e fb          	endbr32 
  1032ec:	55                   	push   %ebp
  1032ed:	89 e5                	mov    %esp,%ebp
  1032ef:	56                   	push   %esi
  1032f0:	53                   	push   %ebx
  1032f1:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  1032f4:	eb 17                	jmp    10330d <vprintfmt+0x25>
            if (ch == '\0') {
  1032f6:	85 db                	test   %ebx,%ebx
  1032f8:	0f 84 c0 03 00 00    	je     1036be <vprintfmt+0x3d6>
                return;
            }
            putch(ch, putdat);
  1032fe:	8b 45 0c             	mov    0xc(%ebp),%eax
  103301:	89 44 24 04          	mov    %eax,0x4(%esp)
  103305:	89 1c 24             	mov    %ebx,(%esp)
  103308:	8b 45 08             	mov    0x8(%ebp),%eax
  10330b:	ff d0                	call   *%eax
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  10330d:	8b 45 10             	mov    0x10(%ebp),%eax
  103310:	8d 50 01             	lea    0x1(%eax),%edx
  103313:	89 55 10             	mov    %edx,0x10(%ebp)
  103316:	0f b6 00             	movzbl (%eax),%eax
  103319:	0f b6 d8             	movzbl %al,%ebx
  10331c:	83 fb 25             	cmp    $0x25,%ebx
  10331f:	75 d5                	jne    1032f6 <vprintfmt+0xe>
        }

        // Process a %-escape sequence
        char padc = ' ';
  103321:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  103325:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  10332c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10332f:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  103332:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  103339:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10333c:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  10333f:	8b 45 10             	mov    0x10(%ebp),%eax
  103342:	8d 50 01             	lea    0x1(%eax),%edx
  103345:	89 55 10             	mov    %edx,0x10(%ebp)
  103348:	0f b6 00             	movzbl (%eax),%eax
  10334b:	0f b6 d8             	movzbl %al,%ebx
  10334e:	8d 43 dd             	lea    -0x23(%ebx),%eax
  103351:	83 f8 55             	cmp    $0x55,%eax
  103354:	0f 87 38 03 00 00    	ja     103692 <vprintfmt+0x3aa>
  10335a:	8b 04 85 94 3f 10 00 	mov    0x103f94(,%eax,4),%eax
  103361:	3e ff e0             	notrack jmp *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  103364:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  103368:	eb d5                	jmp    10333f <vprintfmt+0x57>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  10336a:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  10336e:	eb cf                	jmp    10333f <vprintfmt+0x57>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  103370:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  103377:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  10337a:	89 d0                	mov    %edx,%eax
  10337c:	c1 e0 02             	shl    $0x2,%eax
  10337f:	01 d0                	add    %edx,%eax
  103381:	01 c0                	add    %eax,%eax
  103383:	01 d8                	add    %ebx,%eax
  103385:	83 e8 30             	sub    $0x30,%eax
  103388:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  10338b:	8b 45 10             	mov    0x10(%ebp),%eax
  10338e:	0f b6 00             	movzbl (%eax),%eax
  103391:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  103394:	83 fb 2f             	cmp    $0x2f,%ebx
  103397:	7e 38                	jle    1033d1 <vprintfmt+0xe9>
  103399:	83 fb 39             	cmp    $0x39,%ebx
  10339c:	7f 33                	jg     1033d1 <vprintfmt+0xe9>
            for (precision = 0; ; ++ fmt) {
  10339e:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
  1033a1:	eb d4                	jmp    103377 <vprintfmt+0x8f>
                }
            }
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  1033a3:	8b 45 14             	mov    0x14(%ebp),%eax
  1033a6:	8d 50 04             	lea    0x4(%eax),%edx
  1033a9:	89 55 14             	mov    %edx,0x14(%ebp)
  1033ac:	8b 00                	mov    (%eax),%eax
  1033ae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  1033b1:	eb 1f                	jmp    1033d2 <vprintfmt+0xea>

        case '.':
            if (width < 0)
  1033b3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1033b7:	79 86                	jns    10333f <vprintfmt+0x57>
                width = 0;
  1033b9:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  1033c0:	e9 7a ff ff ff       	jmp    10333f <vprintfmt+0x57>

        case '#':
            altflag = 1;
  1033c5:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  1033cc:	e9 6e ff ff ff       	jmp    10333f <vprintfmt+0x57>
            goto process_precision;
  1033d1:	90                   	nop

        process_precision:
            if (width < 0)
  1033d2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1033d6:	0f 89 63 ff ff ff    	jns    10333f <vprintfmt+0x57>
                width = precision, precision = -1;
  1033dc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1033df:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1033e2:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  1033e9:	e9 51 ff ff ff       	jmp    10333f <vprintfmt+0x57>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  1033ee:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  1033f1:	e9 49 ff ff ff       	jmp    10333f <vprintfmt+0x57>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  1033f6:	8b 45 14             	mov    0x14(%ebp),%eax
  1033f9:	8d 50 04             	lea    0x4(%eax),%edx
  1033fc:	89 55 14             	mov    %edx,0x14(%ebp)
  1033ff:	8b 00                	mov    (%eax),%eax
  103401:	8b 55 0c             	mov    0xc(%ebp),%edx
  103404:	89 54 24 04          	mov    %edx,0x4(%esp)
  103408:	89 04 24             	mov    %eax,(%esp)
  10340b:	8b 45 08             	mov    0x8(%ebp),%eax
  10340e:	ff d0                	call   *%eax
            break;
  103410:	e9 a4 02 00 00       	jmp    1036b9 <vprintfmt+0x3d1>

        // error message
        case 'e':
            err = va_arg(ap, int);
  103415:	8b 45 14             	mov    0x14(%ebp),%eax
  103418:	8d 50 04             	lea    0x4(%eax),%edx
  10341b:	89 55 14             	mov    %edx,0x14(%ebp)
  10341e:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  103420:	85 db                	test   %ebx,%ebx
  103422:	79 02                	jns    103426 <vprintfmt+0x13e>
                err = -err;
  103424:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  103426:	83 fb 06             	cmp    $0x6,%ebx
  103429:	7f 0b                	jg     103436 <vprintfmt+0x14e>
  10342b:	8b 34 9d 54 3f 10 00 	mov    0x103f54(,%ebx,4),%esi
  103432:	85 f6                	test   %esi,%esi
  103434:	75 23                	jne    103459 <vprintfmt+0x171>
                printfmt(putch, putdat, "error %d", err);
  103436:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  10343a:	c7 44 24 08 81 3f 10 	movl   $0x103f81,0x8(%esp)
  103441:	00 
  103442:	8b 45 0c             	mov    0xc(%ebp),%eax
  103445:	89 44 24 04          	mov    %eax,0x4(%esp)
  103449:	8b 45 08             	mov    0x8(%ebp),%eax
  10344c:	89 04 24             	mov    %eax,(%esp)
  10344f:	e8 61 fe ff ff       	call   1032b5 <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  103454:	e9 60 02 00 00       	jmp    1036b9 <vprintfmt+0x3d1>
                printfmt(putch, putdat, "%s", p);
  103459:	89 74 24 0c          	mov    %esi,0xc(%esp)
  10345d:	c7 44 24 08 8a 3f 10 	movl   $0x103f8a,0x8(%esp)
  103464:	00 
  103465:	8b 45 0c             	mov    0xc(%ebp),%eax
  103468:	89 44 24 04          	mov    %eax,0x4(%esp)
  10346c:	8b 45 08             	mov    0x8(%ebp),%eax
  10346f:	89 04 24             	mov    %eax,(%esp)
  103472:	e8 3e fe ff ff       	call   1032b5 <printfmt>
            break;
  103477:	e9 3d 02 00 00       	jmp    1036b9 <vprintfmt+0x3d1>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  10347c:	8b 45 14             	mov    0x14(%ebp),%eax
  10347f:	8d 50 04             	lea    0x4(%eax),%edx
  103482:	89 55 14             	mov    %edx,0x14(%ebp)
  103485:	8b 30                	mov    (%eax),%esi
  103487:	85 f6                	test   %esi,%esi
  103489:	75 05                	jne    103490 <vprintfmt+0x1a8>
                p = "(null)";
  10348b:	be 8d 3f 10 00       	mov    $0x103f8d,%esi
            }
            if (width > 0 && padc != '-') {
  103490:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103494:	7e 76                	jle    10350c <vprintfmt+0x224>
  103496:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  10349a:	74 70                	je     10350c <vprintfmt+0x224>
                for (width -= strnlen(p, precision); width > 0; width --) {
  10349c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10349f:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034a3:	89 34 24             	mov    %esi,(%esp)
  1034a6:	e8 ba f7 ff ff       	call   102c65 <strnlen>
  1034ab:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1034ae:	29 c2                	sub    %eax,%edx
  1034b0:	89 d0                	mov    %edx,%eax
  1034b2:	89 45 e8             	mov    %eax,-0x18(%ebp)
  1034b5:	eb 16                	jmp    1034cd <vprintfmt+0x1e5>
                    putch(padc, putdat);
  1034b7:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  1034bb:	8b 55 0c             	mov    0xc(%ebp),%edx
  1034be:	89 54 24 04          	mov    %edx,0x4(%esp)
  1034c2:	89 04 24             	mov    %eax,(%esp)
  1034c5:	8b 45 08             	mov    0x8(%ebp),%eax
  1034c8:	ff d0                	call   *%eax
                for (width -= strnlen(p, precision); width > 0; width --) {
  1034ca:	ff 4d e8             	decl   -0x18(%ebp)
  1034cd:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1034d1:	7f e4                	jg     1034b7 <vprintfmt+0x1cf>
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  1034d3:	eb 37                	jmp    10350c <vprintfmt+0x224>
                if (altflag && (ch < ' ' || ch > '~')) {
  1034d5:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  1034d9:	74 1f                	je     1034fa <vprintfmt+0x212>
  1034db:	83 fb 1f             	cmp    $0x1f,%ebx
  1034de:	7e 05                	jle    1034e5 <vprintfmt+0x1fd>
  1034e0:	83 fb 7e             	cmp    $0x7e,%ebx
  1034e3:	7e 15                	jle    1034fa <vprintfmt+0x212>
                    putch('?', putdat);
  1034e5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034e8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034ec:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  1034f3:	8b 45 08             	mov    0x8(%ebp),%eax
  1034f6:	ff d0                	call   *%eax
  1034f8:	eb 0f                	jmp    103509 <vprintfmt+0x221>
                }
                else {
                    putch(ch, putdat);
  1034fa:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034fd:	89 44 24 04          	mov    %eax,0x4(%esp)
  103501:	89 1c 24             	mov    %ebx,(%esp)
  103504:	8b 45 08             	mov    0x8(%ebp),%eax
  103507:	ff d0                	call   *%eax
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103509:	ff 4d e8             	decl   -0x18(%ebp)
  10350c:	89 f0                	mov    %esi,%eax
  10350e:	8d 70 01             	lea    0x1(%eax),%esi
  103511:	0f b6 00             	movzbl (%eax),%eax
  103514:	0f be d8             	movsbl %al,%ebx
  103517:	85 db                	test   %ebx,%ebx
  103519:	74 27                	je     103542 <vprintfmt+0x25a>
  10351b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  10351f:	78 b4                	js     1034d5 <vprintfmt+0x1ed>
  103521:	ff 4d e4             	decl   -0x1c(%ebp)
  103524:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  103528:	79 ab                	jns    1034d5 <vprintfmt+0x1ed>
                }
            }
            for (; width > 0; width --) {
  10352a:	eb 16                	jmp    103542 <vprintfmt+0x25a>
                putch(' ', putdat);
  10352c:	8b 45 0c             	mov    0xc(%ebp),%eax
  10352f:	89 44 24 04          	mov    %eax,0x4(%esp)
  103533:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10353a:	8b 45 08             	mov    0x8(%ebp),%eax
  10353d:	ff d0                	call   *%eax
            for (; width > 0; width --) {
  10353f:	ff 4d e8             	decl   -0x18(%ebp)
  103542:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103546:	7f e4                	jg     10352c <vprintfmt+0x244>
            }
            break;
  103548:	e9 6c 01 00 00       	jmp    1036b9 <vprintfmt+0x3d1>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  10354d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103550:	89 44 24 04          	mov    %eax,0x4(%esp)
  103554:	8d 45 14             	lea    0x14(%ebp),%eax
  103557:	89 04 24             	mov    %eax,(%esp)
  10355a:	e8 0b fd ff ff       	call   10326a <getint>
  10355f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103562:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  103565:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103568:	8b 55 f4             	mov    -0xc(%ebp),%edx
  10356b:	85 d2                	test   %edx,%edx
  10356d:	79 26                	jns    103595 <vprintfmt+0x2ad>
                putch('-', putdat);
  10356f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103572:	89 44 24 04          	mov    %eax,0x4(%esp)
  103576:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  10357d:	8b 45 08             	mov    0x8(%ebp),%eax
  103580:	ff d0                	call   *%eax
                num = -(long long)num;
  103582:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103585:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103588:	f7 d8                	neg    %eax
  10358a:	83 d2 00             	adc    $0x0,%edx
  10358d:	f7 da                	neg    %edx
  10358f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103592:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  103595:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  10359c:	e9 a8 00 00 00       	jmp    103649 <vprintfmt+0x361>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  1035a1:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1035a4:	89 44 24 04          	mov    %eax,0x4(%esp)
  1035a8:	8d 45 14             	lea    0x14(%ebp),%eax
  1035ab:	89 04 24             	mov    %eax,(%esp)
  1035ae:	e8 64 fc ff ff       	call   103217 <getuint>
  1035b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1035b6:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  1035b9:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  1035c0:	e9 84 00 00 00       	jmp    103649 <vprintfmt+0x361>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  1035c5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1035c8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1035cc:	8d 45 14             	lea    0x14(%ebp),%eax
  1035cf:	89 04 24             	mov    %eax,(%esp)
  1035d2:	e8 40 fc ff ff       	call   103217 <getuint>
  1035d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1035da:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  1035dd:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  1035e4:	eb 63                	jmp    103649 <vprintfmt+0x361>

        // pointer
        case 'p':
            putch('0', putdat);
  1035e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1035e9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1035ed:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  1035f4:	8b 45 08             	mov    0x8(%ebp),%eax
  1035f7:	ff d0                	call   *%eax
            putch('x', putdat);
  1035f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1035fc:	89 44 24 04          	mov    %eax,0x4(%esp)
  103600:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  103607:	8b 45 08             	mov    0x8(%ebp),%eax
  10360a:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  10360c:	8b 45 14             	mov    0x14(%ebp),%eax
  10360f:	8d 50 04             	lea    0x4(%eax),%edx
  103612:	89 55 14             	mov    %edx,0x14(%ebp)
  103615:	8b 00                	mov    (%eax),%eax
  103617:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10361a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  103621:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  103628:	eb 1f                	jmp    103649 <vprintfmt+0x361>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  10362a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10362d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103631:	8d 45 14             	lea    0x14(%ebp),%eax
  103634:	89 04 24             	mov    %eax,(%esp)
  103637:	e8 db fb ff ff       	call   103217 <getuint>
  10363c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10363f:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  103642:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  103649:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  10364d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103650:	89 54 24 18          	mov    %edx,0x18(%esp)
  103654:	8b 55 e8             	mov    -0x18(%ebp),%edx
  103657:	89 54 24 14          	mov    %edx,0x14(%esp)
  10365b:	89 44 24 10          	mov    %eax,0x10(%esp)
  10365f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103662:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103665:	89 44 24 08          	mov    %eax,0x8(%esp)
  103669:	89 54 24 0c          	mov    %edx,0xc(%esp)
  10366d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103670:	89 44 24 04          	mov    %eax,0x4(%esp)
  103674:	8b 45 08             	mov    0x8(%ebp),%eax
  103677:	89 04 24             	mov    %eax,(%esp)
  10367a:	e8 94 fa ff ff       	call   103113 <printnum>
            break;
  10367f:	eb 38                	jmp    1036b9 <vprintfmt+0x3d1>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  103681:	8b 45 0c             	mov    0xc(%ebp),%eax
  103684:	89 44 24 04          	mov    %eax,0x4(%esp)
  103688:	89 1c 24             	mov    %ebx,(%esp)
  10368b:	8b 45 08             	mov    0x8(%ebp),%eax
  10368e:	ff d0                	call   *%eax
            break;
  103690:	eb 27                	jmp    1036b9 <vprintfmt+0x3d1>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  103692:	8b 45 0c             	mov    0xc(%ebp),%eax
  103695:	89 44 24 04          	mov    %eax,0x4(%esp)
  103699:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  1036a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1036a3:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  1036a5:	ff 4d 10             	decl   0x10(%ebp)
  1036a8:	eb 03                	jmp    1036ad <vprintfmt+0x3c5>
  1036aa:	ff 4d 10             	decl   0x10(%ebp)
  1036ad:	8b 45 10             	mov    0x10(%ebp),%eax
  1036b0:	48                   	dec    %eax
  1036b1:	0f b6 00             	movzbl (%eax),%eax
  1036b4:	3c 25                	cmp    $0x25,%al
  1036b6:	75 f2                	jne    1036aa <vprintfmt+0x3c2>
                /* do nothing */;
            break;
  1036b8:	90                   	nop
    while (1) {
  1036b9:	e9 36 fc ff ff       	jmp    1032f4 <vprintfmt+0xc>
                return;
  1036be:	90                   	nop
        }
    }
}
  1036bf:	83 c4 40             	add    $0x40,%esp
  1036c2:	5b                   	pop    %ebx
  1036c3:	5e                   	pop    %esi
  1036c4:	5d                   	pop    %ebp
  1036c5:	c3                   	ret    

001036c6 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  1036c6:	f3 0f 1e fb          	endbr32 
  1036ca:	55                   	push   %ebp
  1036cb:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  1036cd:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036d0:	8b 40 08             	mov    0x8(%eax),%eax
  1036d3:	8d 50 01             	lea    0x1(%eax),%edx
  1036d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036d9:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  1036dc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036df:	8b 10                	mov    (%eax),%edx
  1036e1:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036e4:	8b 40 04             	mov    0x4(%eax),%eax
  1036e7:	39 c2                	cmp    %eax,%edx
  1036e9:	73 12                	jae    1036fd <sprintputch+0x37>
        *b->buf ++ = ch;
  1036eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  1036ee:	8b 00                	mov    (%eax),%eax
  1036f0:	8d 48 01             	lea    0x1(%eax),%ecx
  1036f3:	8b 55 0c             	mov    0xc(%ebp),%edx
  1036f6:	89 0a                	mov    %ecx,(%edx)
  1036f8:	8b 55 08             	mov    0x8(%ebp),%edx
  1036fb:	88 10                	mov    %dl,(%eax)
    }
}
  1036fd:	90                   	nop
  1036fe:	5d                   	pop    %ebp
  1036ff:	c3                   	ret    

00103700 <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  103700:	f3 0f 1e fb          	endbr32 
  103704:	55                   	push   %ebp
  103705:	89 e5                	mov    %esp,%ebp
  103707:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  10370a:	8d 45 14             	lea    0x14(%ebp),%eax
  10370d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  103710:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103713:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103717:	8b 45 10             	mov    0x10(%ebp),%eax
  10371a:	89 44 24 08          	mov    %eax,0x8(%esp)
  10371e:	8b 45 0c             	mov    0xc(%ebp),%eax
  103721:	89 44 24 04          	mov    %eax,0x4(%esp)
  103725:	8b 45 08             	mov    0x8(%ebp),%eax
  103728:	89 04 24             	mov    %eax,(%esp)
  10372b:	e8 08 00 00 00       	call   103738 <vsnprintf>
  103730:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  103733:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103736:	c9                   	leave  
  103737:	c3                   	ret    

00103738 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  103738:	f3 0f 1e fb          	endbr32 
  10373c:	55                   	push   %ebp
  10373d:	89 e5                	mov    %esp,%ebp
  10373f:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  103742:	8b 45 08             	mov    0x8(%ebp),%eax
  103745:	89 45 ec             	mov    %eax,-0x14(%ebp)
  103748:	8b 45 0c             	mov    0xc(%ebp),%eax
  10374b:	8d 50 ff             	lea    -0x1(%eax),%edx
  10374e:	8b 45 08             	mov    0x8(%ebp),%eax
  103751:	01 d0                	add    %edx,%eax
  103753:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103756:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  10375d:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  103761:	74 0a                	je     10376d <vsnprintf+0x35>
  103763:	8b 55 ec             	mov    -0x14(%ebp),%edx
  103766:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103769:	39 c2                	cmp    %eax,%edx
  10376b:	76 07                	jbe    103774 <vsnprintf+0x3c>
        return -E_INVAL;
  10376d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  103772:	eb 2a                	jmp    10379e <vsnprintf+0x66>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  103774:	8b 45 14             	mov    0x14(%ebp),%eax
  103777:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10377b:	8b 45 10             	mov    0x10(%ebp),%eax
  10377e:	89 44 24 08          	mov    %eax,0x8(%esp)
  103782:	8d 45 ec             	lea    -0x14(%ebp),%eax
  103785:	89 44 24 04          	mov    %eax,0x4(%esp)
  103789:	c7 04 24 c6 36 10 00 	movl   $0x1036c6,(%esp)
  103790:	e8 53 fb ff ff       	call   1032e8 <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  103795:	8b 45 ec             	mov    -0x14(%ebp),%eax
  103798:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  10379b:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10379e:	c9                   	leave  
  10379f:	c3                   	ret    
