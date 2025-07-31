
obj/user/faultallocbad:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 84 00 00 00       	call   8000b5 <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <handler>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	53                   	push   %ebx
  800037:	83 ec 0c             	sub    $0xc,%esp
  80003a:	8b 45 08             	mov    0x8(%ebp),%eax
  80003d:	8b 18                	mov    (%eax),%ebx
  80003f:	53                   	push   %ebx
  800040:	68 40 0f 80 00       	push   $0x800f40
  800045:	e8 a5 01 00 00       	call   8001ef <cprintf>
  80004a:	83 c4 0c             	add    $0xc,%esp
  80004d:	6a 07                	push   $0x7
  80004f:	89 d8                	mov    %ebx,%eax
  800051:	25 00 f0 ff ff       	and    $0xfffff000,%eax
  800056:	50                   	push   %eax
  800057:	6a 00                	push   $0x0
  800059:	e8 0a 0b 00 00       	call   800b68 <sys_page_alloc>
  80005e:	83 c4 10             	add    $0x10,%esp
  800061:	85 c0                	test   %eax,%eax
  800063:	78 16                	js     80007b <handler+0x48>
  800065:	53                   	push   %ebx
  800066:	68 78 10 80 00       	push   $0x801078
  80006b:	6a 64                	push   $0x64
  80006d:	53                   	push   %ebx
  80006e:	e8 6c 06 00 00       	call   8006df <snprintf>
  800073:	83 c4 10             	add    $0x10,%esp
  800076:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800079:	c9                   	leave
  80007a:	c3                   	ret
  80007b:	83 ec 0c             	sub    $0xc,%esp
  80007e:	50                   	push   %eax
  80007f:	53                   	push   %ebx
  800080:	68 4c 10 80 00       	push   $0x80104c
  800085:	6a 0f                	push   $0xf
  800087:	68 4a 0f 80 00       	push   $0x800f4a
  80008c:	e8 83 00 00 00       	call   800114 <_panic>

00800091 <umain>:
  800091:	55                   	push   %ebp
  800092:	89 e5                	mov    %esp,%ebp
  800094:	83 ec 14             	sub    $0x14,%esp
  800097:	68 33 00 80 00       	push   $0x800033
  80009c:	e8 c1 0b 00 00       	call   800c62 <set_pgfault_handler>
  8000a1:	83 c4 08             	add    $0x8,%esp
  8000a4:	6a 04                	push   $0x4
  8000a6:	68 ef be ad de       	push   $0xdeadbeef
  8000ab:	e8 01 0a 00 00       	call   800ab1 <sys_cputs>
  8000b0:	83 c4 10             	add    $0x10,%esp
  8000b3:	c9                   	leave
  8000b4:	c3                   	ret

008000b5 <libmain>:
  8000b5:	55                   	push   %ebp
  8000b6:	89 e5                	mov    %esp,%ebp
  8000b8:	56                   	push   %esi
  8000b9:	53                   	push   %ebx
  8000ba:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8000bd:	8b 75 0c             	mov    0xc(%ebp),%esi
  8000c0:	e8 58 0a 00 00       	call   800b1d <sys_getenvid>
  8000c5:	85 c0                	test   %eax,%eax
  8000c7:	78 15                	js     8000de <libmain+0x29>
  8000c9:	25 ff 03 00 00       	and    $0x3ff,%eax
  8000ce:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  8000d4:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  8000d9:	a3 04 20 80 00       	mov    %eax,0x802004
  8000de:	85 db                	test   %ebx,%ebx
  8000e0:	7e 07                	jle    8000e9 <libmain+0x34>
  8000e2:	8b 06                	mov    (%esi),%eax
  8000e4:	a3 00 20 80 00       	mov    %eax,0x802000
  8000e9:	83 ec 08             	sub    $0x8,%esp
  8000ec:	56                   	push   %esi
  8000ed:	53                   	push   %ebx
  8000ee:	e8 9e ff ff ff       	call   800091 <umain>
  8000f3:	e8 0a 00 00 00       	call   800102 <exit>
  8000f8:	83 c4 10             	add    $0x10,%esp
  8000fb:	8d 65 f8             	lea    -0x8(%ebp),%esp
  8000fe:	5b                   	pop    %ebx
  8000ff:	5e                   	pop    %esi
  800100:	5d                   	pop    %ebp
  800101:	c3                   	ret

00800102 <exit>:
  800102:	55                   	push   %ebp
  800103:	89 e5                	mov    %esp,%ebp
  800105:	83 ec 14             	sub    $0x14,%esp
  800108:	6a 00                	push   $0x0
  80010a:	e8 ec 09 00 00       	call   800afb <sys_env_destroy>
  80010f:	83 c4 10             	add    $0x10,%esp
  800112:	c9                   	leave
  800113:	c3                   	ret

00800114 <_panic>:
  800114:	55                   	push   %ebp
  800115:	89 e5                	mov    %esp,%ebp
  800117:	56                   	push   %esi
  800118:	53                   	push   %ebx
  800119:	8d 5d 14             	lea    0x14(%ebp),%ebx
  80011c:	8b 35 00 20 80 00    	mov    0x802000,%esi
  800122:	e8 f6 09 00 00       	call   800b1d <sys_getenvid>
  800127:	83 ec 0c             	sub    $0xc,%esp
  80012a:	ff 75 0c             	push   0xc(%ebp)
  80012d:	ff 75 08             	push   0x8(%ebp)
  800130:	56                   	push   %esi
  800131:	50                   	push   %eax
  800132:	68 9c 10 80 00       	push   $0x80109c
  800137:	e8 b3 00 00 00       	call   8001ef <cprintf>
  80013c:	83 c4 18             	add    $0x18,%esp
  80013f:	53                   	push   %ebx
  800140:	ff 75 10             	push   0x10(%ebp)
  800143:	e8 56 00 00 00       	call   80019e <vcprintf>
  800148:	c7 04 24 48 0f 80 00 	movl   $0x800f48,(%esp)
  80014f:	e8 9b 00 00 00       	call   8001ef <cprintf>
  800154:	83 c4 10             	add    $0x10,%esp
  800157:	cc                   	int3
  800158:	eb fd                	jmp    800157 <_panic+0x43>

0080015a <putch>:
  80015a:	55                   	push   %ebp
  80015b:	89 e5                	mov    %esp,%ebp
  80015d:	53                   	push   %ebx
  80015e:	83 ec 04             	sub    $0x4,%esp
  800161:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800164:	8b 13                	mov    (%ebx),%edx
  800166:	8d 42 01             	lea    0x1(%edx),%eax
  800169:	89 03                	mov    %eax,(%ebx)
  80016b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80016e:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  800172:	3d ff 00 00 00       	cmp    $0xff,%eax
  800177:	74 09                	je     800182 <putch+0x28>
  800179:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  80017d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800180:	c9                   	leave
  800181:	c3                   	ret
  800182:	83 ec 08             	sub    $0x8,%esp
  800185:	68 ff 00 00 00       	push   $0xff
  80018a:	8d 43 08             	lea    0x8(%ebx),%eax
  80018d:	50                   	push   %eax
  80018e:	e8 1e 09 00 00       	call   800ab1 <sys_cputs>
  800193:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  800199:	83 c4 10             	add    $0x10,%esp
  80019c:	eb db                	jmp    800179 <putch+0x1f>

0080019e <vcprintf>:
  80019e:	55                   	push   %ebp
  80019f:	89 e5                	mov    %esp,%ebp
  8001a1:	81 ec 18 01 00 00    	sub    $0x118,%esp
  8001a7:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  8001ae:	00 00 00 
  8001b1:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  8001b8:	00 00 00 
  8001bb:	ff 75 0c             	push   0xc(%ebp)
  8001be:	ff 75 08             	push   0x8(%ebp)
  8001c1:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  8001c7:	50                   	push   %eax
  8001c8:	68 5a 01 80 00       	push   $0x80015a
  8001cd:	e8 74 01 00 00       	call   800346 <vprintfmt>
  8001d2:	83 c4 08             	add    $0x8,%esp
  8001d5:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  8001db:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  8001e1:	50                   	push   %eax
  8001e2:	e8 ca 08 00 00       	call   800ab1 <sys_cputs>
  8001e7:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  8001ed:	c9                   	leave
  8001ee:	c3                   	ret

008001ef <cprintf>:
  8001ef:	55                   	push   %ebp
  8001f0:	89 e5                	mov    %esp,%ebp
  8001f2:	83 ec 10             	sub    $0x10,%esp
  8001f5:	8d 45 0c             	lea    0xc(%ebp),%eax
  8001f8:	50                   	push   %eax
  8001f9:	ff 75 08             	push   0x8(%ebp)
  8001fc:	e8 9d ff ff ff       	call   80019e <vcprintf>
  800201:	c9                   	leave
  800202:	c3                   	ret

00800203 <printnum>:
  800203:	55                   	push   %ebp
  800204:	89 e5                	mov    %esp,%ebp
  800206:	57                   	push   %edi
  800207:	56                   	push   %esi
  800208:	53                   	push   %ebx
  800209:	83 ec 1c             	sub    $0x1c,%esp
  80020c:	89 c7                	mov    %eax,%edi
  80020e:	89 d6                	mov    %edx,%esi
  800210:	8b 45 08             	mov    0x8(%ebp),%eax
  800213:	8b 55 0c             	mov    0xc(%ebp),%edx
  800216:	89 d1                	mov    %edx,%ecx
  800218:	89 c2                	mov    %eax,%edx
  80021a:	89 45 d8             	mov    %eax,-0x28(%ebp)
  80021d:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  800220:	8b 45 10             	mov    0x10(%ebp),%eax
  800223:	8b 5d 14             	mov    0x14(%ebp),%ebx
  800226:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800229:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  800230:	39 c2                	cmp    %eax,%edx
  800232:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  800235:	72 3e                	jb     800275 <printnum+0x72>
  800237:	83 ec 0c             	sub    $0xc,%esp
  80023a:	ff 75 18             	push   0x18(%ebp)
  80023d:	83 eb 01             	sub    $0x1,%ebx
  800240:	53                   	push   %ebx
  800241:	50                   	push   %eax
  800242:	83 ec 08             	sub    $0x8,%esp
  800245:	ff 75 e4             	push   -0x1c(%ebp)
  800248:	ff 75 e0             	push   -0x20(%ebp)
  80024b:	ff 75 dc             	push   -0x24(%ebp)
  80024e:	ff 75 d8             	push   -0x28(%ebp)
  800251:	e8 7a 0a 00 00       	call   800cd0 <__udivdi3>
  800256:	83 c4 18             	add    $0x18,%esp
  800259:	52                   	push   %edx
  80025a:	50                   	push   %eax
  80025b:	89 f2                	mov    %esi,%edx
  80025d:	89 f8                	mov    %edi,%eax
  80025f:	e8 9f ff ff ff       	call   800203 <printnum>
  800264:	83 c4 20             	add    $0x20,%esp
  800267:	eb 13                	jmp    80027c <printnum+0x79>
  800269:	83 ec 08             	sub    $0x8,%esp
  80026c:	56                   	push   %esi
  80026d:	ff 75 18             	push   0x18(%ebp)
  800270:	ff d7                	call   *%edi
  800272:	83 c4 10             	add    $0x10,%esp
  800275:	83 eb 01             	sub    $0x1,%ebx
  800278:	85 db                	test   %ebx,%ebx
  80027a:	7f ed                	jg     800269 <printnum+0x66>
  80027c:	83 ec 08             	sub    $0x8,%esp
  80027f:	56                   	push   %esi
  800280:	83 ec 04             	sub    $0x4,%esp
  800283:	ff 75 e4             	push   -0x1c(%ebp)
  800286:	ff 75 e0             	push   -0x20(%ebp)
  800289:	ff 75 dc             	push   -0x24(%ebp)
  80028c:	ff 75 d8             	push   -0x28(%ebp)
  80028f:	e8 5c 0b 00 00       	call   800df0 <__umoddi3>
  800294:	83 c4 14             	add    $0x14,%esp
  800297:	0f be 80 69 0f 80 00 	movsbl 0x800f69(%eax),%eax
  80029e:	50                   	push   %eax
  80029f:	ff d7                	call   *%edi
  8002a1:	83 c4 10             	add    $0x10,%esp
  8002a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8002a7:	5b                   	pop    %ebx
  8002a8:	5e                   	pop    %esi
  8002a9:	5f                   	pop    %edi
  8002aa:	5d                   	pop    %ebp
  8002ab:	c3                   	ret

