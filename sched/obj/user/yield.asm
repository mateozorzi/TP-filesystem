
obj/user/yield:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 72 00 00 00       	call   8000a3 <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <umain>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	53                   	push   %ebx
  800037:	83 ec 08             	sub    $0x8,%esp
  80003a:	a1 04 20 80 00       	mov    0x802004,%eax
  80003f:	8b 50 5c             	mov    0x5c(%eax),%edx
  800042:	8b 40 48             	mov    0x48(%eax),%eax
  800045:	52                   	push   %edx
  800046:	50                   	push   %eax
  800047:	68 c0 0e 80 00       	push   $0x800ec0
  80004c:	e8 46 01 00 00       	call   800197 <cprintf>
  800051:	83 c4 10             	add    $0x10,%esp
  800054:	bb 00 00 00 00       	mov    $0x0,%ebx
  800059:	e8 8b 0a 00 00       	call   800ae9 <sys_yield>
  80005e:	a1 04 20 80 00       	mov    0x802004,%eax
  800063:	8b 50 5c             	mov    0x5c(%eax),%edx
  800066:	8b 40 48             	mov    0x48(%eax),%eax
  800069:	52                   	push   %edx
  80006a:	53                   	push   %ebx
  80006b:	50                   	push   %eax
  80006c:	68 e8 0e 80 00       	push   $0x800ee8
  800071:	e8 21 01 00 00       	call   800197 <cprintf>
  800076:	83 c3 01             	add    $0x1,%ebx
  800079:	83 c4 10             	add    $0x10,%esp
  80007c:	83 fb 05             	cmp    $0x5,%ebx
  80007f:	75 d8                	jne    800059 <umain+0x26>
  800081:	a1 04 20 80 00       	mov    0x802004,%eax
  800086:	8b 50 5c             	mov    0x5c(%eax),%edx
  800089:	8b 40 48             	mov    0x48(%eax),%eax
  80008c:	83 ec 04             	sub    $0x4,%esp
  80008f:	52                   	push   %edx
  800090:	50                   	push   %eax
  800091:	68 18 0f 80 00       	push   $0x800f18
  800096:	e8 fc 00 00 00       	call   800197 <cprintf>
  80009b:	83 c4 10             	add    $0x10,%esp
  80009e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8000a1:	c9                   	leave
  8000a2:	c3                   	ret

008000a3 <libmain>:
  8000a3:	55                   	push   %ebp
  8000a4:	89 e5                	mov    %esp,%ebp
  8000a6:	56                   	push   %esi
  8000a7:	53                   	push   %ebx
  8000a8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8000ab:	8b 75 0c             	mov    0xc(%ebp),%esi
  8000ae:	e8 12 0a 00 00       	call   800ac5 <sys_getenvid>
  8000b3:	85 c0                	test   %eax,%eax
  8000b5:	78 15                	js     8000cc <libmain+0x29>
  8000b7:	25 ff 03 00 00       	and    $0x3ff,%eax
  8000bc:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  8000c2:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  8000c7:	a3 04 20 80 00       	mov    %eax,0x802004
  8000cc:	85 db                	test   %ebx,%ebx
  8000ce:	7e 07                	jle    8000d7 <libmain+0x34>
  8000d0:	8b 06                	mov    (%esi),%eax
  8000d2:	a3 00 20 80 00       	mov    %eax,0x802000
  8000d7:	83 ec 08             	sub    $0x8,%esp
  8000da:	56                   	push   %esi
  8000db:	53                   	push   %ebx
  8000dc:	e8 52 ff ff ff       	call   800033 <umain>
  8000e1:	e8 0a 00 00 00       	call   8000f0 <exit>
  8000e6:	83 c4 10             	add    $0x10,%esp
  8000e9:	8d 65 f8             	lea    -0x8(%ebp),%esp
  8000ec:	5b                   	pop    %ebx
  8000ed:	5e                   	pop    %esi
  8000ee:	5d                   	pop    %ebp
  8000ef:	c3                   	ret

008000f0 <exit>:
  8000f0:	55                   	push   %ebp
  8000f1:	89 e5                	mov    %esp,%ebp
  8000f3:	83 ec 14             	sub    $0x14,%esp
  8000f6:	6a 00                	push   $0x0
  8000f8:	e8 a6 09 00 00       	call   800aa3 <sys_env_destroy>
  8000fd:	83 c4 10             	add    $0x10,%esp
  800100:	c9                   	leave
  800101:	c3                   	ret

00800102 <putch>:
  800102:	55                   	push   %ebp
  800103:	89 e5                	mov    %esp,%ebp
  800105:	53                   	push   %ebx
  800106:	83 ec 04             	sub    $0x4,%esp
  800109:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  80010c:	8b 13                	mov    (%ebx),%edx
  80010e:	8d 42 01             	lea    0x1(%edx),%eax
  800111:	89 03                	mov    %eax,(%ebx)
  800113:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800116:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  80011a:	3d ff 00 00 00       	cmp    $0xff,%eax
  80011f:	74 09                	je     80012a <putch+0x28>
  800121:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  800125:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800128:	c9                   	leave
  800129:	c3                   	ret
  80012a:	83 ec 08             	sub    $0x8,%esp
  80012d:	68 ff 00 00 00       	push   $0xff
  800132:	8d 43 08             	lea    0x8(%ebx),%eax
  800135:	50                   	push   %eax
  800136:	e8 1e 09 00 00       	call   800a59 <sys_cputs>
  80013b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  800141:	83 c4 10             	add    $0x10,%esp
  800144:	eb db                	jmp    800121 <putch+0x1f>

00800146 <vcprintf>:
  800146:	55                   	push   %ebp
  800147:	89 e5                	mov    %esp,%ebp
  800149:	81 ec 18 01 00 00    	sub    $0x118,%esp
  80014f:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  800156:	00 00 00 
  800159:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  800160:	00 00 00 
  800163:	ff 75 0c             	push   0xc(%ebp)
  800166:	ff 75 08             	push   0x8(%ebp)
  800169:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  80016f:	50                   	push   %eax
  800170:	68 02 01 80 00       	push   $0x800102
  800175:	e8 74 01 00 00       	call   8002ee <vprintfmt>
  80017a:	83 c4 08             	add    $0x8,%esp
  80017d:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  800183:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  800189:	50                   	push   %eax
  80018a:	e8 ca 08 00 00       	call   800a59 <sys_cputs>
  80018f:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  800195:	c9                   	leave
  800196:	c3                   	ret

00800197 <cprintf>:
  800197:	55                   	push   %ebp
  800198:	89 e5                	mov    %esp,%ebp
  80019a:	83 ec 10             	sub    $0x10,%esp
  80019d:	8d 45 0c             	lea    0xc(%ebp),%eax
  8001a0:	50                   	push   %eax
  8001a1:	ff 75 08             	push   0x8(%ebp)
  8001a4:	e8 9d ff ff ff       	call   800146 <vcprintf>
  8001a9:	c9                   	leave
  8001aa:	c3                   	ret

008001ab <printnum>:
  8001ab:	55                   	push   %ebp
  8001ac:	89 e5                	mov    %esp,%ebp
  8001ae:	57                   	push   %edi
  8001af:	56                   	push   %esi
  8001b0:	53                   	push   %ebx
  8001b1:	83 ec 1c             	sub    $0x1c,%esp
  8001b4:	89 c7                	mov    %eax,%edi
  8001b6:	89 d6                	mov    %edx,%esi
  8001b8:	8b 45 08             	mov    0x8(%ebp),%eax
  8001bb:	8b 55 0c             	mov    0xc(%ebp),%edx
  8001be:	89 d1                	mov    %edx,%ecx
  8001c0:	89 c2                	mov    %eax,%edx
  8001c2:	89 45 d8             	mov    %eax,-0x28(%ebp)
  8001c5:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  8001c8:	8b 45 10             	mov    0x10(%ebp),%eax
  8001cb:	8b 5d 14             	mov    0x14(%ebp),%ebx
  8001ce:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8001d1:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  8001d8:	39 c2                	cmp    %eax,%edx
  8001da:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  8001dd:	72 3e                	jb     80021d <printnum+0x72>
  8001df:	83 ec 0c             	sub    $0xc,%esp
  8001e2:	ff 75 18             	push   0x18(%ebp)
  8001e5:	83 eb 01             	sub    $0x1,%ebx
  8001e8:	53                   	push   %ebx
  8001e9:	50                   	push   %eax
  8001ea:	83 ec 08             	sub    $0x8,%esp
  8001ed:	ff 75 e4             	push   -0x1c(%ebp)
  8001f0:	ff 75 e0             	push   -0x20(%ebp)
  8001f3:	ff 75 dc             	push   -0x24(%ebp)
  8001f6:	ff 75 d8             	push   -0x28(%ebp)
  8001f9:	e8 52 0a 00 00       	call   800c50 <__udivdi3>
  8001fe:	83 c4 18             	add    $0x18,%esp
  800201:	52                   	push   %edx
  800202:	50                   	push   %eax
  800203:	89 f2                	mov    %esi,%edx
  800205:	89 f8                	mov    %edi,%eax
  800207:	e8 9f ff ff ff       	call   8001ab <printnum>
  80020c:	83 c4 20             	add    $0x20,%esp
  80020f:	eb 13                	jmp    800224 <printnum+0x79>
  800211:	83 ec 08             	sub    $0x8,%esp
  800214:	56                   	push   %esi
  800215:	ff 75 18             	push   0x18(%ebp)
  800218:	ff d7                	call   *%edi
  80021a:	83 c4 10             	add    $0x10,%esp
  80021d:	83 eb 01             	sub    $0x1,%ebx
  800220:	85 db                	test   %ebx,%ebx
  800222:	7f ed                	jg     800211 <printnum+0x66>
  800224:	83 ec 08             	sub    $0x8,%esp
  800227:	56                   	push   %esi
  800228:	83 ec 04             	sub    $0x4,%esp
  80022b:	ff 75 e4             	push   -0x1c(%ebp)
  80022e:	ff 75 e0             	push   -0x20(%ebp)
  800231:	ff 75 dc             	push   -0x24(%ebp)
  800234:	ff 75 d8             	push   -0x28(%ebp)
  800237:	e8 34 0b 00 00       	call   800d70 <__umoddi3>
  80023c:	83 c4 14             	add    $0x14,%esp
  80023f:	0f be 80 6d 0f 80 00 	movsbl 0x800f6d(%eax),%eax
  800246:	50                   	push   %eax
  800247:	ff d7                	call   *%edi
  800249:	83 c4 10             	add    $0x10,%esp
  80024c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  80024f:	5b                   	pop    %ebx
  800250:	5e                   	pop    %esi
  800251:	5f                   	pop    %edi
  800252:	5d                   	pop    %ebp
  800253:	c3                   	ret

