
obj/user/spin:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 84 00 00 00       	call   8000b5 <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <umain>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	53                   	push   %ebx
  800037:	83 ec 10             	sub    $0x10,%esp
  80003a:	68 a0 13 80 00       	push   $0x8013a0
  80003f:	e8 65 01 00 00       	call   8001a9 <cprintf>
  800044:	e8 f5 0e 00 00       	call   800f3e <fork>
  800049:	83 c4 10             	add    $0x10,%esp
  80004c:	85 c0                	test   %eax,%eax
  80004e:	75 12                	jne    800062 <umain+0x2f>
  800050:	83 ec 0c             	sub    $0xc,%esp
  800053:	68 8f 15 80 00       	push   $0x80158f
  800058:	e8 4c 01 00 00       	call   8001a9 <cprintf>
  80005d:	83 c4 10             	add    $0x10,%esp
  800060:	eb fe                	jmp    800060 <umain+0x2d>
  800062:	89 c3                	mov    %eax,%ebx
  800064:	83 ec 0c             	sub    $0xc,%esp
  800067:	68 c8 13 80 00       	push   $0x8013c8
  80006c:	e8 38 01 00 00       	call   8001a9 <cprintf>
  800071:	e8 85 0a 00 00       	call   800afb <sys_yield>
  800076:	e8 80 0a 00 00       	call   800afb <sys_yield>
  80007b:	e8 7b 0a 00 00       	call   800afb <sys_yield>
  800080:	e8 76 0a 00 00       	call   800afb <sys_yield>
  800085:	e8 71 0a 00 00       	call   800afb <sys_yield>
  80008a:	e8 6c 0a 00 00       	call   800afb <sys_yield>
  80008f:	e8 67 0a 00 00       	call   800afb <sys_yield>
  800094:	e8 62 0a 00 00       	call   800afb <sys_yield>
  800099:	c7 04 24 f0 13 80 00 	movl   $0x8013f0,(%esp)
  8000a0:	e8 04 01 00 00       	call   8001a9 <cprintf>
  8000a5:	89 1c 24             	mov    %ebx,(%esp)
  8000a8:	e8 08 0a 00 00       	call   800ab5 <sys_env_destroy>
  8000ad:	83 c4 10             	add    $0x10,%esp
  8000b0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8000b3:	c9                   	leave
  8000b4:	c3                   	ret

008000b5 <libmain>:
  8000b5:	55                   	push   %ebp
  8000b6:	89 e5                	mov    %esp,%ebp
  8000b8:	56                   	push   %esi
  8000b9:	53                   	push   %ebx
  8000ba:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8000bd:	8b 75 0c             	mov    0xc(%ebp),%esi
  8000c0:	e8 12 0a 00 00       	call   800ad7 <sys_getenvid>
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
  8000ee:	e8 40 ff ff ff       	call   800033 <umain>
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
  80010a:	e8 a6 09 00 00       	call   800ab5 <sys_env_destroy>
  80010f:	83 c4 10             	add    $0x10,%esp
  800112:	c9                   	leave
  800113:	c3                   	ret

00800114 <putch>:
  800114:	55                   	push   %ebp
  800115:	89 e5                	mov    %esp,%ebp
  800117:	53                   	push   %ebx
  800118:	83 ec 04             	sub    $0x4,%esp
  80011b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  80011e:	8b 13                	mov    (%ebx),%edx
  800120:	8d 42 01             	lea    0x1(%edx),%eax
  800123:	89 03                	mov    %eax,(%ebx)
  800125:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800128:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  80012c:	3d ff 00 00 00       	cmp    $0xff,%eax
  800131:	74 09                	je     80013c <putch+0x28>
  800133:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  800137:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  80013a:	c9                   	leave
  80013b:	c3                   	ret
  80013c:	83 ec 08             	sub    $0x8,%esp
  80013f:	68 ff 00 00 00       	push   $0xff
  800144:	8d 43 08             	lea    0x8(%ebx),%eax
  800147:	50                   	push   %eax
  800148:	e8 1e 09 00 00       	call   800a6b <sys_cputs>
  80014d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  800153:	83 c4 10             	add    $0x10,%esp
  800156:	eb db                	jmp    800133 <putch+0x1f>

00800158 <vcprintf>:
  800158:	55                   	push   %ebp
  800159:	89 e5                	mov    %esp,%ebp
  80015b:	81 ec 18 01 00 00    	sub    $0x118,%esp
  800161:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  800168:	00 00 00 
  80016b:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  800172:	00 00 00 
  800175:	ff 75 0c             	push   0xc(%ebp)
  800178:	ff 75 08             	push   0x8(%ebp)
  80017b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  800181:	50                   	push   %eax
  800182:	68 14 01 80 00       	push   $0x800114
  800187:	e8 74 01 00 00       	call   800300 <vprintfmt>
  80018c:	83 c4 08             	add    $0x8,%esp
  80018f:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  800195:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  80019b:	50                   	push   %eax
  80019c:	e8 ca 08 00 00       	call   800a6b <sys_cputs>
  8001a1:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  8001a7:	c9                   	leave
  8001a8:	c3                   	ret

008001a9 <cprintf>:
  8001a9:	55                   	push   %ebp
  8001aa:	89 e5                	mov    %esp,%ebp
  8001ac:	83 ec 10             	sub    $0x10,%esp
  8001af:	8d 45 0c             	lea    0xc(%ebp),%eax
  8001b2:	50                   	push   %eax
  8001b3:	ff 75 08             	push   0x8(%ebp)
  8001b6:	e8 9d ff ff ff       	call   800158 <vcprintf>
  8001bb:	c9                   	leave
  8001bc:	c3                   	ret

008001bd <printnum>:
  8001bd:	55                   	push   %ebp
  8001be:	89 e5                	mov    %esp,%ebp
  8001c0:	57                   	push   %edi
  8001c1:	56                   	push   %esi
  8001c2:	53                   	push   %ebx
  8001c3:	83 ec 1c             	sub    $0x1c,%esp
  8001c6:	89 c7                	mov    %eax,%edi
  8001c8:	89 d6                	mov    %edx,%esi
  8001ca:	8b 45 08             	mov    0x8(%ebp),%eax
  8001cd:	8b 55 0c             	mov    0xc(%ebp),%edx
  8001d0:	89 d1                	mov    %edx,%ecx
  8001d2:	89 c2                	mov    %eax,%edx
  8001d4:	89 45 d8             	mov    %eax,-0x28(%ebp)
  8001d7:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  8001da:	8b 45 10             	mov    0x10(%ebp),%eax
  8001dd:	8b 5d 14             	mov    0x14(%ebp),%ebx
  8001e0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8001e3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  8001ea:	39 c2                	cmp    %eax,%edx
  8001ec:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  8001ef:	72 3e                	jb     80022f <printnum+0x72>
  8001f1:	83 ec 0c             	sub    $0xc,%esp
  8001f4:	ff 75 18             	push   0x18(%ebp)
  8001f7:	83 eb 01             	sub    $0x1,%ebx
  8001fa:	53                   	push   %ebx
  8001fb:	50                   	push   %eax
  8001fc:	83 ec 08             	sub    $0x8,%esp
  8001ff:	ff 75 e4             	push   -0x1c(%ebp)
  800202:	ff 75 e0             	push   -0x20(%ebp)
  800205:	ff 75 dc             	push   -0x24(%ebp)
  800208:	ff 75 d8             	push   -0x28(%ebp)
  80020b:	e8 20 0f 00 00       	call   801130 <__udivdi3>
  800210:	83 c4 18             	add    $0x18,%esp
  800213:	52                   	push   %edx
  800214:	50                   	push   %eax
  800215:	89 f2                	mov    %esi,%edx
  800217:	89 f8                	mov    %edi,%eax
  800219:	e8 9f ff ff ff       	call   8001bd <printnum>
  80021e:	83 c4 20             	add    $0x20,%esp
  800221:	eb 13                	jmp    800236 <printnum+0x79>
  800223:	83 ec 08             	sub    $0x8,%esp
  800226:	56                   	push   %esi
  800227:	ff 75 18             	push   0x18(%ebp)
  80022a:	ff d7                	call   *%edi
  80022c:	83 c4 10             	add    $0x10,%esp
  80022f:	83 eb 01             	sub    $0x1,%ebx
  800232:	85 db                	test   %ebx,%ebx
  800234:	7f ed                	jg     800223 <printnum+0x66>
  800236:	83 ec 08             	sub    $0x8,%esp
  800239:	56                   	push   %esi
  80023a:	83 ec 04             	sub    $0x4,%esp
  80023d:	ff 75 e4             	push   -0x1c(%ebp)
  800240:	ff 75 e0             	push   -0x20(%ebp)
  800243:	ff 75 dc             	push   -0x24(%ebp)
  800246:	ff 75 d8             	push   -0x28(%ebp)
  800249:	e8 02 10 00 00       	call   801250 <__umoddi3>
  80024e:	83 c4 14             	add    $0x14,%esp
  800251:	0f be 80 b7 15 80 00 	movsbl 0x8015b7(%eax),%eax
  800258:	50                   	push   %eax
  800259:	ff d7                	call   *%edi
  80025b:	83 c4 10             	add    $0x10,%esp
  80025e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800261:	5b                   	pop    %ebx
  800262:	5e                   	pop    %esi
  800263:	5f                   	pop    %edi
  800264:	5d                   	pop    %ebp
  800265:	c3                   	ret

00800266 <getuint>:
  800266:	83 fa 01             	cmp    $0x1,%edx
  800269:	7f 13                	jg     80027e <getuint+0x18>
  80026b:	85 d2                	test   %edx,%edx
  80026d:	74 1c                	je     80028b <getuint+0x25>
  80026f:	8b 10                	mov    (%eax),%edx
  800271:	8d 4a 04             	lea    0x4(%edx),%ecx
  800274:	89 08                	mov    %ecx,(%eax)
  800276:	8b 02                	mov    (%edx),%eax
  800278:	ba 00 00 00 00       	mov    $0x0,%edx
  80027d:	c3                   	ret
  80027e:	8b 10                	mov    (%eax),%edx
  800280:	8d 4a 08             	lea    0x8(%edx),%ecx
  800283:	89 08                	mov    %ecx,(%eax)
  800285:	8b 02                	mov    (%edx),%eax
  800287:	8b 52 04             	mov    0x4(%edx),%edx
  80028a:	c3                   	ret
  80028b:	8b 10                	mov    (%eax),%edx
  80028d:	8d 4a 04             	lea    0x4(%edx),%ecx
  800290:	89 08                	mov    %ecx,(%eax)
  800292:	8b 02                	mov    (%edx),%eax
  800294:	ba 00 00 00 00       	mov    $0x0,%edx
  800299:	c3                   	ret

0080029a <getint>:
  80029a:	83 fa 01             	cmp    $0x1,%edx
  80029d:	7f 0f                	jg     8002ae <getint+0x14>
  80029f:	85 d2                	test   %edx,%edx
  8002a1:	74 18                	je     8002bb <getint+0x21>
  8002a3:	8b 10                	mov    (%eax),%edx
  8002a5:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002a8:	89 08                	mov    %ecx,(%eax)
  8002aa:	8b 02                	mov    (%edx),%eax
  8002ac:	99                   	cltd
  8002ad:	c3                   	ret
  8002ae:	8b 10                	mov    (%eax),%edx
  8002b0:	8d 4a 08             	lea    0x8(%edx),%ecx
  8002b3:	89 08                	mov    %ecx,(%eax)
  8002b5:	8b 02                	mov    (%edx),%eax
  8002b7:	8b 52 04             	mov    0x4(%edx),%edx
  8002ba:	c3                   	ret
  8002bb:	8b 10                	mov    (%eax),%edx
  8002bd:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002c0:	89 08                	mov    %ecx,(%eax)
  8002c2:	8b 02                	mov    (%edx),%eax
  8002c4:	99                   	cltd
  8002c5:	c3                   	ret

008002c6 <sprintputch>:
  8002c6:	55                   	push   %ebp
  8002c7:	89 e5                	mov    %esp,%ebp
  8002c9:	8b 45 0c             	mov    0xc(%ebp),%eax
  8002cc:	83 40 08 01          	addl   $0x1,0x8(%eax)
  8002d0:	8b 10                	mov    (%eax),%edx
  8002d2:	3b 50 04             	cmp    0x4(%eax),%edx
  8002d5:	73 0a                	jae    8002e1 <sprintputch+0x1b>
  8002d7:	8d 4a 01             	lea    0x1(%edx),%ecx
  8002da:	89 08                	mov    %ecx,(%eax)
  8002dc:	8b 45 08             	mov    0x8(%ebp),%eax
  8002df:	88 02                	mov    %al,(%edx)
  8002e1:	5d                   	pop    %ebp
  8002e2:	c3                   	ret

008002e3 <printfmt>:
  8002e3:	55                   	push   %ebp
  8002e4:	89 e5                	mov    %esp,%ebp
  8002e6:	83 ec 08             	sub    $0x8,%esp
  8002e9:	8d 45 14             	lea    0x14(%ebp),%eax
  8002ec:	50                   	push   %eax
  8002ed:	ff 75 10             	push   0x10(%ebp)
  8002f0:	ff 75 0c             	push   0xc(%ebp)
  8002f3:	ff 75 08             	push   0x8(%ebp)
  8002f6:	e8 05 00 00 00       	call   800300 <vprintfmt>
  8002fb:	83 c4 10             	add    $0x10,%esp
  8002fe:	c9                   	leave
  8002ff:	c3                   	ret