008002ac <getuint>:
  8002ac:	83 fa 01             	cmp    $0x1,%edx
  8002af:	7f 13                	jg     8002c4 <getuint+0x18>
  8002b1:	85 d2                	test   %edx,%edx
  8002b3:	74 1c                	je     8002d1 <getuint+0x25>
  8002b5:	8b 10                	mov    (%eax),%edx
  8002b7:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002ba:	89 08                	mov    %ecx,(%eax)
  8002bc:	8b 02                	mov    (%edx),%eax
  8002be:	ba 00 00 00 00       	mov    $0x0,%edx
  8002c3:	c3                   	ret
  8002c4:	8b 10                	mov    (%eax),%edx
  8002c6:	8d 4a 08             	lea    0x8(%edx),%ecx
  8002c9:	89 08                	mov    %ecx,(%eax)
  8002cb:	8b 02                	mov    (%edx),%eax
  8002cd:	8b 52 04             	mov    0x4(%edx),%edx
  8002d0:	c3                   	ret
  8002d1:	8b 10                	mov    (%eax),%edx
  8002d3:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002d6:	89 08                	mov    %ecx,(%eax)
  8002d8:	8b 02                	mov    (%edx),%eax
  8002da:	ba 00 00 00 00       	mov    $0x0,%edx
  8002df:	c3                   	ret

008002e0 <getint>:
  8002e0:	83 fa 01             	cmp    $0x1,%edx
  8002e3:	7f 0f                	jg     8002f4 <getint+0x14>
  8002e5:	85 d2                	test   %edx,%edx
  8002e7:	74 18                	je     800301 <getint+0x21>
  8002e9:	8b 10                	mov    (%eax),%edx
  8002eb:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002ee:	89 08                	mov    %ecx,(%eax)
  8002f0:	8b 02                	mov    (%edx),%eax
  8002f2:	99                   	cltd
  8002f3:	c3                   	ret
  8002f4:	8b 10                	mov    (%eax),%edx
  8002f6:	8d 4a 08             	lea    0x8(%edx),%ecx
  8002f9:	89 08                	mov    %ecx,(%eax)
  8002fb:	8b 02                	mov    (%edx),%eax
  8002fd:	8b 52 04             	mov    0x4(%edx),%edx
  800300:	c3                   	ret
  800301:	8b 10                	mov    (%eax),%edx
  800303:	8d 4a 04             	lea    0x4(%edx),%ecx
  800306:	89 08                	mov    %ecx,(%eax)
  800308:	8b 02                	mov    (%edx),%eax
  80030a:	99                   	cltd
  80030b:	c3                   	ret

0080030c <sprintputch>:
  80030c:	55                   	push   %ebp
  80030d:	89 e5                	mov    %esp,%ebp
  80030f:	8b 45 0c             	mov    0xc(%ebp),%eax
  800312:	83 40 08 01          	addl   $0x1,0x8(%eax)
  800316:	8b 10                	mov    (%eax),%edx
  800318:	3b 50 04             	cmp    0x4(%eax),%edx
  80031b:	73 0a                	jae    800327 <sprintputch+0x1b>
  80031d:	8d 4a 01             	lea    0x1(%edx),%ecx
  800320:	89 08                	mov    %ecx,(%eax)
  800322:	8b 45 08             	mov    0x8(%ebp),%eax
  800325:	88 02                	mov    %al,(%edx)
  800327:	5d                   	pop    %ebp
  800328:	c3                   	ret

00800329 <printfmt>:
  800329:	55                   	push   %ebp
  80032a:	89 e5                	mov    %esp,%ebp
  80032c:	83 ec 08             	sub    $0x8,%esp
  80032f:	8d 45 14             	lea    0x14(%ebp),%eax
  800332:	50                   	push   %eax
  800333:	ff 75 10             	push   0x10(%ebp)
  800336:	ff 75 0c             	push   0xc(%ebp)
  800339:	ff 75 08             	push   0x8(%ebp)
  80033c:	e8 05 00 00 00       	call   800346 <vprintfmt>
  800341:	83 c4 10             	add    $0x10,%esp
  800344:	c9                   	leave
  800345:	c3                   	ret