00800254 <getuint>:
  800254:	83 fa 01             	cmp    $0x1,%edx
  800257:	7f 13                	jg     80026c <getuint+0x18>
  800259:	85 d2                	test   %edx,%edx
  80025b:	74 1c                	je     800279 <getuint+0x25>
  80025d:	8b 10                	mov    (%eax),%edx
  80025f:	8d 4a 04             	lea    0x4(%edx),%ecx
  800262:	89 08                	mov    %ecx,(%eax)
  800264:	8b 02                	mov    (%edx),%eax
  800266:	ba 00 00 00 00       	mov    $0x0,%edx
  80026b:	c3                   	ret
  80026c:	8b 10                	mov    (%eax),%edx
  80026e:	8d 4a 08             	lea    0x8(%edx),%ecx
  800271:	89 08                	mov    %ecx,(%eax)
  800273:	8b 02                	mov    (%edx),%eax
  800275:	8b 52 04             	mov    0x4(%edx),%edx
  800278:	c3                   	ret
  800279:	8b 10                	mov    (%eax),%edx
  80027b:	8d 4a 04             	lea    0x4(%edx),%ecx
  80027e:	89 08                	mov    %ecx,(%eax)
  800280:	8b 02                	mov    (%edx),%eax
  800282:	ba 00 00 00 00       	mov    $0x0,%edx
  800287:	c3                   	ret

00800288 <getint>:
  800288:	83 fa 01             	cmp    $0x1,%edx
  80028b:	7f 0f                	jg     80029c <getint+0x14>
  80028d:	85 d2                	test   %edx,%edx
  80028f:	74 18                	je     8002a9 <getint+0x21>
  800291:	8b 10                	mov    (%eax),%edx
  800293:	8d 4a 04             	lea    0x4(%edx),%ecx
  800296:	89 08                	mov    %ecx,(%eax)
  800298:	8b 02                	mov    (%edx),%eax
  80029a:	99                   	cltd
  80029b:	c3                   	ret
  80029c:	8b 10                	mov    (%eax),%edx
  80029e:	8d 4a 08             	lea    0x8(%edx),%ecx
  8002a1:	89 08                	mov    %ecx,(%eax)
  8002a3:	8b 02                	mov    (%edx),%eax
  8002a5:	8b 52 04             	mov    0x4(%edx),%edx
  8002a8:	c3                   	ret
  8002a9:	8b 10                	mov    (%eax),%edx
  8002ab:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002ae:	89 08                	mov    %ecx,(%eax)
  8002b0:	8b 02                	mov    (%edx),%eax
  8002b2:	99                   	cltd
  8002b3:	c3                   	ret

008002b4 <sprintputch>:
  8002b4:	55                   	push   %ebp
  8002b5:	89 e5                	mov    %esp,%ebp
  8002b7:	8b 45 0c             	mov    0xc(%ebp),%eax
  8002ba:	83 40 08 01          	addl   $0x1,0x8(%eax)
  8002be:	8b 10                	mov    (%eax),%edx
  8002c0:	3b 50 04             	cmp    0x4(%eax),%edx
  8002c3:	73 0a                	jae    8002cf <sprintputch+0x1b>
  8002c5:	8d 4a 01             	lea    0x1(%edx),%ecx
  8002c8:	89 08                	mov    %ecx,(%eax)
  8002ca:	8b 45 08             	mov    0x8(%ebp),%eax
  8002cd:	88 02                	mov    %al,(%edx)
  8002cf:	5d                   	pop    %ebp
  8002d0:	c3                   	ret

008002d1 <printfmt>:
  8002d1:	55                   	push   %ebp
  8002d2:	89 e5                	mov    %esp,%ebp
  8002d4:	83 ec 08             	sub    $0x8,%esp
  8002d7:	8d 45 14             	lea    0x14(%ebp),%eax
  8002da:	50                   	push   %eax
  8002db:	ff 75 10             	push   0x10(%ebp)
  8002de:	ff 75 0c             	push   0xc(%ebp)
  8002e1:	ff 75 08             	push   0x8(%ebp)
  8002e4:	e8 05 00 00 00       	call   8002ee <vprintfmt>
  8002e9:	83 c4 10             	add    $0x10,%esp
  8002ec:	c9                   	leave
  8002ed:	c3                   	ret

