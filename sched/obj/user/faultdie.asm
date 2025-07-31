
obj/user/faultdie:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 4f 00 00 00       	call   800080 <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <handler>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	83 ec 0c             	sub    $0xc,%esp
  800039:	8b 55 08             	mov    0x8(%ebp),%edx
  80003c:	8b 42 04             	mov    0x4(%edx),%eax
  80003f:	83 e0 07             	and    $0x7,%eax
  800042:	50                   	push   %eax
  800043:	ff 32                	push   (%edx)
  800045:	68 00 0f 80 00       	push   $0x800f00
  80004a:	e8 25 01 00 00       	call   800174 <cprintf>
  80004f:	e8 4e 0a 00 00       	call   800aa2 <sys_getenvid>
  800054:	89 04 24             	mov    %eax,(%esp)
  800057:	e8 24 0a 00 00       	call   800a80 <sys_env_destroy>
  80005c:	83 c4 10             	add    $0x10,%esp
  80005f:	c9                   	leave
  800060:	c3                   	ret

00800061 <umain>:
  800061:	55                   	push   %ebp
  800062:	89 e5                	mov    %esp,%ebp
  800064:	83 ec 14             	sub    $0x14,%esp
  800067:	68 33 00 80 00       	push   $0x800033
  80006c:	e8 76 0b 00 00       	call   800be7 <set_pgfault_handler>
  800071:	c7 05 ef be ad de 00 	movl   $0x0,0xdeadbeef
  800078:	00 00 00 
  80007b:	83 c4 10             	add    $0x10,%esp
  80007e:	c9                   	leave
  80007f:	c3                   	ret

00800080 <libmain>:
  800080:	55                   	push   %ebp
  800081:	89 e5                	mov    %esp,%ebp
  800083:	56                   	push   %esi
  800084:	53                   	push   %ebx
  800085:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800088:	8b 75 0c             	mov    0xc(%ebp),%esi
  80008b:	e8 12 0a 00 00       	call   800aa2 <sys_getenvid>
  800090:	85 c0                	test   %eax,%eax
  800092:	78 15                	js     8000a9 <libmain+0x29>
  800094:	25 ff 03 00 00       	and    $0x3ff,%eax
  800099:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  80009f:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  8000a4:	a3 04 20 80 00       	mov    %eax,0x802004
  8000a9:	85 db                	test   %ebx,%ebx
  8000ab:	7e 07                	jle    8000b4 <libmain+0x34>
  8000ad:	8b 06                	mov    (%esi),%eax
  8000af:	a3 00 20 80 00       	mov    %eax,0x802000
  8000b4:	83 ec 08             	sub    $0x8,%esp
  8000b7:	56                   	push   %esi
  8000b8:	53                   	push   %ebx
  8000b9:	e8 a3 ff ff ff       	call   800061 <umain>
  8000be:	e8 0a 00 00 00       	call   8000cd <exit>
  8000c3:	83 c4 10             	add    $0x10,%esp
  8000c6:	8d 65 f8             	lea    -0x8(%ebp),%esp
  8000c9:	5b                   	pop    %ebx
  8000ca:	5e                   	pop    %esi
  8000cb:	5d                   	pop    %ebp
  8000cc:	c3                   	ret

008000cd <exit>:
  8000cd:	55                   	push   %ebp
  8000ce:	89 e5                	mov    %esp,%ebp
  8000d0:	83 ec 14             	sub    $0x14,%esp
  8000d3:	6a 00                	push   $0x0
  8000d5:	e8 a6 09 00 00       	call   800a80 <sys_env_destroy>
  8000da:	83 c4 10             	add    $0x10,%esp
  8000dd:	c9                   	leave
  8000de:	c3                   	ret

008000df <putch>:
  8000df:	55                   	push   %ebp
  8000e0:	89 e5                	mov    %esp,%ebp
  8000e2:	53                   	push   %ebx
  8000e3:	83 ec 04             	sub    $0x4,%esp
  8000e6:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8000e9:	8b 13                	mov    (%ebx),%edx
  8000eb:	8d 42 01             	lea    0x1(%edx),%eax
  8000ee:	89 03                	mov    %eax,(%ebx)
  8000f0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8000f3:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  8000f7:	3d ff 00 00 00       	cmp    $0xff,%eax
  8000fc:	74 09                	je     800107 <putch+0x28>
  8000fe:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  800102:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800105:	c9                   	leave
  800106:	c3                   	ret
  800107:	83 ec 08             	sub    $0x8,%esp
  80010a:	68 ff 00 00 00       	push   $0xff
  80010f:	8d 43 08             	lea    0x8(%ebx),%eax
  800112:	50                   	push   %eax
  800113:	e8 1e 09 00 00       	call   800a36 <sys_cputs>
  800118:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  80011e:	83 c4 10             	add    $0x10,%esp
  800121:	eb db                	jmp    8000fe <putch+0x1f>

00800123 <vcprintf>:
  800123:	55                   	push   %ebp
  800124:	89 e5                	mov    %esp,%ebp
  800126:	81 ec 18 01 00 00    	sub    $0x118,%esp
  80012c:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  800133:	00 00 00 
  800136:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  80013d:	00 00 00 
  800140:	ff 75 0c             	push   0xc(%ebp)
  800143:	ff 75 08             	push   0x8(%ebp)
  800146:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  80014c:	50                   	push   %eax
  80014d:	68 df 00 80 00       	push   $0x8000df
  800152:	e8 74 01 00 00       	call   8002cb <vprintfmt>
  800157:	83 c4 08             	add    $0x8,%esp
  80015a:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  800160:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  800166:	50                   	push   %eax
  800167:	e8 ca 08 00 00       	call   800a36 <sys_cputs>
  80016c:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  800172:	c9                   	leave
  800173:	c3                   	ret

00800174 <cprintf>:
  800174:	55                   	push   %ebp
  800175:	89 e5                	mov    %esp,%ebp
  800177:	83 ec 10             	sub    $0x10,%esp
  80017a:	8d 45 0c             	lea    0xc(%ebp),%eax
  80017d:	50                   	push   %eax
  80017e:	ff 75 08             	push   0x8(%ebp)
  800181:	e8 9d ff ff ff       	call   800123 <vcprintf>
  800186:	c9                   	leave
  800187:	c3                   	ret

00800188 <printnum>:
  800188:	55                   	push   %ebp
  800189:	89 e5                	mov    %esp,%ebp
  80018b:	57                   	push   %edi
  80018c:	56                   	push   %esi
  80018d:	53                   	push   %ebx
  80018e:	83 ec 1c             	sub    $0x1c,%esp
  800191:	89 c7                	mov    %eax,%edi
  800193:	89 d6                	mov    %edx,%esi
  800195:	8b 45 08             	mov    0x8(%ebp),%eax
  800198:	8b 55 0c             	mov    0xc(%ebp),%edx
  80019b:	89 d1                	mov    %edx,%ecx
  80019d:	89 c2                	mov    %eax,%edx
  80019f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  8001a2:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  8001a5:	8b 45 10             	mov    0x10(%ebp),%eax
  8001a8:	8b 5d 14             	mov    0x14(%ebp),%ebx
  8001ab:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8001ae:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  8001b5:	39 c2                	cmp    %eax,%edx
  8001b7:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  8001ba:	72 3e                	jb     8001fa <printnum+0x72>
  8001bc:	83 ec 0c             	sub    $0xc,%esp
  8001bf:	ff 75 18             	push   0x18(%ebp)
  8001c2:	83 eb 01             	sub    $0x1,%ebx
  8001c5:	53                   	push   %ebx
  8001c6:	50                   	push   %eax
  8001c7:	83 ec 08             	sub    $0x8,%esp
  8001ca:	ff 75 e4             	push   -0x1c(%ebp)
  8001cd:	ff 75 e0             	push   -0x20(%ebp)
  8001d0:	ff 75 dc             	push   -0x24(%ebp)
  8001d3:	ff 75 d8             	push   -0x28(%ebp)
  8001d6:	e8 c5 0a 00 00       	call   800ca0 <__udivdi3>
  8001db:	83 c4 18             	add    $0x18,%esp
  8001de:	52                   	push   %edx
  8001df:	50                   	push   %eax
  8001e0:	89 f2                	mov    %esi,%edx
  8001e2:	89 f8                	mov    %edi,%eax
  8001e4:	e8 9f ff ff ff       	call   800188 <printnum>
  8001e9:	83 c4 20             	add    $0x20,%esp
  8001ec:	eb 13                	jmp    800201 <printnum+0x79>
  8001ee:	83 ec 08             	sub    $0x8,%esp
  8001f1:	56                   	push   %esi
  8001f2:	ff 75 18             	push   0x18(%ebp)
  8001f5:	ff d7                	call   *%edi
  8001f7:	83 c4 10             	add    $0x10,%esp
  8001fa:	83 eb 01             	sub    $0x1,%ebx
  8001fd:	85 db                	test   %ebx,%ebx
  8001ff:	7f ed                	jg     8001ee <printnum+0x66>
  800201:	83 ec 08             	sub    $0x8,%esp
  800204:	56                   	push   %esi
  800205:	83 ec 04             	sub    $0x4,%esp
  800208:	ff 75 e4             	push   -0x1c(%ebp)
  80020b:	ff 75 e0             	push   -0x20(%ebp)
  80020e:	ff 75 dc             	push   -0x24(%ebp)
  800211:	ff 75 d8             	push   -0x28(%ebp)
  800214:	e8 a7 0b 00 00       	call   800dc0 <__umoddi3>
  800219:	83 c4 14             	add    $0x14,%esp
  80021c:	0f be 80 26 0f 80 00 	movsbl 0x800f26(%eax),%eax
  800223:	50                   	push   %eax
  800224:	ff d7                	call   *%edi
  800226:	83 c4 10             	add    $0x10,%esp
  800229:	8d 65 f4             	lea    -0xc(%ebp),%esp
  80022c:	5b                   	pop    %ebx
  80022d:	5e                   	pop    %esi
  80022e:	5f                   	pop    %edi
  80022f:	5d                   	pop    %ebp
  800230:	c3                   	ret