00800346 <vprintfmt>:
  800346:	55                   	push   %ebp
  800347:	89 e5                	mov    %esp,%ebp
  800349:	57                   	push   %edi
  80034a:	56                   	push   %esi
  80034b:	53                   	push   %ebx
  80034c:	83 ec 2c             	sub    $0x2c,%esp
  80034f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800352:	8b 75 0c             	mov    0xc(%ebp),%esi
  800355:	8b 7d 10             	mov    0x10(%ebp),%edi
  800358:	eb 0a                	jmp    800364 <vprintfmt+0x1e>
  80035a:	83 ec 08             	sub    $0x8,%esp
  80035d:	56                   	push   %esi
  80035e:	50                   	push   %eax
  80035f:	ff d3                	call   *%ebx
  800361:	83 c4 10             	add    $0x10,%esp
  800364:	83 c7 01             	add    $0x1,%edi
  800367:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  80036b:	83 f8 25             	cmp    $0x25,%eax
  80036e:	74 0c                	je     80037c <vprintfmt+0x36>
  800370:	85 c0                	test   %eax,%eax
  800372:	75 e6                	jne    80035a <vprintfmt+0x14>
  800374:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800377:	5b                   	pop    %ebx
  800378:	5e                   	pop    %esi
  800379:	5f                   	pop    %edi
  80037a:	5d                   	pop    %ebp
  80037b:	c3                   	ret
  80037c:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  800380:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  800387:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  80038e:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  800395:	b9 00 00 00 00       	mov    $0x0,%ecx
  80039a:	8d 47 01             	lea    0x1(%edi),%eax
  80039d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  8003a0:	0f b6 17             	movzbl (%edi),%edx
  8003a3:	8d 42 dd             	lea    -0x23(%edx),%eax
  8003a6:	3c 55                	cmp    $0x55,%al
  8003a8:	0f 87 c3 02 00 00    	ja     800671 <vprintfmt+0x32b>
  8003ae:	0f b6 c0             	movzbl %al,%eax
  8003b1:	ff 24 85 c0 10 80 00 	jmp    *0x8010c0(,%eax,4)
  8003b8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003bb:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  8003bf:	eb d9                	jmp    80039a <vprintfmt+0x54>
  8003c1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003c4:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  8003c8:	eb d0                	jmp    80039a <vprintfmt+0x54>
  8003ca:	0f b6 d2             	movzbl %dl,%edx
  8003cd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003d0:	b8 00 00 00 00       	mov    $0x0,%eax
  8003d5:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  8003d8:	8d 04 80             	lea    (%eax,%eax,4),%eax
  8003db:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  8003df:	0f be 17             	movsbl (%edi),%edx
  8003e2:	8d 4a d0             	lea    -0x30(%edx),%ecx
  8003e5:	83 f9 09             	cmp    $0x9,%ecx
  8003e8:	77 52                	ja     80043c <vprintfmt+0xf6>
  8003ea:	83 c7 01             	add    $0x1,%edi
  8003ed:	eb e9                	jmp    8003d8 <vprintfmt+0x92>
  8003ef:	8b 45 14             	mov    0x14(%ebp),%eax
  8003f2:	8d 50 04             	lea    0x4(%eax),%edx
  8003f5:	89 55 14             	mov    %edx,0x14(%ebp)
  8003f8:	8b 00                	mov    (%eax),%eax
  8003fa:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8003fd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800400:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800404:	79 94                	jns    80039a <vprintfmt+0x54>
  800406:	8b 45 d0             	mov    -0x30(%ebp),%eax
  800409:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80040c:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800413:	eb 85                	jmp    80039a <vprintfmt+0x54>
  800415:	8b 55 e0             	mov    -0x20(%ebp),%edx
  800418:	85 d2                	test   %edx,%edx
  80041a:	b8 00 00 00 00       	mov    $0x0,%eax
  80041f:	0f 49 c2             	cmovns %edx,%eax
  800422:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800425:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800428:	e9 6d ff ff ff       	jmp    80039a <vprintfmt+0x54>
  80042d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800430:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  800437:	e9 5e ff ff ff       	jmp    80039a <vprintfmt+0x54>
  80043c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  80043f:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800442:	eb bc                	jmp    800400 <vprintfmt+0xba>
  800444:	83 c1 01             	add    $0x1,%ecx
  800447:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80044a:	e9 4b ff ff ff       	jmp    80039a <vprintfmt+0x54>
  80044f:	8b 45 14             	mov    0x14(%ebp),%eax
  800452:	8d 50 04             	lea    0x4(%eax),%edx
  800455:	89 55 14             	mov    %edx,0x14(%ebp)
  800458:	83 ec 08             	sub    $0x8,%esp
  80045b:	56                   	push   %esi
  80045c:	ff 30                	push   (%eax)
  80045e:	ff d3                	call   *%ebx
  800460:	83 c4 10             	add    $0x10,%esp
  800463:	e9 a0 01 00 00       	jmp    800608 <vprintfmt+0x2c2>
  800468:	8b 45 14             	mov    0x14(%ebp),%eax
  80046b:	8d 50 04             	lea    0x4(%eax),%edx
  80046e:	89 55 14             	mov    %edx,0x14(%ebp)
  800471:	8b 10                	mov    (%eax),%edx
  800473:	89 d0                	mov    %edx,%eax
  800475:	f7 d8                	neg    %eax
  800477:	0f 48 c2             	cmovs  %edx,%eax
  80047a:	83 f8 08             	cmp    $0x8,%eax
  80047d:	7f 20                	jg     80049f <vprintfmt+0x159>
  80047f:	8b 14 85 20 12 80 00 	mov    0x801220(,%eax,4),%edx
  800486:	85 d2                	test   %edx,%edx
  800488:	74 15                	je     80049f <vprintfmt+0x159>
  80048a:	52                   	push   %edx
  80048b:	68 8a 0f 80 00       	push   $0x800f8a
  800490:	56                   	push   %esi
  800491:	53                   	push   %ebx
  800492:	e8 92 fe ff ff       	call   800329 <printfmt>
  800497:	83 c4 10             	add    $0x10,%esp
  80049a:	e9 69 01 00 00       	jmp    800608 <vprintfmt+0x2c2>
  80049f:	50                   	push   %eax
  8004a0:	68 81 0f 80 00       	push   $0x800f81
  8004a5:	56                   	push   %esi
  8004a6:	53                   	push   %ebx
  8004a7:	e8 7d fe ff ff       	call   800329 <printfmt>
  8004ac:	83 c4 10             	add    $0x10,%esp
  8004af:	e9 54 01 00 00       	jmp    800608 <vprintfmt+0x2c2>
  8004b4:	8b 45 14             	mov    0x14(%ebp),%eax
  8004b7:	8d 50 04             	lea    0x4(%eax),%edx
  8004ba:	89 55 14             	mov    %edx,0x14(%ebp)
  8004bd:	8b 08                	mov    (%eax),%ecx
  8004bf:	85 c9                	test   %ecx,%ecx
  8004c1:	b8 7a 0f 80 00       	mov    $0x800f7a,%eax
  8004c6:	0f 45 c1             	cmovne %ecx,%eax
  8004c9:	89 45 cc             	mov    %eax,-0x34(%ebp)
  8004cc:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  8004d0:	7e 06                	jle    8004d8 <vprintfmt+0x192>
  8004d2:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  8004d6:	75 0b                	jne    8004e3 <vprintfmt+0x19d>
  8004d8:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  8004db:	8b 7d d0             	mov    -0x30(%ebp),%edi
  8004de:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8004e1:	eb 5c                	jmp    80053f <vprintfmt+0x1f9>
  8004e3:	83 ec 08             	sub    $0x8,%esp
  8004e6:	ff 75 d0             	push   -0x30(%ebp)
  8004e9:	ff 75 cc             	push   -0x34(%ebp)
  8004ec:	e8 20 02 00 00       	call   800711 <strnlen>
  8004f1:	89 c2                	mov    %eax,%edx
  8004f3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8004f6:	29 d0                	sub    %edx,%eax
  8004f8:	83 c4 10             	add    $0x10,%esp
  8004fb:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  8004ff:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800502:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800505:	89 c3                	mov    %eax,%ebx
  800507:	eb 0e                	jmp    800517 <vprintfmt+0x1d1>
  800509:	83 ec 08             	sub    $0x8,%esp
  80050c:	56                   	push   %esi
  80050d:	57                   	push   %edi
  80050e:	ff 55 08             	call   *0x8(%ebp)
  800511:	83 eb 01             	sub    $0x1,%ebx
  800514:	83 c4 10             	add    $0x10,%esp
  800517:	85 db                	test   %ebx,%ebx
  800519:	7f ee                	jg     800509 <vprintfmt+0x1c3>
  80051b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  80051e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800521:	85 c0                	test   %eax,%eax
  800523:	ba 00 00 00 00       	mov    $0x0,%edx
  800528:	0f 49 d0             	cmovns %eax,%edx
  80052b:	29 d0                	sub    %edx,%eax
  80052d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800530:	eb a6                	jmp    8004d8 <vprintfmt+0x192>
  800532:	83 ec 08             	sub    $0x8,%esp
  800535:	56                   	push   %esi
  800536:	52                   	push   %edx
  800537:	ff 55 08             	call   *0x8(%ebp)
  80053a:	83 c4 10             	add    $0x10,%esp
  80053d:	89 d9                	mov    %ebx,%ecx
  80053f:	8d 59 01             	lea    0x1(%ecx),%ebx
  800542:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  800546:	0f be d0             	movsbl %al,%edx
  800549:	85 d2                	test   %edx,%edx
  80054b:	74 28                	je     800575 <vprintfmt+0x22f>
  80054d:	85 ff                	test   %edi,%edi
  80054f:	78 05                	js     800556 <vprintfmt+0x210>
  800551:	83 ef 01             	sub    $0x1,%edi
  800554:	78 2e                	js     800584 <vprintfmt+0x23e>
  800556:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  80055a:	74 d6                	je     800532 <vprintfmt+0x1ec>
  80055c:	0f be c0             	movsbl %al,%eax
  80055f:	83 e8 20             	sub    $0x20,%eax
  800562:	83 f8 5e             	cmp    $0x5e,%eax
  800565:	76 cb                	jbe    800532 <vprintfmt+0x1ec>
  800567:	83 ec 08             	sub    $0x8,%esp
  80056a:	56                   	push   %esi
  80056b:	6a 3f                	push   $0x3f
  80056d:	ff 55 08             	call   *0x8(%ebp)
  800570:	83 c4 10             	add    $0x10,%esp
  800573:	eb c8                	jmp    80053d <vprintfmt+0x1f7>
  800575:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800578:	8b 7d cc             	mov    -0x34(%ebp),%edi
  80057b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  80057e:	01 c7                	add    %eax,%edi
  800580:	29 cf                	sub    %ecx,%edi
  800582:	eb 13                	jmp    800597 <vprintfmt+0x251>
  800584:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800587:	eb ef                	jmp    800578 <vprintfmt+0x232>
  800589:	83 ec 08             	sub    $0x8,%esp
  80058c:	56                   	push   %esi
  80058d:	6a 20                	push   $0x20
  80058f:	ff d3                	call   *%ebx
  800591:	83 ef 01             	sub    $0x1,%edi
  800594:	83 c4 10             	add    $0x10,%esp
  800597:	85 ff                	test   %edi,%edi
  800599:	7f ee                	jg     800589 <vprintfmt+0x243>
  80059b:	eb 6b                	jmp    800608 <vprintfmt+0x2c2>
  80059d:	89 ca                	mov    %ecx,%edx
  80059f:	8d 45 14             	lea    0x14(%ebp),%eax
  8005a2:	e8 39 fd ff ff       	call   8002e0 <getint>
  8005a7:	89 45 d8             	mov    %eax,-0x28(%ebp)
  8005aa:	89 55 dc             	mov    %edx,-0x24(%ebp)
  8005ad:	85 d2                	test   %edx,%edx
  8005af:	78 0b                	js     8005bc <vprintfmt+0x276>
  8005b1:	89 d1                	mov    %edx,%ecx
  8005b3:	89 c2                	mov    %eax,%edx
  8005b5:	bf 0a 00 00 00       	mov    $0xa,%edi
  8005ba:	eb 32                	jmp    8005ee <vprintfmt+0x2a8>
  8005bc:	83 ec 08             	sub    $0x8,%esp
  8005bf:	56                   	push   %esi
  8005c0:	6a 2d                	push   $0x2d
  8005c2:	ff d3                	call   *%ebx
  8005c4:	8b 55 d8             	mov    -0x28(%ebp),%edx
  8005c7:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  8005ca:	f7 da                	neg    %edx
  8005cc:	83 d1 00             	adc    $0x0,%ecx
  8005cf:	f7 d9                	neg    %ecx
  8005d1:	83 c4 10             	add    $0x10,%esp
  8005d4:	bf 0a 00 00 00       	mov    $0xa,%edi
  8005d9:	eb 13                	jmp    8005ee <vprintfmt+0x2a8>
  8005db:	89 ca                	mov    %ecx,%edx
  8005dd:	8d 45 14             	lea    0x14(%ebp),%eax
  8005e0:	e8 c7 fc ff ff       	call   8002ac <getuint>
  8005e5:	89 d1                	mov    %edx,%ecx
  8005e7:	89 c2                	mov    %eax,%edx
  8005e9:	bf 0a 00 00 00       	mov    $0xa,%edi
  8005ee:	83 ec 0c             	sub    $0xc,%esp
  8005f1:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  8005f5:	50                   	push   %eax
  8005f6:	ff 75 e0             	push   -0x20(%ebp)
  8005f9:	57                   	push   %edi
  8005fa:	51                   	push   %ecx
  8005fb:	52                   	push   %edx
  8005fc:	89 f2                	mov    %esi,%edx
  8005fe:	89 d8                	mov    %ebx,%eax
  800600:	e8 fe fb ff ff       	call   800203 <printnum>
  800605:	83 c4 20             	add    $0x20,%esp
  800608:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80060b:	e9 54 fd ff ff       	jmp    800364 <vprintfmt+0x1e>
  800610:	89 ca                	mov    %ecx,%edx
  800612:	8d 45 14             	lea    0x14(%ebp),%eax
  800615:	e8 92 fc ff ff       	call   8002ac <getuint>
  80061a:	89 d1                	mov    %edx,%ecx
  80061c:	89 c2                	mov    %eax,%edx
  80061e:	bf 08 00 00 00       	mov    $0x8,%edi
  800623:	eb c9                	jmp    8005ee <vprintfmt+0x2a8>
  800625:	83 ec 08             	sub    $0x8,%esp
  800628:	56                   	push   %esi
  800629:	6a 30                	push   $0x30
  80062b:	ff d3                	call   *%ebx
  80062d:	83 c4 08             	add    $0x8,%esp
  800630:	56                   	push   %esi
  800631:	6a 78                	push   $0x78
  800633:	ff d3                	call   *%ebx
  800635:	8b 45 14             	mov    0x14(%ebp),%eax
  800638:	8d 50 04             	lea    0x4(%eax),%edx
  80063b:	89 55 14             	mov    %edx,0x14(%ebp)
  80063e:	8b 10                	mov    (%eax),%edx
  800640:	b9 00 00 00 00       	mov    $0x0,%ecx
  800645:	83 c4 10             	add    $0x10,%esp
  800648:	bf 10 00 00 00       	mov    $0x10,%edi
  80064d:	eb 9f                	jmp    8005ee <vprintfmt+0x2a8>
  80064f:	89 ca                	mov    %ecx,%edx
  800651:	8d 45 14             	lea    0x14(%ebp),%eax
  800654:	e8 53 fc ff ff       	call   8002ac <getuint>
  800659:	89 d1                	mov    %edx,%ecx
  80065b:	89 c2                	mov    %eax,%edx
  80065d:	bf 10 00 00 00       	mov    $0x10,%edi
  800662:	eb 8a                	jmp    8005ee <vprintfmt+0x2a8>
  800664:	83 ec 08             	sub    $0x8,%esp
  800667:	56                   	push   %esi
  800668:	6a 25                	push   $0x25
  80066a:	ff d3                	call   *%ebx
  80066c:	83 c4 10             	add    $0x10,%esp
  80066f:	eb 97                	jmp    800608 <vprintfmt+0x2c2>
  800671:	83 ec 08             	sub    $0x8,%esp
  800674:	56                   	push   %esi
  800675:	6a 25                	push   $0x25
  800677:	ff d3                	call   *%ebx
  800679:	83 c4 10             	add    $0x10,%esp
  80067c:	89 f8                	mov    %edi,%eax
  80067e:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  800682:	74 05                	je     800689 <vprintfmt+0x343>
  800684:	83 e8 01             	sub    $0x1,%eax
  800687:	eb f5                	jmp    80067e <vprintfmt+0x338>
  800689:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  80068c:	e9 77 ff ff ff       	jmp    800608 <vprintfmt+0x2c2>