008002ee <vprintfmt>:
  8002ee:	55                   	push   %ebp
  8002ef:	89 e5                	mov    %esp,%ebp
  8002f1:	57                   	push   %edi
  8002f2:	56                   	push   %esi
  8002f3:	53                   	push   %ebx
  8002f4:	83 ec 2c             	sub    $0x2c,%esp
  8002f7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8002fa:	8b 75 0c             	mov    0xc(%ebp),%esi
  8002fd:	8b 7d 10             	mov    0x10(%ebp),%edi
  800300:	eb 0a                	jmp    80030c <vprintfmt+0x1e>
  800302:	83 ec 08             	sub    $0x8,%esp
  800305:	56                   	push   %esi
  800306:	50                   	push   %eax
  800307:	ff d3                	call   *%ebx
  800309:	83 c4 10             	add    $0x10,%esp
  80030c:	83 c7 01             	add    $0x1,%edi
  80030f:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  800313:	83 f8 25             	cmp    $0x25,%eax
  800316:	74 0c                	je     800324 <vprintfmt+0x36>
  800318:	85 c0                	test   %eax,%eax
  80031a:	75 e6                	jne    800302 <vprintfmt+0x14>
  80031c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  80031f:	5b                   	pop    %ebx
  800320:	5e                   	pop    %esi
  800321:	5f                   	pop    %edi
  800322:	5d                   	pop    %ebp
  800323:	c3                   	ret
  800324:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  800328:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  80032f:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800336:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  80033d:	b9 00 00 00 00       	mov    $0x0,%ecx
  800342:	8d 47 01             	lea    0x1(%edi),%eax
  800345:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800348:	0f b6 17             	movzbl (%edi),%edx
  80034b:	8d 42 dd             	lea    -0x23(%edx),%eax
  80034e:	3c 55                	cmp    $0x55,%al
  800350:	0f 87 c3 02 00 00    	ja     800619 <vprintfmt+0x32b>
  800356:	0f b6 c0             	movzbl %al,%eax
  800359:	ff 24 85 60 10 80 00 	jmp    *0x801060(,%eax,4)
  800360:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800363:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  800367:	eb d9                	jmp    800342 <vprintfmt+0x54>
  800369:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80036c:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  800370:	eb d0                	jmp    800342 <vprintfmt+0x54>
  800372:	0f b6 d2             	movzbl %dl,%edx
  800375:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800378:	b8 00 00 00 00       	mov    $0x0,%eax
  80037d:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  800380:	8d 04 80             	lea    (%eax,%eax,4),%eax
  800383:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  800387:	0f be 17             	movsbl (%edi),%edx
  80038a:	8d 4a d0             	lea    -0x30(%edx),%ecx
  80038d:	83 f9 09             	cmp    $0x9,%ecx
  800390:	77 52                	ja     8003e4 <vprintfmt+0xf6>
  800392:	83 c7 01             	add    $0x1,%edi
  800395:	eb e9                	jmp    800380 <vprintfmt+0x92>
  800397:	8b 45 14             	mov    0x14(%ebp),%eax
  80039a:	8d 50 04             	lea    0x4(%eax),%edx
  80039d:	89 55 14             	mov    %edx,0x14(%ebp)
  8003a0:	8b 00                	mov    (%eax),%eax
  8003a2:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8003a5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003a8:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  8003ac:	79 94                	jns    800342 <vprintfmt+0x54>
  8003ae:	8b 45 d0             	mov    -0x30(%ebp),%eax
  8003b1:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8003b4:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  8003bb:	eb 85                	jmp    800342 <vprintfmt+0x54>
  8003bd:	8b 55 e0             	mov    -0x20(%ebp),%edx
  8003c0:	85 d2                	test   %edx,%edx
  8003c2:	b8 00 00 00 00       	mov    $0x0,%eax
  8003c7:	0f 49 c2             	cmovns %edx,%eax
  8003ca:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8003cd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003d0:	e9 6d ff ff ff       	jmp    800342 <vprintfmt+0x54>
  8003d5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003d8:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  8003df:	e9 5e ff ff ff       	jmp    800342 <vprintfmt+0x54>
  8003e4:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  8003e7:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8003ea:	eb bc                	jmp    8003a8 <vprintfmt+0xba>
  8003ec:	83 c1 01             	add    $0x1,%ecx
  8003ef:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003f2:	e9 4b ff ff ff       	jmp    800342 <vprintfmt+0x54>
  8003f7:	8b 45 14             	mov    0x14(%ebp),%eax
  8003fa:	8d 50 04             	lea    0x4(%eax),%edx
  8003fd:	89 55 14             	mov    %edx,0x14(%ebp)
  800400:	83 ec 08             	sub    $0x8,%esp
  800403:	56                   	push   %esi
  800404:	ff 30                	push   (%eax)
  800406:	ff d3                	call   *%ebx
  800408:	83 c4 10             	add    $0x10,%esp
  80040b:	e9 a0 01 00 00       	jmp    8005b0 <vprintfmt+0x2c2>
  800410:	8b 45 14             	mov    0x14(%ebp),%eax
  800413:	8d 50 04             	lea    0x4(%eax),%edx
  800416:	89 55 14             	mov    %edx,0x14(%ebp)
  800419:	8b 10                	mov    (%eax),%edx
  80041b:	89 d0                	mov    %edx,%eax
  80041d:	f7 d8                	neg    %eax
  80041f:	0f 48 c2             	cmovs  %edx,%eax
  800422:	83 f8 08             	cmp    $0x8,%eax
  800425:	7f 20                	jg     800447 <vprintfmt+0x159>
  800427:	8b 14 85 c0 11 80 00 	mov    0x8011c0(,%eax,4),%edx
  80042e:	85 d2                	test   %edx,%edx
  800430:	74 15                	je     800447 <vprintfmt+0x159>
  800432:	52                   	push   %edx
  800433:	68 8e 0f 80 00       	push   $0x800f8e
  800438:	56                   	push   %esi
  800439:	53                   	push   %ebx
  80043a:	e8 92 fe ff ff       	call   8002d1 <printfmt>
  80043f:	83 c4 10             	add    $0x10,%esp
  800442:	e9 69 01 00 00       	jmp    8005b0 <vprintfmt+0x2c2>
  800447:	50                   	push   %eax
  800448:	68 85 0f 80 00       	push   $0x800f85
  80044d:	56                   	push   %esi
  80044e:	53                   	push   %ebx
  80044f:	e8 7d fe ff ff       	call   8002d1 <printfmt>
  800454:	83 c4 10             	add    $0x10,%esp
  800457:	e9 54 01 00 00       	jmp    8005b0 <vprintfmt+0x2c2>
  80045c:	8b 45 14             	mov    0x14(%ebp),%eax
  80045f:	8d 50 04             	lea    0x4(%eax),%edx
  800462:	89 55 14             	mov    %edx,0x14(%ebp)
  800465:	8b 08                	mov    (%eax),%ecx
  800467:	85 c9                	test   %ecx,%ecx
  800469:	b8 7e 0f 80 00       	mov    $0x800f7e,%eax
  80046e:	0f 45 c1             	cmovne %ecx,%eax
  800471:	89 45 cc             	mov    %eax,-0x34(%ebp)
  800474:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800478:	7e 06                	jle    800480 <vprintfmt+0x192>
  80047a:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  80047e:	75 0b                	jne    80048b <vprintfmt+0x19d>
  800480:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  800483:	8b 7d d0             	mov    -0x30(%ebp),%edi
  800486:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800489:	eb 5c                	jmp    8004e7 <vprintfmt+0x1f9>
  80048b:	83 ec 08             	sub    $0x8,%esp
  80048e:	ff 75 d0             	push   -0x30(%ebp)
  800491:	ff 75 cc             	push   -0x34(%ebp)
  800494:	e8 20 02 00 00       	call   8006b9 <strnlen>
  800499:	89 c2                	mov    %eax,%edx
  80049b:	8b 45 e0             	mov    -0x20(%ebp),%eax
  80049e:	29 d0                	sub    %edx,%eax
  8004a0:	83 c4 10             	add    $0x10,%esp
  8004a3:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  8004a7:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8004aa:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8004ad:	89 c3                	mov    %eax,%ebx
  8004af:	eb 0e                	jmp    8004bf <vprintfmt+0x1d1>
  8004b1:	83 ec 08             	sub    $0x8,%esp
  8004b4:	56                   	push   %esi
  8004b5:	57                   	push   %edi
  8004b6:	ff 55 08             	call   *0x8(%ebp)
  8004b9:	83 eb 01             	sub    $0x1,%ebx
  8004bc:	83 c4 10             	add    $0x10,%esp
  8004bf:	85 db                	test   %ebx,%ebx
  8004c1:	7f ee                	jg     8004b1 <vprintfmt+0x1c3>
  8004c3:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8004c6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8004c9:	85 c0                	test   %eax,%eax
  8004cb:	ba 00 00 00 00       	mov    $0x0,%edx
  8004d0:	0f 49 d0             	cmovns %eax,%edx
  8004d3:	29 d0                	sub    %edx,%eax
  8004d5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8004d8:	eb a6                	jmp    800480 <vprintfmt+0x192>
  8004da:	83 ec 08             	sub    $0x8,%esp
  8004dd:	56                   	push   %esi
  8004de:	52                   	push   %edx
  8004df:	ff 55 08             	call   *0x8(%ebp)
  8004e2:	83 c4 10             	add    $0x10,%esp
  8004e5:	89 d9                	mov    %ebx,%ecx
  8004e7:	8d 59 01             	lea    0x1(%ecx),%ebx
  8004ea:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  8004ee:	0f be d0             	movsbl %al,%edx
  8004f1:	85 d2                	test   %edx,%edx
  8004f3:	74 28                	je     80051d <vprintfmt+0x22f>
  8004f5:	85 ff                	test   %edi,%edi
  8004f7:	78 05                	js     8004fe <vprintfmt+0x210>
  8004f9:	83 ef 01             	sub    $0x1,%edi
  8004fc:	78 2e                	js     80052c <vprintfmt+0x23e>
  8004fe:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  800502:	74 d6                	je     8004da <vprintfmt+0x1ec>
  800504:	0f be c0             	movsbl %al,%eax
  800507:	83 e8 20             	sub    $0x20,%eax
  80050a:	83 f8 5e             	cmp    $0x5e,%eax
  80050d:	76 cb                	jbe    8004da <vprintfmt+0x1ec>
  80050f:	83 ec 08             	sub    $0x8,%esp
  800512:	56                   	push   %esi
  800513:	6a 3f                	push   $0x3f
  800515:	ff 55 08             	call   *0x8(%ebp)
  800518:	83 c4 10             	add    $0x10,%esp
  80051b:	eb c8                	jmp    8004e5 <vprintfmt+0x1f7>
  80051d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800520:	8b 7d cc             	mov    -0x34(%ebp),%edi
  800523:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800526:	01 c7                	add    %eax,%edi
  800528:	29 cf                	sub    %ecx,%edi
  80052a:	eb 13                	jmp    80053f <vprintfmt+0x251>
  80052c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80052f:	eb ef                	jmp    800520 <vprintfmt+0x232>
  800531:	83 ec 08             	sub    $0x8,%esp
  800534:	56                   	push   %esi
  800535:	6a 20                	push   $0x20
  800537:	ff d3                	call   *%ebx
  800539:	83 ef 01             	sub    $0x1,%edi
  80053c:	83 c4 10             	add    $0x10,%esp
  80053f:	85 ff                	test   %edi,%edi
  800541:	7f ee                	jg     800531 <vprintfmt+0x243>
  800543:	eb 6b                	jmp    8005b0 <vprintfmt+0x2c2>
  800545:	89 ca                	mov    %ecx,%edx
  800547:	8d 45 14             	lea    0x14(%ebp),%eax
  80054a:	e8 39 fd ff ff       	call   800288 <getint>
  80054f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800552:	89 55 dc             	mov    %edx,-0x24(%ebp)
  800555:	85 d2                	test   %edx,%edx
  800557:	78 0b                	js     800564 <vprintfmt+0x276>
  800559:	89 d1                	mov    %edx,%ecx
  80055b:	89 c2                	mov    %eax,%edx
  80055d:	bf 0a 00 00 00       	mov    $0xa,%edi
  800562:	eb 32                	jmp    800596 <vprintfmt+0x2a8>
  800564:	83 ec 08             	sub    $0x8,%esp
  800567:	56                   	push   %esi
  800568:	6a 2d                	push   $0x2d
  80056a:	ff d3                	call   *%ebx
  80056c:	8b 55 d8             	mov    -0x28(%ebp),%edx
  80056f:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  800572:	f7 da                	neg    %edx
  800574:	83 d1 00             	adc    $0x0,%ecx
  800577:	f7 d9                	neg    %ecx
  800579:	83 c4 10             	add    $0x10,%esp
  80057c:	bf 0a 00 00 00       	mov    $0xa,%edi
  800581:	eb 13                	jmp    800596 <vprintfmt+0x2a8>
  800583:	89 ca                	mov    %ecx,%edx
  800585:	8d 45 14             	lea    0x14(%ebp),%eax
  800588:	e8 c7 fc ff ff       	call   800254 <getuint>
  80058d:	89 d1                	mov    %edx,%ecx
  80058f:	89 c2                	mov    %eax,%edx
  800591:	bf 0a 00 00 00       	mov    $0xa,%edi
  800596:	83 ec 0c             	sub    $0xc,%esp
  800599:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  80059d:	50                   	push   %eax
  80059e:	ff 75 e0             	push   -0x20(%ebp)
  8005a1:	57                   	push   %edi
  8005a2:	51                   	push   %ecx
  8005a3:	52                   	push   %edx
  8005a4:	89 f2                	mov    %esi,%edx
  8005a6:	89 d8                	mov    %ebx,%eax
  8005a8:	e8 fe fb ff ff       	call   8001ab <printnum>
  8005ad:	83 c4 20             	add    $0x20,%esp
  8005b0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005b3:	e9 54 fd ff ff       	jmp    80030c <vprintfmt+0x1e>
  8005b8:	89 ca                	mov    %ecx,%edx
  8005ba:	8d 45 14             	lea    0x14(%ebp),%eax
  8005bd:	e8 92 fc ff ff       	call   800254 <getuint>
  8005c2:	89 d1                	mov    %edx,%ecx
  8005c4:	89 c2                	mov    %eax,%edx
  8005c6:	bf 08 00 00 00       	mov    $0x8,%edi
  8005cb:	eb c9                	jmp    800596 <vprintfmt+0x2a8>
  8005cd:	83 ec 08             	sub    $0x8,%esp
  8005d0:	56                   	push   %esi
  8005d1:	6a 30                	push   $0x30
  8005d3:	ff d3                	call   *%ebx
  8005d5:	83 c4 08             	add    $0x8,%esp
  8005d8:	56                   	push   %esi
  8005d9:	6a 78                	push   $0x78
  8005db:	ff d3                	call   *%ebx
  8005dd:	8b 45 14             	mov    0x14(%ebp),%eax
  8005e0:	8d 50 04             	lea    0x4(%eax),%edx
  8005e3:	89 55 14             	mov    %edx,0x14(%ebp)
  8005e6:	8b 10                	mov    (%eax),%edx
  8005e8:	b9 00 00 00 00       	mov    $0x0,%ecx
  8005ed:	83 c4 10             	add    $0x10,%esp
  8005f0:	bf 10 00 00 00       	mov    $0x10,%edi
  8005f5:	eb 9f                	jmp    800596 <vprintfmt+0x2a8>
  8005f7:	89 ca                	mov    %ecx,%edx
  8005f9:	8d 45 14             	lea    0x14(%ebp),%eax
  8005fc:	e8 53 fc ff ff       	call   800254 <getuint>
  800601:	89 d1                	mov    %edx,%ecx
  800603:	89 c2                	mov    %eax,%edx
  800605:	bf 10 00 00 00       	mov    $0x10,%edi
  80060a:	eb 8a                	jmp    800596 <vprintfmt+0x2a8>
  80060c:	83 ec 08             	sub    $0x8,%esp
  80060f:	56                   	push   %esi
  800610:	6a 25                	push   $0x25
  800612:	ff d3                	call   *%ebx
  800614:	83 c4 10             	add    $0x10,%esp
  800617:	eb 97                	jmp    8005b0 <vprintfmt+0x2c2>
  800619:	83 ec 08             	sub    $0x8,%esp
  80061c:	56                   	push   %esi
  80061d:	6a 25                	push   $0x25
  80061f:	ff d3                	call   *%ebx
  800621:	83 c4 10             	add    $0x10,%esp
  800624:	89 f8                	mov    %edi,%eax
  800626:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  80062a:	74 05                	je     800631 <vprintfmt+0x343>
  80062c:	83 e8 01             	sub    $0x1,%eax
  80062f:	eb f5                	jmp    800626 <vprintfmt+0x338>
  800631:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800634:	e9 77 ff ff ff       	jmp    8005b0 <vprintfmt+0x2c2>