00800231 <getuint>:
  800231:	83 fa 01             	cmp    $0x1,%edx
  800234:	7f 13                	jg     800249 <getuint+0x18>
  800236:	85 d2                	test   %edx,%edx
  800238:	74 1c                	je     800256 <getuint+0x25>
  80023a:	8b 10                	mov    (%eax),%edx
  80023c:	8d 4a 04             	lea    0x4(%edx),%ecx
  80023f:	89 08                	mov    %ecx,(%eax)
  800241:	8b 02                	mov    (%edx),%eax
  800243:	ba 00 00 00 00       	mov    $0x0,%edx
  800248:	c3                   	ret
  800249:	8b 10                	mov    (%eax),%edx
  80024b:	8d 4a 08             	lea    0x8(%edx),%ecx
  80024e:	89 08                	mov    %ecx,(%eax)
  800250:	8b 02                	mov    (%edx),%eax
  800252:	8b 52 04             	mov    0x4(%edx),%edx
  800255:	c3                   	ret
  800256:	8b 10                	mov    (%eax),%edx
  800258:	8d 4a 04             	lea    0x4(%edx),%ecx
  80025b:	89 08                	mov    %ecx,(%eax)
  80025d:	8b 02                	mov    (%edx),%eax
  80025f:	ba 00 00 00 00       	mov    $0x0,%edx
  800264:	c3                   	ret

00800265 <getint>:
  800265:	83 fa 01             	cmp    $0x1,%edx
  800268:	7f 0f                	jg     800279 <getint+0x14>
  80026a:	85 d2                	test   %edx,%edx
  80026c:	74 18                	je     800286 <getint+0x21>
  80026e:	8b 10                	mov    (%eax),%edx
  800270:	8d 4a 04             	lea    0x4(%edx),%ecx
  800273:	89 08                	mov    %ecx,(%eax)
  800275:	8b 02                	mov    (%edx),%eax
  800277:	99                   	cltd
  800278:	c3                   	ret
  800279:	8b 10                	mov    (%eax),%edx
  80027b:	8d 4a 08             	lea    0x8(%edx),%ecx
  80027e:	89 08                	mov    %ecx,(%eax)
  800280:	8b 02                	mov    (%edx),%eax
  800282:	8b 52 04             	mov    0x4(%edx),%edx
  800285:	c3                   	ret
  800286:	8b 10                	mov    (%eax),%edx
  800288:	8d 4a 04             	lea    0x4(%edx),%ecx
  80028b:	89 08                	mov    %ecx,(%eax)
  80028d:	8b 02                	mov    (%edx),%eax
  80028f:	99                   	cltd
  800290:	c3                   	ret

00800291 <sprintputch>:
  800291:	55                   	push   %ebp
  800292:	89 e5                	mov    %esp,%ebp
  800294:	8b 45 0c             	mov    0xc(%ebp),%eax
  800297:	83 40 08 01          	addl   $0x1,0x8(%eax)
  80029b:	8b 10                	mov    (%eax),%edx
  80029d:	3b 50 04             	cmp    0x4(%eax),%edx
  8002a0:	73 0a                	jae    8002ac <sprintputch+0x1b>
  8002a2:	8d 4a 01             	lea    0x1(%edx),%ecx
  8002a5:	89 08                	mov    %ecx,(%eax)
  8002a7:	8b 45 08             	mov    0x8(%ebp),%eax
  8002aa:	88 02                	mov    %al,(%edx)
  8002ac:	5d                   	pop    %ebp
  8002ad:	c3                   	ret

008002ae <printfmt>:
  8002ae:	55                   	push   %ebp
  8002af:	89 e5                	mov    %esp,%ebp
  8002b1:	83 ec 08             	sub    $0x8,%esp
  8002b4:	8d 45 14             	lea    0x14(%ebp),%eax
  8002b7:	50                   	push   %eax
  8002b8:	ff 75 10             	push   0x10(%ebp)
  8002bb:	ff 75 0c             	push   0xc(%ebp)
  8002be:	ff 75 08             	push   0x8(%ebp)
  8002c1:	e8 05 00 00 00       	call   8002cb <vprintfmt>
  8002c6:	83 c4 10             	add    $0x10,%esp
  8002c9:	c9                   	leave
  8002ca:	c3                   	ret