00800691 <vsnprintf>:
  800691:	55                   	push   %ebp
  800692:	89 e5                	mov    %esp,%ebp
  800694:	83 ec 18             	sub    $0x18,%esp
  800697:	8b 45 08             	mov    0x8(%ebp),%eax
  80069a:	8b 55 0c             	mov    0xc(%ebp),%edx
  80069d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  8006a0:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  8006a4:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  8006a7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  8006ae:	85 c0                	test   %eax,%eax
  8006b0:	74 26                	je     8006d8 <vsnprintf+0x47>
  8006b2:	85 d2                	test   %edx,%edx
  8006b4:	7e 22                	jle    8006d8 <vsnprintf+0x47>
  8006b6:	ff 75 14             	push   0x14(%ebp)
  8006b9:	ff 75 10             	push   0x10(%ebp)
  8006bc:	8d 45 ec             	lea    -0x14(%ebp),%eax
  8006bf:	50                   	push   %eax
  8006c0:	68 0c 03 80 00       	push   $0x80030c
  8006c5:	e8 7c fc ff ff       	call   800346 <vprintfmt>
  8006ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
  8006cd:	c6 00 00             	movb   $0x0,(%eax)
  8006d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
  8006d3:	83 c4 10             	add    $0x10,%esp
  8006d6:	c9                   	leave
  8006d7:	c3                   	ret
  8006d8:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8006dd:	eb f7                	jmp    8006d6 <vsnprintf+0x45>

008006df <snprintf>:
  8006df:	55                   	push   %ebp
  8006e0:	89 e5                	mov    %esp,%ebp
  8006e2:	83 ec 08             	sub    $0x8,%esp
  8006e5:	8d 45 14             	lea    0x14(%ebp),%eax
  8006e8:	50                   	push   %eax
  8006e9:	ff 75 10             	push   0x10(%ebp)
  8006ec:	ff 75 0c             	push   0xc(%ebp)
  8006ef:	ff 75 08             	push   0x8(%ebp)
  8006f2:	e8 9a ff ff ff       	call   800691 <vsnprintf>
  8006f7:	c9                   	leave
  8006f8:	c3                   	ret

008006f9 <strlen>:
  8006f9:	55                   	push   %ebp
  8006fa:	89 e5                	mov    %esp,%ebp
  8006fc:	8b 55 08             	mov    0x8(%ebp),%edx
  8006ff:	b8 00 00 00 00       	mov    $0x0,%eax
  800704:	eb 03                	jmp    800709 <strlen+0x10>
  800706:	83 c0 01             	add    $0x1,%eax
  800709:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  80070d:	75 f7                	jne    800706 <strlen+0xd>
  80070f:	5d                   	pop    %ebp
  800710:	c3                   	ret

00800711 <strnlen>:
  800711:	55                   	push   %ebp
  800712:	89 e5                	mov    %esp,%ebp
  800714:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800717:	8b 55 0c             	mov    0xc(%ebp),%edx
  80071a:	b8 00 00 00 00       	mov    $0x0,%eax
  80071f:	eb 03                	jmp    800724 <strnlen+0x13>
  800721:	83 c0 01             	add    $0x1,%eax
  800724:	39 d0                	cmp    %edx,%eax
  800726:	74 08                	je     800730 <strnlen+0x1f>
  800728:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  80072c:	75 f3                	jne    800721 <strnlen+0x10>
  80072e:	89 c2                	mov    %eax,%edx
  800730:	89 d0                	mov    %edx,%eax
  800732:	5d                   	pop    %ebp
  800733:	c3                   	ret

00800734 <strcpy>:
  800734:	55                   	push   %ebp
  800735:	89 e5                	mov    %esp,%ebp
  800737:	53                   	push   %ebx
  800738:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80073b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  80073e:	b8 00 00 00 00       	mov    $0x0,%eax
  800743:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  800747:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  80074a:	83 c0 01             	add    $0x1,%eax
  80074d:	84 d2                	test   %dl,%dl
  80074f:	75 f2                	jne    800743 <strcpy+0xf>
  800751:	89 c8                	mov    %ecx,%eax
  800753:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800756:	c9                   	leave
  800757:	c3                   	ret

00800758 <strcat>:
  800758:	55                   	push   %ebp
  800759:	89 e5                	mov    %esp,%ebp
  80075b:	53                   	push   %ebx
  80075c:	83 ec 10             	sub    $0x10,%esp
  80075f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800762:	53                   	push   %ebx
  800763:	e8 91 ff ff ff       	call   8006f9 <strlen>
  800768:	83 c4 08             	add    $0x8,%esp
  80076b:	ff 75 0c             	push   0xc(%ebp)
  80076e:	01 d8                	add    %ebx,%eax
  800770:	50                   	push   %eax
  800771:	e8 be ff ff ff       	call   800734 <strcpy>
  800776:	89 d8                	mov    %ebx,%eax
  800778:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  80077b:	c9                   	leave
  80077c:	c3                   	ret

0080077d <strncpy>:
  80077d:	55                   	push   %ebp
  80077e:	89 e5                	mov    %esp,%ebp
  800780:	56                   	push   %esi
  800781:	53                   	push   %ebx
  800782:	8b 75 08             	mov    0x8(%ebp),%esi
  800785:	8b 55 0c             	mov    0xc(%ebp),%edx
  800788:	89 f3                	mov    %esi,%ebx
  80078a:	03 5d 10             	add    0x10(%ebp),%ebx
  80078d:	89 f0                	mov    %esi,%eax
  80078f:	eb 0f                	jmp    8007a0 <strncpy+0x23>
  800791:	83 c0 01             	add    $0x1,%eax
  800794:	0f b6 0a             	movzbl (%edx),%ecx
  800797:	88 48 ff             	mov    %cl,-0x1(%eax)
  80079a:	80 f9 01             	cmp    $0x1,%cl
  80079d:	83 da ff             	sbb    $0xffffffff,%edx
  8007a0:	39 d8                	cmp    %ebx,%eax
  8007a2:	75 ed                	jne    800791 <strncpy+0x14>
  8007a4:	89 f0                	mov    %esi,%eax
  8007a6:	5b                   	pop    %ebx
  8007a7:	5e                   	pop    %esi
  8007a8:	5d                   	pop    %ebp
  8007a9:	c3                   	ret

008007aa <strlcpy>:
  8007aa:	55                   	push   %ebp
  8007ab:	89 e5                	mov    %esp,%ebp
  8007ad:	56                   	push   %esi
  8007ae:	53                   	push   %ebx
  8007af:	8b 75 08             	mov    0x8(%ebp),%esi
  8007b2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8007b5:	8b 55 10             	mov    0x10(%ebp),%edx
  8007b8:	89 f0                	mov    %esi,%eax
  8007ba:	85 d2                	test   %edx,%edx
  8007bc:	74 21                	je     8007df <strlcpy+0x35>
  8007be:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  8007c2:	89 f2                	mov    %esi,%edx
  8007c4:	eb 09                	jmp    8007cf <strlcpy+0x25>
  8007c6:	83 c1 01             	add    $0x1,%ecx
  8007c9:	83 c2 01             	add    $0x1,%edx
  8007cc:	88 5a ff             	mov    %bl,-0x1(%edx)
  8007cf:	39 c2                	cmp    %eax,%edx
  8007d1:	74 09                	je     8007dc <strlcpy+0x32>
  8007d3:	0f b6 19             	movzbl (%ecx),%ebx
  8007d6:	84 db                	test   %bl,%bl
  8007d8:	75 ec                	jne    8007c6 <strlcpy+0x1c>
  8007da:	89 d0                	mov    %edx,%eax
  8007dc:	c6 00 00             	movb   $0x0,(%eax)
  8007df:	29 f0                	sub    %esi,%eax
  8007e1:	5b                   	pop    %ebx
  8007e2:	5e                   	pop    %esi
  8007e3:	5d                   	pop    %ebp
  8007e4:	c3                   	ret

008007e5 <strcmp>:
  8007e5:	55                   	push   %ebp
  8007e6:	89 e5                	mov    %esp,%ebp
  8007e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8007eb:	8b 55 0c             	mov    0xc(%ebp),%edx
  8007ee:	eb 06                	jmp    8007f6 <strcmp+0x11>
  8007f0:	83 c1 01             	add    $0x1,%ecx
  8007f3:	83 c2 01             	add    $0x1,%edx
  8007f6:	0f b6 01             	movzbl (%ecx),%eax
  8007f9:	84 c0                	test   %al,%al
  8007fb:	74 04                	je     800801 <strcmp+0x1c>
  8007fd:	3a 02                	cmp    (%edx),%al
  8007ff:	74 ef                	je     8007f0 <strcmp+0xb>
  800801:	0f b6 c0             	movzbl %al,%eax
  800804:	0f b6 12             	movzbl (%edx),%edx
  800807:	29 d0                	sub    %edx,%eax
  800809:	5d                   	pop    %ebp
  80080a:	c3                   	ret