00800300 <vprintfmt>:
  800300:	55                   	push   %ebp
  800301:	89 e5                	mov    %esp,%ebp
  800303:	57                   	push   %edi
  800304:	56                   	push   %esi
  800305:	53                   	push   %ebx
  800306:	83 ec 2c             	sub    $0x2c,%esp
  800309:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80030c:	8b 75 0c             	mov    0xc(%ebp),%esi
  80030f:	8b 7d 10             	mov    0x10(%ebp),%edi
  800312:	eb 0a                	jmp    80031e <vprintfmt+0x1e>
  800314:	83 ec 08             	sub    $0x8,%esp
  800317:	56                   	push   %esi
  800318:	50                   	push   %eax
  800319:	ff d3                	call   *%ebx
  80031b:	83 c4 10             	add    $0x10,%esp
  80031e:	83 c7 01             	add    $0x1,%edi
  800321:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  800325:	83 f8 25             	cmp    $0x25,%eax
  800328:	74 0c                	je     800336 <vprintfmt+0x36>
  80032a:	85 c0                	test   %eax,%eax
  80032c:	75 e6                	jne    800314 <vprintfmt+0x14>
  80032e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800331:	5b                   	pop    %ebx
  800332:	5e                   	pop    %esi
  800333:	5f                   	pop    %edi
  800334:	5d                   	pop    %ebp
  800335:	c3                   	ret
  800336:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  80033a:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  800341:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800348:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  80034f:	b9 00 00 00 00       	mov    $0x0,%ecx
  800354:	8d 47 01             	lea    0x1(%edi),%eax
  800357:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  80035a:	0f b6 17             	movzbl (%edi),%edx
  80035d:	8d 42 dd             	lea    -0x23(%edx),%eax
  800360:	3c 55                	cmp    $0x55,%al
  800362:	0f 87 c3 02 00 00    	ja     80062b <vprintfmt+0x32b>
  800368:	0f b6 c0             	movzbl %al,%eax
  80036b:	ff 24 85 40 17 80 00 	jmp    *0x801740(,%eax,4)
  800372:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800375:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  800379:	eb d9                	jmp    800354 <vprintfmt+0x54>
  80037b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80037e:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  800382:	eb d0                	jmp    800354 <vprintfmt+0x54>
  800384:	0f b6 d2             	movzbl %dl,%edx
  800387:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80038a:	b8 00 00 00 00       	mov    $0x0,%eax
  80038f:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  800392:	8d 04 80             	lea    (%eax,%eax,4),%eax
  800395:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  800399:	0f be 17             	movsbl (%edi),%edx
  80039c:	8d 4a d0             	lea    -0x30(%edx),%ecx
  80039f:	83 f9 09             	cmp    $0x9,%ecx
  8003a2:	77 52                	ja     8003f6 <vprintfmt+0xf6>
  8003a4:	83 c7 01             	add    $0x1,%edi
  8003a7:	eb e9                	jmp    800392 <vprintfmt+0x92>
  8003a9:	8b 45 14             	mov    0x14(%ebp),%eax
  8003ac:	8d 50 04             	lea    0x4(%eax),%edx
  8003af:	89 55 14             	mov    %edx,0x14(%ebp)
  8003b2:	8b 00                	mov    (%eax),%eax
  8003b4:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8003b7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003ba:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  8003be:	79 94                	jns    800354 <vprintfmt+0x54>
  8003c0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  8003c3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8003c6:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  8003cd:	eb 85                	jmp    800354 <vprintfmt+0x54>
  8003cf:	8b 55 e0             	mov    -0x20(%ebp),%edx
  8003d2:	85 d2                	test   %edx,%edx
  8003d4:	b8 00 00 00 00       	mov    $0x0,%eax
  8003d9:	0f 49 c2             	cmovns %edx,%eax
  8003dc:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8003df:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003e2:	e9 6d ff ff ff       	jmp    800354 <vprintfmt+0x54>
  8003e7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003ea:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  8003f1:	e9 5e ff ff ff       	jmp    800354 <vprintfmt+0x54>
  8003f6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  8003f9:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8003fc:	eb bc                	jmp    8003ba <vprintfmt+0xba>
  8003fe:	83 c1 01             	add    $0x1,%ecx
  800401:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800404:	e9 4b ff ff ff       	jmp    800354 <vprintfmt+0x54>
  800409:	8b 45 14             	mov    0x14(%ebp),%eax
  80040c:	8d 50 04             	lea    0x4(%eax),%edx
  80040f:	89 55 14             	mov    %edx,0x14(%ebp)
  800412:	83 ec 08             	sub    $0x8,%esp
  800415:	56                   	push   %esi
  800416:	ff 30                	push   (%eax)
  800418:	ff d3                	call   *%ebx
  80041a:	83 c4 10             	add    $0x10,%esp
  80041d:	e9 a0 01 00 00       	jmp    8005c2 <vprintfmt+0x2c2>
  800422:	8b 45 14             	mov    0x14(%ebp),%eax
  800425:	8d 50 04             	lea    0x4(%eax),%edx
  800428:	89 55 14             	mov    %edx,0x14(%ebp)
  80042b:	8b 10                	mov    (%eax),%edx
  80042d:	89 d0                	mov    %edx,%eax
  80042f:	f7 d8                	neg    %eax
  800431:	0f 48 c2             	cmovs  %edx,%eax
  800434:	83 f8 08             	cmp    $0x8,%eax
  800437:	7f 20                	jg     800459 <vprintfmt+0x159>
  800439:	8b 14 85 a0 18 80 00 	mov    0x8018a0(,%eax,4),%edx
  800440:	85 d2                	test   %edx,%edx
  800442:	74 15                	je     800459 <vprintfmt+0x159>
  800444:	52                   	push   %edx
  800445:	68 d8 15 80 00       	push   $0x8015d8
  80044a:	56                   	push   %esi
  80044b:	53                   	push   %ebx
  80044c:	e8 92 fe ff ff       	call   8002e3 <printfmt>
  800451:	83 c4 10             	add    $0x10,%esp
  800454:	e9 69 01 00 00       	jmp    8005c2 <vprintfmt+0x2c2>
  800459:	50                   	push   %eax
  80045a:	68 cf 15 80 00       	push   $0x8015cf
  80045f:	56                   	push   %esi
  800460:	53                   	push   %ebx
  800461:	e8 7d fe ff ff       	call   8002e3 <printfmt>
  800466:	83 c4 10             	add    $0x10,%esp
  800469:	e9 54 01 00 00       	jmp    8005c2 <vprintfmt+0x2c2>
  80046e:	8b 45 14             	mov    0x14(%ebp),%eax
  800471:	8d 50 04             	lea    0x4(%eax),%edx
  800474:	89 55 14             	mov    %edx,0x14(%ebp)
  800477:	8b 08                	mov    (%eax),%ecx
  800479:	85 c9                	test   %ecx,%ecx
  80047b:	b8 c8 15 80 00       	mov    $0x8015c8,%eax
  800480:	0f 45 c1             	cmovne %ecx,%eax
  800483:	89 45 cc             	mov    %eax,-0x34(%ebp)
  800486:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  80048a:	7e 06                	jle    800492 <vprintfmt+0x192>
  80048c:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  800490:	75 0b                	jne    80049d <vprintfmt+0x19d>
  800492:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  800495:	8b 7d d0             	mov    -0x30(%ebp),%edi
  800498:	89 5d 08             	mov    %ebx,0x8(%ebp)
  80049b:	eb 5c                	jmp    8004f9 <vprintfmt+0x1f9>
  80049d:	83 ec 08             	sub    $0x8,%esp
  8004a0:	ff 75 d0             	push   -0x30(%ebp)
  8004a3:	ff 75 cc             	push   -0x34(%ebp)
  8004a6:	e8 20 02 00 00       	call   8006cb <strnlen>
  8004ab:	89 c2                	mov    %eax,%edx
  8004ad:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8004b0:	29 d0                	sub    %edx,%eax
  8004b2:	83 c4 10             	add    $0x10,%esp
  8004b5:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  8004b9:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8004bc:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8004bf:	89 c3                	mov    %eax,%ebx
  8004c1:	eb 0e                	jmp    8004d1 <vprintfmt+0x1d1>
  8004c3:	83 ec 08             	sub    $0x8,%esp
  8004c6:	56                   	push   %esi
  8004c7:	57                   	push   %edi
  8004c8:	ff 55 08             	call   *0x8(%ebp)
  8004cb:	83 eb 01             	sub    $0x1,%ebx
  8004ce:	83 c4 10             	add    $0x10,%esp
  8004d1:	85 db                	test   %ebx,%ebx
  8004d3:	7f ee                	jg     8004c3 <vprintfmt+0x1c3>
  8004d5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8004d8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8004db:	85 c0                	test   %eax,%eax
  8004dd:	ba 00 00 00 00       	mov    $0x0,%edx
  8004e2:	0f 49 d0             	cmovns %eax,%edx
  8004e5:	29 d0                	sub    %edx,%eax
  8004e7:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8004ea:	eb a6                	jmp    800492 <vprintfmt+0x192>
  8004ec:	83 ec 08             	sub    $0x8,%esp
  8004ef:	56                   	push   %esi
  8004f0:	52                   	push   %edx
  8004f1:	ff 55 08             	call   *0x8(%ebp)
  8004f4:	83 c4 10             	add    $0x10,%esp
  8004f7:	89 d9                	mov    %ebx,%ecx
  8004f9:	8d 59 01             	lea    0x1(%ecx),%ebx
  8004fc:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  800500:	0f be d0             	movsbl %al,%edx
  800503:	85 d2                	test   %edx,%edx
  800505:	74 28                	je     80052f <vprintfmt+0x22f>
  800507:	85 ff                	test   %edi,%edi
  800509:	78 05                	js     800510 <vprintfmt+0x210>
  80050b:	83 ef 01             	sub    $0x1,%edi
  80050e:	78 2e                	js     80053e <vprintfmt+0x23e>
  800510:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  800514:	74 d6                	je     8004ec <vprintfmt+0x1ec>
  800516:	0f be c0             	movsbl %al,%eax
  800519:	83 e8 20             	sub    $0x20,%eax
  80051c:	83 f8 5e             	cmp    $0x5e,%eax
  80051f:	76 cb                	jbe    8004ec <vprintfmt+0x1ec>
  800521:	83 ec 08             	sub    $0x8,%esp
  800524:	56                   	push   %esi
  800525:	6a 3f                	push   $0x3f
  800527:	ff 55 08             	call   *0x8(%ebp)
  80052a:	83 c4 10             	add    $0x10,%esp
  80052d:	eb c8                	jmp    8004f7 <vprintfmt+0x1f7>
  80052f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800532:	8b 7d cc             	mov    -0x34(%ebp),%edi
  800535:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800538:	01 c7                	add    %eax,%edi
  80053a:	29 cf                	sub    %ecx,%edi
  80053c:	eb 13                	jmp    800551 <vprintfmt+0x251>
  80053e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800541:	eb ef                	jmp    800532 <vprintfmt+0x232>
  800543:	83 ec 08             	sub    $0x8,%esp
  800546:	56                   	push   %esi
  800547:	6a 20                	push   $0x20
  800549:	ff d3                	call   *%ebx
  80054b:	83 ef 01             	sub    $0x1,%edi
  80054e:	83 c4 10             	add    $0x10,%esp
  800551:	85 ff                	test   %edi,%edi
  800553:	7f ee                	jg     800543 <vprintfmt+0x243>
  800555:	eb 6b                	jmp    8005c2 <vprintfmt+0x2c2>
  800557:	89 ca                	mov    %ecx,%edx
  800559:	8d 45 14             	lea    0x14(%ebp),%eax
  80055c:	e8 39 fd ff ff       	call   80029a <getint>
  800561:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800564:	89 55 dc             	mov    %edx,-0x24(%ebp)
  800567:	85 d2                	test   %edx,%edx
  800569:	78 0b                	js     800576 <vprintfmt+0x276>
  80056b:	89 d1                	mov    %edx,%ecx
  80056d:	89 c2                	mov    %eax,%edx
  80056f:	bf 0a 00 00 00       	mov    $0xa,%edi
  800574:	eb 32                	jmp    8005a8 <vprintfmt+0x2a8>
  800576:	83 ec 08             	sub    $0x8,%esp
  800579:	56                   	push   %esi
  80057a:	6a 2d                	push   $0x2d
  80057c:	ff d3                	call   *%ebx
  80057e:	8b 55 d8             	mov    -0x28(%ebp),%edx
  800581:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  800584:	f7 da                	neg    %edx
  800586:	83 d1 00             	adc    $0x0,%ecx
  800589:	f7 d9                	neg    %ecx
  80058b:	83 c4 10             	add    $0x10,%esp
  80058e:	bf 0a 00 00 00       	mov    $0xa,%edi
  800593:	eb 13                	jmp    8005a8 <vprintfmt+0x2a8>
  800595:	89 ca                	mov    %ecx,%edx
  800597:	8d 45 14             	lea    0x14(%ebp),%eax
  80059a:	e8 c7 fc ff ff       	call   800266 <getuint>
  80059f:	89 d1                	mov    %edx,%ecx
  8005a1:	89 c2                	mov    %eax,%edx
  8005a3:	bf 0a 00 00 00       	mov    $0xa,%edi
  8005a8:	83 ec 0c             	sub    $0xc,%esp
  8005ab:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  8005af:	50                   	push   %eax
  8005b0:	ff 75 e0             	push   -0x20(%ebp)
  8005b3:	57                   	push   %edi
  8005b4:	51                   	push   %ecx
  8005b5:	52                   	push   %edx
  8005b6:	89 f2                	mov    %esi,%edx
  8005b8:	89 d8                	mov    %ebx,%eax
  8005ba:	e8 fe fb ff ff       	call   8001bd <printnum>
  8005bf:	83 c4 20             	add    $0x20,%esp
  8005c2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005c5:	e9 54 fd ff ff       	jmp    80031e <vprintfmt+0x1e>
  8005ca:	89 ca                	mov    %ecx,%edx
  8005cc:	8d 45 14             	lea    0x14(%ebp),%eax
  8005cf:	e8 92 fc ff ff       	call   800266 <getuint>
  8005d4:	89 d1                	mov    %edx,%ecx
  8005d6:	89 c2                	mov    %eax,%edx
  8005d8:	bf 08 00 00 00       	mov    $0x8,%edi
  8005dd:	eb c9                	jmp    8005a8 <vprintfmt+0x2a8>
  8005df:	83 ec 08             	sub    $0x8,%esp
  8005e2:	56                   	push   %esi
  8005e3:	6a 30                	push   $0x30
  8005e5:	ff d3                	call   *%ebx
  8005e7:	83 c4 08             	add    $0x8,%esp
  8005ea:	56                   	push   %esi
  8005eb:	6a 78                	push   $0x78
  8005ed:	ff d3                	call   *%ebx
  8005ef:	8b 45 14             	mov    0x14(%ebp),%eax
  8005f2:	8d 50 04             	lea    0x4(%eax),%edx
  8005f5:	89 55 14             	mov    %edx,0x14(%ebp)
  8005f8:	8b 10                	mov    (%eax),%edx
  8005fa:	b9 00 00 00 00       	mov    $0x0,%ecx
  8005ff:	83 c4 10             	add    $0x10,%esp
  800602:	bf 10 00 00 00       	mov    $0x10,%edi
  800607:	eb 9f                	jmp    8005a8 <vprintfmt+0x2a8>
  800609:	89 ca                	mov    %ecx,%edx
  80060b:	8d 45 14             	lea    0x14(%ebp),%eax
  80060e:	e8 53 fc ff ff       	call   800266 <getuint>
  800613:	89 d1                	mov    %edx,%ecx
  800615:	89 c2                	mov    %eax,%edx
  800617:	bf 10 00 00 00       	mov    $0x10,%edi
  80061c:	eb 8a                	jmp    8005a8 <vprintfmt+0x2a8>
  80061e:	83 ec 08             	sub    $0x8,%esp
  800621:	56                   	push   %esi
  800622:	6a 25                	push   $0x25
  800624:	ff d3                	call   *%ebx
  800626:	83 c4 10             	add    $0x10,%esp
  800629:	eb 97                	jmp    8005c2 <vprintfmt+0x2c2>
  80062b:	83 ec 08             	sub    $0x8,%esp
  80062e:	56                   	push   %esi
  80062f:	6a 25                	push   $0x25
  800631:	ff d3                	call   *%ebx
  800633:	83 c4 10             	add    $0x10,%esp
  800636:	89 f8                	mov    %edi,%eax
  800638:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  80063c:	74 05                	je     800643 <vprintfmt+0x343>
  80063e:	83 e8 01             	sub    $0x1,%eax
  800641:	eb f5                	jmp    800638 <vprintfmt+0x338>
  800643:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800646:	e9 77 ff ff ff       	jmp    8005c2 <vprintfmt+0x2c2>