008002cb <vprintfmt>:
  8002cb:	55                   	push   %ebp
  8002cc:	89 e5                	mov    %esp,%ebp
  8002ce:	57                   	push   %edi
  8002cf:	56                   	push   %esi
  8002d0:	53                   	push   %ebx
  8002d1:	83 ec 2c             	sub    $0x2c,%esp
  8002d4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8002d7:	8b 75 0c             	mov    0xc(%ebp),%esi
  8002da:	8b 7d 10             	mov    0x10(%ebp),%edi
  8002dd:	eb 0a                	jmp    8002e9 <vprintfmt+0x1e>
  8002df:	83 ec 08             	sub    $0x8,%esp
  8002e2:	56                   	push   %esi
  8002e3:	50                   	push   %eax
  8002e4:	ff d3                	call   *%ebx
  8002e6:	83 c4 10             	add    $0x10,%esp
  8002e9:	83 c7 01             	add    $0x1,%edi
  8002ec:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  8002f0:	83 f8 25             	cmp    $0x25,%eax
  8002f3:	74 0c                	je     800301 <vprintfmt+0x36>
  8002f5:	85 c0                	test   %eax,%eax
  8002f7:	75 e6                	jne    8002df <vprintfmt+0x14>
  8002f9:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8002fc:	5b                   	pop    %ebx
  8002fd:	5e                   	pop    %esi
  8002fe:	5f                   	pop    %edi
  8002ff:	5d                   	pop    %ebp
  800300:	c3                   	ret
  800301:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  800305:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  80030c:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800313:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  80031a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80031f:	8d 47 01             	lea    0x1(%edi),%eax
  800322:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800325:	0f b6 17             	movzbl (%edi),%edx
  800328:	8d 42 dd             	lea    -0x23(%edx),%eax
  80032b:	3c 55                	cmp    $0x55,%al
  80032d:	0f 87 c3 02 00 00    	ja     8005f6 <vprintfmt+0x32b>
  800333:	0f b6 c0             	movzbl %al,%eax
  800336:	ff 24 85 20 10 80 00 	jmp    *0x801020(,%eax,4)
  80033d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800340:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  800344:	eb d9                	jmp    80031f <vprintfmt+0x54>
  800346:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800349:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  80034d:	eb d0                	jmp    80031f <vprintfmt+0x54>
  80034f:	0f b6 d2             	movzbl %dl,%edx
  800352:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800355:	b8 00 00 00 00       	mov    $0x0,%eax
  80035a:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  80035d:	8d 04 80             	lea    (%eax,%eax,4),%eax
  800360:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  800364:	0f be 17             	movsbl (%edi),%edx
  800367:	8d 4a d0             	lea    -0x30(%edx),%ecx
  80036a:	83 f9 09             	cmp    $0x9,%ecx
  80036d:	77 52                	ja     8003c1 <vprintfmt+0xf6>
  80036f:	83 c7 01             	add    $0x1,%edi
  800372:	eb e9                	jmp    80035d <vprintfmt+0x92>
  800374:	8b 45 14             	mov    0x14(%ebp),%eax
  800377:	8d 50 04             	lea    0x4(%eax),%edx
  80037a:	89 55 14             	mov    %edx,0x14(%ebp)
  80037d:	8b 00                	mov    (%eax),%eax
  80037f:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800382:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800385:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800389:	79 94                	jns    80031f <vprintfmt+0x54>
  80038b:	8b 45 d0             	mov    -0x30(%ebp),%eax
  80038e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800391:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800398:	eb 85                	jmp    80031f <vprintfmt+0x54>
  80039a:	8b 55 e0             	mov    -0x20(%ebp),%edx
  80039d:	85 d2                	test   %edx,%edx
  80039f:	b8 00 00 00 00       	mov    $0x0,%eax
  8003a4:	0f 49 c2             	cmovns %edx,%eax
  8003a7:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8003aa:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003ad:	e9 6d ff ff ff       	jmp    80031f <vprintfmt+0x54>
  8003b2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003b5:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  8003bc:	e9 5e ff ff ff       	jmp    80031f <vprintfmt+0x54>
  8003c1:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  8003c4:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8003c7:	eb bc                	jmp    800385 <vprintfmt+0xba>
  8003c9:	83 c1 01             	add    $0x1,%ecx
  8003cc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003cf:	e9 4b ff ff ff       	jmp    80031f <vprintfmt+0x54>
  8003d4:	8b 45 14             	mov    0x14(%ebp),%eax
  8003d7:	8d 50 04             	lea    0x4(%eax),%edx
  8003da:	89 55 14             	mov    %edx,0x14(%ebp)
  8003dd:	83 ec 08             	sub    $0x8,%esp
  8003e0:	56                   	push   %esi
  8003e1:	ff 30                	push   (%eax)
  8003e3:	ff d3                	call   *%ebx
  8003e5:	83 c4 10             	add    $0x10,%esp
  8003e8:	e9 a0 01 00 00       	jmp    80058d <vprintfmt+0x2c2>
  8003ed:	8b 45 14             	mov    0x14(%ebp),%eax
  8003f0:	8d 50 04             	lea    0x4(%eax),%edx
  8003f3:	89 55 14             	mov    %edx,0x14(%ebp)
  8003f6:	8b 10                	mov    (%eax),%edx
  8003f8:	89 d0                	mov    %edx,%eax
  8003fa:	f7 d8                	neg    %eax
  8003fc:	0f 48 c2             	cmovs  %edx,%eax
  8003ff:	83 f8 08             	cmp    $0x8,%eax
  800402:	7f 20                	jg     800424 <vprintfmt+0x159>
  800404:	8b 14 85 80 11 80 00 	mov    0x801180(,%eax,4),%edx
  80040b:	85 d2                	test   %edx,%edx
  80040d:	74 15                	je     800424 <vprintfmt+0x159>
  80040f:	52                   	push   %edx
  800410:	68 47 0f 80 00       	push   $0x800f47
  800415:	56                   	push   %esi
  800416:	53                   	push   %ebx
  800417:	e8 92 fe ff ff       	call   8002ae <printfmt>
  80041c:	83 c4 10             	add    $0x10,%esp
  80041f:	e9 69 01 00 00       	jmp    80058d <vprintfmt+0x2c2>
  800424:	50                   	push   %eax
  800425:	68 3e 0f 80 00       	push   $0x800f3e
  80042a:	56                   	push   %esi
  80042b:	53                   	push   %ebx
  80042c:	e8 7d fe ff ff       	call   8002ae <printfmt>
  800431:	83 c4 10             	add    $0x10,%esp
  800434:	e9 54 01 00 00       	jmp    80058d <vprintfmt+0x2c2>
  800439:	8b 45 14             	mov    0x14(%ebp),%eax
  80043c:	8d 50 04             	lea    0x4(%eax),%edx
  80043f:	89 55 14             	mov    %edx,0x14(%ebp)
  800442:	8b 08                	mov    (%eax),%ecx
  800444:	85 c9                	test   %ecx,%ecx
  800446:	b8 37 0f 80 00       	mov    $0x800f37,%eax
  80044b:	0f 45 c1             	cmovne %ecx,%eax
  80044e:	89 45 cc             	mov    %eax,-0x34(%ebp)
  800451:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800455:	7e 06                	jle    80045d <vprintfmt+0x192>
  800457:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  80045b:	75 0b                	jne    800468 <vprintfmt+0x19d>
  80045d:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  800460:	8b 7d d0             	mov    -0x30(%ebp),%edi
  800463:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800466:	eb 5c                	jmp    8004c4 <vprintfmt+0x1f9>
  800468:	83 ec 08             	sub    $0x8,%esp
  80046b:	ff 75 d0             	push   -0x30(%ebp)
  80046e:	ff 75 cc             	push   -0x34(%ebp)
  800471:	e8 20 02 00 00       	call   800696 <strnlen>
  800476:	89 c2                	mov    %eax,%edx
  800478:	8b 45 e0             	mov    -0x20(%ebp),%eax
  80047b:	29 d0                	sub    %edx,%eax
  80047d:	83 c4 10             	add    $0x10,%esp
  800480:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  800484:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800487:	89 5d 08             	mov    %ebx,0x8(%ebp)
  80048a:	89 c3                	mov    %eax,%ebx
  80048c:	eb 0e                	jmp    80049c <vprintfmt+0x1d1>
  80048e:	83 ec 08             	sub    $0x8,%esp
  800491:	56                   	push   %esi
  800492:	57                   	push   %edi
  800493:	ff 55 08             	call   *0x8(%ebp)
  800496:	83 eb 01             	sub    $0x1,%ebx
  800499:	83 c4 10             	add    $0x10,%esp
  80049c:	85 db                	test   %ebx,%ebx
  80049e:	7f ee                	jg     80048e <vprintfmt+0x1c3>
  8004a0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8004a3:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8004a6:	85 c0                	test   %eax,%eax
  8004a8:	ba 00 00 00 00       	mov    $0x0,%edx
  8004ad:	0f 49 d0             	cmovns %eax,%edx
  8004b0:	29 d0                	sub    %edx,%eax
  8004b2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8004b5:	eb a6                	jmp    80045d <vprintfmt+0x192>
  8004b7:	83 ec 08             	sub    $0x8,%esp
  8004ba:	56                   	push   %esi
  8004bb:	52                   	push   %edx
  8004bc:	ff 55 08             	call   *0x8(%ebp)
  8004bf:	83 c4 10             	add    $0x10,%esp
  8004c2:	89 d9                	mov    %ebx,%ecx
  8004c4:	8d 59 01             	lea    0x1(%ecx),%ebx
  8004c7:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  8004cb:	0f be d0             	movsbl %al,%edx
  8004ce:	85 d2                	test   %edx,%edx
  8004d0:	74 28                	je     8004fa <vprintfmt+0x22f>
  8004d2:	85 ff                	test   %edi,%edi
  8004d4:	78 05                	js     8004db <vprintfmt+0x210>
  8004d6:	83 ef 01             	sub    $0x1,%edi
  8004d9:	78 2e                	js     800509 <vprintfmt+0x23e>
  8004db:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  8004df:	74 d6                	je     8004b7 <vprintfmt+0x1ec>
  8004e1:	0f be c0             	movsbl %al,%eax
  8004e4:	83 e8 20             	sub    $0x20,%eax
  8004e7:	83 f8 5e             	cmp    $0x5e,%eax
  8004ea:	76 cb                	jbe    8004b7 <vprintfmt+0x1ec>
  8004ec:	83 ec 08             	sub    $0x8,%esp
  8004ef:	56                   	push   %esi
  8004f0:	6a 3f                	push   $0x3f
  8004f2:	ff 55 08             	call   *0x8(%ebp)
  8004f5:	83 c4 10             	add    $0x10,%esp
  8004f8:	eb c8                	jmp    8004c2 <vprintfmt+0x1f7>
  8004fa:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8004fd:	8b 7d cc             	mov    -0x34(%ebp),%edi
  800500:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800503:	01 c7                	add    %eax,%edi
  800505:	29 cf                	sub    %ecx,%edi
  800507:	eb 13                	jmp    80051c <vprintfmt+0x251>
  800509:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80050c:	eb ef                	jmp    8004fd <vprintfmt+0x232>
  80050e:	83 ec 08             	sub    $0x8,%esp
  800511:	56                   	push   %esi
  800512:	6a 20                	push   $0x20
  800514:	ff d3                	call   *%ebx
  800516:	83 ef 01             	sub    $0x1,%edi
  800519:	83 c4 10             	add    $0x10,%esp
  80051c:	85 ff                	test   %edi,%edi
  80051e:	7f ee                	jg     80050e <vprintfmt+0x243>
  800520:	eb 6b                	jmp    80058d <vprintfmt+0x2c2>
  800522:	89 ca                	mov    %ecx,%edx
  800524:	8d 45 14             	lea    0x14(%ebp),%eax
  800527:	e8 39 fd ff ff       	call   800265 <getint>
  80052c:	89 45 d8             	mov    %eax,-0x28(%ebp)
  80052f:	89 55 dc             	mov    %edx,-0x24(%ebp)
  800532:	85 d2                	test   %edx,%edx
  800534:	78 0b                	js     800541 <vprintfmt+0x276>
  800536:	89 d1                	mov    %edx,%ecx
  800538:	89 c2                	mov    %eax,%edx
  80053a:	bf 0a 00 00 00       	mov    $0xa,%edi
  80053f:	eb 32                	jmp    800573 <vprintfmt+0x2a8>
  800541:	83 ec 08             	sub    $0x8,%esp
  800544:	56                   	push   %esi
  800545:	6a 2d                	push   $0x2d
  800547:	ff d3                	call   *%ebx
  800549:	8b 55 d8             	mov    -0x28(%ebp),%edx
  80054c:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  80054f:	f7 da                	neg    %edx
  800551:	83 d1 00             	adc    $0x0,%ecx
  800554:	f7 d9                	neg    %ecx
  800556:	83 c4 10             	add    $0x10,%esp
  800559:	bf 0a 00 00 00       	mov    $0xa,%edi
  80055e:	eb 13                	jmp    800573 <vprintfmt+0x2a8>
  800560:	89 ca                	mov    %ecx,%edx
  800562:	8d 45 14             	lea    0x14(%ebp),%eax
  800565:	e8 c7 fc ff ff       	call   800231 <getuint>
  80056a:	89 d1                	mov    %edx,%ecx
  80056c:	89 c2                	mov    %eax,%edx
  80056e:	bf 0a 00 00 00       	mov    $0xa,%edi
  800573:	83 ec 0c             	sub    $0xc,%esp
  800576:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  80057a:	50                   	push   %eax
  80057b:	ff 75 e0             	push   -0x20(%ebp)
  80057e:	57                   	push   %edi
  80057f:	51                   	push   %ecx
  800580:	52                   	push   %edx
  800581:	89 f2                	mov    %esi,%edx
  800583:	89 d8                	mov    %ebx,%eax
  800585:	e8 fe fb ff ff       	call   800188 <printnum>
  80058a:	83 c4 20             	add    $0x20,%esp
  80058d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800590:	e9 54 fd ff ff       	jmp    8002e9 <vprintfmt+0x1e>
  800595:	89 ca                	mov    %ecx,%edx
  800597:	8d 45 14             	lea    0x14(%ebp),%eax
  80059a:	e8 92 fc ff ff       	call   800231 <getuint>
  80059f:	89 d1                	mov    %edx,%ecx
  8005a1:	89 c2                	mov    %eax,%edx
  8005a3:	bf 08 00 00 00       	mov    $0x8,%edi
  8005a8:	eb c9                	jmp    800573 <vprintfmt+0x2a8>
  8005aa:	83 ec 08             	sub    $0x8,%esp
  8005ad:	56                   	push   %esi
  8005ae:	6a 30                	push   $0x30
  8005b0:	ff d3                	call   *%ebx
  8005b2:	83 c4 08             	add    $0x8,%esp
  8005b5:	56                   	push   %esi
  8005b6:	6a 78                	push   $0x78
  8005b8:	ff d3                	call   *%ebx
  8005ba:	8b 45 14             	mov    0x14(%ebp),%eax
  8005bd:	8d 50 04             	lea    0x4(%eax),%edx
  8005c0:	89 55 14             	mov    %edx,0x14(%ebp)
  8005c3:	8b 10                	mov    (%eax),%edx
  8005c5:	b9 00 00 00 00       	mov    $0x0,%ecx
  8005ca:	83 c4 10             	add    $0x10,%esp
  8005cd:	bf 10 00 00 00       	mov    $0x10,%edi
  8005d2:	eb 9f                	jmp    800573 <vprintfmt+0x2a8>
  8005d4:	89 ca                	mov    %ecx,%edx
  8005d6:	8d 45 14             	lea    0x14(%ebp),%eax
  8005d9:	e8 53 fc ff ff       	call   800231 <getuint>
  8005de:	89 d1                	mov    %edx,%ecx
  8005e0:	89 c2                	mov    %eax,%edx
  8005e2:	bf 10 00 00 00       	mov    $0x10,%edi
  8005e7:	eb 8a                	jmp    800573 <vprintfmt+0x2a8>
  8005e9:	83 ec 08             	sub    $0x8,%esp
  8005ec:	56                   	push   %esi
  8005ed:	6a 25                	push   $0x25
  8005ef:	ff d3                	call   *%ebx
  8005f1:	83 c4 10             	add    $0x10,%esp
  8005f4:	eb 97                	jmp    80058d <vprintfmt+0x2c2>
  8005f6:	83 ec 08             	sub    $0x8,%esp
  8005f9:	56                   	push   %esi
  8005fa:	6a 25                	push   $0x25
  8005fc:	ff d3                	call   *%ebx
  8005fe:	83 c4 10             	add    $0x10,%esp
  800601:	89 f8                	mov    %edi,%eax
  800603:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  800607:	74 05                	je     80060e <vprintfmt+0x343>
  800609:	83 e8 01             	sub    $0x1,%eax
  80060c:	eb f5                	jmp    800603 <vprintfmt+0x338>
  80060e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800611:	e9 77 ff ff ff       	jmp    80058d <vprintfmt+0x2c2>