00800639 <vsnprintf>:
  800639:	55                   	push   %ebp
  80063a:	89 e5                	mov    %esp,%ebp
  80063c:	83 ec 18             	sub    $0x18,%esp
  80063f:	8b 45 08             	mov    0x8(%ebp),%eax
  800642:	8b 55 0c             	mov    0xc(%ebp),%edx
  800645:	89 45 ec             	mov    %eax,-0x14(%ebp)
  800648:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  80064c:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  80064f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  800656:	85 c0                	test   %eax,%eax
  800658:	74 26                	je     800680 <vsnprintf+0x47>
  80065a:	85 d2                	test   %edx,%edx
  80065c:	7e 22                	jle    800680 <vsnprintf+0x47>
  80065e:	ff 75 14             	push   0x14(%ebp)
  800661:	ff 75 10             	push   0x10(%ebp)
  800664:	8d 45 ec             	lea    -0x14(%ebp),%eax
  800667:	50                   	push   %eax
  800668:	68 b4 02 80 00       	push   $0x8002b4
  80066d:	e8 7c fc ff ff       	call   8002ee <vprintfmt>
  800672:	8b 45 ec             	mov    -0x14(%ebp),%eax
  800675:	c6 00 00             	movb   $0x0,(%eax)
  800678:	8b 45 f4             	mov    -0xc(%ebp),%eax
  80067b:	83 c4 10             	add    $0x10,%esp
  80067e:	c9                   	leave
  80067f:	c3                   	ret
  800680:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800685:	eb f7                	jmp    80067e <vsnprintf+0x45>

00800687 <snprintf>:
  800687:	55                   	push   %ebp
  800688:	89 e5                	mov    %esp,%ebp
  80068a:	83 ec 08             	sub    $0x8,%esp
  80068d:	8d 45 14             	lea    0x14(%ebp),%eax
  800690:	50                   	push   %eax
  800691:	ff 75 10             	push   0x10(%ebp)
  800694:	ff 75 0c             	push   0xc(%ebp)
  800697:	ff 75 08             	push   0x8(%ebp)
  80069a:	e8 9a ff ff ff       	call   800639 <vsnprintf>
  80069f:	c9                   	leave
  8006a0:	c3                   	ret

008006a1 <strlen>:
  8006a1:	55                   	push   %ebp
  8006a2:	89 e5                	mov    %esp,%ebp
  8006a4:	8b 55 08             	mov    0x8(%ebp),%edx
  8006a7:	b8 00 00 00 00       	mov    $0x0,%eax
  8006ac:	eb 03                	jmp    8006b1 <strlen+0x10>
  8006ae:	83 c0 01             	add    $0x1,%eax
  8006b1:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  8006b5:	75 f7                	jne    8006ae <strlen+0xd>
  8006b7:	5d                   	pop    %ebp
  8006b8:	c3                   	ret

008006b9 <strnlen>:
  8006b9:	55                   	push   %ebp
  8006ba:	89 e5                	mov    %esp,%ebp
  8006bc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8006bf:	8b 55 0c             	mov    0xc(%ebp),%edx
  8006c2:	b8 00 00 00 00       	mov    $0x0,%eax
  8006c7:	eb 03                	jmp    8006cc <strnlen+0x13>
  8006c9:	83 c0 01             	add    $0x1,%eax
  8006cc:	39 d0                	cmp    %edx,%eax
  8006ce:	74 08                	je     8006d8 <strnlen+0x1f>
  8006d0:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  8006d4:	75 f3                	jne    8006c9 <strnlen+0x10>
  8006d6:	89 c2                	mov    %eax,%edx
  8006d8:	89 d0                	mov    %edx,%eax
  8006da:	5d                   	pop    %ebp
  8006db:	c3                   	ret

008006dc <strcpy>:
  8006dc:	55                   	push   %ebp
  8006dd:	89 e5                	mov    %esp,%ebp
  8006df:	53                   	push   %ebx
  8006e0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8006e3:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8006e6:	b8 00 00 00 00       	mov    $0x0,%eax
  8006eb:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  8006ef:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  8006f2:	83 c0 01             	add    $0x1,%eax
  8006f5:	84 d2                	test   %dl,%dl
  8006f7:	75 f2                	jne    8006eb <strcpy+0xf>
  8006f9:	89 c8                	mov    %ecx,%eax
  8006fb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8006fe:	c9                   	leave
  8006ff:	c3                   	ret

00800700 <strcat>:
  800700:	55                   	push   %ebp
  800701:	89 e5                	mov    %esp,%ebp
  800703:	53                   	push   %ebx
  800704:	83 ec 10             	sub    $0x10,%esp
  800707:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80070a:	53                   	push   %ebx
  80070b:	e8 91 ff ff ff       	call   8006a1 <strlen>
  800710:	83 c4 08             	add    $0x8,%esp
  800713:	ff 75 0c             	push   0xc(%ebp)
  800716:	01 d8                	add    %ebx,%eax
  800718:	50                   	push   %eax
  800719:	e8 be ff ff ff       	call   8006dc <strcpy>
  80071e:	89 d8                	mov    %ebx,%eax
  800720:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800723:	c9                   	leave
  800724:	c3                   	ret

00800725 <strncpy>:
  800725:	55                   	push   %ebp
  800726:	89 e5                	mov    %esp,%ebp
  800728:	56                   	push   %esi
  800729:	53                   	push   %ebx
  80072a:	8b 75 08             	mov    0x8(%ebp),%esi
  80072d:	8b 55 0c             	mov    0xc(%ebp),%edx
  800730:	89 f3                	mov    %esi,%ebx
  800732:	03 5d 10             	add    0x10(%ebp),%ebx
  800735:	89 f0                	mov    %esi,%eax
  800737:	eb 0f                	jmp    800748 <strncpy+0x23>
  800739:	83 c0 01             	add    $0x1,%eax
  80073c:	0f b6 0a             	movzbl (%edx),%ecx
  80073f:	88 48 ff             	mov    %cl,-0x1(%eax)
  800742:	80 f9 01             	cmp    $0x1,%cl
  800745:	83 da ff             	sbb    $0xffffffff,%edx
  800748:	39 d8                	cmp    %ebx,%eax
  80074a:	75 ed                	jne    800739 <strncpy+0x14>
  80074c:	89 f0                	mov    %esi,%eax
  80074e:	5b                   	pop    %ebx
  80074f:	5e                   	pop    %esi
  800750:	5d                   	pop    %ebp
  800751:	c3                   	ret

00800752 <strlcpy>:
  800752:	55                   	push   %ebp
  800753:	89 e5                	mov    %esp,%ebp
  800755:	56                   	push   %esi
  800756:	53                   	push   %ebx
  800757:	8b 75 08             	mov    0x8(%ebp),%esi
  80075a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80075d:	8b 55 10             	mov    0x10(%ebp),%edx
  800760:	89 f0                	mov    %esi,%eax
  800762:	85 d2                	test   %edx,%edx
  800764:	74 21                	je     800787 <strlcpy+0x35>
  800766:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  80076a:	89 f2                	mov    %esi,%edx
  80076c:	eb 09                	jmp    800777 <strlcpy+0x25>
  80076e:	83 c1 01             	add    $0x1,%ecx
  800771:	83 c2 01             	add    $0x1,%edx
  800774:	88 5a ff             	mov    %bl,-0x1(%edx)
  800777:	39 c2                	cmp    %eax,%edx
  800779:	74 09                	je     800784 <strlcpy+0x32>
  80077b:	0f b6 19             	movzbl (%ecx),%ebx
  80077e:	84 db                	test   %bl,%bl
  800780:	75 ec                	jne    80076e <strlcpy+0x1c>
  800782:	89 d0                	mov    %edx,%eax
  800784:	c6 00 00             	movb   $0x0,(%eax)
  800787:	29 f0                	sub    %esi,%eax
  800789:	5b                   	pop    %ebx
  80078a:	5e                   	pop    %esi
  80078b:	5d                   	pop    %ebp
  80078c:	c3                   	ret

0080078d <strcmp>:
  80078d:	55                   	push   %ebp
  80078e:	89 e5                	mov    %esp,%ebp
  800790:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800793:	8b 55 0c             	mov    0xc(%ebp),%edx
  800796:	eb 06                	jmp    80079e <strcmp+0x11>
  800798:	83 c1 01             	add    $0x1,%ecx
  80079b:	83 c2 01             	add    $0x1,%edx
  80079e:	0f b6 01             	movzbl (%ecx),%eax
  8007a1:	84 c0                	test   %al,%al
  8007a3:	74 04                	je     8007a9 <strcmp+0x1c>
  8007a5:	3a 02                	cmp    (%edx),%al
  8007a7:	74 ef                	je     800798 <strcmp+0xb>
  8007a9:	0f b6 c0             	movzbl %al,%eax
  8007ac:	0f b6 12             	movzbl (%edx),%edx
  8007af:	29 d0                	sub    %edx,%eax
  8007b1:	5d                   	pop    %ebp
  8007b2:	c3                   	ret