0080064b <vsnprintf>:
  80064b:	55                   	push   %ebp
  80064c:	89 e5                	mov    %esp,%ebp
  80064e:	83 ec 18             	sub    $0x18,%esp
  800651:	8b 45 08             	mov    0x8(%ebp),%eax
  800654:	8b 55 0c             	mov    0xc(%ebp),%edx
  800657:	89 45 ec             	mov    %eax,-0x14(%ebp)
  80065a:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  80065e:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  800661:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  800668:	85 c0                	test   %eax,%eax
  80066a:	74 26                	je     800692 <vsnprintf+0x47>
  80066c:	85 d2                	test   %edx,%edx
  80066e:	7e 22                	jle    800692 <vsnprintf+0x47>
  800670:	ff 75 14             	push   0x14(%ebp)
  800673:	ff 75 10             	push   0x10(%ebp)
  800676:	8d 45 ec             	lea    -0x14(%ebp),%eax
  800679:	50                   	push   %eax
  80067a:	68 c6 02 80 00       	push   $0x8002c6
  80067f:	e8 7c fc ff ff       	call   800300 <vprintfmt>
  800684:	8b 45 ec             	mov    -0x14(%ebp),%eax
  800687:	c6 00 00             	movb   $0x0,(%eax)
  80068a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  80068d:	83 c4 10             	add    $0x10,%esp
  800690:	c9                   	leave
  800691:	c3                   	ret
  800692:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800697:	eb f7                	jmp    800690 <vsnprintf+0x45>

00800699 <snprintf>:
  800699:	55                   	push   %ebp
  80069a:	89 e5                	mov    %esp,%ebp
  80069c:	83 ec 08             	sub    $0x8,%esp
  80069f:	8d 45 14             	lea    0x14(%ebp),%eax
  8006a2:	50                   	push   %eax
  8006a3:	ff 75 10             	push   0x10(%ebp)
  8006a6:	ff 75 0c             	push   0xc(%ebp)
  8006a9:	ff 75 08             	push   0x8(%ebp)
  8006ac:	e8 9a ff ff ff       	call   80064b <vsnprintf>
  8006b1:	c9                   	leave
  8006b2:	c3                   	ret

008006b3 <strlen>:
  8006b3:	55                   	push   %ebp
  8006b4:	89 e5                	mov    %esp,%ebp
  8006b6:	8b 55 08             	mov    0x8(%ebp),%edx
  8006b9:	b8 00 00 00 00       	mov    $0x0,%eax
  8006be:	eb 03                	jmp    8006c3 <strlen+0x10>
  8006c0:	83 c0 01             	add    $0x1,%eax
  8006c3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  8006c7:	75 f7                	jne    8006c0 <strlen+0xd>
  8006c9:	5d                   	pop    %ebp
  8006ca:	c3                   	ret

008006cb <strnlen>:
  8006cb:	55                   	push   %ebp
  8006cc:	89 e5                	mov    %esp,%ebp
  8006ce:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8006d1:	8b 55 0c             	mov    0xc(%ebp),%edx
  8006d4:	b8 00 00 00 00       	mov    $0x0,%eax
  8006d9:	eb 03                	jmp    8006de <strnlen+0x13>
  8006db:	83 c0 01             	add    $0x1,%eax
  8006de:	39 d0                	cmp    %edx,%eax
  8006e0:	74 08                	je     8006ea <strnlen+0x1f>
  8006e2:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  8006e6:	75 f3                	jne    8006db <strnlen+0x10>
  8006e8:	89 c2                	mov    %eax,%edx
  8006ea:	89 d0                	mov    %edx,%eax
  8006ec:	5d                   	pop    %ebp
  8006ed:	c3                   	ret

008006ee <strcpy>:
  8006ee:	55                   	push   %ebp
  8006ef:	89 e5                	mov    %esp,%ebp
  8006f1:	53                   	push   %ebx
  8006f2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8006f5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8006f8:	b8 00 00 00 00       	mov    $0x0,%eax
  8006fd:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  800701:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  800704:	83 c0 01             	add    $0x1,%eax
  800707:	84 d2                	test   %dl,%dl
  800709:	75 f2                	jne    8006fd <strcpy+0xf>
  80070b:	89 c8                	mov    %ecx,%eax
  80070d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800710:	c9                   	leave
  800711:	c3                   	ret

00800712 <strcat>:
  800712:	55                   	push   %ebp
  800713:	89 e5                	mov    %esp,%ebp
  800715:	53                   	push   %ebx
  800716:	83 ec 10             	sub    $0x10,%esp
  800719:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80071c:	53                   	push   %ebx
  80071d:	e8 91 ff ff ff       	call   8006b3 <strlen>
  800722:	83 c4 08             	add    $0x8,%esp
  800725:	ff 75 0c             	push   0xc(%ebp)
  800728:	01 d8                	add    %ebx,%eax
  80072a:	50                   	push   %eax
  80072b:	e8 be ff ff ff       	call   8006ee <strcpy>
  800730:	89 d8                	mov    %ebx,%eax
  800732:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800735:	c9                   	leave
  800736:	c3                   	ret

00800737 <strncpy>:
  800737:	55                   	push   %ebp
  800738:	89 e5                	mov    %esp,%ebp
  80073a:	56                   	push   %esi
  80073b:	53                   	push   %ebx
  80073c:	8b 75 08             	mov    0x8(%ebp),%esi
  80073f:	8b 55 0c             	mov    0xc(%ebp),%edx
  800742:	89 f3                	mov    %esi,%ebx
  800744:	03 5d 10             	add    0x10(%ebp),%ebx
  800747:	89 f0                	mov    %esi,%eax
  800749:	eb 0f                	jmp    80075a <strncpy+0x23>
  80074b:	83 c0 01             	add    $0x1,%eax
  80074e:	0f b6 0a             	movzbl (%edx),%ecx
  800751:	88 48 ff             	mov    %cl,-0x1(%eax)
  800754:	80 f9 01             	cmp    $0x1,%cl
  800757:	83 da ff             	sbb    $0xffffffff,%edx
  80075a:	39 d8                	cmp    %ebx,%eax
  80075c:	75 ed                	jne    80074b <strncpy+0x14>
  80075e:	89 f0                	mov    %esi,%eax
  800760:	5b                   	pop    %ebx
  800761:	5e                   	pop    %esi
  800762:	5d                   	pop    %ebp
  800763:	c3                   	ret

00800764 <strlcpy>:
  800764:	55                   	push   %ebp
  800765:	89 e5                	mov    %esp,%ebp
  800767:	56                   	push   %esi
  800768:	53                   	push   %ebx
  800769:	8b 75 08             	mov    0x8(%ebp),%esi
  80076c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80076f:	8b 55 10             	mov    0x10(%ebp),%edx
  800772:	89 f0                	mov    %esi,%eax
  800774:	85 d2                	test   %edx,%edx
  800776:	74 21                	je     800799 <strlcpy+0x35>
  800778:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  80077c:	89 f2                	mov    %esi,%edx
  80077e:	eb 09                	jmp    800789 <strlcpy+0x25>
  800780:	83 c1 01             	add    $0x1,%ecx
  800783:	83 c2 01             	add    $0x1,%edx
  800786:	88 5a ff             	mov    %bl,-0x1(%edx)
  800789:	39 c2                	cmp    %eax,%edx
  80078b:	74 09                	je     800796 <strlcpy+0x32>
  80078d:	0f b6 19             	movzbl (%ecx),%ebx
  800790:	84 db                	test   %bl,%bl
  800792:	75 ec                	jne    800780 <strlcpy+0x1c>
  800794:	89 d0                	mov    %edx,%eax
  800796:	c6 00 00             	movb   $0x0,(%eax)
  800799:	29 f0                	sub    %esi,%eax
  80079b:	5b                   	pop    %ebx
  80079c:	5e                   	pop    %esi
  80079d:	5d                   	pop    %ebp
  80079e:	c3                   	ret

0080079f <strcmp>:
  80079f:	55                   	push   %ebp
  8007a0:	89 e5                	mov    %esp,%ebp
  8007a2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8007a5:	8b 55 0c             	mov    0xc(%ebp),%edx
  8007a8:	eb 06                	jmp    8007b0 <strcmp+0x11>
  8007aa:	83 c1 01             	add    $0x1,%ecx
  8007ad:	83 c2 01             	add    $0x1,%edx
  8007b0:	0f b6 01             	movzbl (%ecx),%eax
  8007b3:	84 c0                	test   %al,%al
  8007b5:	74 04                	je     8007bb <strcmp+0x1c>
  8007b7:	3a 02                	cmp    (%edx),%al
  8007b9:	74 ef                	je     8007aa <strcmp+0xb>
  8007bb:	0f b6 c0             	movzbl %al,%eax
  8007be:	0f b6 12             	movzbl (%edx),%edx
  8007c1:	29 d0                	sub    %edx,%eax
  8007c3:	5d                   	pop    %ebp
  8007c4:	c3                   	ret