00800616 <vsnprintf>:
  800616:	55                   	push   %ebp
  800617:	89 e5                	mov    %esp,%ebp
  800619:	83 ec 18             	sub    $0x18,%esp
  80061c:	8b 45 08             	mov    0x8(%ebp),%eax
  80061f:	8b 55 0c             	mov    0xc(%ebp),%edx
  800622:	89 45 ec             	mov    %eax,-0x14(%ebp)
  800625:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  800629:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  80062c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  800633:	85 c0                	test   %eax,%eax
  800635:	74 26                	je     80065d <vsnprintf+0x47>
  800637:	85 d2                	test   %edx,%edx
  800639:	7e 22                	jle    80065d <vsnprintf+0x47>
  80063b:	ff 75 14             	push   0x14(%ebp)
  80063e:	ff 75 10             	push   0x10(%ebp)
  800641:	8d 45 ec             	lea    -0x14(%ebp),%eax
  800644:	50                   	push   %eax
  800645:	68 91 02 80 00       	push   $0x800291
  80064a:	e8 7c fc ff ff       	call   8002cb <vprintfmt>
  80064f:	8b 45 ec             	mov    -0x14(%ebp),%eax
  800652:	c6 00 00             	movb   $0x0,(%eax)
  800655:	8b 45 f4             	mov    -0xc(%ebp),%eax
  800658:	83 c4 10             	add    $0x10,%esp
  80065b:	c9                   	leave
  80065c:	c3                   	ret
  80065d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800662:	eb f7                	jmp    80065b <vsnprintf+0x45>

00800664 <snprintf>:
  800664:	55                   	push   %ebp
  800665:	89 e5                	mov    %esp,%ebp
  800667:	83 ec 08             	sub    $0x8,%esp
  80066a:	8d 45 14             	lea    0x14(%ebp),%eax
  80066d:	50                   	push   %eax
  80066e:	ff 75 10             	push   0x10(%ebp)
  800671:	ff 75 0c             	push   0xc(%ebp)
  800674:	ff 75 08             	push   0x8(%ebp)
  800677:	e8 9a ff ff ff       	call   800616 <vsnprintf>
  80067c:	c9                   	leave
  80067d:	c3                   	ret

0080067e <strlen>:
  80067e:	55                   	push   %ebp
  80067f:	89 e5                	mov    %esp,%ebp
  800681:	8b 55 08             	mov    0x8(%ebp),%edx
  800684:	b8 00 00 00 00       	mov    $0x0,%eax
  800689:	eb 03                	jmp    80068e <strlen+0x10>
  80068b:	83 c0 01             	add    $0x1,%eax
  80068e:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  800692:	75 f7                	jne    80068b <strlen+0xd>
  800694:	5d                   	pop    %ebp
  800695:	c3                   	ret

00800696 <strnlen>:
  800696:	55                   	push   %ebp
  800697:	89 e5                	mov    %esp,%ebp
  800699:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80069c:	8b 55 0c             	mov    0xc(%ebp),%edx
  80069f:	b8 00 00 00 00       	mov    $0x0,%eax
  8006a4:	eb 03                	jmp    8006a9 <strnlen+0x13>
  8006a6:	83 c0 01             	add    $0x1,%eax
  8006a9:	39 d0                	cmp    %edx,%eax
  8006ab:	74 08                	je     8006b5 <strnlen+0x1f>
  8006ad:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  8006b1:	75 f3                	jne    8006a6 <strnlen+0x10>
  8006b3:	89 c2                	mov    %eax,%edx
  8006b5:	89 d0                	mov    %edx,%eax
  8006b7:	5d                   	pop    %ebp
  8006b8:	c3                   	ret

008006b9 <strcpy>:
  8006b9:	55                   	push   %ebp
  8006ba:	89 e5                	mov    %esp,%ebp
  8006bc:	53                   	push   %ebx
  8006bd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8006c0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8006c3:	b8 00 00 00 00       	mov    $0x0,%eax
  8006c8:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  8006cc:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  8006cf:	83 c0 01             	add    $0x1,%eax
  8006d2:	84 d2                	test   %dl,%dl
  8006d4:	75 f2                	jne    8006c8 <strcpy+0xf>
  8006d6:	89 c8                	mov    %ecx,%eax
  8006d8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8006db:	c9                   	leave
  8006dc:	c3                   	ret

008006dd <strcat>:
  8006dd:	55                   	push   %ebp
  8006de:	89 e5                	mov    %esp,%ebp
  8006e0:	53                   	push   %ebx
  8006e1:	83 ec 10             	sub    $0x10,%esp
  8006e4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8006e7:	53                   	push   %ebx
  8006e8:	e8 91 ff ff ff       	call   80067e <strlen>
  8006ed:	83 c4 08             	add    $0x8,%esp
  8006f0:	ff 75 0c             	push   0xc(%ebp)
  8006f3:	01 d8                	add    %ebx,%eax
  8006f5:	50                   	push   %eax
  8006f6:	e8 be ff ff ff       	call   8006b9 <strcpy>
  8006fb:	89 d8                	mov    %ebx,%eax
  8006fd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800700:	c9                   	leave
  800701:	c3                   	ret

00800702 <strncpy>:
  800702:	55                   	push   %ebp
  800703:	89 e5                	mov    %esp,%ebp
  800705:	56                   	push   %esi
  800706:	53                   	push   %ebx
  800707:	8b 75 08             	mov    0x8(%ebp),%esi
  80070a:	8b 55 0c             	mov    0xc(%ebp),%edx
  80070d:	89 f3                	mov    %esi,%ebx
  80070f:	03 5d 10             	add    0x10(%ebp),%ebx
  800712:	89 f0                	mov    %esi,%eax
  800714:	eb 0f                	jmp    800725 <strncpy+0x23>
  800716:	83 c0 01             	add    $0x1,%eax
  800719:	0f b6 0a             	movzbl (%edx),%ecx
  80071c:	88 48 ff             	mov    %cl,-0x1(%eax)
  80071f:	80 f9 01             	cmp    $0x1,%cl
  800722:	83 da ff             	sbb    $0xffffffff,%edx
  800725:	39 d8                	cmp    %ebx,%eax
  800727:	75 ed                	jne    800716 <strncpy+0x14>
  800729:	89 f0                	mov    %esi,%eax
  80072b:	5b                   	pop    %ebx
  80072c:	5e                   	pop    %esi
  80072d:	5d                   	pop    %ebp
  80072e:	c3                   	ret

0080072f <strlcpy>:
  80072f:	55                   	push   %ebp
  800730:	89 e5                	mov    %esp,%ebp
  800732:	56                   	push   %esi
  800733:	53                   	push   %ebx
  800734:	8b 75 08             	mov    0x8(%ebp),%esi
  800737:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80073a:	8b 55 10             	mov    0x10(%ebp),%edx
  80073d:	89 f0                	mov    %esi,%eax
  80073f:	85 d2                	test   %edx,%edx
  800741:	74 21                	je     800764 <strlcpy+0x35>
  800743:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  800747:	89 f2                	mov    %esi,%edx
  800749:	eb 09                	jmp    800754 <strlcpy+0x25>
  80074b:	83 c1 01             	add    $0x1,%ecx
  80074e:	83 c2 01             	add    $0x1,%edx
  800751:	88 5a ff             	mov    %bl,-0x1(%edx)
  800754:	39 c2                	cmp    %eax,%edx
  800756:	74 09                	je     800761 <strlcpy+0x32>
  800758:	0f b6 19             	movzbl (%ecx),%ebx
  80075b:	84 db                	test   %bl,%bl
  80075d:	75 ec                	jne    80074b <strlcpy+0x1c>
  80075f:	89 d0                	mov    %edx,%eax
  800761:	c6 00 00             	movb   $0x0,(%eax)
  800764:	29 f0                	sub    %esi,%eax
  800766:	5b                   	pop    %ebx
  800767:	5e                   	pop    %esi
  800768:	5d                   	pop    %ebp
  800769:	c3                   	ret

0080076a <strcmp>:
  80076a:	55                   	push   %ebp
  80076b:	89 e5                	mov    %esp,%ebp
  80076d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800770:	8b 55 0c             	mov    0xc(%ebp),%edx
  800773:	eb 06                	jmp    80077b <strcmp+0x11>
  800775:	83 c1 01             	add    $0x1,%ecx
  800778:	83 c2 01             	add    $0x1,%edx
  80077b:	0f b6 01             	movzbl (%ecx),%eax
  80077e:	84 c0                	test   %al,%al
  800780:	74 04                	je     800786 <strcmp+0x1c>
  800782:	3a 02                	cmp    (%edx),%al
  800784:	74 ef                	je     800775 <strcmp+0xb>
  800786:	0f b6 c0             	movzbl %al,%eax
  800789:	0f b6 12             	movzbl (%edx),%edx
  80078c:	29 d0                	sub    %edx,%eax
  80078e:	5d                   	pop    %ebp
  80078f:	c3                   	ret

00800790 <strncmp>:
  800790:	55                   	push   %ebp
  800791:	89 e5                	mov    %esp,%ebp
  800793:	53                   	push   %ebx
  800794:	8b 45 08             	mov    0x8(%ebp),%eax
  800797:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80079a:	8b 55 10             	mov    0x10(%ebp),%edx
  80079d:	eb 09                	jmp    8007a8 <strncmp+0x18>
  80079f:	83 ea 01             	sub    $0x1,%edx
  8007a2:	83 c0 01             	add    $0x1,%eax
  8007a5:	83 c1 01             	add    $0x1,%ecx
  8007a8:	85 d2                	test   %edx,%edx
  8007aa:	74 18                	je     8007c4 <strncmp+0x34>
  8007ac:	0f b6 18             	movzbl (%eax),%ebx
  8007af:	84 db                	test   %bl,%bl
  8007b1:	74 04                	je     8007b7 <strncmp+0x27>
  8007b3:	3a 19                	cmp    (%ecx),%bl
  8007b5:	74 e8                	je     80079f <strncmp+0xf>
  8007b7:	0f b6 00             	movzbl (%eax),%eax
  8007ba:	0f b6 11             	movzbl (%ecx),%edx
  8007bd:	29 d0                	sub    %edx,%eax
  8007bf:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8007c2:	c9                   	leave
  8007c3:	c3                   	ret
  8007c4:	b8 00 00 00 00       	mov    $0x0,%eax
  8007c9:	eb f4                	jmp    8007bf <strncmp+0x2f>

008007cb <strchr>:
  8007cb:	55                   	push   %ebp
  8007cc:	89 e5                	mov    %esp,%ebp
  8007ce:	8b 45 08             	mov    0x8(%ebp),%eax
  8007d1:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8007d5:	eb 03                	jmp    8007da <strchr+0xf>
  8007d7:	83 c0 01             	add    $0x1,%eax
  8007da:	0f b6 10             	movzbl (%eax),%edx
  8007dd:	84 d2                	test   %dl,%dl
  8007df:	74 06                	je     8007e7 <strchr+0x1c>
  8007e1:	38 ca                	cmp    %cl,%dl
  8007e3:	75 f2                	jne    8007d7 <strchr+0xc>
  8007e5:	eb 05                	jmp    8007ec <strchr+0x21>
  8007e7:	b8 00 00 00 00       	mov    $0x0,%eax
  8007ec:	5d                   	pop    %ebp
  8007ed:	c3                   	ret