0080080b <strncmp>:
  80080b:	55                   	push   %ebp
  80080c:	89 e5                	mov    %esp,%ebp
  80080e:	53                   	push   %ebx
  80080f:	8b 45 08             	mov    0x8(%ebp),%eax
  800812:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800815:	8b 55 10             	mov    0x10(%ebp),%edx
  800818:	eb 09                	jmp    800823 <strncmp+0x18>
  80081a:	83 ea 01             	sub    $0x1,%edx
  80081d:	83 c0 01             	add    $0x1,%eax
  800820:	83 c1 01             	add    $0x1,%ecx
  800823:	85 d2                	test   %edx,%edx
  800825:	74 18                	je     80083f <strncmp+0x34>
  800827:	0f b6 18             	movzbl (%eax),%ebx
  80082a:	84 db                	test   %bl,%bl
  80082c:	74 04                	je     800832 <strncmp+0x27>
  80082e:	3a 19                	cmp    (%ecx),%bl
  800830:	74 e8                	je     80081a <strncmp+0xf>
  800832:	0f b6 00             	movzbl (%eax),%eax
  800835:	0f b6 11             	movzbl (%ecx),%edx
  800838:	29 d0                	sub    %edx,%eax
  80083a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  80083d:	c9                   	leave
  80083e:	c3                   	ret
  80083f:	b8 00 00 00 00       	mov    $0x0,%eax
  800844:	eb f4                	jmp    80083a <strncmp+0x2f>

00800846 <strchr>:
  800846:	55                   	push   %ebp
  800847:	89 e5                	mov    %esp,%ebp
  800849:	8b 45 08             	mov    0x8(%ebp),%eax
  80084c:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  800850:	eb 03                	jmp    800855 <strchr+0xf>
  800852:	83 c0 01             	add    $0x1,%eax
  800855:	0f b6 10             	movzbl (%eax),%edx
  800858:	84 d2                	test   %dl,%dl
  80085a:	74 06                	je     800862 <strchr+0x1c>
  80085c:	38 ca                	cmp    %cl,%dl
  80085e:	75 f2                	jne    800852 <strchr+0xc>
  800860:	eb 05                	jmp    800867 <strchr+0x21>
  800862:	b8 00 00 00 00       	mov    $0x0,%eax
  800867:	5d                   	pop    %ebp
  800868:	c3                   	ret

00800869 <strfind>:
  800869:	55                   	push   %ebp
  80086a:	89 e5                	mov    %esp,%ebp
  80086c:	8b 45 08             	mov    0x8(%ebp),%eax
  80086f:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  800873:	0f b6 10             	movzbl (%eax),%edx
  800876:	38 ca                	cmp    %cl,%dl
  800878:	74 09                	je     800883 <strfind+0x1a>
  80087a:	84 d2                	test   %dl,%dl
  80087c:	74 05                	je     800883 <strfind+0x1a>
  80087e:	83 c0 01             	add    $0x1,%eax
  800881:	eb f0                	jmp    800873 <strfind+0xa>
  800883:	5d                   	pop    %ebp
  800884:	c3                   	ret

00800885 <memset>:
  800885:	55                   	push   %ebp
  800886:	89 e5                	mov    %esp,%ebp
  800888:	57                   	push   %edi
  800889:	8b 55 08             	mov    0x8(%ebp),%edx
  80088c:	8b 4d 10             	mov    0x10(%ebp),%ecx
  80088f:	85 c9                	test   %ecx,%ecx
  800891:	74 24                	je     8008b7 <memset+0x32>
  800893:	89 d0                	mov    %edx,%eax
  800895:	09 c8                	or     %ecx,%eax
  800897:	a8 03                	test   $0x3,%al
  800899:	75 14                	jne    8008af <memset+0x2a>
  80089b:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  80089f:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  8008a5:	c1 e9 02             	shr    $0x2,%ecx
  8008a8:	89 d7                	mov    %edx,%edi
  8008aa:	fc                   	cld
  8008ab:	f3 ab                	rep stos %eax,%es:(%edi)
  8008ad:	eb 08                	jmp    8008b7 <memset+0x32>
  8008af:	89 d7                	mov    %edx,%edi
  8008b1:	8b 45 0c             	mov    0xc(%ebp),%eax
  8008b4:	fc                   	cld
  8008b5:	f3 aa                	rep stos %al,%es:(%edi)
  8008b7:	89 d0                	mov    %edx,%eax
  8008b9:	8b 7d fc             	mov    -0x4(%ebp),%edi
  8008bc:	c9                   	leave
  8008bd:	c3                   	ret

008008be <memmove>:
  8008be:	55                   	push   %ebp
  8008bf:	89 e5                	mov    %esp,%ebp
  8008c1:	57                   	push   %edi
  8008c2:	56                   	push   %esi
  8008c3:	8b 45 08             	mov    0x8(%ebp),%eax
  8008c6:	8b 75 0c             	mov    0xc(%ebp),%esi
  8008c9:	8b 4d 10             	mov    0x10(%ebp),%ecx
  8008cc:	39 c6                	cmp    %eax,%esi
  8008ce:	73 32                	jae    800902 <memmove+0x44>
  8008d0:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  8008d3:	39 d0                	cmp    %edx,%eax
  8008d5:	73 2b                	jae    800902 <memmove+0x44>
  8008d7:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  8008da:	89 fe                	mov    %edi,%esi
  8008dc:	09 ce                	or     %ecx,%esi
  8008de:	09 d6                	or     %edx,%esi
  8008e0:	f7 c6 03 00 00 00    	test   $0x3,%esi
  8008e6:	75 0e                	jne    8008f6 <memmove+0x38>
  8008e8:	83 ef 04             	sub    $0x4,%edi
  8008eb:	8d 72 fc             	lea    -0x4(%edx),%esi
  8008ee:	c1 e9 02             	shr    $0x2,%ecx
  8008f1:	fd                   	std
  8008f2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  8008f4:	eb 09                	jmp    8008ff <memmove+0x41>
  8008f6:	83 ef 01             	sub    $0x1,%edi
  8008f9:	8d 72 ff             	lea    -0x1(%edx),%esi
  8008fc:	fd                   	std
  8008fd:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  8008ff:	fc                   	cld
  800900:	eb 1a                	jmp    80091c <memmove+0x5e>
  800902:	89 c2                	mov    %eax,%edx
  800904:	09 ca                	or     %ecx,%edx
  800906:	09 f2                	or     %esi,%edx
  800908:	f6 c2 03             	test   $0x3,%dl
  80090b:	75 0a                	jne    800917 <memmove+0x59>
  80090d:	c1 e9 02             	shr    $0x2,%ecx
  800910:	89 c7                	mov    %eax,%edi
  800912:	fc                   	cld
  800913:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800915:	eb 05                	jmp    80091c <memmove+0x5e>
  800917:	89 c7                	mov    %eax,%edi
  800919:	fc                   	cld
  80091a:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  80091c:	5e                   	pop    %esi
  80091d:	5f                   	pop    %edi
  80091e:	5d                   	pop    %ebp
  80091f:	c3                   	ret

00800920 <memcpy>:
  800920:	55                   	push   %ebp
  800921:	89 e5                	mov    %esp,%ebp
  800923:	83 ec 0c             	sub    $0xc,%esp
  800926:	ff 75 10             	push   0x10(%ebp)
  800929:	ff 75 0c             	push   0xc(%ebp)
  80092c:	ff 75 08             	push   0x8(%ebp)
  80092f:	e8 8a ff ff ff       	call   8008be <memmove>
  800934:	c9                   	leave
  800935:	c3                   	ret

00800936 <memcmp>:
  800936:	55                   	push   %ebp
  800937:	89 e5                	mov    %esp,%ebp
  800939:	56                   	push   %esi
  80093a:	53                   	push   %ebx
  80093b:	8b 45 08             	mov    0x8(%ebp),%eax
  80093e:	8b 55 0c             	mov    0xc(%ebp),%edx
  800941:	89 c6                	mov    %eax,%esi
  800943:	03 75 10             	add    0x10(%ebp),%esi
  800946:	eb 06                	jmp    80094e <memcmp+0x18>
  800948:	83 c0 01             	add    $0x1,%eax
  80094b:	83 c2 01             	add    $0x1,%edx
  80094e:	39 f0                	cmp    %esi,%eax
  800950:	74 14                	je     800966 <memcmp+0x30>
  800952:	0f b6 08             	movzbl (%eax),%ecx
  800955:	0f b6 1a             	movzbl (%edx),%ebx
  800958:	38 d9                	cmp    %bl,%cl
  80095a:	74 ec                	je     800948 <memcmp+0x12>
  80095c:	0f b6 c1             	movzbl %cl,%eax
  80095f:	0f b6 db             	movzbl %bl,%ebx
  800962:	29 d8                	sub    %ebx,%eax
  800964:	eb 05                	jmp    80096b <memcmp+0x35>
  800966:	b8 00 00 00 00       	mov    $0x0,%eax
  80096b:	5b                   	pop    %ebx
  80096c:	5e                   	pop    %esi
  80096d:	5d                   	pop    %ebp
  80096e:	c3                   	ret

0080096f <memfind>:
  80096f:	55                   	push   %ebp
  800970:	89 e5                	mov    %esp,%ebp
  800972:	8b 45 08             	mov    0x8(%ebp),%eax
  800975:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800978:	89 c2                	mov    %eax,%edx
  80097a:	03 55 10             	add    0x10(%ebp),%edx
  80097d:	eb 03                	jmp    800982 <memfind+0x13>
  80097f:	83 c0 01             	add    $0x1,%eax
  800982:	39 d0                	cmp    %edx,%eax
  800984:	73 04                	jae    80098a <memfind+0x1b>
  800986:	38 08                	cmp    %cl,(%eax)
  800988:	75 f5                	jne    80097f <memfind+0x10>
  80098a:	5d                   	pop    %ebp
  80098b:	c3                   	ret