008007c5 <strncmp>:
  8007c5:	55                   	push   %ebp
  8007c6:	89 e5                	mov    %esp,%ebp
  8007c8:	53                   	push   %ebx
  8007c9:	8b 45 08             	mov    0x8(%ebp),%eax
  8007cc:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8007cf:	8b 55 10             	mov    0x10(%ebp),%edx
  8007d2:	eb 09                	jmp    8007dd <strncmp+0x18>
  8007d4:	83 ea 01             	sub    $0x1,%edx
  8007d7:	83 c0 01             	add    $0x1,%eax
  8007da:	83 c1 01             	add    $0x1,%ecx
  8007dd:	85 d2                	test   %edx,%edx
  8007df:	74 18                	je     8007f9 <strncmp+0x34>
  8007e1:	0f b6 18             	movzbl (%eax),%ebx
  8007e4:	84 db                	test   %bl,%bl
  8007e6:	74 04                	je     8007ec <strncmp+0x27>
  8007e8:	3a 19                	cmp    (%ecx),%bl
  8007ea:	74 e8                	je     8007d4 <strncmp+0xf>
  8007ec:	0f b6 00             	movzbl (%eax),%eax
  8007ef:	0f b6 11             	movzbl (%ecx),%edx
  8007f2:	29 d0                	sub    %edx,%eax
  8007f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8007f7:	c9                   	leave
  8007f8:	c3                   	ret
  8007f9:	b8 00 00 00 00       	mov    $0x0,%eax
  8007fe:	eb f4                	jmp    8007f4 <strncmp+0x2f>

00800800 <strchr>:
  800800:	55                   	push   %ebp
  800801:	89 e5                	mov    %esp,%ebp
  800803:	8b 45 08             	mov    0x8(%ebp),%eax
  800806:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  80080a:	eb 03                	jmp    80080f <strchr+0xf>
  80080c:	83 c0 01             	add    $0x1,%eax
  80080f:	0f b6 10             	movzbl (%eax),%edx
  800812:	84 d2                	test   %dl,%dl
  800814:	74 06                	je     80081c <strchr+0x1c>
  800816:	38 ca                	cmp    %cl,%dl
  800818:	75 f2                	jne    80080c <strchr+0xc>
  80081a:	eb 05                	jmp    800821 <strchr+0x21>
  80081c:	b8 00 00 00 00       	mov    $0x0,%eax
  800821:	5d                   	pop    %ebp
  800822:	c3                   	ret

00800823 <strfind>:
  800823:	55                   	push   %ebp
  800824:	89 e5                	mov    %esp,%ebp
  800826:	8b 45 08             	mov    0x8(%ebp),%eax
  800829:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  80082d:	0f b6 10             	movzbl (%eax),%edx
  800830:	38 ca                	cmp    %cl,%dl
  800832:	74 09                	je     80083d <strfind+0x1a>
  800834:	84 d2                	test   %dl,%dl
  800836:	74 05                	je     80083d <strfind+0x1a>
  800838:	83 c0 01             	add    $0x1,%eax
  80083b:	eb f0                	jmp    80082d <strfind+0xa>
  80083d:	5d                   	pop    %ebp
  80083e:	c3                   	ret

0080083f <memset>:
  80083f:	55                   	push   %ebp
  800840:	89 e5                	mov    %esp,%ebp
  800842:	57                   	push   %edi
  800843:	8b 55 08             	mov    0x8(%ebp),%edx
  800846:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800849:	85 c9                	test   %ecx,%ecx
  80084b:	74 24                	je     800871 <memset+0x32>
  80084d:	89 d0                	mov    %edx,%eax
  80084f:	09 c8                	or     %ecx,%eax
  800851:	a8 03                	test   $0x3,%al
  800853:	75 14                	jne    800869 <memset+0x2a>
  800855:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  800859:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  80085f:	c1 e9 02             	shr    $0x2,%ecx
  800862:	89 d7                	mov    %edx,%edi
  800864:	fc                   	cld
  800865:	f3 ab                	rep stos %eax,%es:(%edi)
  800867:	eb 08                	jmp    800871 <memset+0x32>
  800869:	89 d7                	mov    %edx,%edi
  80086b:	8b 45 0c             	mov    0xc(%ebp),%eax
  80086e:	fc                   	cld
  80086f:	f3 aa                	rep stos %al,%es:(%edi)
  800871:	89 d0                	mov    %edx,%eax
  800873:	8b 7d fc             	mov    -0x4(%ebp),%edi
  800876:	c9                   	leave
  800877:	c3                   	ret

00800878 <memmove>:
  800878:	55                   	push   %ebp
  800879:	89 e5                	mov    %esp,%ebp
  80087b:	57                   	push   %edi
  80087c:	56                   	push   %esi
  80087d:	8b 45 08             	mov    0x8(%ebp),%eax
  800880:	8b 75 0c             	mov    0xc(%ebp),%esi
  800883:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800886:	39 c6                	cmp    %eax,%esi
  800888:	73 32                	jae    8008bc <memmove+0x44>
  80088a:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  80088d:	39 d0                	cmp    %edx,%eax
  80088f:	73 2b                	jae    8008bc <memmove+0x44>
  800891:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  800894:	89 fe                	mov    %edi,%esi
  800896:	09 ce                	or     %ecx,%esi
  800898:	09 d6                	or     %edx,%esi
  80089a:	f7 c6 03 00 00 00    	test   $0x3,%esi
  8008a0:	75 0e                	jne    8008b0 <memmove+0x38>
  8008a2:	83 ef 04             	sub    $0x4,%edi
  8008a5:	8d 72 fc             	lea    -0x4(%edx),%esi
  8008a8:	c1 e9 02             	shr    $0x2,%ecx
  8008ab:	fd                   	std
  8008ac:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  8008ae:	eb 09                	jmp    8008b9 <memmove+0x41>
  8008b0:	83 ef 01             	sub    $0x1,%edi
  8008b3:	8d 72 ff             	lea    -0x1(%edx),%esi
  8008b6:	fd                   	std
  8008b7:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  8008b9:	fc                   	cld
  8008ba:	eb 1a                	jmp    8008d6 <memmove+0x5e>
  8008bc:	89 c2                	mov    %eax,%edx
  8008be:	09 ca                	or     %ecx,%edx
  8008c0:	09 f2                	or     %esi,%edx
  8008c2:	f6 c2 03             	test   $0x3,%dl
  8008c5:	75 0a                	jne    8008d1 <memmove+0x59>
  8008c7:	c1 e9 02             	shr    $0x2,%ecx
  8008ca:	89 c7                	mov    %eax,%edi
  8008cc:	fc                   	cld
  8008cd:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  8008cf:	eb 05                	jmp    8008d6 <memmove+0x5e>
  8008d1:	89 c7                	mov    %eax,%edi
  8008d3:	fc                   	cld
  8008d4:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  8008d6:	5e                   	pop    %esi
  8008d7:	5f                   	pop    %edi
  8008d8:	5d                   	pop    %ebp
  8008d9:	c3                   	ret

008008da <memcpy>:
  8008da:	55                   	push   %ebp
  8008db:	89 e5                	mov    %esp,%ebp
  8008dd:	83 ec 0c             	sub    $0xc,%esp
  8008e0:	ff 75 10             	push   0x10(%ebp)
  8008e3:	ff 75 0c             	push   0xc(%ebp)
  8008e6:	ff 75 08             	push   0x8(%ebp)
  8008e9:	e8 8a ff ff ff       	call   800878 <memmove>
  8008ee:	c9                   	leave
  8008ef:	c3                   	ret

008008f0 <memcmp>:
  8008f0:	55                   	push   %ebp
  8008f1:	89 e5                	mov    %esp,%ebp
  8008f3:	56                   	push   %esi
  8008f4:	53                   	push   %ebx
  8008f5:	8b 45 08             	mov    0x8(%ebp),%eax
  8008f8:	8b 55 0c             	mov    0xc(%ebp),%edx
  8008fb:	89 c6                	mov    %eax,%esi
  8008fd:	03 75 10             	add    0x10(%ebp),%esi
  800900:	eb 06                	jmp    800908 <memcmp+0x18>
  800902:	83 c0 01             	add    $0x1,%eax
  800905:	83 c2 01             	add    $0x1,%edx
  800908:	39 f0                	cmp    %esi,%eax
  80090a:	74 14                	je     800920 <memcmp+0x30>
  80090c:	0f b6 08             	movzbl (%eax),%ecx
  80090f:	0f b6 1a             	movzbl (%edx),%ebx
  800912:	38 d9                	cmp    %bl,%cl
  800914:	74 ec                	je     800902 <memcmp+0x12>
  800916:	0f b6 c1             	movzbl %cl,%eax
  800919:	0f b6 db             	movzbl %bl,%ebx
  80091c:	29 d8                	sub    %ebx,%eax
  80091e:	eb 05                	jmp    800925 <memcmp+0x35>
  800920:	b8 00 00 00 00       	mov    $0x0,%eax
  800925:	5b                   	pop    %ebx
  800926:	5e                   	pop    %esi
  800927:	5d                   	pop    %ebp
  800928:	c3                   	ret

00800929 <memfind>:
  800929:	55                   	push   %ebp
  80092a:	89 e5                	mov    %esp,%ebp
  80092c:	8b 45 08             	mov    0x8(%ebp),%eax
  80092f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800932:	89 c2                	mov    %eax,%edx
  800934:	03 55 10             	add    0x10(%ebp),%edx
  800937:	eb 03                	jmp    80093c <memfind+0x13>
  800939:	83 c0 01             	add    $0x1,%eax
  80093c:	39 d0                	cmp    %edx,%eax
  80093e:	73 04                	jae    800944 <memfind+0x1b>
  800940:	38 08                	cmp    %cl,(%eax)
  800942:	75 f5                	jne    800939 <memfind+0x10>
  800944:	5d                   	pop    %ebp
  800945:	c3                   	ret

00800946 <strtol>:
  800946:	55                   	push   %ebp
  800947:	89 e5                	mov    %esp,%ebp
  800949:	57                   	push   %edi
  80094a:	56                   	push   %esi
  80094b:	53                   	push   %ebx
  80094c:	8b 55 08             	mov    0x8(%ebp),%edx
  80094f:	8b 5d 10             	mov    0x10(%ebp),%ebx
  800952:	eb 03                	jmp    800957 <strtol+0x11>
  800954:	83 c2 01             	add    $0x1,%edx
  800957:	0f b6 02             	movzbl (%edx),%eax
  80095a:	3c 20                	cmp    $0x20,%al
  80095c:	74 f6                	je     800954 <strtol+0xe>
  80095e:	3c 09                	cmp    $0x9,%al
  800960:	74 f2                	je     800954 <strtol+0xe>
  800962:	3c 2b                	cmp    $0x2b,%al
  800964:	74 2a                	je     800990 <strtol+0x4a>
  800966:	bf 00 00 00 00       	mov    $0x0,%edi
  80096b:	3c 2d                	cmp    $0x2d,%al
  80096d:	74 2b                	je     80099a <strtol+0x54>
  80096f:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  800975:	75 0f                	jne    800986 <strtol+0x40>
  800977:	80 3a 30             	cmpb   $0x30,(%edx)
  80097a:	74 28                	je     8009a4 <strtol+0x5e>
  80097c:	85 db                	test   %ebx,%ebx
  80097e:	b8 0a 00 00 00       	mov    $0xa,%eax
  800983:	0f 44 d8             	cmove  %eax,%ebx
  800986:	b9 00 00 00 00       	mov    $0x0,%ecx
  80098b:	89 5d 10             	mov    %ebx,0x10(%ebp)
  80098e:	eb 46                	jmp    8009d6 <strtol+0x90>
  800990:	83 c2 01             	add    $0x1,%edx
  800993:	bf 00 00 00 00       	mov    $0x0,%edi
  800998:	eb d5                	jmp    80096f <strtol+0x29>
  80099a:	83 c2 01             	add    $0x1,%edx
  80099d:	bf 01 00 00 00       	mov    $0x1,%edi
  8009a2:	eb cb                	jmp    80096f <strtol+0x29>
  8009a4:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  8009a8:	74 0e                	je     8009b8 <strtol+0x72>
  8009aa:	85 db                	test   %ebx,%ebx
  8009ac:	75 d8                	jne    800986 <strtol+0x40>
  8009ae:	83 c2 01             	add    $0x1,%edx
  8009b1:	bb 08 00 00 00       	mov    $0x8,%ebx
  8009b6:	eb ce                	jmp    800986 <strtol+0x40>
  8009b8:	83 c2 02             	add    $0x2,%edx
  8009bb:	bb 10 00 00 00       	mov    $0x10,%ebx
  8009c0:	eb c4                	jmp    800986 <strtol+0x40>
  8009c2:	0f be c0             	movsbl %al,%eax
  8009c5:	83 e8 30             	sub    $0x30,%eax
  8009c8:	3b 45 10             	cmp    0x10(%ebp),%eax
  8009cb:	7d 3a                	jge    800a07 <strtol+0xc1>
  8009cd:	83 c2 01             	add    $0x1,%edx
  8009d0:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  8009d4:	01 c1                	add    %eax,%ecx
  8009d6:	0f b6 02             	movzbl (%edx),%eax
  8009d9:	8d 70 d0             	lea    -0x30(%eax),%esi
  8009dc:	89 f3                	mov    %esi,%ebx
  8009de:	80 fb 09             	cmp    $0x9,%bl
  8009e1:	76 df                	jbe    8009c2 <strtol+0x7c>
  8009e3:	8d 70 9f             	lea    -0x61(%eax),%esi
  8009e6:	89 f3                	mov    %esi,%ebx
  8009e8:	80 fb 19             	cmp    $0x19,%bl
  8009eb:	77 08                	ja     8009f5 <strtol+0xaf>
  8009ed:	0f be c0             	movsbl %al,%eax
  8009f0:	83 e8 57             	sub    $0x57,%eax
  8009f3:	eb d3                	jmp    8009c8 <strtol+0x82>
  8009f5:	8d 70 bf             	lea    -0x41(%eax),%esi
  8009f8:	89 f3                	mov    %esi,%ebx
  8009fa:	80 fb 19             	cmp    $0x19,%bl
  8009fd:	77 08                	ja     800a07 <strtol+0xc1>
  8009ff:	0f be c0             	movsbl %al,%eax
  800a02:	83 e8 37             	sub    $0x37,%eax
  800a05:	eb c1                	jmp    8009c8 <strtol+0x82>
  800a07:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  800a0b:	74 05                	je     800a12 <strtol+0xcc>
  800a0d:	8b 45 0c             	mov    0xc(%ebp),%eax
  800a10:	89 10                	mov    %edx,(%eax)
  800a12:	89 c8                	mov    %ecx,%eax
  800a14:	f7 d8                	neg    %eax
  800a16:	85 ff                	test   %edi,%edi
  800a18:	0f 45 c8             	cmovne %eax,%ecx
  800a1b:	89 c8                	mov    %ecx,%eax
  800a1d:	5b                   	pop    %ebx
  800a1e:	5e                   	pop    %esi
  800a1f:	5f                   	pop    %edi
  800a20:	5d                   	pop    %ebp
  800a21:	c3                   	ret