008007ee <strfind>:
  8007ee:	55                   	push   %ebp
  8007ef:	89 e5                	mov    %esp,%ebp
  8007f1:	8b 45 08             	mov    0x8(%ebp),%eax
  8007f4:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8007f8:	0f b6 10             	movzbl (%eax),%edx
  8007fb:	38 ca                	cmp    %cl,%dl
  8007fd:	74 09                	je     800808 <strfind+0x1a>
  8007ff:	84 d2                	test   %dl,%dl
  800801:	74 05                	je     800808 <strfind+0x1a>
  800803:	83 c0 01             	add    $0x1,%eax
  800806:	eb f0                	jmp    8007f8 <strfind+0xa>
  800808:	5d                   	pop    %ebp
  800809:	c3                   	ret

0080080a <memset>:
  80080a:	55                   	push   %ebp
  80080b:	89 e5                	mov    %esp,%ebp
  80080d:	57                   	push   %edi
  80080e:	8b 55 08             	mov    0x8(%ebp),%edx
  800811:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800814:	85 c9                	test   %ecx,%ecx
  800816:	74 24                	je     80083c <memset+0x32>
  800818:	89 d0                	mov    %edx,%eax
  80081a:	09 c8                	or     %ecx,%eax
  80081c:	a8 03                	test   $0x3,%al
  80081e:	75 14                	jne    800834 <memset+0x2a>
  800820:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  800824:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  80082a:	c1 e9 02             	shr    $0x2,%ecx
  80082d:	89 d7                	mov    %edx,%edi
  80082f:	fc                   	cld
  800830:	f3 ab                	rep stos %eax,%es:(%edi)
  800832:	eb 08                	jmp    80083c <memset+0x32>
  800834:	89 d7                	mov    %edx,%edi
  800836:	8b 45 0c             	mov    0xc(%ebp),%eax
  800839:	fc                   	cld
  80083a:	f3 aa                	rep stos %al,%es:(%edi)
  80083c:	89 d0                	mov    %edx,%eax
  80083e:	8b 7d fc             	mov    -0x4(%ebp),%edi
  800841:	c9                   	leave
  800842:	c3                   	ret

00800843 <memmove>:
  800843:	55                   	push   %ebp
  800844:	89 e5                	mov    %esp,%ebp
  800846:	57                   	push   %edi
  800847:	56                   	push   %esi
  800848:	8b 45 08             	mov    0x8(%ebp),%eax
  80084b:	8b 75 0c             	mov    0xc(%ebp),%esi
  80084e:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800851:	39 c6                	cmp    %eax,%esi
  800853:	73 32                	jae    800887 <memmove+0x44>
  800855:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  800858:	39 d0                	cmp    %edx,%eax
  80085a:	73 2b                	jae    800887 <memmove+0x44>
  80085c:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  80085f:	89 fe                	mov    %edi,%esi
  800861:	09 ce                	or     %ecx,%esi
  800863:	09 d6                	or     %edx,%esi
  800865:	f7 c6 03 00 00 00    	test   $0x3,%esi
  80086b:	75 0e                	jne    80087b <memmove+0x38>
  80086d:	83 ef 04             	sub    $0x4,%edi
  800870:	8d 72 fc             	lea    -0x4(%edx),%esi
  800873:	c1 e9 02             	shr    $0x2,%ecx
  800876:	fd                   	std
  800877:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800879:	eb 09                	jmp    800884 <memmove+0x41>
  80087b:	83 ef 01             	sub    $0x1,%edi
  80087e:	8d 72 ff             	lea    -0x1(%edx),%esi
  800881:	fd                   	std
  800882:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800884:	fc                   	cld
  800885:	eb 1a                	jmp    8008a1 <memmove+0x5e>
  800887:	89 c2                	mov    %eax,%edx
  800889:	09 ca                	or     %ecx,%edx
  80088b:	09 f2                	or     %esi,%edx
  80088d:	f6 c2 03             	test   $0x3,%dl
  800890:	75 0a                	jne    80089c <memmove+0x59>
  800892:	c1 e9 02             	shr    $0x2,%ecx
  800895:	89 c7                	mov    %eax,%edi
  800897:	fc                   	cld
  800898:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  80089a:	eb 05                	jmp    8008a1 <memmove+0x5e>
  80089c:	89 c7                	mov    %eax,%edi
  80089e:	fc                   	cld
  80089f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  8008a1:	5e                   	pop    %esi
  8008a2:	5f                   	pop    %edi
  8008a3:	5d                   	pop    %ebp
  8008a4:	c3                   	ret

008008a5 <memcpy>:
  8008a5:	55                   	push   %ebp
  8008a6:	89 e5                	mov    %esp,%ebp
  8008a8:	83 ec 0c             	sub    $0xc,%esp
  8008ab:	ff 75 10             	push   0x10(%ebp)
  8008ae:	ff 75 0c             	push   0xc(%ebp)
  8008b1:	ff 75 08             	push   0x8(%ebp)
  8008b4:	e8 8a ff ff ff       	call   800843 <memmove>
  8008b9:	c9                   	leave
  8008ba:	c3                   	ret

008008bb <memcmp>:
  8008bb:	55                   	push   %ebp
  8008bc:	89 e5                	mov    %esp,%ebp
  8008be:	56                   	push   %esi
  8008bf:	53                   	push   %ebx
  8008c0:	8b 45 08             	mov    0x8(%ebp),%eax
  8008c3:	8b 55 0c             	mov    0xc(%ebp),%edx
  8008c6:	89 c6                	mov    %eax,%esi
  8008c8:	03 75 10             	add    0x10(%ebp),%esi
  8008cb:	eb 06                	jmp    8008d3 <memcmp+0x18>
  8008cd:	83 c0 01             	add    $0x1,%eax
  8008d0:	83 c2 01             	add    $0x1,%edx
  8008d3:	39 f0                	cmp    %esi,%eax
  8008d5:	74 14                	je     8008eb <memcmp+0x30>
  8008d7:	0f b6 08             	movzbl (%eax),%ecx
  8008da:	0f b6 1a             	movzbl (%edx),%ebx
  8008dd:	38 d9                	cmp    %bl,%cl
  8008df:	74 ec                	je     8008cd <memcmp+0x12>
  8008e1:	0f b6 c1             	movzbl %cl,%eax
  8008e4:	0f b6 db             	movzbl %bl,%ebx
  8008e7:	29 d8                	sub    %ebx,%eax
  8008e9:	eb 05                	jmp    8008f0 <memcmp+0x35>
  8008eb:	b8 00 00 00 00       	mov    $0x0,%eax
  8008f0:	5b                   	pop    %ebx
  8008f1:	5e                   	pop    %esi
  8008f2:	5d                   	pop    %ebp
  8008f3:	c3                   	ret

008008f4 <memfind>:
  8008f4:	55                   	push   %ebp
  8008f5:	89 e5                	mov    %esp,%ebp
  8008f7:	8b 45 08             	mov    0x8(%ebp),%eax
  8008fa:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8008fd:	89 c2                	mov    %eax,%edx
  8008ff:	03 55 10             	add    0x10(%ebp),%edx
  800902:	eb 03                	jmp    800907 <memfind+0x13>
  800904:	83 c0 01             	add    $0x1,%eax
  800907:	39 d0                	cmp    %edx,%eax
  800909:	73 04                	jae    80090f <memfind+0x1b>
  80090b:	38 08                	cmp    %cl,(%eax)
  80090d:	75 f5                	jne    800904 <memfind+0x10>
  80090f:	5d                   	pop    %ebp
  800910:	c3                   	ret

00800911 <strtol>:
  800911:	55                   	push   %ebp
  800912:	89 e5                	mov    %esp,%ebp
  800914:	57                   	push   %edi
  800915:	56                   	push   %esi
  800916:	53                   	push   %ebx
  800917:	8b 55 08             	mov    0x8(%ebp),%edx
  80091a:	8b 5d 10             	mov    0x10(%ebp),%ebx
  80091d:	eb 03                	jmp    800922 <strtol+0x11>
  80091f:	83 c2 01             	add    $0x1,%edx
  800922:	0f b6 02             	movzbl (%edx),%eax
  800925:	3c 20                	cmp    $0x20,%al
  800927:	74 f6                	je     80091f <strtol+0xe>
  800929:	3c 09                	cmp    $0x9,%al
  80092b:	74 f2                	je     80091f <strtol+0xe>
  80092d:	3c 2b                	cmp    $0x2b,%al
  80092f:	74 2a                	je     80095b <strtol+0x4a>
  800931:	bf 00 00 00 00       	mov    $0x0,%edi
  800936:	3c 2d                	cmp    $0x2d,%al
  800938:	74 2b                	je     800965 <strtol+0x54>
  80093a:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  800940:	75 0f                	jne    800951 <strtol+0x40>
  800942:	80 3a 30             	cmpb   $0x30,(%edx)
  800945:	74 28                	je     80096f <strtol+0x5e>
  800947:	85 db                	test   %ebx,%ebx
  800949:	b8 0a 00 00 00       	mov    $0xa,%eax
  80094e:	0f 44 d8             	cmove  %eax,%ebx
  800951:	b9 00 00 00 00       	mov    $0x0,%ecx
  800956:	89 5d 10             	mov    %ebx,0x10(%ebp)
  800959:	eb 46                	jmp    8009a1 <strtol+0x90>
  80095b:	83 c2 01             	add    $0x1,%edx
  80095e:	bf 00 00 00 00       	mov    $0x0,%edi
  800963:	eb d5                	jmp    80093a <strtol+0x29>
  800965:	83 c2 01             	add    $0x1,%edx
  800968:	bf 01 00 00 00       	mov    $0x1,%edi
  80096d:	eb cb                	jmp    80093a <strtol+0x29>
  80096f:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800973:	74 0e                	je     800983 <strtol+0x72>
  800975:	85 db                	test   %ebx,%ebx
  800977:	75 d8                	jne    800951 <strtol+0x40>
  800979:	83 c2 01             	add    $0x1,%edx
  80097c:	bb 08 00 00 00       	mov    $0x8,%ebx
  800981:	eb ce                	jmp    800951 <strtol+0x40>
  800983:	83 c2 02             	add    $0x2,%edx
  800986:	bb 10 00 00 00       	mov    $0x10,%ebx
  80098b:	eb c4                	jmp    800951 <strtol+0x40>
  80098d:	0f be c0             	movsbl %al,%eax
  800990:	83 e8 30             	sub    $0x30,%eax
  800993:	3b 45 10             	cmp    0x10(%ebp),%eax
  800996:	7d 3a                	jge    8009d2 <strtol+0xc1>
  800998:	83 c2 01             	add    $0x1,%edx
  80099b:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  80099f:	01 c1                	add    %eax,%ecx
  8009a1:	0f b6 02             	movzbl (%edx),%eax
  8009a4:	8d 70 d0             	lea    -0x30(%eax),%esi
  8009a7:	89 f3                	mov    %esi,%ebx
  8009a9:	80 fb 09             	cmp    $0x9,%bl
  8009ac:	76 df                	jbe    80098d <strtol+0x7c>
  8009ae:	8d 70 9f             	lea    -0x61(%eax),%esi
  8009b1:	89 f3                	mov    %esi,%ebx
  8009b3:	80 fb 19             	cmp    $0x19,%bl
  8009b6:	77 08                	ja     8009c0 <strtol+0xaf>
  8009b8:	0f be c0             	movsbl %al,%eax
  8009bb:	83 e8 57             	sub    $0x57,%eax
  8009be:	eb d3                	jmp    800993 <strtol+0x82>
  8009c0:	8d 70 bf             	lea    -0x41(%eax),%esi
  8009c3:	89 f3                	mov    %esi,%ebx
  8009c5:	80 fb 19             	cmp    $0x19,%bl
  8009c8:	77 08                	ja     8009d2 <strtol+0xc1>
  8009ca:	0f be c0             	movsbl %al,%eax
  8009cd:	83 e8 37             	sub    $0x37,%eax
  8009d0:	eb c1                	jmp    800993 <strtol+0x82>
  8009d2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  8009d6:	74 05                	je     8009dd <strtol+0xcc>
  8009d8:	8b 45 0c             	mov    0xc(%ebp),%eax
  8009db:	89 10                	mov    %edx,(%eax)
  8009dd:	89 c8                	mov    %ecx,%eax
  8009df:	f7 d8                	neg    %eax
  8009e1:	85 ff                	test   %edi,%edi
  8009e3:	0f 45 c8             	cmovne %eax,%ecx
  8009e6:	89 c8                	mov    %ecx,%eax
  8009e8:	5b                   	pop    %ebx
  8009e9:	5e                   	pop    %esi
  8009ea:	5f                   	pop    %edi
  8009eb:	5d                   	pop    %ebp
  8009ec:	c3                   	ret