008007b3 <strncmp>:
  8007b3:	55                   	push   %ebp
  8007b4:	89 e5                	mov    %esp,%ebp
  8007b6:	53                   	push   %ebx
  8007b7:	8b 45 08             	mov    0x8(%ebp),%eax
  8007ba:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8007bd:	8b 55 10             	mov    0x10(%ebp),%edx
  8007c0:	eb 09                	jmp    8007cb <strncmp+0x18>
  8007c2:	83 ea 01             	sub    $0x1,%edx
  8007c5:	83 c0 01             	add    $0x1,%eax
  8007c8:	83 c1 01             	add    $0x1,%ecx
  8007cb:	85 d2                	test   %edx,%edx
  8007cd:	74 18                	je     8007e7 <strncmp+0x34>
  8007cf:	0f b6 18             	movzbl (%eax),%ebx
  8007d2:	84 db                	test   %bl,%bl
  8007d4:	74 04                	je     8007da <strncmp+0x27>
  8007d6:	3a 19                	cmp    (%ecx),%bl
  8007d8:	74 e8                	je     8007c2 <strncmp+0xf>
  8007da:	0f b6 00             	movzbl (%eax),%eax
  8007dd:	0f b6 11             	movzbl (%ecx),%edx
  8007e0:	29 d0                	sub    %edx,%eax
  8007e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8007e5:	c9                   	leave
  8007e6:	c3                   	ret
  8007e7:	b8 00 00 00 00       	mov    $0x0,%eax
  8007ec:	eb f4                	jmp    8007e2 <strncmp+0x2f>

008007ee <strchr>:
  8007ee:	55                   	push   %ebp
  8007ef:	89 e5                	mov    %esp,%ebp
  8007f1:	8b 45 08             	mov    0x8(%ebp),%eax
  8007f4:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8007f8:	eb 03                	jmp    8007fd <strchr+0xf>
  8007fa:	83 c0 01             	add    $0x1,%eax
  8007fd:	0f b6 10             	movzbl (%eax),%edx
  800800:	84 d2                	test   %dl,%dl
  800802:	74 06                	je     80080a <strchr+0x1c>
  800804:	38 ca                	cmp    %cl,%dl
  800806:	75 f2                	jne    8007fa <strchr+0xc>
  800808:	eb 05                	jmp    80080f <strchr+0x21>
  80080a:	b8 00 00 00 00       	mov    $0x0,%eax
  80080f:	5d                   	pop    %ebp
  800810:	c3                   	ret

00800811 <strfind>:
  800811:	55                   	push   %ebp
  800812:	89 e5                	mov    %esp,%ebp
  800814:	8b 45 08             	mov    0x8(%ebp),%eax
  800817:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  80081b:	0f b6 10             	movzbl (%eax),%edx
  80081e:	38 ca                	cmp    %cl,%dl
  800820:	74 09                	je     80082b <strfind+0x1a>
  800822:	84 d2                	test   %dl,%dl
  800824:	74 05                	je     80082b <strfind+0x1a>
  800826:	83 c0 01             	add    $0x1,%eax
  800829:	eb f0                	jmp    80081b <strfind+0xa>
  80082b:	5d                   	pop    %ebp
  80082c:	c3                   	ret

0080082d <memset>:
  80082d:	55                   	push   %ebp
  80082e:	89 e5                	mov    %esp,%ebp
  800830:	57                   	push   %edi
  800831:	8b 55 08             	mov    0x8(%ebp),%edx
  800834:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800837:	85 c9                	test   %ecx,%ecx
  800839:	74 24                	je     80085f <memset+0x32>
  80083b:	89 d0                	mov    %edx,%eax
  80083d:	09 c8                	or     %ecx,%eax
  80083f:	a8 03                	test   $0x3,%al
  800841:	75 14                	jne    800857 <memset+0x2a>
  800843:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  800847:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  80084d:	c1 e9 02             	shr    $0x2,%ecx
  800850:	89 d7                	mov    %edx,%edi
  800852:	fc                   	cld
  800853:	f3 ab                	rep stos %eax,%es:(%edi)
  800855:	eb 08                	jmp    80085f <memset+0x32>
  800857:	89 d7                	mov    %edx,%edi
  800859:	8b 45 0c             	mov    0xc(%ebp),%eax
  80085c:	fc                   	cld
  80085d:	f3 aa                	rep stos %al,%es:(%edi)
  80085f:	89 d0                	mov    %edx,%eax
  800861:	8b 7d fc             	mov    -0x4(%ebp),%edi
  800864:	c9                   	leave
  800865:	c3                   	ret

00800866 <memmove>:
  800866:	55                   	push   %ebp
  800867:	89 e5                	mov    %esp,%ebp
  800869:	57                   	push   %edi
  80086a:	56                   	push   %esi
  80086b:	8b 45 08             	mov    0x8(%ebp),%eax
  80086e:	8b 75 0c             	mov    0xc(%ebp),%esi
  800871:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800874:	39 c6                	cmp    %eax,%esi
  800876:	73 32                	jae    8008aa <memmove+0x44>
  800878:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  80087b:	39 d0                	cmp    %edx,%eax
  80087d:	73 2b                	jae    8008aa <memmove+0x44>
  80087f:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  800882:	89 fe                	mov    %edi,%esi
  800884:	09 ce                	or     %ecx,%esi
  800886:	09 d6                	or     %edx,%esi
  800888:	f7 c6 03 00 00 00    	test   $0x3,%esi
  80088e:	75 0e                	jne    80089e <memmove+0x38>
  800890:	83 ef 04             	sub    $0x4,%edi
  800893:	8d 72 fc             	lea    -0x4(%edx),%esi
  800896:	c1 e9 02             	shr    $0x2,%ecx
  800899:	fd                   	std
  80089a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  80089c:	eb 09                	jmp    8008a7 <memmove+0x41>
  80089e:	83 ef 01             	sub    $0x1,%edi
  8008a1:	8d 72 ff             	lea    -0x1(%edx),%esi
  8008a4:	fd                   	std
  8008a5:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  8008a7:	fc                   	cld
  8008a8:	eb 1a                	jmp    8008c4 <memmove+0x5e>
  8008aa:	89 c2                	mov    %eax,%edx
  8008ac:	09 ca                	or     %ecx,%edx
  8008ae:	09 f2                	or     %esi,%edx
  8008b0:	f6 c2 03             	test   $0x3,%dl
  8008b3:	75 0a                	jne    8008bf <memmove+0x59>
  8008b5:	c1 e9 02             	shr    $0x2,%ecx
  8008b8:	89 c7                	mov    %eax,%edi
  8008ba:	fc                   	cld
  8008bb:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  8008bd:	eb 05                	jmp    8008c4 <memmove+0x5e>
  8008bf:	89 c7                	mov    %eax,%edi
  8008c1:	fc                   	cld
  8008c2:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  8008c4:	5e                   	pop    %esi
  8008c5:	5f                   	pop    %edi
  8008c6:	5d                   	pop    %ebp
  8008c7:	c3                   	ret

008008c8 <memcpy>:
  8008c8:	55                   	push   %ebp
  8008c9:	89 e5                	mov    %esp,%ebp
  8008cb:	83 ec 0c             	sub    $0xc,%esp
  8008ce:	ff 75 10             	push   0x10(%ebp)
  8008d1:	ff 75 0c             	push   0xc(%ebp)
  8008d4:	ff 75 08             	push   0x8(%ebp)
  8008d7:	e8 8a ff ff ff       	call   800866 <memmove>
  8008dc:	c9                   	leave
  8008dd:	c3                   	ret

008008de <memcmp>:
  8008de:	55                   	push   %ebp
  8008df:	89 e5                	mov    %esp,%ebp
  8008e1:	56                   	push   %esi
  8008e2:	53                   	push   %ebx
  8008e3:	8b 45 08             	mov    0x8(%ebp),%eax
  8008e6:	8b 55 0c             	mov    0xc(%ebp),%edx
  8008e9:	89 c6                	mov    %eax,%esi
  8008eb:	03 75 10             	add    0x10(%ebp),%esi
  8008ee:	eb 06                	jmp    8008f6 <memcmp+0x18>
  8008f0:	83 c0 01             	add    $0x1,%eax
  8008f3:	83 c2 01             	add    $0x1,%edx
  8008f6:	39 f0                	cmp    %esi,%eax
  8008f8:	74 14                	je     80090e <memcmp+0x30>
  8008fa:	0f b6 08             	movzbl (%eax),%ecx
  8008fd:	0f b6 1a             	movzbl (%edx),%ebx
  800900:	38 d9                	cmp    %bl,%cl
  800902:	74 ec                	je     8008f0 <memcmp+0x12>
  800904:	0f b6 c1             	movzbl %cl,%eax
  800907:	0f b6 db             	movzbl %bl,%ebx
  80090a:	29 d8                	sub    %ebx,%eax
  80090c:	eb 05                	jmp    800913 <memcmp+0x35>
  80090e:	b8 00 00 00 00       	mov    $0x0,%eax
  800913:	5b                   	pop    %ebx
  800914:	5e                   	pop    %esi
  800915:	5d                   	pop    %ebp
  800916:	c3                   	ret

00800917 <memfind>:
  800917:	55                   	push   %ebp
  800918:	89 e5                	mov    %esp,%ebp
  80091a:	8b 45 08             	mov    0x8(%ebp),%eax
  80091d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800920:	89 c2                	mov    %eax,%edx
  800922:	03 55 10             	add    0x10(%ebp),%edx
  800925:	eb 03                	jmp    80092a <memfind+0x13>
  800927:	83 c0 01             	add    $0x1,%eax
  80092a:	39 d0                	cmp    %edx,%eax
  80092c:	73 04                	jae    800932 <memfind+0x1b>
  80092e:	38 08                	cmp    %cl,(%eax)
  800930:	75 f5                	jne    800927 <memfind+0x10>
  800932:	5d                   	pop    %ebp
  800933:	c3                   	ret