00800a22 <syscall>:
  800a22:	55                   	push   %ebp
  800a23:	89 e5                	mov    %esp,%ebp
  800a25:	57                   	push   %edi
  800a26:	56                   	push   %esi
  800a27:	53                   	push   %ebx
  800a28:	83 ec 1c             	sub    $0x1c,%esp
  800a2b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800a2e:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  800a31:	89 ca                	mov    %ecx,%edx
  800a33:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a36:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800a39:	8b 7d 10             	mov    0x10(%ebp),%edi
  800a3c:	8b 75 14             	mov    0x14(%ebp),%esi
  800a3f:	cd 30                	int    $0x30
  800a41:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  800a45:	74 04                	je     800a4b <syscall+0x29>
  800a47:	85 c0                	test   %eax,%eax
  800a49:	7f 08                	jg     800a53 <syscall+0x31>
  800a4b:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800a4e:	5b                   	pop    %ebx
  800a4f:	5e                   	pop    %esi
  800a50:	5f                   	pop    %edi
  800a51:	5d                   	pop    %ebp
  800a52:	c3                   	ret
  800a53:	83 ec 0c             	sub    $0xc,%esp
  800a56:	50                   	push   %eax
  800a57:	ff 75 e0             	push   -0x20(%ebp)
  800a5a:	68 6e 16 80 00       	push   $0x80166e
  800a5f:	6a 1e                	push   $0x1e
  800a61:	68 8b 16 80 00       	push   $0x80168b
  800a66:	e8 11 06 00 00       	call   80107c <_panic>

00800a6b <sys_cputs>:
  800a6b:	55                   	push   %ebp
  800a6c:	89 e5                	mov    %esp,%ebp
  800a6e:	83 ec 08             	sub    $0x8,%esp
  800a71:	6a 00                	push   $0x0
  800a73:	6a 00                	push   $0x0
  800a75:	6a 00                	push   $0x0
  800a77:	ff 75 0c             	push   0xc(%ebp)
  800a7a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a7d:	ba 00 00 00 00       	mov    $0x0,%edx
  800a82:	b8 00 00 00 00       	mov    $0x0,%eax
  800a87:	e8 96 ff ff ff       	call   800a22 <syscall>
  800a8c:	83 c4 10             	add    $0x10,%esp
  800a8f:	c9                   	leave
  800a90:	c3                   	ret

00800a91 <sys_cgetc>:
  800a91:	55                   	push   %ebp
  800a92:	89 e5                	mov    %esp,%ebp
  800a94:	83 ec 08             	sub    $0x8,%esp
  800a97:	6a 00                	push   $0x0
  800a99:	6a 00                	push   $0x0
  800a9b:	6a 00                	push   $0x0
  800a9d:	6a 00                	push   $0x0
  800a9f:	b9 00 00 00 00       	mov    $0x0,%ecx
  800aa4:	ba 00 00 00 00       	mov    $0x0,%edx
  800aa9:	b8 01 00 00 00       	mov    $0x1,%eax
  800aae:	e8 6f ff ff ff       	call   800a22 <syscall>
  800ab3:	c9                   	leave
  800ab4:	c3                   	ret

00800ab5 <sys_env_destroy>:
  800ab5:	55                   	push   %ebp
  800ab6:	89 e5                	mov    %esp,%ebp
  800ab8:	83 ec 08             	sub    $0x8,%esp
  800abb:	6a 00                	push   $0x0
  800abd:	6a 00                	push   $0x0
  800abf:	6a 00                	push   $0x0
  800ac1:	6a 00                	push   $0x0
  800ac3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800ac6:	ba 01 00 00 00       	mov    $0x1,%edx
  800acb:	b8 03 00 00 00       	mov    $0x3,%eax
  800ad0:	e8 4d ff ff ff       	call   800a22 <syscall>
  800ad5:	c9                   	leave
  800ad6:	c3                   	ret

00800ad7 <sys_getenvid>:
  800ad7:	55                   	push   %ebp
  800ad8:	89 e5                	mov    %esp,%ebp
  800ada:	83 ec 08             	sub    $0x8,%esp
  800add:	6a 00                	push   $0x0
  800adf:	6a 00                	push   $0x0
  800ae1:	6a 00                	push   $0x0
  800ae3:	6a 00                	push   $0x0
  800ae5:	b9 00 00 00 00       	mov    $0x0,%ecx
  800aea:	ba 00 00 00 00       	mov    $0x0,%edx
  800aef:	b8 02 00 00 00       	mov    $0x2,%eax
  800af4:	e8 29 ff ff ff       	call   800a22 <syscall>
  800af9:	c9                   	leave
  800afa:	c3                   	ret

00800afb <sys_yield>:
  800afb:	55                   	push   %ebp
  800afc:	89 e5                	mov    %esp,%ebp
  800afe:	83 ec 08             	sub    $0x8,%esp
  800b01:	6a 00                	push   $0x0
  800b03:	6a 00                	push   $0x0
  800b05:	6a 00                	push   $0x0
  800b07:	6a 00                	push   $0x0
  800b09:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b0e:	ba 00 00 00 00       	mov    $0x0,%edx
  800b13:	b8 0a 00 00 00       	mov    $0xa,%eax
  800b18:	e8 05 ff ff ff       	call   800a22 <syscall>
  800b1d:	83 c4 10             	add    $0x10,%esp
  800b20:	c9                   	leave
  800b21:	c3                   	ret

00800b22 <sys_page_alloc>:
  800b22:	55                   	push   %ebp
  800b23:	89 e5                	mov    %esp,%ebp
  800b25:	83 ec 08             	sub    $0x8,%esp
  800b28:	6a 00                	push   $0x0
  800b2a:	6a 00                	push   $0x0
  800b2c:	ff 75 10             	push   0x10(%ebp)
  800b2f:	ff 75 0c             	push   0xc(%ebp)
  800b32:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b35:	ba 01 00 00 00       	mov    $0x1,%edx
  800b3a:	b8 04 00 00 00       	mov    $0x4,%eax
  800b3f:	e8 de fe ff ff       	call   800a22 <syscall>
  800b44:	c9                   	leave
  800b45:	c3                   	ret

00800b46 <sys_page_map>:
  800b46:	55                   	push   %ebp
  800b47:	89 e5                	mov    %esp,%ebp
  800b49:	83 ec 08             	sub    $0x8,%esp
  800b4c:	ff 75 18             	push   0x18(%ebp)
  800b4f:	ff 75 14             	push   0x14(%ebp)
  800b52:	ff 75 10             	push   0x10(%ebp)
  800b55:	ff 75 0c             	push   0xc(%ebp)
  800b58:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b5b:	ba 01 00 00 00       	mov    $0x1,%edx
  800b60:	b8 05 00 00 00       	mov    $0x5,%eax
  800b65:	e8 b8 fe ff ff       	call   800a22 <syscall>
  800b6a:	c9                   	leave
  800b6b:	c3                   	ret

00800b6c <sys_page_unmap>:
  800b6c:	55                   	push   %ebp
  800b6d:	89 e5                	mov    %esp,%ebp
  800b6f:	83 ec 08             	sub    $0x8,%esp
  800b72:	6a 00                	push   $0x0
  800b74:	6a 00                	push   $0x0
  800b76:	6a 00                	push   $0x0
  800b78:	ff 75 0c             	push   0xc(%ebp)
  800b7b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b7e:	ba 01 00 00 00       	mov    $0x1,%edx
  800b83:	b8 06 00 00 00       	mov    $0x6,%eax
  800b88:	e8 95 fe ff ff       	call   800a22 <syscall>
  800b8d:	c9                   	leave
  800b8e:	c3                   	ret

00800b8f <sys_env_set_status>:
  800b8f:	55                   	push   %ebp
  800b90:	89 e5                	mov    %esp,%ebp
  800b92:	83 ec 08             	sub    $0x8,%esp
  800b95:	6a 00                	push   $0x0
  800b97:	6a 00                	push   $0x0
  800b99:	6a 00                	push   $0x0
  800b9b:	ff 75 0c             	push   0xc(%ebp)
  800b9e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800ba1:	ba 01 00 00 00       	mov    $0x1,%edx
  800ba6:	b8 08 00 00 00       	mov    $0x8,%eax
  800bab:	e8 72 fe ff ff       	call   800a22 <syscall>
  800bb0:	c9                   	leave
  800bb1:	c3                   	ret

00800bb2 <sys_env_set_pgfault_upcall>:
  800bb2:	55                   	push   %ebp
  800bb3:	89 e5                	mov    %esp,%ebp
  800bb5:	83 ec 08             	sub    $0x8,%esp
  800bb8:	6a 00                	push   $0x0
  800bba:	6a 00                	push   $0x0
  800bbc:	6a 00                	push   $0x0
  800bbe:	ff 75 0c             	push   0xc(%ebp)
  800bc1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bc4:	ba 01 00 00 00       	mov    $0x1,%edx
  800bc9:	b8 09 00 00 00       	mov    $0x9,%eax
  800bce:	e8 4f fe ff ff       	call   800a22 <syscall>
  800bd3:	c9                   	leave
  800bd4:	c3                   	ret

00800bd5 <sys_ipc_try_send>:
  800bd5:	55                   	push   %ebp
  800bd6:	89 e5                	mov    %esp,%ebp
  800bd8:	83 ec 08             	sub    $0x8,%esp
  800bdb:	6a 00                	push   $0x0
  800bdd:	ff 75 14             	push   0x14(%ebp)
  800be0:	ff 75 10             	push   0x10(%ebp)
  800be3:	ff 75 0c             	push   0xc(%ebp)
  800be6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800be9:	ba 00 00 00 00       	mov    $0x0,%edx
  800bee:	b8 0c 00 00 00       	mov    $0xc,%eax
  800bf3:	e8 2a fe ff ff       	call   800a22 <syscall>
  800bf8:	c9                   	leave
  800bf9:	c3                   	ret

00800bfa <sys_ipc_recv>:
  800bfa:	55                   	push   %ebp
  800bfb:	89 e5                	mov    %esp,%ebp
  800bfd:	83 ec 08             	sub    $0x8,%esp
  800c00:	6a 00                	push   $0x0
  800c02:	6a 00                	push   $0x0
  800c04:	6a 00                	push   $0x0
  800c06:	6a 00                	push   $0x0
  800c08:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c0b:	ba 01 00 00 00       	mov    $0x1,%edx
  800c10:	b8 0d 00 00 00       	mov    $0xd,%eax
  800c15:	e8 08 fe ff ff       	call   800a22 <syscall>
  800c1a:	c9                   	leave
  800c1b:	c3                   	ret