008009ed <syscall>:
  8009ed:	55                   	push   %ebp
  8009ee:	89 e5                	mov    %esp,%ebp
  8009f0:	57                   	push   %edi
  8009f1:	56                   	push   %esi
  8009f2:	53                   	push   %ebx
  8009f3:	83 ec 1c             	sub    $0x1c,%esp
  8009f6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8009f9:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  8009fc:	89 ca                	mov    %ecx,%edx
  8009fe:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a01:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800a04:	8b 7d 10             	mov    0x10(%ebp),%edi
  800a07:	8b 75 14             	mov    0x14(%ebp),%esi
  800a0a:	cd 30                	int    $0x30
  800a0c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  800a10:	74 04                	je     800a16 <syscall+0x29>
  800a12:	85 c0                	test   %eax,%eax
  800a14:	7f 08                	jg     800a1e <syscall+0x31>
  800a16:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800a19:	5b                   	pop    %ebx
  800a1a:	5e                   	pop    %esi
  800a1b:	5f                   	pop    %edi
  800a1c:	5d                   	pop    %ebp
  800a1d:	c3                   	ret
  800a1e:	83 ec 0c             	sub    $0xc,%esp
  800a21:	50                   	push   %eax
  800a22:	ff 75 e0             	push   -0x20(%ebp)
  800a25:	68 dd 0f 80 00       	push   $0x800fdd
  800a2a:	6a 1e                	push   $0x1e
  800a2c:	68 fa 0f 80 00       	push   $0x800ffa
  800a31:	e8 1f 02 00 00       	call   800c55 <_panic>

00800a36 <sys_cputs>:
  800a36:	55                   	push   %ebp
  800a37:	89 e5                	mov    %esp,%ebp
  800a39:	83 ec 08             	sub    $0x8,%esp
  800a3c:	6a 00                	push   $0x0
  800a3e:	6a 00                	push   $0x0
  800a40:	6a 00                	push   $0x0
  800a42:	ff 75 0c             	push   0xc(%ebp)
  800a45:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a48:	ba 00 00 00 00       	mov    $0x0,%edx
  800a4d:	b8 00 00 00 00       	mov    $0x0,%eax
  800a52:	e8 96 ff ff ff       	call   8009ed <syscall>
  800a57:	83 c4 10             	add    $0x10,%esp
  800a5a:	c9                   	leave
  800a5b:	c3                   	ret

00800a5c <sys_cgetc>:
  800a5c:	55                   	push   %ebp
  800a5d:	89 e5                	mov    %esp,%ebp
  800a5f:	83 ec 08             	sub    $0x8,%esp
  800a62:	6a 00                	push   $0x0
  800a64:	6a 00                	push   $0x0
  800a66:	6a 00                	push   $0x0
  800a68:	6a 00                	push   $0x0
  800a6a:	b9 00 00 00 00       	mov    $0x0,%ecx
  800a6f:	ba 00 00 00 00       	mov    $0x0,%edx
  800a74:	b8 01 00 00 00       	mov    $0x1,%eax
  800a79:	e8 6f ff ff ff       	call   8009ed <syscall>
  800a7e:	c9                   	leave
  800a7f:	c3                   	ret

00800a80 <sys_env_destroy>:
  800a80:	55                   	push   %ebp
  800a81:	89 e5                	mov    %esp,%ebp
  800a83:	83 ec 08             	sub    $0x8,%esp
  800a86:	6a 00                	push   $0x0
  800a88:	6a 00                	push   $0x0
  800a8a:	6a 00                	push   $0x0
  800a8c:	6a 00                	push   $0x0
  800a8e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a91:	ba 01 00 00 00       	mov    $0x1,%edx
  800a96:	b8 03 00 00 00       	mov    $0x3,%eax
  800a9b:	e8 4d ff ff ff       	call   8009ed <syscall>
  800aa0:	c9                   	leave
  800aa1:	c3                   	ret

00800aa2 <sys_getenvid>:
  800aa2:	55                   	push   %ebp
  800aa3:	89 e5                	mov    %esp,%ebp
  800aa5:	83 ec 08             	sub    $0x8,%esp
  800aa8:	6a 00                	push   $0x0
  800aaa:	6a 00                	push   $0x0
  800aac:	6a 00                	push   $0x0
  800aae:	6a 00                	push   $0x0
  800ab0:	b9 00 00 00 00       	mov    $0x0,%ecx
  800ab5:	ba 00 00 00 00       	mov    $0x0,%edx
  800aba:	b8 02 00 00 00       	mov    $0x2,%eax
  800abf:	e8 29 ff ff ff       	call   8009ed <syscall>
  800ac4:	c9                   	leave
  800ac5:	c3                   	ret

00800ac6 <sys_yield>:
  800ac6:	55                   	push   %ebp
  800ac7:	89 e5                	mov    %esp,%ebp
  800ac9:	83 ec 08             	sub    $0x8,%esp
  800acc:	6a 00                	push   $0x0
  800ace:	6a 00                	push   $0x0
  800ad0:	6a 00                	push   $0x0
  800ad2:	6a 00                	push   $0x0
  800ad4:	b9 00 00 00 00       	mov    $0x0,%ecx
  800ad9:	ba 00 00 00 00       	mov    $0x0,%edx
  800ade:	b8 0a 00 00 00       	mov    $0xa,%eax
  800ae3:	e8 05 ff ff ff       	call   8009ed <syscall>
  800ae8:	83 c4 10             	add    $0x10,%esp
  800aeb:	c9                   	leave
  800aec:	c3                   	ret

00800aed <sys_page_alloc>:
  800aed:	55                   	push   %ebp
  800aee:	89 e5                	mov    %esp,%ebp
  800af0:	83 ec 08             	sub    $0x8,%esp
  800af3:	6a 00                	push   $0x0
  800af5:	6a 00                	push   $0x0
  800af7:	ff 75 10             	push   0x10(%ebp)
  800afa:	ff 75 0c             	push   0xc(%ebp)
  800afd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b00:	ba 01 00 00 00       	mov    $0x1,%edx
  800b05:	b8 04 00 00 00       	mov    $0x4,%eax
  800b0a:	e8 de fe ff ff       	call   8009ed <syscall>
  800b0f:	c9                   	leave
  800b10:	c3                   	ret

00800b11 <sys_page_map>:
  800b11:	55                   	push   %ebp
  800b12:	89 e5                	mov    %esp,%ebp
  800b14:	83 ec 08             	sub    $0x8,%esp
  800b17:	ff 75 18             	push   0x18(%ebp)
  800b1a:	ff 75 14             	push   0x14(%ebp)
  800b1d:	ff 75 10             	push   0x10(%ebp)
  800b20:	ff 75 0c             	push   0xc(%ebp)
  800b23:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b26:	ba 01 00 00 00       	mov    $0x1,%edx
  800b2b:	b8 05 00 00 00       	mov    $0x5,%eax
  800b30:	e8 b8 fe ff ff       	call   8009ed <syscall>
  800b35:	c9                   	leave
  800b36:	c3                   	ret

00800b37 <sys_page_unmap>:
  800b37:	55                   	push   %ebp
  800b38:	89 e5                	mov    %esp,%ebp
  800b3a:	83 ec 08             	sub    $0x8,%esp
  800b3d:	6a 00                	push   $0x0
  800b3f:	6a 00                	push   $0x0
  800b41:	6a 00                	push   $0x0
  800b43:	ff 75 0c             	push   0xc(%ebp)
  800b46:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b49:	ba 01 00 00 00       	mov    $0x1,%edx
  800b4e:	b8 06 00 00 00       	mov    $0x6,%eax
  800b53:	e8 95 fe ff ff       	call   8009ed <syscall>
  800b58:	c9                   	leave
  800b59:	c3                   	ret

00800b5a <sys_env_set_status>:
  800b5a:	55                   	push   %ebp
  800b5b:	89 e5                	mov    %esp,%ebp
  800b5d:	83 ec 08             	sub    $0x8,%esp
  800b60:	6a 00                	push   $0x0
  800b62:	6a 00                	push   $0x0
  800b64:	6a 00                	push   $0x0
  800b66:	ff 75 0c             	push   0xc(%ebp)
  800b69:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b6c:	ba 01 00 00 00       	mov    $0x1,%edx
  800b71:	b8 08 00 00 00       	mov    $0x8,%eax
  800b76:	e8 72 fe ff ff       	call   8009ed <syscall>
  800b7b:	c9                   	leave
  800b7c:	c3                   	ret