00800934 <strtol>:
  800934:	55                   	push   %ebp
  800935:	89 e5                	mov    %esp,%ebp
  800937:	57                   	push   %edi
  800938:	56                   	push   %esi
  800939:	53                   	push   %ebx
  80093a:	8b 55 08             	mov    0x8(%ebp),%edx
  80093d:	8b 5d 10             	mov    0x10(%ebp),%ebx
  800940:	eb 03                	jmp    800945 <strtol+0x11>
  800942:	83 c2 01             	add    $0x1,%edx
  800945:	0f b6 02             	movzbl (%edx),%eax
  800948:	3c 20                	cmp    $0x20,%al
  80094a:	74 f6                	je     800942 <strtol+0xe>
  80094c:	3c 09                	cmp    $0x9,%al
  80094e:	74 f2                	je     800942 <strtol+0xe>
  800950:	3c 2b                	cmp    $0x2b,%al
  800952:	74 2a                	je     80097e <strtol+0x4a>
  800954:	bf 00 00 00 00       	mov    $0x0,%edi
  800959:	3c 2d                	cmp    $0x2d,%al
  80095b:	74 2b                	je     800988 <strtol+0x54>
  80095d:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  800963:	75 0f                	jne    800974 <strtol+0x40>
  800965:	80 3a 30             	cmpb   $0x30,(%edx)
  800968:	74 28                	je     800992 <strtol+0x5e>
  80096a:	85 db                	test   %ebx,%ebx
  80096c:	b8 0a 00 00 00       	mov    $0xa,%eax
  800971:	0f 44 d8             	cmove  %eax,%ebx
  800974:	b9 00 00 00 00       	mov    $0x0,%ecx
  800979:	89 5d 10             	mov    %ebx,0x10(%ebp)
  80097c:	eb 46                	jmp    8009c4 <strtol+0x90>
  80097e:	83 c2 01             	add    $0x1,%edx
  800981:	bf 00 00 00 00       	mov    $0x0,%edi
  800986:	eb d5                	jmp    80095d <strtol+0x29>
  800988:	83 c2 01             	add    $0x1,%edx
  80098b:	bf 01 00 00 00       	mov    $0x1,%edi
  800990:	eb cb                	jmp    80095d <strtol+0x29>
  800992:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800996:	74 0e                	je     8009a6 <strtol+0x72>
  800998:	85 db                	test   %ebx,%ebx
  80099a:	75 d8                	jne    800974 <strtol+0x40>
  80099c:	83 c2 01             	add    $0x1,%edx
  80099f:	bb 08 00 00 00       	mov    $0x8,%ebx
  8009a4:	eb ce                	jmp    800974 <strtol+0x40>
  8009a6:	83 c2 02             	add    $0x2,%edx
  8009a9:	bb 10 00 00 00       	mov    $0x10,%ebx
  8009ae:	eb c4                	jmp    800974 <strtol+0x40>
  8009b0:	0f be c0             	movsbl %al,%eax
  8009b3:	83 e8 30             	sub    $0x30,%eax
  8009b6:	3b 45 10             	cmp    0x10(%ebp),%eax
  8009b9:	7d 3a                	jge    8009f5 <strtol+0xc1>
  8009bb:	83 c2 01             	add    $0x1,%edx
  8009be:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  8009c2:	01 c1                	add    %eax,%ecx
  8009c4:	0f b6 02             	movzbl (%edx),%eax
  8009c7:	8d 70 d0             	lea    -0x30(%eax),%esi
  8009ca:	89 f3                	mov    %esi,%ebx
  8009cc:	80 fb 09             	cmp    $0x9,%bl
  8009cf:	76 df                	jbe    8009b0 <strtol+0x7c>
  8009d1:	8d 70 9f             	lea    -0x61(%eax),%esi
  8009d4:	89 f3                	mov    %esi,%ebx
  8009d6:	80 fb 19             	cmp    $0x19,%bl
  8009d9:	77 08                	ja     8009e3 <strtol+0xaf>
  8009db:	0f be c0             	movsbl %al,%eax
  8009de:	83 e8 57             	sub    $0x57,%eax
  8009e1:	eb d3                	jmp    8009b6 <strtol+0x82>
  8009e3:	8d 70 bf             	lea    -0x41(%eax),%esi
  8009e6:	89 f3                	mov    %esi,%ebx
  8009e8:	80 fb 19             	cmp    $0x19,%bl
  8009eb:	77 08                	ja     8009f5 <strtol+0xc1>
  8009ed:	0f be c0             	movsbl %al,%eax
  8009f0:	83 e8 37             	sub    $0x37,%eax
  8009f3:	eb c1                	jmp    8009b6 <strtol+0x82>
  8009f5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  8009f9:	74 05                	je     800a00 <strtol+0xcc>
  8009fb:	8b 45 0c             	mov    0xc(%ebp),%eax
  8009fe:	89 10                	mov    %edx,(%eax)
  800a00:	89 c8                	mov    %ecx,%eax
  800a02:	f7 d8                	neg    %eax
  800a04:	85 ff                	test   %edi,%edi
  800a06:	0f 45 c8             	cmovne %eax,%ecx
  800a09:	89 c8                	mov    %ecx,%eax
  800a0b:	5b                   	pop    %ebx
  800a0c:	5e                   	pop    %esi
  800a0d:	5f                   	pop    %edi
  800a0e:	5d                   	pop    %ebp
  800a0f:	c3                   	ret

00800a10 <syscall>:
  800a10:	55                   	push   %ebp
  800a11:	89 e5                	mov    %esp,%ebp
  800a13:	57                   	push   %edi
  800a14:	56                   	push   %esi
  800a15:	53                   	push   %ebx
  800a16:	83 ec 1c             	sub    $0x1c,%esp
  800a19:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800a1c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  800a1f:	89 ca                	mov    %ecx,%edx
  800a21:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a24:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800a27:	8b 7d 10             	mov    0x10(%ebp),%edi
  800a2a:	8b 75 14             	mov    0x14(%ebp),%esi
  800a2d:	cd 30                	int    $0x30
  800a2f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  800a33:	74 04                	je     800a39 <syscall+0x29>
  800a35:	85 c0                	test   %eax,%eax
  800a37:	7f 08                	jg     800a41 <syscall+0x31>
  800a39:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800a3c:	5b                   	pop    %ebx
  800a3d:	5e                   	pop    %esi
  800a3e:	5f                   	pop    %edi
  800a3f:	5d                   	pop    %ebp
  800a40:	c3                   	ret
  800a41:	83 ec 0c             	sub    $0xc,%esp
  800a44:	50                   	push   %eax
  800a45:	ff 75 e0             	push   -0x20(%ebp)
  800a48:	68 24 10 80 00       	push   $0x801024
  800a4d:	6a 1e                	push   $0x1e
  800a4f:	68 41 10 80 00       	push   $0x801041
  800a54:	e8 b1 01 00 00       	call   800c0a <_panic>

00800a59 <sys_cputs>:
  800a59:	55                   	push   %ebp
  800a5a:	89 e5                	mov    %esp,%ebp
  800a5c:	83 ec 08             	sub    $0x8,%esp
  800a5f:	6a 00                	push   $0x0
  800a61:	6a 00                	push   $0x0
  800a63:	6a 00                	push   $0x0
  800a65:	ff 75 0c             	push   0xc(%ebp)
  800a68:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a6b:	ba 00 00 00 00       	mov    $0x0,%edx
  800a70:	b8 00 00 00 00       	mov    $0x0,%eax
  800a75:	e8 96 ff ff ff       	call   800a10 <syscall>
  800a7a:	83 c4 10             	add    $0x10,%esp
  800a7d:	c9                   	leave
  800a7e:	c3                   	ret

00800a7f <sys_cgetc>:
  800a7f:	55                   	push   %ebp
  800a80:	89 e5                	mov    %esp,%ebp
  800a82:	83 ec 08             	sub    $0x8,%esp
  800a85:	6a 00                	push   $0x0
  800a87:	6a 00                	push   $0x0
  800a89:	6a 00                	push   $0x0
  800a8b:	6a 00                	push   $0x0
  800a8d:	b9 00 00 00 00       	mov    $0x0,%ecx
  800a92:	ba 00 00 00 00       	mov    $0x0,%edx
  800a97:	b8 01 00 00 00       	mov    $0x1,%eax
  800a9c:	e8 6f ff ff ff       	call   800a10 <syscall>
  800aa1:	c9                   	leave
  800aa2:	c3                   	ret

00800aa3 <sys_env_destroy>:
  800aa3:	55                   	push   %ebp
  800aa4:	89 e5                	mov    %esp,%ebp
  800aa6:	83 ec 08             	sub    $0x8,%esp
  800aa9:	6a 00                	push   $0x0
  800aab:	6a 00                	push   $0x0
  800aad:	6a 00                	push   $0x0
  800aaf:	6a 00                	push   $0x0
  800ab1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800ab4:	ba 01 00 00 00       	mov    $0x1,%edx
  800ab9:	b8 03 00 00 00       	mov    $0x3,%eax
  800abe:	e8 4d ff ff ff       	call   800a10 <syscall>
  800ac3:	c9                   	leave
  800ac4:	c3                   	ret

00800ac5 <sys_getenvid>:
  800ac5:	55                   	push   %ebp
  800ac6:	89 e5                	mov    %esp,%ebp
  800ac8:	83 ec 08             	sub    $0x8,%esp
  800acb:	6a 00                	push   $0x0
  800acd:	6a 00                	push   $0x0
  800acf:	6a 00                	push   $0x0
  800ad1:	6a 00                	push   $0x0
  800ad3:	b9 00 00 00 00       	mov    $0x0,%ecx
  800ad8:	ba 00 00 00 00       	mov    $0x0,%edx
  800add:	b8 02 00 00 00       	mov    $0x2,%eax
  800ae2:	e8 29 ff ff ff       	call   800a10 <syscall>
  800ae7:	c9                   	leave
  800ae8:	c3                   	ret

00800ae9 <sys_yield>:
  800ae9:	55                   	push   %ebp
  800aea:	89 e5                	mov    %esp,%ebp
  800aec:	83 ec 08             	sub    $0x8,%esp
  800aef:	6a 00                	push   $0x0
  800af1:	6a 00                	push   $0x0
  800af3:	6a 00                	push   $0x0
  800af5:	6a 00                	push   $0x0
  800af7:	b9 00 00 00 00       	mov    $0x0,%ecx
  800afc:	ba 00 00 00 00       	mov    $0x0,%edx
  800b01:	b8 0a 00 00 00       	mov    $0xa,%eax
  800b06:	e8 05 ff ff ff       	call   800a10 <syscall>
  800b0b:	83 c4 10             	add    $0x10,%esp
  800b0e:	c9                   	leave
  800b0f:	c3                   	ret

00800b10 <sys_page_alloc>:
  800b10:	55                   	push   %ebp
  800b11:	89 e5                	mov    %esp,%ebp
  800b13:	83 ec 08             	sub    $0x8,%esp
  800b16:	6a 00                	push   $0x0
  800b18:	6a 00                	push   $0x0
  800b1a:	ff 75 10             	push   0x10(%ebp)
  800b1d:	ff 75 0c             	push   0xc(%ebp)
  800b20:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b23:	ba 01 00 00 00       	mov    $0x1,%edx
  800b28:	b8 04 00 00 00       	mov    $0x4,%eax
  800b2d:	e8 de fe ff ff       	call   800a10 <syscall>
  800b32:	c9                   	leave
  800b33:	c3                   	ret