00800c1c <duppage>:
  800c1c:	55                   	push   %ebp
  800c1d:	89 e5                	mov    %esp,%ebp
  800c1f:	56                   	push   %esi
  800c20:	53                   	push   %ebx
  800c21:	89 c1                	mov    %eax,%ecx
  800c23:	89 d6                	mov    %edx,%esi
  800c25:	c1 e6 0c             	shl    $0xc,%esi
  800c28:	8b 14 95 00 00 40 ef 	mov    -0x10c00000(,%edx,4),%edx
  800c2f:	89 d0                	mov    %edx,%eax
  800c31:	f7 d0                	not    %eax
  800c33:	a8 05                	test   $0x5,%al
  800c35:	75 5a                	jne    800c91 <duppage+0x75>
  800c37:	89 d0                	mov    %edx,%eax
  800c39:	83 e0 18             	and    $0x18,%eax
  800c3c:	83 f8 01             	cmp    $0x1,%eax
  800c3f:	19 c0                	sbb    %eax,%eax
  800c41:	83 e0 e8             	and    $0xffffffe8,%eax
  800c44:	83 c0 1d             	add    $0x1d,%eax
  800c47:	f7 c2 02 08 00 00    	test   $0x802,%edx
  800c4d:	74 68                	je     800cb7 <duppage+0x9b>
  800c4f:	80 cc 08             	or     $0x8,%ah
  800c52:	89 c3                	mov    %eax,%ebx
  800c54:	83 ec 0c             	sub    $0xc,%esp
  800c57:	53                   	push   %ebx
  800c58:	56                   	push   %esi
  800c59:	51                   	push   %ecx
  800c5a:	56                   	push   %esi
  800c5b:	6a 00                	push   $0x0
  800c5d:	e8 e4 fe ff ff       	call   800b46 <sys_page_map>
  800c62:	83 c4 20             	add    $0x20,%esp
  800c65:	85 c0                	test   %eax,%eax
  800c67:	78 3c                	js     800ca5 <duppage+0x89>
  800c69:	83 ec 0c             	sub    $0xc,%esp
  800c6c:	53                   	push   %ebx
  800c6d:	56                   	push   %esi
  800c6e:	6a 00                	push   $0x0
  800c70:	56                   	push   %esi
  800c71:	6a 00                	push   $0x0
  800c73:	e8 ce fe ff ff       	call   800b46 <sys_page_map>
  800c78:	83 c4 20             	add    $0x20,%esp
  800c7b:	85 c0                	test   %eax,%eax
  800c7d:	79 4d                	jns    800ccc <duppage+0xb0>
  800c7f:	50                   	push   %eax
  800c80:	68 74 14 80 00       	push   $0x801474
  800c85:	6a 57                	push   $0x57
  800c87:	68 99 16 80 00       	push   $0x801699
  800c8c:	e8 eb 03 00 00       	call   80107c <_panic>
  800c91:	83 ec 04             	sub    $0x4,%esp
  800c94:	68 18 14 80 00       	push   $0x801418
  800c99:	6a 47                	push   $0x47
  800c9b:	68 99 16 80 00       	push   $0x801699
  800ca0:	e8 d7 03 00 00       	call   80107c <_panic>
  800ca5:	50                   	push   %eax
  800ca6:	68 48 14 80 00       	push   $0x801448
  800cab:	6a 53                	push   $0x53
  800cad:	68 99 16 80 00       	push   $0x801699
  800cb2:	e8 c5 03 00 00       	call   80107c <_panic>
  800cb7:	83 ec 0c             	sub    $0xc,%esp
  800cba:	50                   	push   %eax
  800cbb:	56                   	push   %esi
  800cbc:	51                   	push   %ecx
  800cbd:	56                   	push   %esi
  800cbe:	6a 00                	push   $0x0
  800cc0:	e8 81 fe ff ff       	call   800b46 <sys_page_map>
  800cc5:	83 c4 20             	add    $0x20,%esp
  800cc8:	85 c0                	test   %eax,%eax
  800cca:	78 0c                	js     800cd8 <duppage+0xbc>
  800ccc:	b8 00 00 00 00       	mov    $0x0,%eax
  800cd1:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800cd4:	5b                   	pop    %ebx
  800cd5:	5e                   	pop    %esi
  800cd6:	5d                   	pop    %ebp
  800cd7:	c3                   	ret
  800cd8:	50                   	push   %eax
  800cd9:	68 9c 14 80 00       	push   $0x80149c
  800cde:	6a 5b                	push   $0x5b
  800ce0:	68 99 16 80 00       	push   $0x801699
  800ce5:	e8 92 03 00 00       	call   80107c <_panic>

00800cea <dup_or_share>:
  800cea:	55                   	push   %ebp
  800ceb:	89 e5                	mov    %esp,%ebp
  800ced:	57                   	push   %edi
  800cee:	56                   	push   %esi
  800cef:	53                   	push   %ebx
  800cf0:	83 ec 0c             	sub    $0xc,%esp
  800cf3:	89 c7                	mov    %eax,%edi
  800cf5:	8b 04 95 00 00 40 ef 	mov    -0x10c00000(,%edx,4),%eax
  800cfc:	a8 01                	test   $0x1,%al
  800cfe:	74 33                	je     800d33 <dup_or_share+0x49>
  800d00:	89 d6                	mov    %edx,%esi
  800d02:	21 c1                	and    %eax,%ecx
  800d04:	89 cb                	mov    %ecx,%ebx
  800d06:	83 e3 02             	and    $0x2,%ebx
  800d09:	89 da                	mov    %ebx,%edx
  800d0b:	83 ca 18             	or     $0x18,%edx
  800d0e:	a8 18                	test   $0x18,%al
  800d10:	0f 45 da             	cmovne %edx,%ebx
  800d13:	c1 e6 0c             	shl    $0xc,%esi
  800d16:	83 e0 1a             	and    $0x1a,%eax
  800d19:	83 f8 02             	cmp    $0x2,%eax
  800d1c:	74 32                	je     800d50 <dup_or_share+0x66>
  800d1e:	83 ec 0c             	sub    $0xc,%esp
  800d21:	53                   	push   %ebx
  800d22:	56                   	push   %esi
  800d23:	57                   	push   %edi
  800d24:	56                   	push   %esi
  800d25:	6a 00                	push   $0x0
  800d27:	e8 1a fe ff ff       	call   800b46 <sys_page_map>
  800d2c:	83 c4 20             	add    $0x20,%esp
  800d2f:	85 c0                	test   %eax,%eax
  800d31:	78 08                	js     800d3b <dup_or_share+0x51>
  800d33:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800d36:	5b                   	pop    %ebx
  800d37:	5e                   	pop    %esi
  800d38:	5f                   	pop    %edi
  800d39:	5d                   	pop    %ebp
  800d3a:	c3                   	ret
  800d3b:	50                   	push   %eax
  800d3c:	68 c8 14 80 00       	push   $0x8014c8
  800d41:	68 84 00 00 00       	push   $0x84
  800d46:	68 99 16 80 00       	push   $0x801699
  800d4b:	e8 2c 03 00 00       	call   80107c <_panic>
  800d50:	83 ec 04             	sub    $0x4,%esp
  800d53:	53                   	push   %ebx
  800d54:	56                   	push   %esi
  800d55:	57                   	push   %edi
  800d56:	e8 c7 fd ff ff       	call   800b22 <sys_page_alloc>
  800d5b:	83 c4 10             	add    $0x10,%esp
  800d5e:	85 c0                	test   %eax,%eax
  800d60:	78 57                	js     800db9 <dup_or_share+0xcf>
  800d62:	83 ec 0c             	sub    $0xc,%esp
  800d65:	53                   	push   %ebx
  800d66:	68 00 00 40 00       	push   $0x400000
  800d6b:	6a 00                	push   $0x0
  800d6d:	56                   	push   %esi
  800d6e:	57                   	push   %edi
  800d6f:	e8 d2 fd ff ff       	call   800b46 <sys_page_map>
  800d74:	83 c4 20             	add    $0x20,%esp
  800d77:	85 c0                	test   %eax,%eax
  800d79:	78 53                	js     800dce <dup_or_share+0xe4>
  800d7b:	83 ec 04             	sub    $0x4,%esp
  800d7e:	68 00 10 00 00       	push   $0x1000
  800d83:	56                   	push   %esi
  800d84:	68 00 00 40 00       	push   $0x400000
  800d89:	e8 ea fa ff ff       	call   800878 <memmove>
  800d8e:	83 c4 08             	add    $0x8,%esp
  800d91:	68 00 00 40 00       	push   $0x400000
  800d96:	6a 00                	push   $0x0
  800d98:	e8 cf fd ff ff       	call   800b6c <sys_page_unmap>
  800d9d:	83 c4 10             	add    $0x10,%esp
  800da0:	85 c0                	test   %eax,%eax
  800da2:	79 8f                	jns    800d33 <dup_or_share+0x49>
  800da4:	50                   	push   %eax
  800da5:	68 e3 16 80 00       	push   $0x8016e3
  800daa:	68 8d 00 00 00       	push   $0x8d
  800daf:	68 99 16 80 00       	push   $0x801699
  800db4:	e8 c3 02 00 00       	call   80107c <_panic>
  800db9:	50                   	push   %eax
  800dba:	68 e8 14 80 00       	push   $0x8014e8
  800dbf:	68 88 00 00 00       	push   $0x88
  800dc4:	68 99 16 80 00       	push   $0x801699
  800dc9:	e8 ae 02 00 00       	call   80107c <_panic>
  800dce:	50                   	push   %eax
  800dcf:	68 c8 14 80 00       	push   $0x8014c8
  800dd4:	68 8a 00 00 00       	push   $0x8a
  800dd9:	68 99 16 80 00       	push   $0x801699
  800dde:	e8 99 02 00 00       	call   80107c <_panic>

00800de3 <pgfault>:
  800de3:	55                   	push   %ebp
  800de4:	89 e5                	mov    %esp,%ebp
  800de6:	53                   	push   %ebx
  800de7:	83 ec 08             	sub    $0x8,%esp
  800dea:	8b 45 08             	mov    0x8(%ebp),%eax
  800ded:	8b 18                	mov    (%eax),%ebx
  800def:	89 d8                	mov    %ebx,%eax
  800df1:	c1 e8 0c             	shr    $0xc,%eax
  800df4:	8b 04 85 00 00 40 ef 	mov    -0x10c00000(,%eax,4),%eax
  800dfb:	6a 07                	push   $0x7
  800dfd:	68 00 f0 7f 00       	push   $0x7ff000
  800e02:	6a 00                	push   $0x0
  800e04:	e8 19 fd ff ff       	call   800b22 <sys_page_alloc>
  800e09:	83 c4 10             	add    $0x10,%esp
  800e0c:	85 c0                	test   %eax,%eax
  800e0e:	78 51                	js     800e61 <pgfault+0x7e>
  800e10:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  800e16:	83 ec 04             	sub    $0x4,%esp
  800e19:	68 00 10 00 00       	push   $0x1000
  800e1e:	53                   	push   %ebx
  800e1f:	68 00 f0 7f 00       	push   $0x7ff000
  800e24:	e8 4f fa ff ff       	call   800878 <memmove>
  800e29:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
  800e30:	53                   	push   %ebx
  800e31:	6a 00                	push   $0x0
  800e33:	68 00 f0 7f 00       	push   $0x7ff000
  800e38:	6a 00                	push   $0x0
  800e3a:	e8 07 fd ff ff       	call   800b46 <sys_page_map>
  800e3f:	83 c4 20             	add    $0x20,%esp
  800e42:	85 c0                	test   %eax,%eax
  800e44:	78 2d                	js     800e73 <pgfault+0x90>
  800e46:	83 ec 08             	sub    $0x8,%esp
  800e49:	68 00 f0 7f 00       	push   $0x7ff000
  800e4e:	6a 00                	push   $0x0
  800e50:	e8 17 fd ff ff       	call   800b6c <sys_page_unmap>
  800e55:	83 c4 10             	add    $0x10,%esp
  800e58:	85 c0                	test   %eax,%eax
  800e5a:	78 29                	js     800e85 <pgfault+0xa2>
  800e5c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800e5f:	c9                   	leave
  800e60:	c3                   	ret
  800e61:	50                   	push   %eax
  800e62:	68 a4 16 80 00       	push   $0x8016a4
  800e67:	6a 27                	push   $0x27
  800e69:	68 99 16 80 00       	push   $0x801699
  800e6e:	e8 09 02 00 00       	call   80107c <_panic>
  800e73:	50                   	push   %eax
  800e74:	68 c0 16 80 00       	push   $0x8016c0
  800e79:	6a 2c                	push   $0x2c
  800e7b:	68 99 16 80 00       	push   $0x801699
  800e80:	e8 f7 01 00 00       	call   80107c <_panic>
  800e85:	50                   	push   %eax
  800e86:	68 da 16 80 00       	push   $0x8016da
  800e8b:	6a 2f                	push   $0x2f
  800e8d:	68 99 16 80 00       	push   $0x801699
  800e92:	e8 e5 01 00 00       	call   80107c <_panic>