00800b7d <sys_env_set_pgfault_upcall>:
  800b7d:	55                   	push   %ebp
  800b7e:	89 e5                	mov    %esp,%ebp
  800b80:	83 ec 08             	sub    $0x8,%esp
  800b83:	6a 00                	push   $0x0
  800b85:	6a 00                	push   $0x0
  800b87:	6a 00                	push   $0x0
  800b89:	ff 75 0c             	push   0xc(%ebp)
  800b8c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b8f:	ba 01 00 00 00       	mov    $0x1,%edx
  800b94:	b8 09 00 00 00       	mov    $0x9,%eax
  800b99:	e8 4f fe ff ff       	call   8009ed <syscall>
  800b9e:	c9                   	leave
  800b9f:	c3                   	ret

00800ba0 <sys_ipc_try_send>:
  800ba0:	55                   	push   %ebp
  800ba1:	89 e5                	mov    %esp,%ebp
  800ba3:	83 ec 08             	sub    $0x8,%esp
  800ba6:	6a 00                	push   $0x0
  800ba8:	ff 75 14             	push   0x14(%ebp)
  800bab:	ff 75 10             	push   0x10(%ebp)
  800bae:	ff 75 0c             	push   0xc(%ebp)
  800bb1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bb4:	ba 00 00 00 00       	mov    $0x0,%edx
  800bb9:	b8 0c 00 00 00       	mov    $0xc,%eax
  800bbe:	e8 2a fe ff ff       	call   8009ed <syscall>
  800bc3:	c9                   	leave
  800bc4:	c3                   	ret

00800bc5 <sys_ipc_recv>:
  800bc5:	55                   	push   %ebp
  800bc6:	89 e5                	mov    %esp,%ebp
  800bc8:	83 ec 08             	sub    $0x8,%esp
  800bcb:	6a 00                	push   $0x0
  800bcd:	6a 00                	push   $0x0
  800bcf:	6a 00                	push   $0x0
  800bd1:	6a 00                	push   $0x0
  800bd3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bd6:	ba 01 00 00 00       	mov    $0x1,%edx
  800bdb:	b8 0d 00 00 00       	mov    $0xd,%eax
  800be0:	e8 08 fe ff ff       	call   8009ed <syscall>
  800be5:	c9                   	leave
  800be6:	c3                   	ret

00800be7 <set_pgfault_handler>:
  800be7:	55                   	push   %ebp
  800be8:	89 e5                	mov    %esp,%ebp
  800bea:	83 ec 08             	sub    $0x8,%esp
  800bed:	83 3d 08 20 80 00 00 	cmpl   $0x0,0x802008
  800bf4:	74 0a                	je     800c00 <set_pgfault_handler+0x19>
  800bf6:	8b 45 08             	mov    0x8(%ebp),%eax
  800bf9:	a3 08 20 80 00       	mov    %eax,0x802008
  800bfe:	c9                   	leave
  800bff:	c3                   	ret
  800c00:	83 ec 04             	sub    $0x4,%esp
  800c03:	6a 07                	push   $0x7
  800c05:	68 00 f0 bf ee       	push   $0xeebff000
  800c0a:	6a 00                	push   $0x0
  800c0c:	e8 dc fe ff ff       	call   800aed <sys_page_alloc>
  800c11:	83 c4 10             	add    $0x10,%esp
  800c14:	85 c0                	test   %eax,%eax
  800c16:	78 e6                	js     800bfe <set_pgfault_handler+0x17>
  800c18:	83 ec 08             	sub    $0x8,%esp
  800c1b:	68 30 0c 80 00       	push   $0x800c30
  800c20:	6a 00                	push   $0x0
  800c22:	e8 56 ff ff ff       	call   800b7d <sys_env_set_pgfault_upcall>
  800c27:	83 c4 10             	add    $0x10,%esp
  800c2a:	85 c0                	test   %eax,%eax
  800c2c:	79 c8                	jns    800bf6 <set_pgfault_handler+0xf>
  800c2e:	eb ce                	jmp    800bfe <set_pgfault_handler+0x17>

00800c30 <_pgfault_upcall>:
  800c30:	54                   	push   %esp
  800c31:	a1 08 20 80 00       	mov    0x802008,%eax
  800c36:	ff d0                	call   *%eax
  800c38:	83 c4 04             	add    $0x4,%esp
  800c3b:	8b 44 24 28          	mov    0x28(%esp),%eax
  800c3f:	8b 5c 24 30          	mov    0x30(%esp),%ebx
  800c43:	83 eb 04             	sub    $0x4,%ebx
  800c46:	89 03                	mov    %eax,(%ebx)
  800c48:	89 5c 24 30          	mov    %ebx,0x30(%esp)
  800c4c:	58                   	pop    %eax
  800c4d:	58                   	pop    %eax
  800c4e:	61                   	popa
  800c4f:	83 c4 04             	add    $0x4,%esp
  800c52:	9d                   	popf
  800c53:	5c                   	pop    %esp
  800c54:	c3                   	ret

00800c55 <_panic>:
  800c55:	55                   	push   %ebp
  800c56:	89 e5                	mov    %esp,%ebp
  800c58:	56                   	push   %esi
  800c59:	53                   	push   %ebx
  800c5a:	8d 5d 14             	lea    0x14(%ebp),%ebx
  800c5d:	8b 35 00 20 80 00    	mov    0x802000,%esi
  800c63:	e8 3a fe ff ff       	call   800aa2 <sys_getenvid>
  800c68:	83 ec 0c             	sub    $0xc,%esp
  800c6b:	ff 75 0c             	push   0xc(%ebp)
  800c6e:	ff 75 08             	push   0x8(%ebp)
  800c71:	56                   	push   %esi
  800c72:	50                   	push   %eax
  800c73:	68 a4 11 80 00       	push   $0x8011a4
  800c78:	e8 f7 f4 ff ff       	call   800174 <cprintf>
  800c7d:	83 c4 18             	add    $0x18,%esp
  800c80:	53                   	push   %ebx
  800c81:	ff 75 10             	push   0x10(%ebp)
  800c84:	e8 9a f4 ff ff       	call   800123 <vcprintf>
  800c89:	c7 04 24 1a 0f 80 00 	movl   $0x800f1a,(%esp)
  800c90:	e8 df f4 ff ff       	call   800174 <cprintf>
  800c95:	83 c4 10             	add    $0x10,%esp
  800c98:	cc                   	int3
  800c99:	eb fd                	jmp    800c98 <_panic+0x43>
  800c9b:	66 90                	xchg   %ax,%ax
  800c9d:	66 90                	xchg   %ax,%ax
  800c9f:	90                   	nop

00800ca0 <__udivdi3>:
  800ca0:	f3 0f 1e fb          	endbr32
  800ca4:	55                   	push   %ebp
  800ca5:	57                   	push   %edi
  800ca6:	56                   	push   %esi
  800ca7:	53                   	push   %ebx
  800ca8:	83 ec 1c             	sub    $0x1c,%esp
  800cab:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800caf:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  800cb3:	8b 74 24 34          	mov    0x34(%esp),%esi
  800cb7:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  800cbb:	85 c0                	test   %eax,%eax
  800cbd:	75 19                	jne    800cd8 <__udivdi3+0x38>
  800cbf:	39 de                	cmp    %ebx,%esi
  800cc1:	73 4d                	jae    800d10 <__udivdi3+0x70>
  800cc3:	31 ff                	xor    %edi,%edi
  800cc5:	89 e8                	mov    %ebp,%eax
  800cc7:	89 f2                	mov    %esi,%edx
  800cc9:	f7 f3                	div    %ebx
  800ccb:	89 fa                	mov    %edi,%edx
  800ccd:	83 c4 1c             	add    $0x1c,%esp
  800cd0:	5b                   	pop    %ebx
  800cd1:	5e                   	pop    %esi
  800cd2:	5f                   	pop    %edi
  800cd3:	5d                   	pop    %ebp
  800cd4:	c3                   	ret
  800cd5:	8d 76 00             	lea    0x0(%esi),%esi
  800cd8:	39 c6                	cmp    %eax,%esi
  800cda:	73 14                	jae    800cf0 <__udivdi3+0x50>
  800cdc:	31 ff                	xor    %edi,%edi
  800cde:	31 c0                	xor    %eax,%eax
  800ce0:	89 fa                	mov    %edi,%edx
  800ce2:	83 c4 1c             	add    $0x1c,%esp
  800ce5:	5b                   	pop    %ebx
  800ce6:	5e                   	pop    %esi
  800ce7:	5f                   	pop    %edi
  800ce8:	5d                   	pop    %ebp
  800ce9:	c3                   	ret
  800cea:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800cf0:	0f bd f8             	bsr    %eax,%edi
  800cf3:	83 f7 1f             	xor    $0x1f,%edi
  800cf6:	75 48                	jne    800d40 <__udivdi3+0xa0>
  800cf8:	39 f0                	cmp    %esi,%eax
  800cfa:	72 06                	jb     800d02 <__udivdi3+0x62>
  800cfc:	31 c0                	xor    %eax,%eax
  800cfe:	39 dd                	cmp    %ebx,%ebp
  800d00:	72 de                	jb     800ce0 <__udivdi3+0x40>
  800d02:	b8 01 00 00 00       	mov    $0x1,%eax
  800d07:	eb d7                	jmp    800ce0 <__udivdi3+0x40>
  800d09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800d10:	89 d9                	mov    %ebx,%ecx
  800d12:	85 db                	test   %ebx,%ebx
  800d14:	75 0b                	jne    800d21 <__udivdi3+0x81>
  800d16:	b8 01 00 00 00       	mov    $0x1,%eax
  800d1b:	31 d2                	xor    %edx,%edx
  800d1d:	f7 f3                	div    %ebx
  800d1f:	89 c1                	mov    %eax,%ecx
  800d21:	31 d2                	xor    %edx,%edx
  800d23:	89 f0                	mov    %esi,%eax
  800d25:	f7 f1                	div    %ecx
  800d27:	89 c6                	mov    %eax,%esi
  800d29:	89 e8                	mov    %ebp,%eax
  800d2b:	89 f7                	mov    %esi,%edi
  800d2d:	f7 f1                	div    %ecx
  800d2f:	89 fa                	mov    %edi,%edx
  800d31:	83 c4 1c             	add    $0x1c,%esp
  800d34:	5b                   	pop    %ebx
  800d35:	5e                   	pop    %esi
  800d36:	5f                   	pop    %edi
  800d37:	5d                   	pop    %ebp
  800d38:	c3                   	ret
  800d39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800d40:	89 f9                	mov    %edi,%ecx
  800d42:	ba 20 00 00 00       	mov    $0x20,%edx
  800d47:	29 fa                	sub    %edi,%edx
  800d49:	d3 e0                	shl    %cl,%eax
  800d4b:	89 44 24 08          	mov    %eax,0x8(%esp)
  800d4f:	89 d1                	mov    %edx,%ecx
  800d51:	89 d8                	mov    %ebx,%eax
  800d53:	d3 e8                	shr    %cl,%eax
  800d55:	89 c1                	mov    %eax,%ecx
  800d57:	8b 44 24 08          	mov    0x8(%esp),%eax
  800d5b:	09 c1                	or     %eax,%ecx
  800d5d:	89 f0                	mov    %esi,%eax
  800d5f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800d63:	89 f9                	mov    %edi,%ecx
  800d65:	d3 e3                	shl    %cl,%ebx
  800d67:	89 d1                	mov    %edx,%ecx
  800d69:	d3 e8                	shr    %cl,%eax
  800d6b:	89 f9                	mov    %edi,%ecx
  800d6d:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  800d71:	89 eb                	mov    %ebp,%ebx
  800d73:	d3 e6                	shl    %cl,%esi
  800d75:	89 d1                	mov    %edx,%ecx
  800d77:	d3 eb                	shr    %cl,%ebx
  800d79:	09 f3                	or     %esi,%ebx
  800d7b:	89 c6                	mov    %eax,%esi
  800d7d:	89 f2                	mov    %esi,%edx
  800d7f:	89 d8                	mov    %ebx,%eax
  800d81:	f7 74 24 08          	divl   0x8(%esp)
  800d85:	89 d6                	mov    %edx,%esi
  800d87:	89 c3                	mov    %eax,%ebx
  800d89:	f7 64 24 0c          	mull   0xc(%esp)
  800d8d:	39 d6                	cmp    %edx,%esi
  800d8f:	72 1f                	jb     800db0 <__udivdi3+0x110>
  800d91:	89 f9                	mov    %edi,%ecx
  800d93:	d3 e5                	shl    %cl,%ebp
  800d95:	39 c5                	cmp    %eax,%ebp
  800d97:	73 04                	jae    800d9d <__udivdi3+0xfd>
  800d99:	39 d6                	cmp    %edx,%esi
  800d9b:	74 13                	je     800db0 <__udivdi3+0x110>
  800d9d:	89 d8                	mov    %ebx,%eax
  800d9f:	31 ff                	xor    %edi,%edi
  800da1:	e9 3a ff ff ff       	jmp    800ce0 <__udivdi3+0x40>
  800da6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800dad:	00 
  800dae:	66 90                	xchg   %ax,%ax
  800db0:	8d 43 ff             	lea    -0x1(%ebx),%eax
  800db3:	31 ff                	xor    %edi,%edi
  800db5:	e9 26 ff ff ff       	jmp    800ce0 <__udivdi3+0x40>
  800dba:	66 90                	xchg   %ax,%ax
  800dbc:	66 90                	xchg   %ax,%ax
  800dbe:	66 90                	xchg   %ax,%ax