00800b34 <sys_page_map>:
  800b34:	55                   	push   %ebp
  800b35:	89 e5                	mov    %esp,%ebp
  800b37:	83 ec 08             	sub    $0x8,%esp
  800b3a:	ff 75 18             	push   0x18(%ebp)
  800b3d:	ff 75 14             	push   0x14(%ebp)
  800b40:	ff 75 10             	push   0x10(%ebp)
  800b43:	ff 75 0c             	push   0xc(%ebp)
  800b46:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b49:	ba 01 00 00 00       	mov    $0x1,%edx
  800b4e:	b8 05 00 00 00       	mov    $0x5,%eax
  800b53:	e8 b8 fe ff ff       	call   800a10 <syscall>
  800b58:	c9                   	leave
  800b59:	c3                   	ret

00800b5a <sys_page_unmap>:
  800b5a:	55                   	push   %ebp
  800b5b:	89 e5                	mov    %esp,%ebp
  800b5d:	83 ec 08             	sub    $0x8,%esp
  800b60:	6a 00                	push   $0x0
  800b62:	6a 00                	push   $0x0
  800b64:	6a 00                	push   $0x0
  800b66:	ff 75 0c             	push   0xc(%ebp)
  800b69:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b6c:	ba 01 00 00 00       	mov    $0x1,%edx
  800b71:	b8 06 00 00 00       	mov    $0x6,%eax
  800b76:	e8 95 fe ff ff       	call   800a10 <syscall>
  800b7b:	c9                   	leave
  800b7c:	c3                   	ret

00800b7d <sys_env_set_status>:
  800b7d:	55                   	push   %ebp
  800b7e:	89 e5                	mov    %esp,%ebp
  800b80:	83 ec 08             	sub    $0x8,%esp
  800b83:	6a 00                	push   $0x0
  800b85:	6a 00                	push   $0x0
  800b87:	6a 00                	push   $0x0
  800b89:	ff 75 0c             	push   0xc(%ebp)
  800b8c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b8f:	ba 01 00 00 00       	mov    $0x1,%edx
  800b94:	b8 08 00 00 00       	mov    $0x8,%eax
  800b99:	e8 72 fe ff ff       	call   800a10 <syscall>
  800b9e:	c9                   	leave
  800b9f:	c3                   	ret

00800ba0 <sys_env_set_pgfault_upcall>:
  800ba0:	55                   	push   %ebp
  800ba1:	89 e5                	mov    %esp,%ebp
  800ba3:	83 ec 08             	sub    $0x8,%esp
  800ba6:	6a 00                	push   $0x0
  800ba8:	6a 00                	push   $0x0
  800baa:	6a 00                	push   $0x0
  800bac:	ff 75 0c             	push   0xc(%ebp)
  800baf:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bb2:	ba 01 00 00 00       	mov    $0x1,%edx
  800bb7:	b8 09 00 00 00       	mov    $0x9,%eax
  800bbc:	e8 4f fe ff ff       	call   800a10 <syscall>
  800bc1:	c9                   	leave
  800bc2:	c3                   	ret

00800bc3 <sys_ipc_try_send>:
  800bc3:	55                   	push   %ebp
  800bc4:	89 e5                	mov    %esp,%ebp
  800bc6:	83 ec 08             	sub    $0x8,%esp
  800bc9:	6a 00                	push   $0x0
  800bcb:	ff 75 14             	push   0x14(%ebp)
  800bce:	ff 75 10             	push   0x10(%ebp)
  800bd1:	ff 75 0c             	push   0xc(%ebp)
  800bd4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bd7:	ba 00 00 00 00       	mov    $0x0,%edx
  800bdc:	b8 0c 00 00 00       	mov    $0xc,%eax
  800be1:	e8 2a fe ff ff       	call   800a10 <syscall>
  800be6:	c9                   	leave
  800be7:	c3                   	ret

00800be8 <sys_ipc_recv>:
  800be8:	55                   	push   %ebp
  800be9:	89 e5                	mov    %esp,%ebp
  800beb:	83 ec 08             	sub    $0x8,%esp
  800bee:	6a 00                	push   $0x0
  800bf0:	6a 00                	push   $0x0
  800bf2:	6a 00                	push   $0x0
  800bf4:	6a 00                	push   $0x0
  800bf6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bf9:	ba 01 00 00 00       	mov    $0x1,%edx
  800bfe:	b8 0d 00 00 00       	mov    $0xd,%eax
  800c03:	e8 08 fe ff ff       	call   800a10 <syscall>
  800c08:	c9                   	leave
  800c09:	c3                   	ret

00800c0a <_panic>:
  800c0a:	55                   	push   %ebp
  800c0b:	89 e5                	mov    %esp,%ebp
  800c0d:	56                   	push   %esi
  800c0e:	53                   	push   %ebx
  800c0f:	8d 5d 14             	lea    0x14(%ebp),%ebx
  800c12:	8b 35 00 20 80 00    	mov    0x802000,%esi
  800c18:	e8 a8 fe ff ff       	call   800ac5 <sys_getenvid>
  800c1d:	83 ec 0c             	sub    $0xc,%esp
  800c20:	ff 75 0c             	push   0xc(%ebp)
  800c23:	ff 75 08             	push   0x8(%ebp)
  800c26:	56                   	push   %esi
  800c27:	50                   	push   %eax
  800c28:	68 40 0f 80 00       	push   $0x800f40
  800c2d:	e8 65 f5 ff ff       	call   800197 <cprintf>
  800c32:	83 c4 18             	add    $0x18,%esp
  800c35:	53                   	push   %ebx
  800c36:	ff 75 10             	push   0x10(%ebp)
  800c39:	e8 08 f5 ff ff       	call   800146 <vcprintf>
  800c3e:	c7 04 24 4f 10 80 00 	movl   $0x80104f,(%esp)
  800c45:	e8 4d f5 ff ff       	call   800197 <cprintf>
  800c4a:	83 c4 10             	add    $0x10,%esp
  800c4d:	cc                   	int3
  800c4e:	eb fd                	jmp    800c4d <_panic+0x43>

00800c50 <__udivdi3>:
  800c50:	f3 0f 1e fb          	endbr32
  800c54:	55                   	push   %ebp
  800c55:	57                   	push   %edi
  800c56:	56                   	push   %esi
  800c57:	53                   	push   %ebx
  800c58:	83 ec 1c             	sub    $0x1c,%esp
  800c5b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800c5f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  800c63:	8b 74 24 34          	mov    0x34(%esp),%esi
  800c67:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  800c6b:	85 c0                	test   %eax,%eax
  800c6d:	75 19                	jne    800c88 <__udivdi3+0x38>
  800c6f:	39 de                	cmp    %ebx,%esi
  800c71:	73 4d                	jae    800cc0 <__udivdi3+0x70>
  800c73:	31 ff                	xor    %edi,%edi
  800c75:	89 e8                	mov    %ebp,%eax
  800c77:	89 f2                	mov    %esi,%edx
  800c79:	f7 f3                	div    %ebx
  800c7b:	89 fa                	mov    %edi,%edx
  800c7d:	83 c4 1c             	add    $0x1c,%esp
  800c80:	5b                   	pop    %ebx
  800c81:	5e                   	pop    %esi
  800c82:	5f                   	pop    %edi
  800c83:	5d                   	pop    %ebp
  800c84:	c3                   	ret
  800c85:	8d 76 00             	lea    0x0(%esi),%esi
  800c88:	39 c6                	cmp    %eax,%esi
  800c8a:	73 14                	jae    800ca0 <__udivdi3+0x50>
  800c8c:	31 ff                	xor    %edi,%edi
  800c8e:	31 c0                	xor    %eax,%eax
  800c90:	89 fa                	mov    %edi,%edx
  800c92:	83 c4 1c             	add    $0x1c,%esp
  800c95:	5b                   	pop    %ebx
  800c96:	5e                   	pop    %esi
  800c97:	5f                   	pop    %edi
  800c98:	5d                   	pop    %ebp
  800c99:	c3                   	ret
  800c9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800ca0:	0f bd f8             	bsr    %eax,%edi
  800ca3:	83 f7 1f             	xor    $0x1f,%edi
  800ca6:	75 48                	jne    800cf0 <__udivdi3+0xa0>
  800ca8:	39 f0                	cmp    %esi,%eax
  800caa:	72 06                	jb     800cb2 <__udivdi3+0x62>
  800cac:	31 c0                	xor    %eax,%eax
  800cae:	39 dd                	cmp    %ebx,%ebp
  800cb0:	72 de                	jb     800c90 <__udivdi3+0x40>
  800cb2:	b8 01 00 00 00       	mov    $0x1,%eax
  800cb7:	eb d7                	jmp    800c90 <__udivdi3+0x40>
  800cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800cc0:	89 d9                	mov    %ebx,%ecx
  800cc2:	85 db                	test   %ebx,%ebx
  800cc4:	75 0b                	jne    800cd1 <__udivdi3+0x81>
  800cc6:	b8 01 00 00 00       	mov    $0x1,%eax
  800ccb:	31 d2                	xor    %edx,%edx
  800ccd:	f7 f3                	div    %ebx
  800ccf:	89 c1                	mov    %eax,%ecx
  800cd1:	31 d2                	xor    %edx,%edx
  800cd3:	89 f0                	mov    %esi,%eax
  800cd5:	f7 f1                	div    %ecx
  800cd7:	89 c6                	mov    %eax,%esi
  800cd9:	89 e8                	mov    %ebp,%eax
  800cdb:	89 f7                	mov    %esi,%edi
  800cdd:	f7 f1                	div    %ecx
  800cdf:	89 fa                	mov    %edi,%edx
  800ce1:	83 c4 1c             	add    $0x1c,%esp
  800ce4:	5b                   	pop    %ebx
  800ce5:	5e                   	pop    %esi
  800ce6:	5f                   	pop    %edi
  800ce7:	5d                   	pop    %ebp
  800ce8:	c3                   	ret
  800ce9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800cf0:	89 f9                	mov    %edi,%ecx
  800cf2:	ba 20 00 00 00       	mov    $0x20,%edx
  800cf7:	29 fa                	sub    %edi,%edx
  800cf9:	d3 e0                	shl    %cl,%eax
  800cfb:	89 44 24 08          	mov    %eax,0x8(%esp)
  800cff:	89 d1                	mov    %edx,%ecx
  800d01:	89 d8                	mov    %ebx,%eax
  800d03:	d3 e8                	shr    %cl,%eax
  800d05:	89 c1                	mov    %eax,%ecx
  800d07:	8b 44 24 08          	mov    0x8(%esp),%eax
  800d0b:	09 c1                	or     %eax,%ecx
  800d0d:	89 f0                	mov    %esi,%eax
  800d0f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800d13:	89 f9                	mov    %edi,%ecx
  800d15:	d3 e3                	shl    %cl,%ebx
  800d17:	89 d1                	mov    %edx,%ecx
  800d19:	d3 e8                	shr    %cl,%eax
  800d1b:	89 f9                	mov    %edi,%ecx
  800d1d:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  800d21:	89 eb                	mov    %ebp,%ebx
  800d23:	d3 e6                	shl    %cl,%esi
  800d25:	89 d1                	mov    %edx,%ecx
  800d27:	d3 eb                	shr    %cl,%ebx
  800d29:	09 f3                	or     %esi,%ebx
  800d2b:	89 c6                	mov    %eax,%esi
  800d2d:	89 f2                	mov    %esi,%edx
  800d2f:	89 d8                	mov    %ebx,%eax
  800d31:	f7 74 24 08          	divl   0x8(%esp)
  800d35:	89 d6                	mov    %edx,%esi
  800d37:	89 c3                	mov    %eax,%ebx
  800d39:	f7 64 24 0c          	mull   0xc(%esp)
  800d3d:	39 d6                	cmp    %edx,%esi
  800d3f:	72 1f                	jb     800d60 <__udivdi3+0x110>
  800d41:	89 f9                	mov    %edi,%ecx
  800d43:	d3 e5                	shl    %cl,%ebp
  800d45:	39 c5                	cmp    %eax,%ebp
  800d47:	73 04                	jae    800d4d <__udivdi3+0xfd>
  800d49:	39 d6                	cmp    %edx,%esi
  800d4b:	74 13                	je     800d60 <__udivdi3+0x110>
  800d4d:	89 d8                	mov    %ebx,%eax
  800d4f:	31 ff                	xor    %edi,%edi
  800d51:	e9 3a ff ff ff       	jmp    800c90 <__udivdi3+0x40>
  800d56:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800d5d:	00 
  800d5e:	66 90                	xchg   %ax,%ax
  800d60:	8d 43 ff             	lea    -0x1(%ebx),%eax
  800d63:	31 ff                	xor    %edi,%edi
  800d65:	e9 26 ff ff ff       	jmp    800c90 <__udivdi3+0x40>
  800d6a:	66 90                	xchg   %ax,%ax
  800d6c:	66 90                	xchg   %ax,%ax
  800d6e:	66 90                	xchg   %ax,%ax