00800e97 <fork_v0>:
  800e97:	55                   	push   %ebp
  800e98:	89 e5                	mov    %esp,%ebp
  800e9a:	56                   	push   %esi
  800e9b:	53                   	push   %ebx
  800e9c:	b8 07 00 00 00       	mov    $0x7,%eax
  800ea1:	cd 30                	int    $0x30
  800ea3:	89 c6                	mov    %eax,%esi
  800ea5:	85 c0                	test   %eax,%eax
  800ea7:	78 23                	js     800ecc <fork_v0+0x35>
  800ea9:	bb 00 00 00 00       	mov    $0x0,%ebx
  800eae:	75 3c                	jne    800eec <fork_v0+0x55>
  800eb0:	e8 22 fc ff ff       	call   800ad7 <sys_getenvid>
  800eb5:	25 ff 03 00 00       	and    $0x3ff,%eax
  800eba:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800ec0:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800ec5:	a3 04 20 80 00       	mov    %eax,0x802004
  800eca:	eb 54                	jmp    800f20 <fork_v0+0x89>
  800ecc:	50                   	push   %eax
  800ecd:	68 f6 16 80 00       	push   $0x8016f6
  800ed2:	68 a2 00 00 00       	push   $0xa2
  800ed7:	68 99 16 80 00       	push   $0x801699
  800edc:	e8 9b 01 00 00       	call   80107c <_panic>
  800ee1:	83 c3 01             	add    $0x1,%ebx
  800ee4:	81 fb 00 ec 0e 00    	cmp    $0xeec00,%ebx
  800eea:	74 22                	je     800f0e <fork_v0+0x77>
  800eec:	89 d8                	mov    %ebx,%eax
  800eee:	c1 e8 0a             	shr    $0xa,%eax
  800ef1:	8b 04 85 00 d0 7b ef 	mov    -0x10843000(,%eax,4),%eax
  800ef8:	f7 d0                	not    %eax
  800efa:	a8 05                	test   $0x5,%al
  800efc:	75 e3                	jne    800ee1 <fork_v0+0x4a>
  800efe:	b9 07 00 00 00       	mov    $0x7,%ecx
  800f03:	89 da                	mov    %ebx,%edx
  800f05:	89 f0                	mov    %esi,%eax
  800f07:	e8 de fd ff ff       	call   800cea <dup_or_share>
  800f0c:	eb d3                	jmp    800ee1 <fork_v0+0x4a>
  800f0e:	83 ec 08             	sub    $0x8,%esp
  800f11:	6a 02                	push   $0x2
  800f13:	56                   	push   %esi
  800f14:	e8 76 fc ff ff       	call   800b8f <sys_env_set_status>
  800f19:	83 c4 10             	add    $0x10,%esp
  800f1c:	85 c0                	test   %eax,%eax
  800f1e:	78 09                	js     800f29 <fork_v0+0x92>
  800f20:	89 f0                	mov    %esi,%eax
  800f22:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800f25:	5b                   	pop    %ebx
  800f26:	5e                   	pop    %esi
  800f27:	5d                   	pop    %ebp
  800f28:	c3                   	ret
  800f29:	50                   	push   %eax
  800f2a:	68 06 17 80 00       	push   $0x801706
  800f2f:	68 b8 00 00 00       	push   $0xb8
  800f34:	68 99 16 80 00       	push   $0x801699
  800f39:	e8 3e 01 00 00       	call   80107c <_panic>

00800f3e <fork>:
  800f3e:	55                   	push   %ebp
  800f3f:	89 e5                	mov    %esp,%ebp
  800f41:	56                   	push   %esi
  800f42:	53                   	push   %ebx
  800f43:	83 ec 0c             	sub    $0xc,%esp
  800f46:	68 e3 0d 80 00       	push   $0x800de3
  800f4b:	e8 72 01 00 00       	call   8010c2 <set_pgfault_handler>
  800f50:	b8 07 00 00 00       	mov    $0x7,%eax
  800f55:	cd 30                	int    $0x30
  800f57:	89 c6                	mov    %eax,%esi
  800f59:	83 c4 10             	add    $0x10,%esp
  800f5c:	85 c0                	test   %eax,%eax
  800f5e:	78 26                	js     800f86 <fork+0x48>
  800f60:	bb 00 00 00 00       	mov    $0x0,%ebx
  800f65:	75 47                	jne    800fae <fork+0x70>
  800f67:	e8 6b fb ff ff       	call   800ad7 <sys_getenvid>
  800f6c:	25 ff 03 00 00       	and    $0x3ff,%eax
  800f71:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800f77:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800f7c:	a3 04 20 80 00       	mov    %eax,0x802004
  800f81:	e9 94 00 00 00       	jmp    80101a <fork+0xdc>
  800f86:	50                   	push   %eax
  800f87:	68 f6 16 80 00       	push   $0x8016f6
  800f8c:	68 d5 00 00 00       	push   $0xd5
  800f91:	68 99 16 80 00       	push   $0x801699
  800f96:	e8 e1 00 00 00       	call   80107c <_panic>
  800f9b:	83 c3 01             	add    $0x1,%ebx
  800f9e:	81 fb 00 ec 0e 00    	cmp    $0xeec00,%ebx
  800fa4:	74 32                	je     800fd8 <fork+0x9a>
  800fa6:	81 fb ff eb 0e 00    	cmp    $0xeebff,%ebx
  800fac:	74 ed                	je     800f9b <fork+0x5d>
  800fae:	89 d8                	mov    %ebx,%eax
  800fb0:	c1 e8 0a             	shr    $0xa,%eax
  800fb3:	8b 04 85 00 d0 7b ef 	mov    -0x10843000(,%eax,4),%eax
  800fba:	f7 d0                	not    %eax
  800fbc:	a8 05                	test   $0x5,%al
  800fbe:	75 db                	jne    800f9b <fork+0x5d>
  800fc0:	8b 04 9d 00 00 40 ef 	mov    -0x10c00000(,%ebx,4),%eax
  800fc7:	f7 d0                	not    %eax
  800fc9:	a8 05                	test   $0x5,%al
  800fcb:	75 ce                	jne    800f9b <fork+0x5d>
  800fcd:	89 da                	mov    %ebx,%edx
  800fcf:	89 f0                	mov    %esi,%eax
  800fd1:	e8 46 fc ff ff       	call   800c1c <duppage>
  800fd6:	eb c3                	jmp    800f9b <fork+0x5d>
  800fd8:	83 ec 04             	sub    $0x4,%esp
  800fdb:	6a 07                	push   $0x7
  800fdd:	68 00 f0 bf ee       	push   $0xeebff000
  800fe2:	56                   	push   %esi
  800fe3:	e8 3a fb ff ff       	call   800b22 <sys_page_alloc>
  800fe8:	83 c4 10             	add    $0x10,%esp
  800feb:	85 c0                	test   %eax,%eax
  800fed:	78 34                	js     801023 <fork+0xe5>
  800fef:	a1 04 20 80 00       	mov    0x802004,%eax
  800ff4:	8b 40 64             	mov    0x64(%eax),%eax
  800ff7:	83 ec 08             	sub    $0x8,%esp
  800ffa:	50                   	push   %eax
  800ffb:	56                   	push   %esi
  800ffc:	e8 b1 fb ff ff       	call   800bb2 <sys_env_set_pgfault_upcall>
  801001:	83 c4 10             	add    $0x10,%esp
  801004:	85 c0                	test   %eax,%eax
  801006:	78 30                	js     801038 <fork+0xfa>
  801008:	83 ec 08             	sub    $0x8,%esp
  80100b:	6a 02                	push   $0x2
  80100d:	56                   	push   %esi
  80100e:	e8 7c fb ff ff       	call   800b8f <sys_env_set_status>
  801013:	83 c4 10             	add    $0x10,%esp
  801016:	85 c0                	test   %eax,%eax
  801018:	78 33                	js     80104d <fork+0x10f>
  80101a:	89 f0                	mov    %esi,%eax
  80101c:	8d 65 f8             	lea    -0x8(%ebp),%esp
  80101f:	5b                   	pop    %ebx
  801020:	5e                   	pop    %esi
  801021:	5d                   	pop    %ebp
  801022:	c3                   	ret
  801023:	50                   	push   %eax
  801024:	68 0c 15 80 00       	push   $0x80150c
  801029:	68 f2 00 00 00       	push   $0xf2
  80102e:	68 99 16 80 00       	push   $0x801699
  801033:	e8 44 00 00 00       	call   80107c <_panic>
  801038:	50                   	push   %eax
  801039:	68 38 15 80 00       	push   $0x801538
  80103e:	68 f5 00 00 00       	push   $0xf5
  801043:	68 99 16 80 00       	push   $0x801699
  801048:	e8 2f 00 00 00       	call   80107c <_panic>
  80104d:	50                   	push   %eax
  80104e:	68 06 17 80 00       	push   $0x801706
  801053:	68 f8 00 00 00       	push   $0xf8
  801058:	68 99 16 80 00       	push   $0x801699
  80105d:	e8 1a 00 00 00       	call   80107c <_panic>

00801062 <sfork>:
  801062:	55                   	push   %ebp
  801063:	89 e5                	mov    %esp,%ebp
  801065:	83 ec 0c             	sub    $0xc,%esp
  801068:	68 1d 17 80 00       	push   $0x80171d
  80106d:	68 01 01 00 00       	push   $0x101
  801072:	68 99 16 80 00       	push   $0x801699
  801077:	e8 00 00 00 00       	call   80107c <_panic>

0080107c <_panic>:
  80107c:	55                   	push   %ebp
  80107d:	89 e5                	mov    %esp,%ebp
  80107f:	56                   	push   %esi
  801080:	53                   	push   %ebx
  801081:	8d 5d 14             	lea    0x14(%ebp),%ebx
  801084:	8b 35 00 20 80 00    	mov    0x802000,%esi
  80108a:	e8 48 fa ff ff       	call   800ad7 <sys_getenvid>
  80108f:	83 ec 0c             	sub    $0xc,%esp
  801092:	ff 75 0c             	push   0xc(%ebp)
  801095:	ff 75 08             	push   0x8(%ebp)
  801098:	56                   	push   %esi
  801099:	50                   	push   %eax
  80109a:	68 6c 15 80 00       	push   $0x80156c
  80109f:	e8 05 f1 ff ff       	call   8001a9 <cprintf>
  8010a4:	83 c4 18             	add    $0x18,%esp
  8010a7:	53                   	push   %ebx
  8010a8:	ff 75 10             	push   0x10(%ebp)
  8010ab:	e8 a8 f0 ff ff       	call   800158 <vcprintf>
  8010b0:	c7 04 24 ab 15 80 00 	movl   $0x8015ab,(%esp)
  8010b7:	e8 ed f0 ff ff       	call   8001a9 <cprintf>
  8010bc:	83 c4 10             	add    $0x10,%esp
  8010bf:	cc                   	int3
  8010c0:	eb fd                	jmp    8010bf <_panic+0x43>

008010c2 <set_pgfault_handler>:
  8010c2:	55                   	push   %ebp
  8010c3:	89 e5                	mov    %esp,%ebp
  8010c5:	83 ec 08             	sub    $0x8,%esp
  8010c8:	83 3d 08 20 80 00 00 	cmpl   $0x0,0x802008
  8010cf:	74 0a                	je     8010db <set_pgfault_handler+0x19>
  8010d1:	8b 45 08             	mov    0x8(%ebp),%eax
  8010d4:	a3 08 20 80 00       	mov    %eax,0x802008
  8010d9:	c9                   	leave
  8010da:	c3                   	ret
  8010db:	83 ec 04             	sub    $0x4,%esp
  8010de:	6a 07                	push   $0x7
  8010e0:	68 00 f0 bf ee       	push   $0xeebff000
  8010e5:	6a 00                	push   $0x0
  8010e7:	e8 36 fa ff ff       	call   800b22 <sys_page_alloc>
  8010ec:	83 c4 10             	add    $0x10,%esp
  8010ef:	85 c0                	test   %eax,%eax
  8010f1:	78 e6                	js     8010d9 <set_pgfault_handler+0x17>
  8010f3:	83 ec 08             	sub    $0x8,%esp
  8010f6:	68 0b 11 80 00       	push   $0x80110b
  8010fb:	6a 00                	push   $0x0
  8010fd:	e8 b0 fa ff ff       	call   800bb2 <sys_env_set_pgfault_upcall>
  801102:	83 c4 10             	add    $0x10,%esp
  801105:	85 c0                	test   %eax,%eax
  801107:	79 c8                	jns    8010d1 <set_pgfault_handler+0xf>
  801109:	eb ce                	jmp    8010d9 <set_pgfault_handler+0x17>

0080110b <_pgfault_upcall>:
  80110b:	54                   	push   %esp
  80110c:	a1 08 20 80 00       	mov    0x802008,%eax
  801111:	ff d0                	call   *%eax
  801113:	83 c4 04             	add    $0x4,%esp
  801116:	8b 44 24 28          	mov    0x28(%esp),%eax
  80111a:	8b 5c 24 30          	mov    0x30(%esp),%ebx
  80111e:	83 eb 04             	sub    $0x4,%ebx
  801121:	89 03                	mov    %eax,(%ebx)
  801123:	89 5c 24 30          	mov    %ebx,0x30(%esp)
  801127:	58                   	pop    %eax
  801128:	58                   	pop    %eax
  801129:	61                   	popa
  80112a:	83 c4 04             	add    $0x4,%esp
  80112d:	9d                   	popf
  80112e:	5c                   	pop    %esp
  80112f:	c3                   	ret