00800dc0 <__umoddi3>:
  800dc0:	f3 0f 1e fb          	endbr32
  800dc4:	55                   	push   %ebp
  800dc5:	57                   	push   %edi
  800dc6:	56                   	push   %esi
  800dc7:	53                   	push   %ebx
  800dc8:	83 ec 1c             	sub    $0x1c,%esp
  800dcb:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  800dcf:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800dd3:	8b 74 24 30          	mov    0x30(%esp),%esi
  800dd7:	8b 7c 24 38          	mov    0x38(%esp),%edi
  800ddb:	89 da                	mov    %ebx,%edx
  800ddd:	85 c0                	test   %eax,%eax
  800ddf:	75 17                	jne    800df8 <__umoddi3+0x38>
  800de1:	39 fb                	cmp    %edi,%ebx
  800de3:	73 53                	jae    800e38 <__umoddi3+0x78>
  800de5:	89 f0                	mov    %esi,%eax
  800de7:	f7 f7                	div    %edi
  800de9:	89 d0                	mov    %edx,%eax
  800deb:	31 d2                	xor    %edx,%edx
  800ded:	83 c4 1c             	add    $0x1c,%esp
  800df0:	5b                   	pop    %ebx
  800df1:	5e                   	pop    %esi
  800df2:	5f                   	pop    %edi
  800df3:	5d                   	pop    %ebp
  800df4:	c3                   	ret
  800df5:	8d 76 00             	lea    0x0(%esi),%esi
  800df8:	89 f1                	mov    %esi,%ecx
  800dfa:	39 c3                	cmp    %eax,%ebx
  800dfc:	73 12                	jae    800e10 <__umoddi3+0x50>
  800dfe:	89 f0                	mov    %esi,%eax
  800e00:	83 c4 1c             	add    $0x1c,%esp
  800e03:	5b                   	pop    %ebx
  800e04:	5e                   	pop    %esi
  800e05:	5f                   	pop    %edi
  800e06:	5d                   	pop    %ebp
  800e07:	c3                   	ret
  800e08:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800e0f:	00 
  800e10:	0f bd e8             	bsr    %eax,%ebp
  800e13:	83 f5 1f             	xor    $0x1f,%ebp
  800e16:	75 48                	jne    800e60 <__umoddi3+0xa0>
  800e18:	39 d8                	cmp    %ebx,%eax
  800e1a:	0f 82 d0 00 00 00    	jb     800ef0 <__umoddi3+0x130>
  800e20:	39 fe                	cmp    %edi,%esi
  800e22:	0f 83 c8 00 00 00    	jae    800ef0 <__umoddi3+0x130>
  800e28:	89 c8                	mov    %ecx,%eax
  800e2a:	83 c4 1c             	add    $0x1c,%esp
  800e2d:	5b                   	pop    %ebx
  800e2e:	5e                   	pop    %esi
  800e2f:	5f                   	pop    %edi
  800e30:	5d                   	pop    %ebp
  800e31:	c3                   	ret
  800e32:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800e38:	89 f9                	mov    %edi,%ecx
  800e3a:	85 ff                	test   %edi,%edi
  800e3c:	75 0b                	jne    800e49 <__umoddi3+0x89>
  800e3e:	b8 01 00 00 00       	mov    $0x1,%eax
  800e43:	31 d2                	xor    %edx,%edx
  800e45:	f7 f7                	div    %edi
  800e47:	89 c1                	mov    %eax,%ecx
  800e49:	89 d8                	mov    %ebx,%eax
  800e4b:	31 d2                	xor    %edx,%edx
  800e4d:	f7 f1                	div    %ecx
  800e4f:	89 f0                	mov    %esi,%eax
  800e51:	f7 f1                	div    %ecx
  800e53:	89 d0                	mov    %edx,%eax
  800e55:	31 d2                	xor    %edx,%edx
  800e57:	eb 94                	jmp    800ded <__umoddi3+0x2d>
  800e59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800e60:	89 e9                	mov    %ebp,%ecx
  800e62:	ba 20 00 00 00       	mov    $0x20,%edx
  800e67:	29 ea                	sub    %ebp,%edx
  800e69:	d3 e0                	shl    %cl,%eax
  800e6b:	89 44 24 08          	mov    %eax,0x8(%esp)
  800e6f:	89 d1                	mov    %edx,%ecx
  800e71:	89 f8                	mov    %edi,%eax
  800e73:	d3 e8                	shr    %cl,%eax
  800e75:	89 54 24 04          	mov    %edx,0x4(%esp)
  800e79:	8b 54 24 04          	mov    0x4(%esp),%edx
  800e7d:	89 c1                	mov    %eax,%ecx
  800e7f:	8b 44 24 08          	mov    0x8(%esp),%eax
  800e83:	09 c1                	or     %eax,%ecx
  800e85:	89 d8                	mov    %ebx,%eax
  800e87:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800e8b:	89 e9                	mov    %ebp,%ecx
  800e8d:	d3 e7                	shl    %cl,%edi
  800e8f:	89 d1                	mov    %edx,%ecx
  800e91:	d3 e8                	shr    %cl,%eax
  800e93:	89 e9                	mov    %ebp,%ecx
  800e95:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  800e99:	d3 e3                	shl    %cl,%ebx
  800e9b:	89 c7                	mov    %eax,%edi
  800e9d:	89 d1                	mov    %edx,%ecx
  800e9f:	89 f0                	mov    %esi,%eax
  800ea1:	d3 e8                	shr    %cl,%eax
  800ea3:	89 fa                	mov    %edi,%edx
  800ea5:	89 e9                	mov    %ebp,%ecx
  800ea7:	09 d8                	or     %ebx,%eax
  800ea9:	d3 e6                	shl    %cl,%esi
  800eab:	f7 74 24 08          	divl   0x8(%esp)
  800eaf:	89 d3                	mov    %edx,%ebx
  800eb1:	f7 64 24 0c          	mull   0xc(%esp)
  800eb5:	89 c7                	mov    %eax,%edi
  800eb7:	89 d1                	mov    %edx,%ecx
  800eb9:	39 d3                	cmp    %edx,%ebx
  800ebb:	72 06                	jb     800ec3 <__umoddi3+0x103>
  800ebd:	75 10                	jne    800ecf <__umoddi3+0x10f>
  800ebf:	39 c6                	cmp    %eax,%esi
  800ec1:	73 0c                	jae    800ecf <__umoddi3+0x10f>
  800ec3:	2b 44 24 0c          	sub    0xc(%esp),%eax
  800ec7:	1b 54 24 08          	sbb    0x8(%esp),%edx
  800ecb:	89 d1                	mov    %edx,%ecx
  800ecd:	89 c7                	mov    %eax,%edi
  800ecf:	89 f2                	mov    %esi,%edx
  800ed1:	29 fa                	sub    %edi,%edx
  800ed3:	19 cb                	sbb    %ecx,%ebx
  800ed5:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  800eda:	89 d8                	mov    %ebx,%eax
  800edc:	d3 e0                	shl    %cl,%eax
  800ede:	89 e9                	mov    %ebp,%ecx
  800ee0:	d3 ea                	shr    %cl,%edx
  800ee2:	d3 eb                	shr    %cl,%ebx
  800ee4:	09 d0                	or     %edx,%eax
  800ee6:	89 da                	mov    %ebx,%edx
  800ee8:	83 c4 1c             	add    $0x1c,%esp
  800eeb:	5b                   	pop    %ebx
  800eec:	5e                   	pop    %esi
  800eed:	5f                   	pop    %edi
  800eee:	5d                   	pop    %ebp
  800eef:	c3                   	ret
  800ef0:	89 da                	mov    %ebx,%edx
  800ef2:	89 f1                	mov    %esi,%ecx
  800ef4:	29 f9                	sub    %edi,%ecx
  800ef6:	19 c2                	sbb    %eax,%edx
  800ef8:	89 c8                	mov    %ecx,%eax
  800efa:	e9 2b ff ff ff       	jmp    800e2a <__umoddi3+0x6a>