00800d70 <__umoddi3>:
  800d70:	f3 0f 1e fb          	endbr32
  800d74:	55                   	push   %ebp
  800d75:	57                   	push   %edi
  800d76:	56                   	push   %esi
  800d77:	53                   	push   %ebx
  800d78:	83 ec 1c             	sub    $0x1c,%esp
  800d7b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  800d7f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800d83:	8b 74 24 30          	mov    0x30(%esp),%esi
  800d87:	8b 7c 24 38          	mov    0x38(%esp),%edi
  800d8b:	89 da                	mov    %ebx,%edx
  800d8d:	85 c0                	test   %eax,%eax
  800d8f:	75 17                	jne    800da8 <__umoddi3+0x38>
  800d91:	39 fb                	cmp    %edi,%ebx
  800d93:	73 53                	jae    800de8 <__umoddi3+0x78>
  800d95:	89 f0                	mov    %esi,%eax
  800d97:	f7 f7                	div    %edi
  800d99:	89 d0                	mov    %edx,%eax
  800d9b:	31 d2                	xor    %edx,%edx
  800d9d:	83 c4 1c             	add    $0x1c,%esp
  800da0:	5b                   	pop    %ebx
  800da1:	5e                   	pop    %esi
  800da2:	5f                   	pop    %edi
  800da3:	5d                   	pop    %ebp
  800da4:	c3                   	ret
  800da5:	8d 76 00             	lea    0x0(%esi),%esi
  800da8:	89 f1                	mov    %esi,%ecx
  800daa:	39 c3                	cmp    %eax,%ebx
  800dac:	73 12                	jae    800dc0 <__umoddi3+0x50>
  800dae:	89 f0                	mov    %esi,%eax
  800db0:	83 c4 1c             	add    $0x1c,%esp
  800db3:	5b                   	pop    %ebx
  800db4:	5e                   	pop    %esi
  800db5:	5f                   	pop    %edi
  800db6:	5d                   	pop    %ebp
  800db7:	c3                   	ret
  800db8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800dbf:	00 
  800dc0:	0f bd e8             	bsr    %eax,%ebp
  800dc3:	83 f5 1f             	xor    $0x1f,%ebp
  800dc6:	75 48                	jne    800e10 <__umoddi3+0xa0>
  800dc8:	39 d8                	cmp    %ebx,%eax
  800dca:	0f 82 d0 00 00 00    	jb     800ea0 <__umoddi3+0x130>
  800dd0:	39 fe                	cmp    %edi,%esi
  800dd2:	0f 83 c8 00 00 00    	jae    800ea0 <__umoddi3+0x130>
  800dd8:	89 c8                	mov    %ecx,%eax
  800dda:	83 c4 1c             	add    $0x1c,%esp
  800ddd:	5b                   	pop    %ebx
  800dde:	5e                   	pop    %esi
  800ddf:	5f                   	pop    %edi
  800de0:	5d                   	pop    %ebp
  800de1:	c3                   	ret
  800de2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800de8:	89 f9                	mov    %edi,%ecx
  800dea:	85 ff                	test   %edi,%edi
  800dec:	75 0b                	jne    800df9 <__umoddi3+0x89>
  800dee:	b8 01 00 00 00       	mov    $0x1,%eax
  800df3:	31 d2                	xor    %edx,%edx
  800df5:	f7 f7                	div    %edi
  800df7:	89 c1                	mov    %eax,%ecx
  800df9:	89 d8                	mov    %ebx,%eax
  800dfb:	31 d2                	xor    %edx,%edx
  800dfd:	f7 f1                	div    %ecx
  800dff:	89 f0                	mov    %esi,%eax
  800e01:	f7 f1                	div    %ecx
  800e03:	89 d0                	mov    %edx,%eax
  800e05:	31 d2                	xor    %edx,%edx
  800e07:	eb 94                	jmp    800d9d <__umoddi3+0x2d>
  800e09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800e10:	89 e9                	mov    %ebp,%ecx
  800e12:	ba 20 00 00 00       	mov    $0x20,%edx
  800e17:	29 ea                	sub    %ebp,%edx
  800e19:	d3 e0                	shl    %cl,%eax
  800e1b:	89 44 24 08          	mov    %eax,0x8(%esp)
  800e1f:	89 d1                	mov    %edx,%ecx
  800e21:	89 f8                	mov    %edi,%eax
  800e23:	d3 e8                	shr    %cl,%eax
  800e25:	89 54 24 04          	mov    %edx,0x4(%esp)
  800e29:	8b 54 24 04          	mov    0x4(%esp),%edx
  800e2d:	89 c1                	mov    %eax,%ecx
  800e2f:	8b 44 24 08          	mov    0x8(%esp),%eax
  800e33:	09 c1                	or     %eax,%ecx
  800e35:	89 d8                	mov    %ebx,%eax
  800e37:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800e3b:	89 e9                	mov    %ebp,%ecx
  800e3d:	d3 e7                	shl    %cl,%edi
  800e3f:	89 d1                	mov    %edx,%ecx
  800e41:	d3 e8                	shr    %cl,%eax
  800e43:	89 e9                	mov    %ebp,%ecx
  800e45:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  800e49:	d3 e3                	shl    %cl,%ebx
  800e4b:	89 c7                	mov    %eax,%edi
  800e4d:	89 d1                	mov    %edx,%ecx
  800e4f:	89 f0                	mov    %esi,%eax
  800e51:	d3 e8                	shr    %cl,%eax
  800e53:	89 fa                	mov    %edi,%edx
  800e55:	89 e9                	mov    %ebp,%ecx
  800e57:	09 d8                	or     %ebx,%eax
  800e59:	d3 e6                	shl    %cl,%esi
  800e5b:	f7 74 24 08          	divl   0x8(%esp)
  800e5f:	89 d3                	mov    %edx,%ebx
  800e61:	f7 64 24 0c          	mull   0xc(%esp)
  800e65:	89 c7                	mov    %eax,%edi
  800e67:	89 d1                	mov    %edx,%ecx
  800e69:	39 d3                	cmp    %edx,%ebx
  800e6b:	72 06                	jb     800e73 <__umoddi3+0x103>
  800e6d:	75 10                	jne    800e7f <__umoddi3+0x10f>
  800e6f:	39 c6                	cmp    %eax,%esi
  800e71:	73 0c                	jae    800e7f <__umoddi3+0x10f>
  800e73:	2b 44 24 0c          	sub    0xc(%esp),%eax
  800e77:	1b 54 24 08          	sbb    0x8(%esp),%edx
  800e7b:	89 d1                	mov    %edx,%ecx
  800e7d:	89 c7                	mov    %eax,%edi
  800e7f:	89 f2                	mov    %esi,%edx
  800e81:	29 fa                	sub    %edi,%edx
  800e83:	19 cb                	sbb    %ecx,%ebx
  800e85:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  800e8a:	89 d8                	mov    %ebx,%eax
  800e8c:	d3 e0                	shl    %cl,%eax
  800e8e:	89 e9                	mov    %ebp,%ecx
  800e90:	d3 ea                	shr    %cl,%edx
  800e92:	d3 eb                	shr    %cl,%ebx
  800e94:	09 d0                	or     %edx,%eax
  800e96:	89 da                	mov    %ebx,%edx
  800e98:	83 c4 1c             	add    $0x1c,%esp
  800e9b:	5b                   	pop    %ebx
  800e9c:	5e                   	pop    %esi
  800e9d:	5f                   	pop    %edi
  800e9e:	5d                   	pop    %ebp
  800e9f:	c3                   	ret
  800ea0:	89 da                	mov    %ebx,%edx
  800ea2:	89 f1                	mov    %esi,%ecx
  800ea4:	29 f9                	sub    %edi,%ecx
  800ea6:	19 c2                	sbb    %eax,%edx
  800ea8:	89 c8                	mov    %ecx,%eax
  800eaa:	e9 2b ff ff ff       	jmp    800dda <__umoddi3+0x6a>