0080098c <strtol>:
  80098c:	55                   	push   %ebp
  80098d:	89 e5                	mov    %esp,%ebp
  80098f:	57                   	push   %edi
  800990:	56                   	push   %esi
  800991:	53                   	push   %ebx
  800992:	8b 55 08             	mov    0x8(%ebp),%edx
  800995:	8b 5d 10             	mov    0x10(%ebp),%ebx
  800998:	eb 03                	jmp    80099d <strtol+0x11>
  80099a:	83 c2 01             	add    $0x1,%edx
  80099d:	0f b6 02             	movzbl (%edx),%eax
  8009a0:	3c 20                	cmp    $0x20,%al
  8009a2:	74 f6                	je     80099a <strtol+0xe>
  8009a4:	3c 09                	cmp    $0x9,%al
  8009a6:	74 f2                	je     80099a <strtol+0xe>
  8009a8:	3c 2b                	cmp    $0x2b,%al
  8009aa:	74 2a                	je     8009d6 <strtol+0x4a>
  8009ac:	bf 00 00 00 00       	mov    $0x0,%edi
  8009b1:	3c 2d                	cmp    $0x2d,%al
  8009b3:	74 2b                	je     8009e0 <strtol+0x54>
  8009b5:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  8009bb:	75 0f                	jne    8009cc <strtol+0x40>
  8009bd:	80 3a 30             	cmpb   $0x30,(%edx)
  8009c0:	74 28                	je     8009ea <strtol+0x5e>
  8009c2:	85 db                	test   %ebx,%ebx
  8009c4:	b8 0a 00 00 00       	mov    $0xa,%eax
  8009c9:	0f 44 d8             	cmove  %eax,%ebx
  8009cc:	b9 00 00 00 00       	mov    $0x0,%ecx
  8009d1:	89 5d 10             	mov    %ebx,0x10(%ebp)
  8009d4:	eb 46                	jmp    800a1c <strtol+0x90>
  8009d6:	83 c2 01             	add    $0x1,%edx
  8009d9:	bf 00 00 00 00       	mov    $0x0,%edi
  8009de:	eb d5                	jmp    8009b5 <strtol+0x29>
  8009e0:	83 c2 01             	add    $0x1,%edx
  8009e3:	bf 01 00 00 00       	mov    $0x1,%edi
  8009e8:	eb cb                	jmp    8009b5 <strtol+0x29>
  8009ea:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  8009ee:	74 0e                	je     8009fe <strtol+0x72>
  8009f0:	85 db                	test   %ebx,%ebx
  8009f2:	75 d8                	jne    8009cc <strtol+0x40>
  8009f4:	83 c2 01             	add    $0x1,%edx
  8009f7:	bb 08 00 00 00       	mov    $0x8,%ebx
  8009fc:	eb ce                	jmp    8009cc <strtol+0x40>
  8009fe:	83 c2 02             	add    $0x2,%edx
  800a01:	bb 10 00 00 00       	mov    $0x10,%ebx
  800a06:	eb c4                	jmp    8009cc <strtol+0x40>
  800a08:	0f be c0             	movsbl %al,%eax
  800a0b:	83 e8 30             	sub    $0x30,%eax
  800a0e:	3b 45 10             	cmp    0x10(%ebp),%eax
  800a11:	7d 3a                	jge    800a4d <strtol+0xc1>
  800a13:	83 c2 01             	add    $0x1,%edx
  800a16:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  800a1a:	01 c1                	add    %eax,%ecx
  800a1c:	0f b6 02             	movzbl (%edx),%eax
  800a1f:	8d 70 d0             	lea    -0x30(%eax),%esi
  800a22:	89 f3                	mov    %esi,%ebx
  800a24:	80 fb 09             	cmp    $0x9,%bl
  800a27:	76 df                	jbe    800a08 <strtol+0x7c>
  800a29:	8d 70 9f             	lea    -0x61(%eax),%esi
  800a2c:	89 f3                	mov    %esi,%ebx
  800a2e:	80 fb 19             	cmp    $0x19,%bl
  800a31:	77 08                	ja     800a3b <strtol+0xaf>
  800a33:	0f be c0             	movsbl %al,%eax
  800a36:	83 e8 57             	sub    $0x57,%eax
  800a39:	eb d3                	jmp    800a0e <strtol+0x82>
  800a3b:	8d 70 bf             	lea    -0x41(%eax),%esi
  800a3e:	89 f3                	mov    %esi,%ebx
  800a40:	80 fb 19             	cmp    $0x19,%bl
  800a43:	77 08                	ja     800a4d <strtol+0xc1>
  800a45:	0f be c0             	movsbl %al,%eax
  800a48:	83 e8 37             	sub    $0x37,%eax
  800a4b:	eb c1                	jmp    800a0e <strtol+0x82>
  800a4d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  800a51:	74 05                	je     800a58 <strtol+0xcc>
  800a53:	8b 45 0c             	mov    0xc(%ebp),%eax
  800a56:	89 10                	mov    %edx,(%eax)
  800a58:	89 c8                	mov    %ecx,%eax
  800a5a:	f7 d8                	neg    %eax
  800a5c:	85 ff                	test   %edi,%edi
  800a5e:	0f 45 c8             	cmovne %eax,%ecx
  800a61:	89 c8                	mov    %ecx,%eax
  800a63:	5b                   	pop    %ebx
  800a64:	5e                   	pop    %esi
  800a65:	5f                   	pop    %edi
  800a66:	5d                   	pop    %ebp
  800a67:	c3                   	ret

00800a68 <syscall>:
  800a68:	55                   	push   %ebp
  800a69:	89 e5                	mov    %esp,%ebp
  800a6b:	57                   	push   %edi
  800a6c:	56                   	push   %esi
  800a6d:	53                   	push   %ebx
  800a6e:	83 ec 1c             	sub    $0x1c,%esp
  800a71:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800a74:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  800a77:	89 ca                	mov    %ecx,%edx
  800a79:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a7c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800a7f:	8b 7d 10             	mov    0x10(%ebp),%edi
  800a82:	8b 75 14             	mov    0x14(%ebp),%esi
  800a85:	cd 30                	int    $0x30
  800a87:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  800a8b:	74 04                	je     800a91 <syscall+0x29>
  800a8d:	85 c0                	test   %eax,%eax
  800a8f:	7f 08                	jg     800a99 <syscall+0x31>
  800a91:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800a94:	5b                   	pop    %ebx
  800a95:	5e                   	pop    %esi
  800a96:	5f                   	pop    %edi
  800a97:	5d                   	pop    %ebp
  800a98:	c3                   	ret
  800a99:	83 ec 0c             	sub    $0xc,%esp
  800a9c:	50                   	push   %eax
  800a9d:	ff 75 e0             	push   -0x20(%ebp)
  800aa0:	68 20 10 80 00       	push   $0x801020
  800aa5:	6a 1e                	push   $0x1e
  800aa7:	68 3d 10 80 00       	push   $0x80103d
  800aac:	e8 63 f6 ff ff       	call   800114 <_panic>

00800ab1 <sys_cputs>:
  800ab1:	55                   	push   %ebp
  800ab2:	89 e5                	mov    %esp,%ebp
  800ab4:	83 ec 08             	sub    $0x8,%esp
  800ab7:	6a 00                	push   $0x0
  800ab9:	6a 00                	push   $0x0
  800abb:	6a 00                	push   $0x0
  800abd:	ff 75 0c             	push   0xc(%ebp)
  800ac0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800ac3:	ba 00 00 00 00       	mov    $0x0,%edx
  800ac8:	b8 00 00 00 00       	mov    $0x0,%eax
  800acd:	e8 96 ff ff ff       	call   800a68 <syscall>
  800ad2:	83 c4 10             	add    $0x10,%esp
  800ad5:	c9                   	leave
  800ad6:	c3                   	ret

00800ad7 <sys_cgetc>:
  800ad7:	55                   	push   %ebp
  800ad8:	89 e5                	mov    %esp,%ebp
  800ada:	83 ec 08             	sub    $0x8,%esp
  800add:	6a 00                	push   $0x0
  800adf:	6a 00                	push   $0x0
  800ae1:	6a 00                	push   $0x0
  800ae3:	6a 00                	push   $0x0
  800ae5:	b9 00 00 00 00       	mov    $0x0,%ecx
  800aea:	ba 00 00 00 00       	mov    $0x0,%edx
  800aef:	b8 01 00 00 00       	mov    $0x1,%eax
  800af4:	e8 6f ff ff ff       	call   800a68 <syscall>
  800af9:	c9                   	leave
  800afa:	c3                   	ret

00800afb <sys_env_destroy>:
  800afb:	55                   	push   %ebp
  800afc:	89 e5                	mov    %esp,%ebp
  800afe:	83 ec 08             	sub    $0x8,%esp
  800b01:	6a 00                	push   $0x0
  800b03:	6a 00                	push   $0x0
  800b05:	6a 00                	push   $0x0
  800b07:	6a 00                	push   $0x0
  800b09:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b0c:	ba 01 00 00 00       	mov    $0x1,%edx
  800b11:	b8 03 00 00 00       	mov    $0x3,%eax
  800b16:	e8 4d ff ff ff       	call   800a68 <syscall>
  800b1b:	c9                   	leave
  800b1c:	c3                   	ret

00800b1d <sys_getenvid>:
  800b1d:	55                   	push   %ebp
  800b1e:	89 e5                	mov    %esp,%ebp
  800b20:	83 ec 08             	sub    $0x8,%esp
  800b23:	6a 00                	push   $0x0
  800b25:	6a 00                	push   $0x0
  800b27:	6a 00                	push   $0x0
  800b29:	6a 00                	push   $0x0
  800b2b:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b30:	ba 00 00 00 00       	mov    $0x0,%edx
  800b35:	b8 02 00 00 00       	mov    $0x2,%eax
  800b3a:	e8 29 ff ff ff       	call   800a68 <syscall>
  800b3f:	c9                   	leave
  800b40:	c3                   	ret

00800b41 <sys_yield>:
  800b41:	55                   	push   %ebp
  800b42:	89 e5                	mov    %esp,%ebp
  800b44:	83 ec 08             	sub    $0x8,%esp
  800b47:	6a 00                	push   $0x0
  800b49:	6a 00                	push   $0x0
  800b4b:	6a 00                	push   $0x0
  800b4d:	6a 00                	push   $0x0
  800b4f:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b54:	ba 00 00 00 00       	mov    $0x0,%edx
  800b59:	b8 0a 00 00 00       	mov    $0xa,%eax
  800b5e:	e8 05 ff ff ff       	call   800a68 <syscall>
  800b63:	83 c4 10             	add    $0x10,%esp
  800b66:	c9                   	leave
  800b67:	c3                   	ret

00800b68 <sys_page_alloc>:
  800b68:	55                   	push   %ebp
  800b69:	89 e5                	mov    %esp,%ebp
  800b6b:	83 ec 08             	sub    $0x8,%esp
  800b6e:	6a 00                	push   $0x0
  800b70:	6a 00                	push   $0x0
  800b72:	ff 75 10             	push   0x10(%ebp)
  800b75:	ff 75 0c             	push   0xc(%ebp)
  800b78:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b7b:	ba 01 00 00 00       	mov    $0x1,%edx
  800b80:	b8 04 00 00 00       	mov    $0x4,%eax
  800b85:	e8 de fe ff ff       	call   800a68 <syscall>
  800b8a:	c9                   	leave
  800b8b:	c3                   	ret

00800b8c <sys_page_map>:
  800b8c:	55                   	push   %ebp
  800b8d:	89 e5                	mov    %esp,%ebp
  800b8f:	83 ec 08             	sub    $0x8,%esp
  800b92:	ff 75 18             	push   0x18(%ebp)
  800b95:	ff 75 14             	push   0x14(%ebp)
  800b98:	ff 75 10             	push   0x10(%ebp)
  800b9b:	ff 75 0c             	push   0xc(%ebp)
  800b9e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800ba1:	ba 01 00 00 00       	mov    $0x1,%edx
  800ba6:	b8 05 00 00 00       	mov    $0x5,%eax
  800bab:	e8 b8 fe ff ff       	call   800a68 <syscall>
  800bb0:	c9                   	leave
  800bb1:	c3                   	ret