00801130 <__udivdi3>:
  801130:	f3 0f 1e fb          	endbr32
  801134:	55                   	push   %ebp
  801135:	57                   	push   %edi
  801136:	56                   	push   %esi
  801137:	53                   	push   %ebx
  801138:	83 ec 1c             	sub    $0x1c,%esp
  80113b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  80113f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  801143:	8b 74 24 34          	mov    0x34(%esp),%esi
  801147:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  80114b:	85 c0                	test   %eax,%eax
  80114d:	75 19                	jne    801168 <__udivdi3+0x38>
  80114f:	39 de                	cmp    %ebx,%esi
  801151:	73 4d                	jae    8011a0 <__udivdi3+0x70>
  801153:	31 ff                	xor    %edi,%edi
  801155:	89 e8                	mov    %ebp,%eax
  801157:	89 f2                	mov    %esi,%edx
  801159:	f7 f3                	div    %ebx
  80115b:	89 fa                	mov    %edi,%edx
  80115d:	83 c4 1c             	add    $0x1c,%esp
  801160:	5b                   	pop    %ebx
  801161:	5e                   	pop    %esi
  801162:	5f                   	pop    %edi
  801163:	5d                   	pop    %ebp
  801164:	c3                   	ret
  801165:	8d 76 00             	lea    0x0(%esi),%esi
  801168:	39 c6                	cmp    %eax,%esi
  80116a:	73 14                	jae    801180 <__udivdi3+0x50>
  80116c:	31 ff                	xor    %edi,%edi
  80116e:	31 c0                	xor    %eax,%eax
  801170:	89 fa                	mov    %edi,%edx
  801172:	83 c4 1c             	add    $0x1c,%esp
  801175:	5b                   	pop    %ebx
  801176:	5e                   	pop    %esi
  801177:	5f                   	pop    %edi
  801178:	5d                   	pop    %ebp
  801179:	c3                   	ret
  80117a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  801180:	0f bd f8             	bsr    %eax,%edi
  801183:	83 f7 1f             	xor    $0x1f,%edi
  801186:	75 48                	jne    8011d0 <__udivdi3+0xa0>
  801188:	39 f0                	cmp    %esi,%eax
  80118a:	72 06                	jb     801192 <__udivdi3+0x62>
  80118c:	31 c0                	xor    %eax,%eax
  80118e:	39 dd                	cmp    %ebx,%ebp
  801190:	72 de                	jb     801170 <__udivdi3+0x40>
  801192:	b8 01 00 00 00       	mov    $0x1,%eax
  801197:	eb d7                	jmp    801170 <__udivdi3+0x40>
  801199:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8011a0:	89 d9                	mov    %ebx,%ecx
  8011a2:	85 db                	test   %ebx,%ebx
  8011a4:	75 0b                	jne    8011b1 <__udivdi3+0x81>
  8011a6:	b8 01 00 00 00       	mov    $0x1,%eax
  8011ab:	31 d2                	xor    %edx,%edx
  8011ad:	f7 f3                	div    %ebx
  8011af:	89 c1                	mov    %eax,%ecx
  8011b1:	31 d2                	xor    %edx,%edx
  8011b3:	89 f0                	mov    %esi,%eax
  8011b5:	f7 f1                	div    %ecx
  8011b7:	89 c6                	mov    %eax,%esi
  8011b9:	89 e8                	mov    %ebp,%eax
  8011bb:	89 f7                	mov    %esi,%edi
  8011bd:	f7 f1                	div    %ecx
  8011bf:	89 fa                	mov    %edi,%edx
  8011c1:	83 c4 1c             	add    $0x1c,%esp
  8011c4:	5b                   	pop    %ebx
  8011c5:	5e                   	pop    %esi
  8011c6:	5f                   	pop    %edi
  8011c7:	5d                   	pop    %ebp
  8011c8:	c3                   	ret
  8011c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8011d0:	89 f9                	mov    %edi,%ecx
  8011d2:	ba 20 00 00 00       	mov    $0x20,%edx
  8011d7:	29 fa                	sub    %edi,%edx
  8011d9:	d3 e0                	shl    %cl,%eax
  8011db:	89 44 24 08          	mov    %eax,0x8(%esp)
  8011df:	89 d1                	mov    %edx,%ecx
  8011e1:	89 d8                	mov    %ebx,%eax
  8011e3:	d3 e8                	shr    %cl,%eax
  8011e5:	89 c1                	mov    %eax,%ecx
  8011e7:	8b 44 24 08          	mov    0x8(%esp),%eax
  8011eb:	09 c1                	or     %eax,%ecx
  8011ed:	89 f0                	mov    %esi,%eax
  8011ef:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  8011f3:	89 f9                	mov    %edi,%ecx
  8011f5:	d3 e3                	shl    %cl,%ebx
  8011f7:	89 d1                	mov    %edx,%ecx
  8011f9:	d3 e8                	shr    %cl,%eax
  8011fb:	89 f9                	mov    %edi,%ecx
  8011fd:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  801201:	89 eb                	mov    %ebp,%ebx
  801203:	d3 e6                	shl    %cl,%esi
  801205:	89 d1                	mov    %edx,%ecx
  801207:	d3 eb                	shr    %cl,%ebx
  801209:	09 f3                	or     %esi,%ebx
  80120b:	89 c6                	mov    %eax,%esi
  80120d:	89 f2                	mov    %esi,%edx
  80120f:	89 d8                	mov    %ebx,%eax
  801211:	f7 74 24 08          	divl   0x8(%esp)
  801215:	89 d6                	mov    %edx,%esi
  801217:	89 c3                	mov    %eax,%ebx
  801219:	f7 64 24 0c          	mull   0xc(%esp)
  80121d:	39 d6                	cmp    %edx,%esi
  80121f:	72 1f                	jb     801240 <__udivdi3+0x110>
  801221:	89 f9                	mov    %edi,%ecx
  801223:	d3 e5                	shl    %cl,%ebp
  801225:	39 c5                	cmp    %eax,%ebp
  801227:	73 04                	jae    80122d <__udivdi3+0xfd>
  801229:	39 d6                	cmp    %edx,%esi
  80122b:	74 13                	je     801240 <__udivdi3+0x110>
  80122d:	89 d8                	mov    %ebx,%eax
  80122f:	31 ff                	xor    %edi,%edi
  801231:	e9 3a ff ff ff       	jmp    801170 <__udivdi3+0x40>
  801236:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  80123d:	00 
  80123e:	66 90                	xchg   %ax,%ax
  801240:	8d 43 ff             	lea    -0x1(%ebx),%eax
  801243:	31 ff                	xor    %edi,%edi
  801245:	e9 26 ff ff ff       	jmp    801170 <__udivdi3+0x40>
  80124a:	66 90                	xchg   %ax,%ax
  80124c:	66 90                	xchg   %ax,%ax
  80124e:	66 90                	xchg   %ax,%ax

00801250 <__umoddi3>:
  801250:	f3 0f 1e fb          	endbr32
  801254:	55                   	push   %ebp
  801255:	57                   	push   %edi
  801256:	56                   	push   %esi
  801257:	53                   	push   %ebx
  801258:	83 ec 1c             	sub    $0x1c,%esp
  80125b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  80125f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  801263:	8b 74 24 30          	mov    0x30(%esp),%esi
  801267:	8b 7c 24 38          	mov    0x38(%esp),%edi
  80126b:	89 da                	mov    %ebx,%edx
  80126d:	85 c0                	test   %eax,%eax
  80126f:	75 17                	jne    801288 <__umoddi3+0x38>
  801271:	39 fb                	cmp    %edi,%ebx
  801273:	73 53                	jae    8012c8 <__umoddi3+0x78>
  801275:	89 f0                	mov    %esi,%eax
  801277:	f7 f7                	div    %edi
  801279:	89 d0                	mov    %edx,%eax
  80127b:	31 d2                	xor    %edx,%edx
  80127d:	83 c4 1c             	add    $0x1c,%esp
  801280:	5b                   	pop    %ebx
  801281:	5e                   	pop    %esi
  801282:	5f                   	pop    %edi
  801283:	5d                   	pop    %ebp
  801284:	c3                   	ret
  801285:	8d 76 00             	lea    0x0(%esi),%esi
  801288:	89 f1                	mov    %esi,%ecx
  80128a:	39 c3                	cmp    %eax,%ebx
  80128c:	73 12                	jae    8012a0 <__umoddi3+0x50>
  80128e:	89 f0                	mov    %esi,%eax
  801290:	83 c4 1c             	add    $0x1c,%esp
  801293:	5b                   	pop    %ebx
  801294:	5e                   	pop    %esi
  801295:	5f                   	pop    %edi
  801296:	5d                   	pop    %ebp
  801297:	c3                   	ret
  801298:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  80129f:	00 
  8012a0:	0f bd e8             	bsr    %eax,%ebp
  8012a3:	83 f5 1f             	xor    $0x1f,%ebp
  8012a6:	75 48                	jne    8012f0 <__umoddi3+0xa0>
  8012a8:	39 d8                	cmp    %ebx,%eax
  8012aa:	0f 82 d0 00 00 00    	jb     801380 <__umoddi3+0x130>
  8012b0:	39 fe                	cmp    %edi,%esi
  8012b2:	0f 83 c8 00 00 00    	jae    801380 <__umoddi3+0x130>
  8012b8:	89 c8                	mov    %ecx,%eax
  8012ba:	83 c4 1c             	add    $0x1c,%esp
  8012bd:	5b                   	pop    %ebx
  8012be:	5e                   	pop    %esi
  8012bf:	5f                   	pop    %edi
  8012c0:	5d                   	pop    %ebp
  8012c1:	c3                   	ret
  8012c2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  8012c8:	89 f9                	mov    %edi,%ecx
  8012ca:	85 ff                	test   %edi,%edi
  8012cc:	75 0b                	jne    8012d9 <__umoddi3+0x89>
  8012ce:	b8 01 00 00 00       	mov    $0x1,%eax
  8012d3:	31 d2                	xor    %edx,%edx
  8012d5:	f7 f7                	div    %edi
  8012d7:	89 c1                	mov    %eax,%ecx
  8012d9:	89 d8                	mov    %ebx,%eax
  8012db:	31 d2                	xor    %edx,%edx
  8012dd:	f7 f1                	div    %ecx
  8012df:	89 f0                	mov    %esi,%eax
  8012e1:	f7 f1                	div    %ecx
  8012e3:	89 d0                	mov    %edx,%eax
  8012e5:	31 d2                	xor    %edx,%edx
  8012e7:	eb 94                	jmp    80127d <__umoddi3+0x2d>
  8012e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8012f0:	89 e9                	mov    %ebp,%ecx
  8012f2:	ba 20 00 00 00       	mov    $0x20,%edx
  8012f7:	29 ea                	sub    %ebp,%edx
  8012f9:	d3 e0                	shl    %cl,%eax
  8012fb:	89 44 24 08          	mov    %eax,0x8(%esp)
  8012ff:	89 d1                	mov    %edx,%ecx
  801301:	89 f8                	mov    %edi,%eax
  801303:	d3 e8                	shr    %cl,%eax
  801305:	89 54 24 04          	mov    %edx,0x4(%esp)
  801309:	8b 54 24 04          	mov    0x4(%esp),%edx
  80130d:	89 c1                	mov    %eax,%ecx
  80130f:	8b 44 24 08          	mov    0x8(%esp),%eax
  801313:	09 c1                	or     %eax,%ecx
  801315:	89 d8                	mov    %ebx,%eax
  801317:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  80131b:	89 e9                	mov    %ebp,%ecx
  80131d:	d3 e7                	shl    %cl,%edi
  80131f:	89 d1                	mov    %edx,%ecx
  801321:	d3 e8                	shr    %cl,%eax
  801323:	89 e9                	mov    %ebp,%ecx
  801325:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  801329:	d3 e3                	shl    %cl,%ebx
  80132b:	89 c7                	mov    %eax,%edi
  80132d:	89 d1                	mov    %edx,%ecx
  80132f:	89 f0                	mov    %esi,%eax
  801331:	d3 e8                	shr    %cl,%eax
  801333:	89 fa                	mov    %edi,%edx
  801335:	89 e9                	mov    %ebp,%ecx
  801337:	09 d8                	or     %ebx,%eax
  801339:	d3 e6                	shl    %cl,%esi
  80133b:	f7 74 24 08          	divl   0x8(%esp)
  80133f:	89 d3                	mov    %edx,%ebx
  801341:	f7 64 24 0c          	mull   0xc(%esp)
  801345:	89 c7                	mov    %eax,%edi
  801347:	89 d1                	mov    %edx,%ecx
  801349:	39 d3                	cmp    %edx,%ebx
  80134b:	72 06                	jb     801353 <__umoddi3+0x103>
  80134d:	75 10                	jne    80135f <__umoddi3+0x10f>
  80134f:	39 c6                	cmp    %eax,%esi
  801351:	73 0c                	jae    80135f <__umoddi3+0x10f>
  801353:	2b 44 24 0c          	sub    0xc(%esp),%eax
  801357:	1b 54 24 08          	sbb    0x8(%esp),%edx
  80135b:	89 d1                	mov    %edx,%ecx
  80135d:	89 c7                	mov    %eax,%edi
  80135f:	89 f2                	mov    %esi,%edx
  801361:	29 fa                	sub    %edi,%edx
  801363:	19 cb                	sbb    %ecx,%ebx
  801365:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  80136a:	89 d8                	mov    %ebx,%eax
  80136c:	d3 e0                	shl    %cl,%eax
  80136e:	89 e9                	mov    %ebp,%ecx
  801370:	d3 ea                	shr    %cl,%edx
  801372:	d3 eb                	shr    %cl,%ebx
  801374:	09 d0                	or     %edx,%eax
  801376:	89 da                	mov    %ebx,%edx
  801378:	83 c4 1c             	add    $0x1c,%esp
  80137b:	5b                   	pop    %ebx
  80137c:	5e                   	pop    %esi
  80137d:	5f                   	pop    %edi
  80137e:	5d                   	pop    %ebp
  80137f:	c3                   	ret
  801380:	89 da                	mov    %ebx,%edx
  801382:	89 f1                	mov    %esi,%ecx
  801384:	29 f9                	sub    %edi,%ecx
  801386:	19 c2                	sbb    %eax,%edx
  801388:	89 c8                	mov    %ecx,%eax
  80138a:	e9 2b ff ff ff       	jmp    8012ba <__umoddi3+0x6a>