00800bb2 <sys_page_unmap>:
  800bb2:	55                   	push   %ebp
  800bb3:	89 e5                	mov    %esp,%ebp
  800bb5:	83 ec 08             	sub    $0x8,%esp
  800bb8:	6a 00                	push   $0x0
  800bba:	6a 00                	push   $0x0
  800bbc:	6a 00                	push   $0x0
  800bbe:	ff 75 0c             	push   0xc(%ebp)
  800bc1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bc4:	ba 01 00 00 00       	mov    $0x1,%edx
  800bc9:	b8 06 00 00 00       	mov    $0x6,%eax
  800bce:	e8 95 fe ff ff       	call   800a68 <syscall>
  800bd3:	c9                   	leave
  800bd4:	c3                   	ret

00800bd5 <sys_env_set_status>:
  800bd5:	55                   	push   %ebp
  800bd6:	89 e5                	mov    %esp,%ebp
  800bd8:	83 ec 08             	sub    $0x8,%esp
  800bdb:	6a 00                	push   $0x0
  800bdd:	6a 00                	push   $0x0
  800bdf:	6a 00                	push   $0x0
  800be1:	ff 75 0c             	push   0xc(%ebp)
  800be4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800be7:	ba 01 00 00 00       	mov    $0x1,%edx
  800bec:	b8 08 00 00 00       	mov    $0x8,%eax
  800bf1:	e8 72 fe ff ff       	call   800a68 <syscall>
  800bf6:	c9                   	leave
  800bf7:	c3                   	ret

00800bf8 <sys_env_set_pgfault_upcall>:
  800bf8:	55                   	push   %ebp
  800bf9:	89 e5                	mov    %esp,%ebp
  800bfb:	83 ec 08             	sub    $0x8,%esp
  800bfe:	6a 00                	push   $0x0
  800c00:	6a 00                	push   $0x0
  800c02:	6a 00                	push   $0x0
  800c04:	ff 75 0c             	push   0xc(%ebp)
  800c07:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c0a:	ba 01 00 00 00       	mov    $0x1,%edx
  800c0f:	b8 09 00 00 00       	mov    $0x9,%eax
  800c14:	e8 4f fe ff ff       	call   800a68 <syscall>
  800c19:	c9                   	leave
  800c1a:	c3                   	ret

00800c1b <sys_ipc_try_send>:
  800c1b:	55                   	push   %ebp
  800c1c:	89 e5                	mov    %esp,%ebp
  800c1e:	83 ec 08             	sub    $0x8,%esp
  800c21:	6a 00                	push   $0x0
  800c23:	ff 75 14             	push   0x14(%ebp)
  800c26:	ff 75 10             	push   0x10(%ebp)
  800c29:	ff 75 0c             	push   0xc(%ebp)
  800c2c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c2f:	ba 00 00 00 00       	mov    $0x0,%edx
  800c34:	b8 0c 00 00 00       	mov    $0xc,%eax
  800c39:	e8 2a fe ff ff       	call   800a68 <syscall>
  800c3e:	c9                   	leave
  800c3f:	c3                   	ret

00800c40 <sys_ipc_recv>:
  800c40:	55                   	push   %ebp
  800c41:	89 e5                	mov    %esp,%ebp
  800c43:	83 ec 08             	sub    $0x8,%esp
  800c46:	6a 00                	push   $0x0
  800c48:	6a 00                	push   $0x0
  800c4a:	6a 00                	push   $0x0
  800c4c:	6a 00                	push   $0x0
  800c4e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c51:	ba 01 00 00 00       	mov    $0x1,%edx
  800c56:	b8 0d 00 00 00       	mov    $0xd,%eax
  800c5b:	e8 08 fe ff ff       	call   800a68 <syscall>
  800c60:	c9                   	leave
  800c61:	c3                   	ret

00800c62 <set_pgfault_handler>:
  800c62:	55                   	push   %ebp
  800c63:	89 e5                	mov    %esp,%ebp
  800c65:	83 ec 08             	sub    $0x8,%esp
  800c68:	83 3d 08 20 80 00 00 	cmpl   $0x0,0x802008
  800c6f:	74 0a                	je     800c7b <set_pgfault_handler+0x19>
  800c71:	8b 45 08             	mov    0x8(%ebp),%eax
  800c74:	a3 08 20 80 00       	mov    %eax,0x802008
  800c79:	c9                   	leave
  800c7a:	c3                   	ret
  800c7b:	83 ec 04             	sub    $0x4,%esp
  800c7e:	6a 07                	push   $0x7
  800c80:	68 00 f0 bf ee       	push   $0xeebff000
  800c85:	6a 00                	push   $0x0
  800c87:	e8 dc fe ff ff       	call   800b68 <sys_page_alloc>
  800c8c:	83 c4 10             	add    $0x10,%esp
  800c8f:	85 c0                	test   %eax,%eax
  800c91:	78 e6                	js     800c79 <set_pgfault_handler+0x17>
  800c93:	83 ec 08             	sub    $0x8,%esp
  800c96:	68 ab 0c 80 00       	push   $0x800cab
  800c9b:	6a 00                	push   $0x0
  800c9d:	e8 56 ff ff ff       	call   800bf8 <sys_env_set_pgfault_upcall>
  800ca2:	83 c4 10             	add    $0x10,%esp
  800ca5:	85 c0                	test   %eax,%eax
  800ca7:	79 c8                	jns    800c71 <set_pgfault_handler+0xf>
  800ca9:	eb ce                	jmp    800c79 <set_pgfault_handler+0x17>

00800cab <_pgfault_upcall>:
  800cab:	54                   	push   %esp
  800cac:	a1 08 20 80 00       	mov    0x802008,%eax
  800cb1:	ff d0                	call   *%eax
  800cb3:	83 c4 04             	add    $0x4,%esp
  800cb6:	8b 44 24 28          	mov    0x28(%esp),%eax
  800cba:	8b 5c 24 30          	mov    0x30(%esp),%ebx
  800cbe:	83 eb 04             	sub    $0x4,%ebx
  800cc1:	89 03                	mov    %eax,(%ebx)
  800cc3:	89 5c 24 30          	mov    %ebx,0x30(%esp)
  800cc7:	58                   	pop    %eax
  800cc8:	58                   	pop    %eax
  800cc9:	61                   	popa
  800cca:	83 c4 04             	add    $0x4,%esp
  800ccd:	9d                   	popf
  800cce:	5c                   	pop    %esp
  800ccf:	c3                   	ret

00800cd0 <__udivdi3>:
  800cd0:	f3 0f 1e fb          	endbr32
  800cd4:	55                   	push   %ebp
  800cd5:	57                   	push   %edi
  800cd6:	56                   	push   %esi
  800cd7:	53                   	push   %ebx
  800cd8:	83 ec 1c             	sub    $0x1c,%esp
  800cdb:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800cdf:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  800ce3:	8b 74 24 34          	mov    0x34(%esp),%esi
  800ce7:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  800ceb:	85 c0                	test   %eax,%eax
  800ced:	75 19                	jne    800d08 <__udivdi3+0x38>
  800cef:	39 de                	cmp    %ebx,%esi
  800cf1:	73 4d                	jae    800d40 <__udivdi3+0x70>
  800cf3:	31 ff                	xor    %edi,%edi
  800cf5:	89 e8                	mov    %ebp,%eax
  800cf7:	89 f2                	mov    %esi,%edx
  800cf9:	f7 f3                	div    %ebx
  800cfb:	89 fa                	mov    %edi,%edx
  800cfd:	83 c4 1c             	add    $0x1c,%esp
  800d00:	5b                   	pop    %ebx
  800d01:	5e                   	pop    %esi
  800d02:	5f                   	pop    %edi
  800d03:	5d                   	pop    %ebp
  800d04:	c3                   	ret
  800d05:	8d 76 00             	lea    0x0(%esi),%esi
  800d08:	39 c6                	cmp    %eax,%esi
  800d0a:	73 14                	jae    800d20 <__udivdi3+0x50>
  800d0c:	31 ff                	xor    %edi,%edi
  800d0e:	31 c0                	xor    %eax,%eax
  800d10:	89 fa                	mov    %edi,%edx
  800d12:	83 c4 1c             	add    $0x1c,%esp
  800d15:	5b                   	pop    %ebx
  800d16:	5e                   	pop    %esi
  800d17:	5f                   	pop    %edi
  800d18:	5d                   	pop    %ebp
  800d19:	c3                   	ret
  800d1a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800d20:	0f bd f8             	bsr    %eax,%edi
  800d23:	83 f7 1f             	xor    $0x1f,%edi
  800d26:	75 48                	jne    800d70 <__udivdi3+0xa0>
  800d28:	39 f0                	cmp    %esi,%eax
  800d2a:	72 06                	jb     800d32 <__udivdi3+0x62>
  800d2c:	31 c0                	xor    %eax,%eax
  800d2e:	39 dd                	cmp    %ebx,%ebp
  800d30:	72 de                	jb     800d10 <__udivdi3+0x40>
  800d32:	b8 01 00 00 00       	mov    $0x1,%eax
  800d37:	eb d7                	jmp    800d10 <__udivdi3+0x40>
  800d39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800d40:	89 d9                	mov    %ebx,%ecx
  800d42:	85 db                	test   %ebx,%ebx
  800d44:	75 0b                	jne    800d51 <__udivdi3+0x81>
  800d46:	b8 01 00 00 00       	mov    $0x1,%eax
  800d4b:	31 d2                	xor    %edx,%edx
  800d4d:	f7 f3                	div    %ebx
  800d4f:	89 c1                	mov    %eax,%ecx
  800d51:	31 d2                	xor    %edx,%edx
  800d53:	89 f0                	mov    %esi,%eax
  800d55:	f7 f1                	div    %ecx
  800d57:	89 c6                	mov    %eax,%esi
  800d59:	89 e8                	mov    %ebp,%eax
  800d5b:	89 f7                	mov    %esi,%edi
  800d5d:	f7 f1                	div    %ecx
  800d5f:	89 fa                	mov    %edi,%edx
  800d61:	83 c4 1c             	add    $0x1c,%esp
  800d64:	5b                   	pop    %ebx
  800d65:	5e                   	pop    %esi
  800d66:	5f                   	pop    %edi
  800d67:	5d                   	pop    %ebp
  800d68:	c3                   	ret
  800d69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800d70:	89 f9                	mov    %edi,%ecx
  800d72:	ba 20 00 00 00       	mov    $0x20,%edx
  800d77:	29 fa                	sub    %edi,%edx
  800d79:	d3 e0                	shl    %cl,%eax
  800d7b:	89 44 24 08          	mov    %eax,0x8(%esp)
  800d7f:	89 d1                	mov    %edx,%ecx
  800d81:	89 d8                	mov    %ebx,%eax
  800d83:	d3 e8                	shr    %cl,%eax
  800d85:	89 c1                	mov    %eax,%ecx
  800d87:	8b 44 24 08          	mov    0x8(%esp),%eax
  800d8b:	09 c1                	or     %eax,%ecx
  800d8d:	89 f0                	mov    %esi,%eax
  800d8f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800d93:	89 f9                	mov    %edi,%ecx
  800d95:	d3 e3                	shl    %cl,%ebx
  800d97:	89 d1                	mov    %edx,%ecx
  800d99:	d3 e8                	shr    %cl,%eax
  800d9b:	89 f9                	mov    %edi,%ecx
  800d9d:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  800da1:	89 eb                	mov    %ebp,%ebx
  800da3:	d3 e6                	shl    %cl,%esi
  800da5:	89 d1                	mov    %edx,%ecx
  800da7:	d3 eb                	shr    %cl,%ebx
  800da9:	09 f3                	or     %esi,%ebx
  800dab:	89 c6                	mov    %eax,%esi
  800dad:	89 f2                	mov    %esi,%edx
  800daf:	89 d8                	mov    %ebx,%eax
  800db1:	f7 74 24 08          	divl   0x8(%esp)
  800db5:	89 d6                	mov    %edx,%esi
  800db7:	89 c3                	mov    %eax,%ebx
  800db9:	f7 64 24 0c          	mull   0xc(%esp)
  800dbd:	39 d6                	cmp    %edx,%esi
  800dbf:	72 1f                	jb     800de0 <__udivdi3+0x110>
  800dc1:	89 f9                	mov    %edi,%ecx
  800dc3:	d3 e5                	shl    %cl,%ebp
  800dc5:	39 c5                	cmp    %eax,%ebp
  800dc7:	73 04                	jae    800dcd <__udivdi3+0xfd>
  800dc9:	39 d6                	cmp    %edx,%esi
  800dcb:	74 13                	je     800de0 <__udivdi3+0x110>
  800dcd:	89 d8                	mov    %ebx,%eax
  800dcf:	31 ff                	xor    %edi,%edi
  800dd1:	e9 3a ff ff ff       	jmp    800d10 <__udivdi3+0x40>
  800dd6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800ddd:	00 
  800dde:	66 90                	xchg   %ax,%ax
  800de0:	8d 43 ff             	lea    -0x1(%ebx),%eax
  800de3:	31 ff                	xor    %edi,%edi
  800de5:	e9 26 ff ff ff       	jmp    800d10 <__udivdi3+0x40>
  800dea:	66 90                	xchg   %ax,%ax
  800dec:	66 90                	xchg   %ax,%ax
  800dee:	66 90                	xchg   %ax,%ax

00800df0 <__umoddi3>:
  800df0:	f3 0f 1e fb          	endbr32
  800df4:	55                   	push   %ebp
  800df5:	57                   	push   %edi
  800df6:	56                   	push   %esi
  800df7:	53                   	push   %ebx
  800df8:	83 ec 1c             	sub    $0x1c,%esp
  800dfb:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  800dff:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800e03:	8b 74 24 30          	mov    0x30(%esp),%esi
  800e07:	8b 7c 24 38          	mov    0x38(%esp),%edi
  800e0b:	89 da                	mov    %ebx,%edx
  800e0d:	85 c0                	test   %eax,%eax
  800e0f:	75 17                	jne    800e28 <__umoddi3+0x38>
  800e11:	39 fb                	cmp    %edi,%ebx
  800e13:	73 53                	jae    800e68 <__umoddi3+0x78>
  800e15:	89 f0                	mov    %esi,%eax
  800e17:	f7 f7                	div    %edi
  800e19:	89 d0                	mov    %edx,%eax
  800e1b:	31 d2                	xor    %edx,%edx
  800e1d:	83 c4 1c             	add    $0x1c,%esp
  800e20:	5b                   	pop    %ebx
  800e21:	5e                   	pop    %esi
  800e22:	5f                   	pop    %edi
  800e23:	5d                   	pop    %ebp
  800e24:	c3                   	ret
  800e25:	8d 76 00             	lea    0x0(%esi),%esi
  800e28:	89 f1                	mov    %esi,%ecx
  800e2a:	39 c3                	cmp    %eax,%ebx
  800e2c:	73 12                	jae    800e40 <__umoddi3+0x50>
  800e2e:	89 f0                	mov    %esi,%eax
  800e30:	83 c4 1c             	add    $0x1c,%esp
  800e33:	5b                   	pop    %ebx
  800e34:	5e                   	pop    %esi
  800e35:	5f                   	pop    %edi
  800e36:	5d                   	pop    %ebp
  800e37:	c3                   	ret
  800e38:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800e3f:	00 
  800e40:	0f bd e8             	bsr    %eax,%ebp
  800e43:	83 f5 1f             	xor    $0x1f,%ebp
  800e46:	75 48                	jne    800e90 <__umoddi3+0xa0>
  800e48:	39 d8                	cmp    %ebx,%eax
  800e4a:	0f 82 d0 00 00 00    	jb     800f20 <__umoddi3+0x130>
  800e50:	39 fe                	cmp    %edi,%esi
  800e52:	0f 83 c8 00 00 00    	jae    800f20 <__umoddi3+0x130>
  800e58:	89 c8                	mov    %ecx,%eax
  800e5a:	83 c4 1c             	add    $0x1c,%esp
  800e5d:	5b                   	pop    %ebx
  800e5e:	5e                   	pop    %esi
  800e5f:	5f                   	pop    %edi
  800e60:	5d                   	pop    %ebp
  800e61:	c3                   	ret
  800e62:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800e68:	89 f9                	mov    %edi,%ecx
  800e6a:	85 ff                	test   %edi,%edi
  800e6c:	75 0b                	jne    800e79 <__umoddi3+0x89>
  800e6e:	b8 01 00 00 00       	mov    $0x1,%eax
  800e73:	31 d2                	xor    %edx,%edx
  800e75:	f7 f7                	div    %edi
  800e77:	89 c1                	mov    %eax,%ecx
  800e79:	89 d8                	mov    %ebx,%eax
  800e7b:	31 d2                	xor    %edx,%edx
  800e7d:	f7 f1                	div    %ecx
  800e7f:	89 f0                	mov    %esi,%eax
  800e81:	f7 f1                	div    %ecx
  800e83:	89 d0                	mov    %edx,%eax
  800e85:	31 d2                	xor    %edx,%edx
  800e87:	eb 94                	jmp    800e1d <__umoddi3+0x2d>
  800e89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800e90:	89 e9                	mov    %ebp,%ecx
  800e92:	ba 20 00 00 00       	mov    $0x20,%edx
  800e97:	29 ea                	sub    %ebp,%edx
  800e99:	d3 e0                	shl    %cl,%eax
  800e9b:	89 44 24 08          	mov    %eax,0x8(%esp)
  800e9f:	89 d1                	mov    %edx,%ecx
  800ea1:	89 f8                	mov    %edi,%eax
  800ea3:	d3 e8                	shr    %cl,%eax
  800ea5:	89 54 24 04          	mov    %edx,0x4(%esp)
  800ea9:	8b 54 24 04          	mov    0x4(%esp),%edx
  800ead:	89 c1                	mov    %eax,%ecx
  800eaf:	8b 44 24 08          	mov    0x8(%esp),%eax
  800eb3:	09 c1                	or     %eax,%ecx
  800eb5:	89 d8                	mov    %ebx,%eax
  800eb7:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800ebb:	89 e9                	mov    %ebp,%ecx
  800ebd:	d3 e7                	shl    %cl,%edi
  800ebf:	89 d1                	mov    %edx,%ecx
  800ec1:	d3 e8                	shr    %cl,%eax
  800ec3:	89 e9                	mov    %ebp,%ecx
  800ec5:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  800ec9:	d3 e3                	shl    %cl,%ebx
  800ecb:	89 c7                	mov    %eax,%edi
  800ecd:	89 d1                	mov    %edx,%ecx
  800ecf:	89 f0                	mov    %esi,%eax
  800ed1:	d3 e8                	shr    %cl,%eax
  800ed3:	89 fa                	mov    %edi,%edx
  800ed5:	89 e9                	mov    %ebp,%ecx
  800ed7:	09 d8                	or     %ebx,%eax
  800ed9:	d3 e6                	shl    %cl,%esi
  800edb:	f7 74 24 08          	divl   0x8(%esp)
  800edf:	89 d3                	mov    %edx,%ebx
  800ee1:	f7 64 24 0c          	mull   0xc(%esp)
  800ee5:	89 c7                	mov    %eax,%edi
  800ee7:	89 d1                	mov    %edx,%ecx
  800ee9:	39 d3                	cmp    %edx,%ebx
  800eeb:	72 06                	jb     800ef3 <__umoddi3+0x103>
  800eed:	75 10                	jne    800eff <__umoddi3+0x10f>
  800eef:	39 c6                	cmp    %eax,%esi
  800ef1:	73 0c                	jae    800eff <__umoddi3+0x10f>
  800ef3:	2b 44 24 0c          	sub    0xc(%esp),%eax
  800ef7:	1b 54 24 08          	sbb    0x8(%esp),%edx
  800efb:	89 d1                	mov    %edx,%ecx
  800efd:	89 c7                	mov    %eax,%edi
  800eff:	89 f2                	mov    %esi,%edx
  800f01:	29 fa                	sub    %edi,%edx
  800f03:	19 cb                	sbb    %ecx,%ebx
  800f05:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  800f0a:	89 d8                	mov    %ebx,%eax
  800f0c:	d3 e0                	shl    %cl,%eax
  800f0e:	89 e9                	mov    %ebp,%ecx
  800f10:	d3 ea                	shr    %cl,%edx
  800f12:	d3 eb                	shr    %cl,%ebx
  800f14:	09 d0                	or     %edx,%eax
  800f16:	89 da                	mov    %ebx,%edx
  800f18:	83 c4 1c             	add    $0x1c,%esp
  800f1b:	5b                   	pop    %ebx
  800f1c:	5e                   	pop    %esi
  800f1d:	5f                   	pop    %edi
  800f1e:	5d                   	pop    %ebp
  800f1f:	c3                   	ret
  800f20:	89 da                	mov    %ebx,%edx
  800f22:	89 f1                	mov    %esi,%ecx
  800f24:	29 f9                	sub    %edi,%ecx
  800f26:	19 c2                	sbb    %eax,%edx
  800f28:	89 c8                	mov    %ecx,%eax
  800f2a:	e9 2b ff ff ff       	jmp    800e5a <__umoddi3+0x6a>
