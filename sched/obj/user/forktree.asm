
obj/user/forktree:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 b2 00 00 00       	call   8000e3 <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <forktree>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	53                   	push   %ebx
  800037:	83 ec 04             	sub    $0x4,%esp
  80003a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80003d:	e8 c3 0a 00 00       	call   800b05 <sys_getenvid>
  800042:	83 ec 04             	sub    $0x4,%esp
  800045:	53                   	push   %ebx
  800046:	50                   	push   %eax
  800047:	68 c0 13 80 00       	push   $0x8013c0
  80004c:	e8 86 01 00 00       	call   8001d7 <cprintf>
  800051:	83 c4 08             	add    $0x8,%esp
  800054:	6a 30                	push   $0x30
  800056:	53                   	push   %ebx
  800057:	e8 13 00 00 00       	call   80006f <forkchild>
  80005c:	83 c4 08             	add    $0x8,%esp
  80005f:	6a 31                	push   $0x31
  800061:	53                   	push   %ebx
  800062:	e8 08 00 00 00       	call   80006f <forkchild>
  800067:	83 c4 10             	add    $0x10,%esp
  80006a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  80006d:	c9                   	leave
  80006e:	c3                   	ret

0080006f <forkchild>:
  80006f:	55                   	push   %ebp
  800070:	89 e5                	mov    %esp,%ebp
  800072:	56                   	push   %esi
  800073:	53                   	push   %ebx
  800074:	83 ec 1c             	sub    $0x1c,%esp
  800077:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80007a:	8b 75 0c             	mov    0xc(%ebp),%esi
  80007d:	53                   	push   %ebx
  80007e:	e8 5e 06 00 00       	call   8006e1 <strlen>
  800083:	83 c4 10             	add    $0x10,%esp
  800086:	83 f8 02             	cmp    $0x2,%eax
  800089:	7e 07                	jle    800092 <forkchild+0x23>
  80008b:	8d 65 f8             	lea    -0x8(%ebp),%esp
  80008e:	5b                   	pop    %ebx
  80008f:	5e                   	pop    %esi
  800090:	5d                   	pop    %ebp
  800091:	c3                   	ret
  800092:	83 ec 0c             	sub    $0xc,%esp
  800095:	89 f0                	mov    %esi,%eax
  800097:	0f be f0             	movsbl %al,%esi
  80009a:	56                   	push   %esi
  80009b:	53                   	push   %ebx
  80009c:	68 d1 13 80 00       	push   $0x8013d1
  8000a1:	6a 04                	push   $0x4
  8000a3:	8d 45 f4             	lea    -0xc(%ebp),%eax
  8000a6:	50                   	push   %eax
  8000a7:	e8 1b 06 00 00       	call   8006c7 <snprintf>
  8000ac:	83 c4 20             	add    $0x20,%esp
  8000af:	e8 b8 0e 00 00       	call   800f6c <fork>
  8000b4:	85 c0                	test   %eax,%eax
  8000b6:	75 d3                	jne    80008b <forkchild+0x1c>
  8000b8:	83 ec 0c             	sub    $0xc,%esp
  8000bb:	8d 45 f4             	lea    -0xc(%ebp),%eax
  8000be:	50                   	push   %eax
  8000bf:	e8 6f ff ff ff       	call   800033 <forktree>
  8000c4:	e8 67 00 00 00       	call   800130 <exit>
  8000c9:	83 c4 10             	add    $0x10,%esp
  8000cc:	eb bd                	jmp    80008b <forkchild+0x1c>

008000ce <umain>:
  8000ce:	55                   	push   %ebp
  8000cf:	89 e5                	mov    %esp,%ebp
  8000d1:	83 ec 14             	sub    $0x14,%esp
  8000d4:	68 d0 13 80 00       	push   $0x8013d0
  8000d9:	e8 55 ff ff ff       	call   800033 <forktree>
  8000de:	83 c4 10             	add    $0x10,%esp
  8000e1:	c9                   	leave
  8000e2:	c3                   	ret

008000e3 <libmain>:
  8000e3:	55                   	push   %ebp
  8000e4:	89 e5                	mov    %esp,%ebp
  8000e6:	56                   	push   %esi
  8000e7:	53                   	push   %ebx
  8000e8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8000eb:	8b 75 0c             	mov    0xc(%ebp),%esi
  8000ee:	e8 12 0a 00 00       	call   800b05 <sys_getenvid>
  8000f3:	85 c0                	test   %eax,%eax
  8000f5:	78 15                	js     80010c <libmain+0x29>
  8000f7:	25 ff 03 00 00       	and    $0x3ff,%eax
  8000fc:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800102:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800107:	a3 04 20 80 00       	mov    %eax,0x802004
  80010c:	85 db                	test   %ebx,%ebx
  80010e:	7e 07                	jle    800117 <libmain+0x34>
  800110:	8b 06                	mov    (%esi),%eax
  800112:	a3 00 20 80 00       	mov    %eax,0x802000
  800117:	83 ec 08             	sub    $0x8,%esp
  80011a:	56                   	push   %esi
  80011b:	53                   	push   %ebx
  80011c:	e8 ad ff ff ff       	call   8000ce <umain>
  800121:	e8 0a 00 00 00       	call   800130 <exit>
  800126:	83 c4 10             	add    $0x10,%esp
  800129:	8d 65 f8             	lea    -0x8(%ebp),%esp
  80012c:	5b                   	pop    %ebx
  80012d:	5e                   	pop    %esi
  80012e:	5d                   	pop    %ebp
  80012f:	c3                   	ret

00800130 <exit>:
  800130:	55                   	push   %ebp
  800131:	89 e5                	mov    %esp,%ebp
  800133:	83 ec 14             	sub    $0x14,%esp
  800136:	6a 00                	push   $0x0
  800138:	e8 a6 09 00 00       	call   800ae3 <sys_env_destroy>
  80013d:	83 c4 10             	add    $0x10,%esp
  800140:	c9                   	leave
  800141:	c3                   	ret

00800142 <putch>:
  800142:	55                   	push   %ebp
  800143:	89 e5                	mov    %esp,%ebp
  800145:	53                   	push   %ebx
  800146:	83 ec 04             	sub    $0x4,%esp
  800149:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  80014c:	8b 13                	mov    (%ebx),%edx
  80014e:	8d 42 01             	lea    0x1(%edx),%eax
  800151:	89 03                	mov    %eax,(%ebx)
  800153:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800156:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  80015a:	3d ff 00 00 00       	cmp    $0xff,%eax
  80015f:	74 09                	je     80016a <putch+0x28>
  800161:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  800165:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800168:	c9                   	leave
  800169:	c3                   	ret
  80016a:	83 ec 08             	sub    $0x8,%esp
  80016d:	68 ff 00 00 00       	push   $0xff
  800172:	8d 43 08             	lea    0x8(%ebx),%eax
  800175:	50                   	push   %eax
  800176:	e8 1e 09 00 00       	call   800a99 <sys_cputs>
  80017b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  800181:	83 c4 10             	add    $0x10,%esp
  800184:	eb db                	jmp    800161 <putch+0x1f>

00800186 <vcprintf>:
  800186:	55                   	push   %ebp
  800187:	89 e5                	mov    %esp,%ebp
  800189:	81 ec 18 01 00 00    	sub    $0x118,%esp
  80018f:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  800196:	00 00 00 
  800199:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  8001a0:	00 00 00 
  8001a3:	ff 75 0c             	push   0xc(%ebp)
  8001a6:	ff 75 08             	push   0x8(%ebp)
  8001a9:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  8001af:	50                   	push   %eax
  8001b0:	68 42 01 80 00       	push   $0x800142
  8001b5:	e8 74 01 00 00       	call   80032e <vprintfmt>
  8001ba:	83 c4 08             	add    $0x8,%esp
  8001bd:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  8001c3:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  8001c9:	50                   	push   %eax
  8001ca:	e8 ca 08 00 00       	call   800a99 <sys_cputs>
  8001cf:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  8001d5:	c9                   	leave
  8001d6:	c3                   	ret

008001d7 <cprintf>:
  8001d7:	55                   	push   %ebp
  8001d8:	89 e5                	mov    %esp,%ebp
  8001da:	83 ec 10             	sub    $0x10,%esp
  8001dd:	8d 45 0c             	lea    0xc(%ebp),%eax
  8001e0:	50                   	push   %eax
  8001e1:	ff 75 08             	push   0x8(%ebp)
  8001e4:	e8 9d ff ff ff       	call   800186 <vcprintf>
  8001e9:	c9                   	leave
  8001ea:	c3                   	ret

008001eb <printnum>:
  8001eb:	55                   	push   %ebp
  8001ec:	89 e5                	mov    %esp,%ebp
  8001ee:	57                   	push   %edi
  8001ef:	56                   	push   %esi
  8001f0:	53                   	push   %ebx
  8001f1:	83 ec 1c             	sub    $0x1c,%esp
  8001f4:	89 c7                	mov    %eax,%edi
  8001f6:	89 d6                	mov    %edx,%esi
  8001f8:	8b 45 08             	mov    0x8(%ebp),%eax
  8001fb:	8b 55 0c             	mov    0xc(%ebp),%edx
  8001fe:	89 d1                	mov    %edx,%ecx
  800200:	89 c2                	mov    %eax,%edx
  800202:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800205:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  800208:	8b 45 10             	mov    0x10(%ebp),%eax
  80020b:	8b 5d 14             	mov    0x14(%ebp),%ebx
  80020e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800211:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  800218:	39 c2                	cmp    %eax,%edx
  80021a:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  80021d:	72 3e                	jb     80025d <printnum+0x72>
  80021f:	83 ec 0c             	sub    $0xc,%esp
  800222:	ff 75 18             	push   0x18(%ebp)
  800225:	83 eb 01             	sub    $0x1,%ebx
  800228:	53                   	push   %ebx
  800229:	50                   	push   %eax
  80022a:	83 ec 08             	sub    $0x8,%esp
  80022d:	ff 75 e4             	push   -0x1c(%ebp)
  800230:	ff 75 e0             	push   -0x20(%ebp)
  800233:	ff 75 dc             	push   -0x24(%ebp)
  800236:	ff 75 d8             	push   -0x28(%ebp)
  800239:	e8 22 0f 00 00       	call   801160 <__udivdi3>
  80023e:	83 c4 18             	add    $0x18,%esp
  800241:	52                   	push   %edx
  800242:	50                   	push   %eax
  800243:	89 f2                	mov    %esi,%edx
  800245:	89 f8                	mov    %edi,%eax
  800247:	e8 9f ff ff ff       	call   8001eb <printnum>
  80024c:	83 c4 20             	add    $0x20,%esp
  80024f:	eb 13                	jmp    800264 <printnum+0x79>
  800251:	83 ec 08             	sub    $0x8,%esp
  800254:	56                   	push   %esi
  800255:	ff 75 18             	push   0x18(%ebp)
  800258:	ff d7                	call   *%edi
  80025a:	83 c4 10             	add    $0x10,%esp
  80025d:	83 eb 01             	sub    $0x1,%ebx
  800260:	85 db                	test   %ebx,%ebx
  800262:	7f ed                	jg     800251 <printnum+0x66>
  800264:	83 ec 08             	sub    $0x8,%esp
  800267:	56                   	push   %esi
  800268:	83 ec 04             	sub    $0x4,%esp
  80026b:	ff 75 e4             	push   -0x1c(%ebp)
  80026e:	ff 75 e0             	push   -0x20(%ebp)
  800271:	ff 75 dc             	push   -0x24(%ebp)
  800274:	ff 75 d8             	push   -0x28(%ebp)
  800277:	e8 04 10 00 00       	call   801280 <__umoddi3>
  80027c:	83 c4 14             	add    $0x14,%esp
  80027f:	0f be 80 e0 13 80 00 	movsbl 0x8013e0(%eax),%eax
  800286:	50                   	push   %eax
  800287:	ff d7                	call   *%edi
  800289:	83 c4 10             	add    $0x10,%esp
  80028c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  80028f:	5b                   	pop    %ebx
  800290:	5e                   	pop    %esi
  800291:	5f                   	pop    %edi
  800292:	5d                   	pop    %ebp
  800293:	c3                   	ret

00800294 <getuint>:
  800294:	83 fa 01             	cmp    $0x1,%edx
  800297:	7f 13                	jg     8002ac <getuint+0x18>
  800299:	85 d2                	test   %edx,%edx
  80029b:	74 1c                	je     8002b9 <getuint+0x25>
  80029d:	8b 10                	mov    (%eax),%edx
  80029f:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002a2:	89 08                	mov    %ecx,(%eax)
  8002a4:	8b 02                	mov    (%edx),%eax
  8002a6:	ba 00 00 00 00       	mov    $0x0,%edx
  8002ab:	c3                   	ret
  8002ac:	8b 10                	mov    (%eax),%edx
  8002ae:	8d 4a 08             	lea    0x8(%edx),%ecx
  8002b1:	89 08                	mov    %ecx,(%eax)
  8002b3:	8b 02                	mov    (%edx),%eax
  8002b5:	8b 52 04             	mov    0x4(%edx),%edx
  8002b8:	c3                   	ret
  8002b9:	8b 10                	mov    (%eax),%edx
  8002bb:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002be:	89 08                	mov    %ecx,(%eax)
  8002c0:	8b 02                	mov    (%edx),%eax
  8002c2:	ba 00 00 00 00       	mov    $0x0,%edx
  8002c7:	c3                   	ret

008002c8 <getint>:
  8002c8:	83 fa 01             	cmp    $0x1,%edx
  8002cb:	7f 0f                	jg     8002dc <getint+0x14>
  8002cd:	85 d2                	test   %edx,%edx
  8002cf:	74 18                	je     8002e9 <getint+0x21>
  8002d1:	8b 10                	mov    (%eax),%edx
  8002d3:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002d6:	89 08                	mov    %ecx,(%eax)
  8002d8:	8b 02                	mov    (%edx),%eax
  8002da:	99                   	cltd
  8002db:	c3                   	ret
  8002dc:	8b 10                	mov    (%eax),%edx
  8002de:	8d 4a 08             	lea    0x8(%edx),%ecx
  8002e1:	89 08                	mov    %ecx,(%eax)
  8002e3:	8b 02                	mov    (%edx),%eax
  8002e5:	8b 52 04             	mov    0x4(%edx),%edx
  8002e8:	c3                   	ret
  8002e9:	8b 10                	mov    (%eax),%edx
  8002eb:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002ee:	89 08                	mov    %ecx,(%eax)
  8002f0:	8b 02                	mov    (%edx),%eax
  8002f2:	99                   	cltd
  8002f3:	c3                   	ret

008002f4 <sprintputch>:
  8002f4:	55                   	push   %ebp
  8002f5:	89 e5                	mov    %esp,%ebp
  8002f7:	8b 45 0c             	mov    0xc(%ebp),%eax
  8002fa:	83 40 08 01          	addl   $0x1,0x8(%eax)
  8002fe:	8b 10                	mov    (%eax),%edx
  800300:	3b 50 04             	cmp    0x4(%eax),%edx
  800303:	73 0a                	jae    80030f <sprintputch+0x1b>
  800305:	8d 4a 01             	lea    0x1(%edx),%ecx
  800308:	89 08                	mov    %ecx,(%eax)
  80030a:	8b 45 08             	mov    0x8(%ebp),%eax
  80030d:	88 02                	mov    %al,(%edx)
  80030f:	5d                   	pop    %ebp
  800310:	c3                   	ret

00800311 <printfmt>:
  800311:	55                   	push   %ebp
  800312:	89 e5                	mov    %esp,%ebp
  800314:	83 ec 08             	sub    $0x8,%esp
  800317:	8d 45 14             	lea    0x14(%ebp),%eax
  80031a:	50                   	push   %eax
  80031b:	ff 75 10             	push   0x10(%ebp)
  80031e:	ff 75 0c             	push   0xc(%ebp)
  800321:	ff 75 08             	push   0x8(%ebp)
  800324:	e8 05 00 00 00       	call   80032e <vprintfmt>
  800329:	83 c4 10             	add    $0x10,%esp
  80032c:	c9                   	leave
  80032d:	c3                   	ret

0080032e <vprintfmt>:
  80032e:	55                   	push   %ebp
  80032f:	89 e5                	mov    %esp,%ebp
  800331:	57                   	push   %edi
  800332:	56                   	push   %esi
  800333:	53                   	push   %ebx
  800334:	83 ec 2c             	sub    $0x2c,%esp
  800337:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80033a:	8b 75 0c             	mov    0xc(%ebp),%esi
  80033d:	8b 7d 10             	mov    0x10(%ebp),%edi
  800340:	eb 0a                	jmp    80034c <vprintfmt+0x1e>
  800342:	83 ec 08             	sub    $0x8,%esp
  800345:	56                   	push   %esi
  800346:	50                   	push   %eax
  800347:	ff d3                	call   *%ebx
  800349:	83 c4 10             	add    $0x10,%esp
  80034c:	83 c7 01             	add    $0x1,%edi
  80034f:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  800353:	83 f8 25             	cmp    $0x25,%eax
  800356:	74 0c                	je     800364 <vprintfmt+0x36>
  800358:	85 c0                	test   %eax,%eax
  80035a:	75 e6                	jne    800342 <vprintfmt+0x14>
  80035c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  80035f:	5b                   	pop    %ebx
  800360:	5e                   	pop    %esi
  800361:	5f                   	pop    %edi
  800362:	5d                   	pop    %ebp
  800363:	c3                   	ret
  800364:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  800368:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  80036f:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800376:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  80037d:	b9 00 00 00 00       	mov    $0x0,%ecx
  800382:	8d 47 01             	lea    0x1(%edi),%eax
  800385:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800388:	0f b6 17             	movzbl (%edi),%edx
  80038b:	8d 42 dd             	lea    -0x23(%edx),%eax
  80038e:	3c 55                	cmp    $0x55,%al
  800390:	0f 87 c3 02 00 00    	ja     800659 <vprintfmt+0x32b>
  800396:	0f b6 c0             	movzbl %al,%eax
  800399:	ff 24 85 60 15 80 00 	jmp    *0x801560(,%eax,4)
  8003a0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003a3:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  8003a7:	eb d9                	jmp    800382 <vprintfmt+0x54>
  8003a9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003ac:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  8003b0:	eb d0                	jmp    800382 <vprintfmt+0x54>
  8003b2:	0f b6 d2             	movzbl %dl,%edx
  8003b5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003b8:	b8 00 00 00 00       	mov    $0x0,%eax
  8003bd:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  8003c0:	8d 04 80             	lea    (%eax,%eax,4),%eax
  8003c3:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  8003c7:	0f be 17             	movsbl (%edi),%edx
  8003ca:	8d 4a d0             	lea    -0x30(%edx),%ecx
  8003cd:	83 f9 09             	cmp    $0x9,%ecx
  8003d0:	77 52                	ja     800424 <vprintfmt+0xf6>
  8003d2:	83 c7 01             	add    $0x1,%edi
  8003d5:	eb e9                	jmp    8003c0 <vprintfmt+0x92>
  8003d7:	8b 45 14             	mov    0x14(%ebp),%eax
  8003da:	8d 50 04             	lea    0x4(%eax),%edx
  8003dd:	89 55 14             	mov    %edx,0x14(%ebp)
  8003e0:	8b 00                	mov    (%eax),%eax
  8003e2:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8003e5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003e8:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  8003ec:	79 94                	jns    800382 <vprintfmt+0x54>
  8003ee:	8b 45 d0             	mov    -0x30(%ebp),%eax
  8003f1:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8003f4:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  8003fb:	eb 85                	jmp    800382 <vprintfmt+0x54>
  8003fd:	8b 55 e0             	mov    -0x20(%ebp),%edx
  800400:	85 d2                	test   %edx,%edx
  800402:	b8 00 00 00 00       	mov    $0x0,%eax
  800407:	0f 49 c2             	cmovns %edx,%eax
  80040a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80040d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800410:	e9 6d ff ff ff       	jmp    800382 <vprintfmt+0x54>
  800415:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800418:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  80041f:	e9 5e ff ff ff       	jmp    800382 <vprintfmt+0x54>
  800424:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  800427:	89 45 d0             	mov    %eax,-0x30(%ebp)
  80042a:	eb bc                	jmp    8003e8 <vprintfmt+0xba>
  80042c:	83 c1 01             	add    $0x1,%ecx
  80042f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800432:	e9 4b ff ff ff       	jmp    800382 <vprintfmt+0x54>
  800437:	8b 45 14             	mov    0x14(%ebp),%eax
  80043a:	8d 50 04             	lea    0x4(%eax),%edx
  80043d:	89 55 14             	mov    %edx,0x14(%ebp)
  800440:	83 ec 08             	sub    $0x8,%esp
  800443:	56                   	push   %esi
  800444:	ff 30                	push   (%eax)
  800446:	ff d3                	call   *%ebx
  800448:	83 c4 10             	add    $0x10,%esp
  80044b:	e9 a0 01 00 00       	jmp    8005f0 <vprintfmt+0x2c2>
  800450:	8b 45 14             	mov    0x14(%ebp),%eax
  800453:	8d 50 04             	lea    0x4(%eax),%edx
  800456:	89 55 14             	mov    %edx,0x14(%ebp)
  800459:	8b 10                	mov    (%eax),%edx
  80045b:	89 d0                	mov    %edx,%eax
  80045d:	f7 d8                	neg    %eax
  80045f:	0f 48 c2             	cmovs  %edx,%eax
  800462:	83 f8 08             	cmp    $0x8,%eax
  800465:	7f 20                	jg     800487 <vprintfmt+0x159>
  800467:	8b 14 85 c0 16 80 00 	mov    0x8016c0(,%eax,4),%edx
  80046e:	85 d2                	test   %edx,%edx
  800470:	74 15                	je     800487 <vprintfmt+0x159>
  800472:	52                   	push   %edx
  800473:	68 01 14 80 00       	push   $0x801401
  800478:	56                   	push   %esi
  800479:	53                   	push   %ebx
  80047a:	e8 92 fe ff ff       	call   800311 <printfmt>
  80047f:	83 c4 10             	add    $0x10,%esp
  800482:	e9 69 01 00 00       	jmp    8005f0 <vprintfmt+0x2c2>
  800487:	50                   	push   %eax
  800488:	68 f8 13 80 00       	push   $0x8013f8
  80048d:	56                   	push   %esi
  80048e:	53                   	push   %ebx
  80048f:	e8 7d fe ff ff       	call   800311 <printfmt>
  800494:	83 c4 10             	add    $0x10,%esp
  800497:	e9 54 01 00 00       	jmp    8005f0 <vprintfmt+0x2c2>
  80049c:	8b 45 14             	mov    0x14(%ebp),%eax
  80049f:	8d 50 04             	lea    0x4(%eax),%edx
  8004a2:	89 55 14             	mov    %edx,0x14(%ebp)
  8004a5:	8b 08                	mov    (%eax),%ecx
  8004a7:	85 c9                	test   %ecx,%ecx
  8004a9:	b8 f1 13 80 00       	mov    $0x8013f1,%eax
  8004ae:	0f 45 c1             	cmovne %ecx,%eax
  8004b1:	89 45 cc             	mov    %eax,-0x34(%ebp)
  8004b4:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  8004b8:	7e 06                	jle    8004c0 <vprintfmt+0x192>
  8004ba:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  8004be:	75 0b                	jne    8004cb <vprintfmt+0x19d>
  8004c0:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  8004c3:	8b 7d d0             	mov    -0x30(%ebp),%edi
  8004c6:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8004c9:	eb 5c                	jmp    800527 <vprintfmt+0x1f9>
  8004cb:	83 ec 08             	sub    $0x8,%esp
  8004ce:	ff 75 d0             	push   -0x30(%ebp)
  8004d1:	ff 75 cc             	push   -0x34(%ebp)
  8004d4:	e8 20 02 00 00       	call   8006f9 <strnlen>
  8004d9:	89 c2                	mov    %eax,%edx
  8004db:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8004de:	29 d0                	sub    %edx,%eax
  8004e0:	83 c4 10             	add    $0x10,%esp
  8004e3:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  8004e7:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8004ea:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8004ed:	89 c3                	mov    %eax,%ebx
  8004ef:	eb 0e                	jmp    8004ff <vprintfmt+0x1d1>
  8004f1:	83 ec 08             	sub    $0x8,%esp
  8004f4:	56                   	push   %esi
  8004f5:	57                   	push   %edi
  8004f6:	ff 55 08             	call   *0x8(%ebp)
  8004f9:	83 eb 01             	sub    $0x1,%ebx
  8004fc:	83 c4 10             	add    $0x10,%esp
  8004ff:	85 db                	test   %ebx,%ebx
  800501:	7f ee                	jg     8004f1 <vprintfmt+0x1c3>
  800503:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800506:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800509:	85 c0                	test   %eax,%eax
  80050b:	ba 00 00 00 00       	mov    $0x0,%edx
  800510:	0f 49 d0             	cmovns %eax,%edx
  800513:	29 d0                	sub    %edx,%eax
  800515:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800518:	eb a6                	jmp    8004c0 <vprintfmt+0x192>
  80051a:	83 ec 08             	sub    $0x8,%esp
  80051d:	56                   	push   %esi
  80051e:	52                   	push   %edx
  80051f:	ff 55 08             	call   *0x8(%ebp)
  800522:	83 c4 10             	add    $0x10,%esp
  800525:	89 d9                	mov    %ebx,%ecx
  800527:	8d 59 01             	lea    0x1(%ecx),%ebx
  80052a:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  80052e:	0f be d0             	movsbl %al,%edx
  800531:	85 d2                	test   %edx,%edx
  800533:	74 28                	je     80055d <vprintfmt+0x22f>
  800535:	85 ff                	test   %edi,%edi
  800537:	78 05                	js     80053e <vprintfmt+0x210>
  800539:	83 ef 01             	sub    $0x1,%edi
  80053c:	78 2e                	js     80056c <vprintfmt+0x23e>
  80053e:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  800542:	74 d6                	je     80051a <vprintfmt+0x1ec>
  800544:	0f be c0             	movsbl %al,%eax
  800547:	83 e8 20             	sub    $0x20,%eax
  80054a:	83 f8 5e             	cmp    $0x5e,%eax
  80054d:	76 cb                	jbe    80051a <vprintfmt+0x1ec>
  80054f:	83 ec 08             	sub    $0x8,%esp
  800552:	56                   	push   %esi
  800553:	6a 3f                	push   $0x3f
  800555:	ff 55 08             	call   *0x8(%ebp)
  800558:	83 c4 10             	add    $0x10,%esp
  80055b:	eb c8                	jmp    800525 <vprintfmt+0x1f7>
  80055d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800560:	8b 7d cc             	mov    -0x34(%ebp),%edi
  800563:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800566:	01 c7                	add    %eax,%edi
  800568:	29 cf                	sub    %ecx,%edi
  80056a:	eb 13                	jmp    80057f <vprintfmt+0x251>
  80056c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80056f:	eb ef                	jmp    800560 <vprintfmt+0x232>
  800571:	83 ec 08             	sub    $0x8,%esp
  800574:	56                   	push   %esi
  800575:	6a 20                	push   $0x20
  800577:	ff d3                	call   *%ebx
  800579:	83 ef 01             	sub    $0x1,%edi
  80057c:	83 c4 10             	add    $0x10,%esp
  80057f:	85 ff                	test   %edi,%edi
  800581:	7f ee                	jg     800571 <vprintfmt+0x243>
  800583:	eb 6b                	jmp    8005f0 <vprintfmt+0x2c2>
  800585:	89 ca                	mov    %ecx,%edx
  800587:	8d 45 14             	lea    0x14(%ebp),%eax
  80058a:	e8 39 fd ff ff       	call   8002c8 <getint>
  80058f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800592:	89 55 dc             	mov    %edx,-0x24(%ebp)
  800595:	85 d2                	test   %edx,%edx
  800597:	78 0b                	js     8005a4 <vprintfmt+0x276>
  800599:	89 d1                	mov    %edx,%ecx
  80059b:	89 c2                	mov    %eax,%edx
  80059d:	bf 0a 00 00 00       	mov    $0xa,%edi
  8005a2:	eb 32                	jmp    8005d6 <vprintfmt+0x2a8>
  8005a4:	83 ec 08             	sub    $0x8,%esp
  8005a7:	56                   	push   %esi
  8005a8:	6a 2d                	push   $0x2d
  8005aa:	ff d3                	call   *%ebx
  8005ac:	8b 55 d8             	mov    -0x28(%ebp),%edx
  8005af:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  8005b2:	f7 da                	neg    %edx
  8005b4:	83 d1 00             	adc    $0x0,%ecx
  8005b7:	f7 d9                	neg    %ecx
  8005b9:	83 c4 10             	add    $0x10,%esp
  8005bc:	bf 0a 00 00 00       	mov    $0xa,%edi
  8005c1:	eb 13                	jmp    8005d6 <vprintfmt+0x2a8>
  8005c3:	89 ca                	mov    %ecx,%edx
  8005c5:	8d 45 14             	lea    0x14(%ebp),%eax
  8005c8:	e8 c7 fc ff ff       	call   800294 <getuint>
  8005cd:	89 d1                	mov    %edx,%ecx
  8005cf:	89 c2                	mov    %eax,%edx
  8005d1:	bf 0a 00 00 00       	mov    $0xa,%edi
  8005d6:	83 ec 0c             	sub    $0xc,%esp
  8005d9:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  8005dd:	50                   	push   %eax
  8005de:	ff 75 e0             	push   -0x20(%ebp)
  8005e1:	57                   	push   %edi
  8005e2:	51                   	push   %ecx
  8005e3:	52                   	push   %edx
  8005e4:	89 f2                	mov    %esi,%edx
  8005e6:	89 d8                	mov    %ebx,%eax
  8005e8:	e8 fe fb ff ff       	call   8001eb <printnum>
  8005ed:	83 c4 20             	add    $0x20,%esp
  8005f0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005f3:	e9 54 fd ff ff       	jmp    80034c <vprintfmt+0x1e>
  8005f8:	89 ca                	mov    %ecx,%edx
  8005fa:	8d 45 14             	lea    0x14(%ebp),%eax
  8005fd:	e8 92 fc ff ff       	call   800294 <getuint>
  800602:	89 d1                	mov    %edx,%ecx
  800604:	89 c2                	mov    %eax,%edx
  800606:	bf 08 00 00 00       	mov    $0x8,%edi
  80060b:	eb c9                	jmp    8005d6 <vprintfmt+0x2a8>
  80060d:	83 ec 08             	sub    $0x8,%esp
  800610:	56                   	push   %esi
  800611:	6a 30                	push   $0x30
  800613:	ff d3                	call   *%ebx
  800615:	83 c4 08             	add    $0x8,%esp
  800618:	56                   	push   %esi
  800619:	6a 78                	push   $0x78
  80061b:	ff d3                	call   *%ebx
  80061d:	8b 45 14             	mov    0x14(%ebp),%eax
  800620:	8d 50 04             	lea    0x4(%eax),%edx
  800623:	89 55 14             	mov    %edx,0x14(%ebp)
  800626:	8b 10                	mov    (%eax),%edx
  800628:	b9 00 00 00 00       	mov    $0x0,%ecx
  80062d:	83 c4 10             	add    $0x10,%esp
  800630:	bf 10 00 00 00       	mov    $0x10,%edi
  800635:	eb 9f                	jmp    8005d6 <vprintfmt+0x2a8>
  800637:	89 ca                	mov    %ecx,%edx
  800639:	8d 45 14             	lea    0x14(%ebp),%eax
  80063c:	e8 53 fc ff ff       	call   800294 <getuint>
  800641:	89 d1                	mov    %edx,%ecx
  800643:	89 c2                	mov    %eax,%edx
  800645:	bf 10 00 00 00       	mov    $0x10,%edi
  80064a:	eb 8a                	jmp    8005d6 <vprintfmt+0x2a8>
  80064c:	83 ec 08             	sub    $0x8,%esp
  80064f:	56                   	push   %esi
  800650:	6a 25                	push   $0x25
  800652:	ff d3                	call   *%ebx
  800654:	83 c4 10             	add    $0x10,%esp
  800657:	eb 97                	jmp    8005f0 <vprintfmt+0x2c2>
  800659:	83 ec 08             	sub    $0x8,%esp
  80065c:	56                   	push   %esi
  80065d:	6a 25                	push   $0x25
  80065f:	ff d3                	call   *%ebx
  800661:	83 c4 10             	add    $0x10,%esp
  800664:	89 f8                	mov    %edi,%eax
  800666:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  80066a:	74 05                	je     800671 <vprintfmt+0x343>
  80066c:	83 e8 01             	sub    $0x1,%eax
  80066f:	eb f5                	jmp    800666 <vprintfmt+0x338>
  800671:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800674:	e9 77 ff ff ff       	jmp    8005f0 <vprintfmt+0x2c2>

00800679 <vsnprintf>:
  800679:	55                   	push   %ebp
  80067a:	89 e5                	mov    %esp,%ebp
  80067c:	83 ec 18             	sub    $0x18,%esp
  80067f:	8b 45 08             	mov    0x8(%ebp),%eax
  800682:	8b 55 0c             	mov    0xc(%ebp),%edx
  800685:	89 45 ec             	mov    %eax,-0x14(%ebp)
  800688:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  80068c:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  80068f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  800696:	85 c0                	test   %eax,%eax
  800698:	74 26                	je     8006c0 <vsnprintf+0x47>
  80069a:	85 d2                	test   %edx,%edx
  80069c:	7e 22                	jle    8006c0 <vsnprintf+0x47>
  80069e:	ff 75 14             	push   0x14(%ebp)
  8006a1:	ff 75 10             	push   0x10(%ebp)
  8006a4:	8d 45 ec             	lea    -0x14(%ebp),%eax
  8006a7:	50                   	push   %eax
  8006a8:	68 f4 02 80 00       	push   $0x8002f4
  8006ad:	e8 7c fc ff ff       	call   80032e <vprintfmt>
  8006b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  8006b5:	c6 00 00             	movb   $0x0,(%eax)
  8006b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  8006bb:	83 c4 10             	add    $0x10,%esp
  8006be:	c9                   	leave
  8006bf:	c3                   	ret
  8006c0:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8006c5:	eb f7                	jmp    8006be <vsnprintf+0x45>

008006c7 <snprintf>:
  8006c7:	55                   	push   %ebp
  8006c8:	89 e5                	mov    %esp,%ebp
  8006ca:	83 ec 08             	sub    $0x8,%esp
  8006cd:	8d 45 14             	lea    0x14(%ebp),%eax
  8006d0:	50                   	push   %eax
  8006d1:	ff 75 10             	push   0x10(%ebp)
  8006d4:	ff 75 0c             	push   0xc(%ebp)
  8006d7:	ff 75 08             	push   0x8(%ebp)
  8006da:	e8 9a ff ff ff       	call   800679 <vsnprintf>
  8006df:	c9                   	leave
  8006e0:	c3                   	ret

008006e1 <strlen>:
  8006e1:	55                   	push   %ebp
  8006e2:	89 e5                	mov    %esp,%ebp
  8006e4:	8b 55 08             	mov    0x8(%ebp),%edx
  8006e7:	b8 00 00 00 00       	mov    $0x0,%eax
  8006ec:	eb 03                	jmp    8006f1 <strlen+0x10>
  8006ee:	83 c0 01             	add    $0x1,%eax
  8006f1:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  8006f5:	75 f7                	jne    8006ee <strlen+0xd>
  8006f7:	5d                   	pop    %ebp
  8006f8:	c3                   	ret

008006f9 <strnlen>:
  8006f9:	55                   	push   %ebp
  8006fa:	89 e5                	mov    %esp,%ebp
  8006fc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8006ff:	8b 55 0c             	mov    0xc(%ebp),%edx
  800702:	b8 00 00 00 00       	mov    $0x0,%eax
  800707:	eb 03                	jmp    80070c <strnlen+0x13>
  800709:	83 c0 01             	add    $0x1,%eax
  80070c:	39 d0                	cmp    %edx,%eax
  80070e:	74 08                	je     800718 <strnlen+0x1f>
  800710:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  800714:	75 f3                	jne    800709 <strnlen+0x10>
  800716:	89 c2                	mov    %eax,%edx
  800718:	89 d0                	mov    %edx,%eax
  80071a:	5d                   	pop    %ebp
  80071b:	c3                   	ret

0080071c <strcpy>:
  80071c:	55                   	push   %ebp
  80071d:	89 e5                	mov    %esp,%ebp
  80071f:	53                   	push   %ebx
  800720:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800723:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800726:	b8 00 00 00 00       	mov    $0x0,%eax
  80072b:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  80072f:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  800732:	83 c0 01             	add    $0x1,%eax
  800735:	84 d2                	test   %dl,%dl
  800737:	75 f2                	jne    80072b <strcpy+0xf>
  800739:	89 c8                	mov    %ecx,%eax
  80073b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  80073e:	c9                   	leave
  80073f:	c3                   	ret

00800740 <strcat>:
  800740:	55                   	push   %ebp
  800741:	89 e5                	mov    %esp,%ebp
  800743:	53                   	push   %ebx
  800744:	83 ec 10             	sub    $0x10,%esp
  800747:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80074a:	53                   	push   %ebx
  80074b:	e8 91 ff ff ff       	call   8006e1 <strlen>
  800750:	83 c4 08             	add    $0x8,%esp
  800753:	ff 75 0c             	push   0xc(%ebp)
  800756:	01 d8                	add    %ebx,%eax
  800758:	50                   	push   %eax
  800759:	e8 be ff ff ff       	call   80071c <strcpy>
  80075e:	89 d8                	mov    %ebx,%eax
  800760:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800763:	c9                   	leave
  800764:	c3                   	ret

00800765 <strncpy>:
  800765:	55                   	push   %ebp
  800766:	89 e5                	mov    %esp,%ebp
  800768:	56                   	push   %esi
  800769:	53                   	push   %ebx
  80076a:	8b 75 08             	mov    0x8(%ebp),%esi
  80076d:	8b 55 0c             	mov    0xc(%ebp),%edx
  800770:	89 f3                	mov    %esi,%ebx
  800772:	03 5d 10             	add    0x10(%ebp),%ebx
  800775:	89 f0                	mov    %esi,%eax
  800777:	eb 0f                	jmp    800788 <strncpy+0x23>
  800779:	83 c0 01             	add    $0x1,%eax
  80077c:	0f b6 0a             	movzbl (%edx),%ecx
  80077f:	88 48 ff             	mov    %cl,-0x1(%eax)
  800782:	80 f9 01             	cmp    $0x1,%cl
  800785:	83 da ff             	sbb    $0xffffffff,%edx
  800788:	39 d8                	cmp    %ebx,%eax
  80078a:	75 ed                	jne    800779 <strncpy+0x14>
  80078c:	89 f0                	mov    %esi,%eax
  80078e:	5b                   	pop    %ebx
  80078f:	5e                   	pop    %esi
  800790:	5d                   	pop    %ebp
  800791:	c3                   	ret

00800792 <strlcpy>:
  800792:	55                   	push   %ebp
  800793:	89 e5                	mov    %esp,%ebp
  800795:	56                   	push   %esi
  800796:	53                   	push   %ebx
  800797:	8b 75 08             	mov    0x8(%ebp),%esi
  80079a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80079d:	8b 55 10             	mov    0x10(%ebp),%edx
  8007a0:	89 f0                	mov    %esi,%eax
  8007a2:	85 d2                	test   %edx,%edx
  8007a4:	74 21                	je     8007c7 <strlcpy+0x35>
  8007a6:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  8007aa:	89 f2                	mov    %esi,%edx
  8007ac:	eb 09                	jmp    8007b7 <strlcpy+0x25>
  8007ae:	83 c1 01             	add    $0x1,%ecx
  8007b1:	83 c2 01             	add    $0x1,%edx
  8007b4:	88 5a ff             	mov    %bl,-0x1(%edx)
  8007b7:	39 c2                	cmp    %eax,%edx
  8007b9:	74 09                	je     8007c4 <strlcpy+0x32>
  8007bb:	0f b6 19             	movzbl (%ecx),%ebx
  8007be:	84 db                	test   %bl,%bl
  8007c0:	75 ec                	jne    8007ae <strlcpy+0x1c>
  8007c2:	89 d0                	mov    %edx,%eax
  8007c4:	c6 00 00             	movb   $0x0,(%eax)
  8007c7:	29 f0                	sub    %esi,%eax
  8007c9:	5b                   	pop    %ebx
  8007ca:	5e                   	pop    %esi
  8007cb:	5d                   	pop    %ebp
  8007cc:	c3                   	ret

008007cd <strcmp>:
  8007cd:	55                   	push   %ebp
  8007ce:	89 e5                	mov    %esp,%ebp
  8007d0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8007d3:	8b 55 0c             	mov    0xc(%ebp),%edx
  8007d6:	eb 06                	jmp    8007de <strcmp+0x11>
  8007d8:	83 c1 01             	add    $0x1,%ecx
  8007db:	83 c2 01             	add    $0x1,%edx
  8007de:	0f b6 01             	movzbl (%ecx),%eax
  8007e1:	84 c0                	test   %al,%al
  8007e3:	74 04                	je     8007e9 <strcmp+0x1c>
  8007e5:	3a 02                	cmp    (%edx),%al
  8007e7:	74 ef                	je     8007d8 <strcmp+0xb>
  8007e9:	0f b6 c0             	movzbl %al,%eax
  8007ec:	0f b6 12             	movzbl (%edx),%edx
  8007ef:	29 d0                	sub    %edx,%eax
  8007f1:	5d                   	pop    %ebp
  8007f2:	c3                   	ret

008007f3 <strncmp>:
  8007f3:	55                   	push   %ebp
  8007f4:	89 e5                	mov    %esp,%ebp
  8007f6:	53                   	push   %ebx
  8007f7:	8b 45 08             	mov    0x8(%ebp),%eax
  8007fa:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8007fd:	8b 55 10             	mov    0x10(%ebp),%edx
  800800:	eb 09                	jmp    80080b <strncmp+0x18>
  800802:	83 ea 01             	sub    $0x1,%edx
  800805:	83 c0 01             	add    $0x1,%eax
  800808:	83 c1 01             	add    $0x1,%ecx
  80080b:	85 d2                	test   %edx,%edx
  80080d:	74 18                	je     800827 <strncmp+0x34>
  80080f:	0f b6 18             	movzbl (%eax),%ebx
  800812:	84 db                	test   %bl,%bl
  800814:	74 04                	je     80081a <strncmp+0x27>
  800816:	3a 19                	cmp    (%ecx),%bl
  800818:	74 e8                	je     800802 <strncmp+0xf>
  80081a:	0f b6 00             	movzbl (%eax),%eax
  80081d:	0f b6 11             	movzbl (%ecx),%edx
  800820:	29 d0                	sub    %edx,%eax
  800822:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800825:	c9                   	leave
  800826:	c3                   	ret
  800827:	b8 00 00 00 00       	mov    $0x0,%eax
  80082c:	eb f4                	jmp    800822 <strncmp+0x2f>

0080082e <strchr>:
  80082e:	55                   	push   %ebp
  80082f:	89 e5                	mov    %esp,%ebp
  800831:	8b 45 08             	mov    0x8(%ebp),%eax
  800834:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  800838:	eb 03                	jmp    80083d <strchr+0xf>
  80083a:	83 c0 01             	add    $0x1,%eax
  80083d:	0f b6 10             	movzbl (%eax),%edx
  800840:	84 d2                	test   %dl,%dl
  800842:	74 06                	je     80084a <strchr+0x1c>
  800844:	38 ca                	cmp    %cl,%dl
  800846:	75 f2                	jne    80083a <strchr+0xc>
  800848:	eb 05                	jmp    80084f <strchr+0x21>
  80084a:	b8 00 00 00 00       	mov    $0x0,%eax
  80084f:	5d                   	pop    %ebp
  800850:	c3                   	ret

00800851 <strfind>:
  800851:	55                   	push   %ebp
  800852:	89 e5                	mov    %esp,%ebp
  800854:	8b 45 08             	mov    0x8(%ebp),%eax
  800857:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  80085b:	0f b6 10             	movzbl (%eax),%edx
  80085e:	38 ca                	cmp    %cl,%dl
  800860:	74 09                	je     80086b <strfind+0x1a>
  800862:	84 d2                	test   %dl,%dl
  800864:	74 05                	je     80086b <strfind+0x1a>
  800866:	83 c0 01             	add    $0x1,%eax
  800869:	eb f0                	jmp    80085b <strfind+0xa>
  80086b:	5d                   	pop    %ebp
  80086c:	c3                   	ret

0080086d <memset>:
  80086d:	55                   	push   %ebp
  80086e:	89 e5                	mov    %esp,%ebp
  800870:	57                   	push   %edi
  800871:	8b 55 08             	mov    0x8(%ebp),%edx
  800874:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800877:	85 c9                	test   %ecx,%ecx
  800879:	74 24                	je     80089f <memset+0x32>
  80087b:	89 d0                	mov    %edx,%eax
  80087d:	09 c8                	or     %ecx,%eax
  80087f:	a8 03                	test   $0x3,%al
  800881:	75 14                	jne    800897 <memset+0x2a>
  800883:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  800887:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  80088d:	c1 e9 02             	shr    $0x2,%ecx
  800890:	89 d7                	mov    %edx,%edi
  800892:	fc                   	cld
  800893:	f3 ab                	rep stos %eax,%es:(%edi)
  800895:	eb 08                	jmp    80089f <memset+0x32>
  800897:	89 d7                	mov    %edx,%edi
  800899:	8b 45 0c             	mov    0xc(%ebp),%eax
  80089c:	fc                   	cld
  80089d:	f3 aa                	rep stos %al,%es:(%edi)
  80089f:	89 d0                	mov    %edx,%eax
  8008a1:	8b 7d fc             	mov    -0x4(%ebp),%edi
  8008a4:	c9                   	leave
  8008a5:	c3                   	ret

008008a6 <memmove>:
  8008a6:	55                   	push   %ebp
  8008a7:	89 e5                	mov    %esp,%ebp
  8008a9:	57                   	push   %edi
  8008aa:	56                   	push   %esi
  8008ab:	8b 45 08             	mov    0x8(%ebp),%eax
  8008ae:	8b 75 0c             	mov    0xc(%ebp),%esi
  8008b1:	8b 4d 10             	mov    0x10(%ebp),%ecx
  8008b4:	39 c6                	cmp    %eax,%esi
  8008b6:	73 32                	jae    8008ea <memmove+0x44>
  8008b8:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  8008bb:	39 d0                	cmp    %edx,%eax
  8008bd:	73 2b                	jae    8008ea <memmove+0x44>
  8008bf:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  8008c2:	89 fe                	mov    %edi,%esi
  8008c4:	09 ce                	or     %ecx,%esi
  8008c6:	09 d6                	or     %edx,%esi
  8008c8:	f7 c6 03 00 00 00    	test   $0x3,%esi
  8008ce:	75 0e                	jne    8008de <memmove+0x38>
  8008d0:	83 ef 04             	sub    $0x4,%edi
  8008d3:	8d 72 fc             	lea    -0x4(%edx),%esi
  8008d6:	c1 e9 02             	shr    $0x2,%ecx
  8008d9:	fd                   	std
  8008da:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  8008dc:	eb 09                	jmp    8008e7 <memmove+0x41>
  8008de:	83 ef 01             	sub    $0x1,%edi
  8008e1:	8d 72 ff             	lea    -0x1(%edx),%esi
  8008e4:	fd                   	std
  8008e5:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  8008e7:	fc                   	cld
  8008e8:	eb 1a                	jmp    800904 <memmove+0x5e>
  8008ea:	89 c2                	mov    %eax,%edx
  8008ec:	09 ca                	or     %ecx,%edx
  8008ee:	09 f2                	or     %esi,%edx
  8008f0:	f6 c2 03             	test   $0x3,%dl
  8008f3:	75 0a                	jne    8008ff <memmove+0x59>
  8008f5:	c1 e9 02             	shr    $0x2,%ecx
  8008f8:	89 c7                	mov    %eax,%edi
  8008fa:	fc                   	cld
  8008fb:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  8008fd:	eb 05                	jmp    800904 <memmove+0x5e>
  8008ff:	89 c7                	mov    %eax,%edi
  800901:	fc                   	cld
  800902:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800904:	5e                   	pop    %esi
  800905:	5f                   	pop    %edi
  800906:	5d                   	pop    %ebp
  800907:	c3                   	ret

00800908 <memcpy>:
  800908:	55                   	push   %ebp
  800909:	89 e5                	mov    %esp,%ebp
  80090b:	83 ec 0c             	sub    $0xc,%esp
  80090e:	ff 75 10             	push   0x10(%ebp)
  800911:	ff 75 0c             	push   0xc(%ebp)
  800914:	ff 75 08             	push   0x8(%ebp)
  800917:	e8 8a ff ff ff       	call   8008a6 <memmove>
  80091c:	c9                   	leave
  80091d:	c3                   	ret

0080091e <memcmp>:
  80091e:	55                   	push   %ebp
  80091f:	89 e5                	mov    %esp,%ebp
  800921:	56                   	push   %esi
  800922:	53                   	push   %ebx
  800923:	8b 45 08             	mov    0x8(%ebp),%eax
  800926:	8b 55 0c             	mov    0xc(%ebp),%edx
  800929:	89 c6                	mov    %eax,%esi
  80092b:	03 75 10             	add    0x10(%ebp),%esi
  80092e:	eb 06                	jmp    800936 <memcmp+0x18>
  800930:	83 c0 01             	add    $0x1,%eax
  800933:	83 c2 01             	add    $0x1,%edx
  800936:	39 f0                	cmp    %esi,%eax
  800938:	74 14                	je     80094e <memcmp+0x30>
  80093a:	0f b6 08             	movzbl (%eax),%ecx
  80093d:	0f b6 1a             	movzbl (%edx),%ebx
  800940:	38 d9                	cmp    %bl,%cl
  800942:	74 ec                	je     800930 <memcmp+0x12>
  800944:	0f b6 c1             	movzbl %cl,%eax
  800947:	0f b6 db             	movzbl %bl,%ebx
  80094a:	29 d8                	sub    %ebx,%eax
  80094c:	eb 05                	jmp    800953 <memcmp+0x35>
  80094e:	b8 00 00 00 00       	mov    $0x0,%eax
  800953:	5b                   	pop    %ebx
  800954:	5e                   	pop    %esi
  800955:	5d                   	pop    %ebp
  800956:	c3                   	ret

00800957 <memfind>:
  800957:	55                   	push   %ebp
  800958:	89 e5                	mov    %esp,%ebp
  80095a:	8b 45 08             	mov    0x8(%ebp),%eax
  80095d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800960:	89 c2                	mov    %eax,%edx
  800962:	03 55 10             	add    0x10(%ebp),%edx
  800965:	eb 03                	jmp    80096a <memfind+0x13>
  800967:	83 c0 01             	add    $0x1,%eax
  80096a:	39 d0                	cmp    %edx,%eax
  80096c:	73 04                	jae    800972 <memfind+0x1b>
  80096e:	38 08                	cmp    %cl,(%eax)
  800970:	75 f5                	jne    800967 <memfind+0x10>
  800972:	5d                   	pop    %ebp
  800973:	c3                   	ret

00800974 <strtol>:
  800974:	55                   	push   %ebp
  800975:	89 e5                	mov    %esp,%ebp
  800977:	57                   	push   %edi
  800978:	56                   	push   %esi
  800979:	53                   	push   %ebx
  80097a:	8b 55 08             	mov    0x8(%ebp),%edx
  80097d:	8b 5d 10             	mov    0x10(%ebp),%ebx
  800980:	eb 03                	jmp    800985 <strtol+0x11>
  800982:	83 c2 01             	add    $0x1,%edx
  800985:	0f b6 02             	movzbl (%edx),%eax
  800988:	3c 20                	cmp    $0x20,%al
  80098a:	74 f6                	je     800982 <strtol+0xe>
  80098c:	3c 09                	cmp    $0x9,%al
  80098e:	74 f2                	je     800982 <strtol+0xe>
  800990:	3c 2b                	cmp    $0x2b,%al
  800992:	74 2a                	je     8009be <strtol+0x4a>
  800994:	bf 00 00 00 00       	mov    $0x0,%edi
  800999:	3c 2d                	cmp    $0x2d,%al
  80099b:	74 2b                	je     8009c8 <strtol+0x54>
  80099d:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  8009a3:	75 0f                	jne    8009b4 <strtol+0x40>
  8009a5:	80 3a 30             	cmpb   $0x30,(%edx)
  8009a8:	74 28                	je     8009d2 <strtol+0x5e>
  8009aa:	85 db                	test   %ebx,%ebx
  8009ac:	b8 0a 00 00 00       	mov    $0xa,%eax
  8009b1:	0f 44 d8             	cmove  %eax,%ebx
  8009b4:	b9 00 00 00 00       	mov    $0x0,%ecx
  8009b9:	89 5d 10             	mov    %ebx,0x10(%ebp)
  8009bc:	eb 46                	jmp    800a04 <strtol+0x90>
  8009be:	83 c2 01             	add    $0x1,%edx
  8009c1:	bf 00 00 00 00       	mov    $0x0,%edi
  8009c6:	eb d5                	jmp    80099d <strtol+0x29>
  8009c8:	83 c2 01             	add    $0x1,%edx
  8009cb:	bf 01 00 00 00       	mov    $0x1,%edi
  8009d0:	eb cb                	jmp    80099d <strtol+0x29>
  8009d2:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  8009d6:	74 0e                	je     8009e6 <strtol+0x72>
  8009d8:	85 db                	test   %ebx,%ebx
  8009da:	75 d8                	jne    8009b4 <strtol+0x40>
  8009dc:	83 c2 01             	add    $0x1,%edx
  8009df:	bb 08 00 00 00       	mov    $0x8,%ebx
  8009e4:	eb ce                	jmp    8009b4 <strtol+0x40>
  8009e6:	83 c2 02             	add    $0x2,%edx
  8009e9:	bb 10 00 00 00       	mov    $0x10,%ebx
  8009ee:	eb c4                	jmp    8009b4 <strtol+0x40>
  8009f0:	0f be c0             	movsbl %al,%eax
  8009f3:	83 e8 30             	sub    $0x30,%eax
  8009f6:	3b 45 10             	cmp    0x10(%ebp),%eax
  8009f9:	7d 3a                	jge    800a35 <strtol+0xc1>
  8009fb:	83 c2 01             	add    $0x1,%edx
  8009fe:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  800a02:	01 c1                	add    %eax,%ecx
  800a04:	0f b6 02             	movzbl (%edx),%eax
  800a07:	8d 70 d0             	lea    -0x30(%eax),%esi
  800a0a:	89 f3                	mov    %esi,%ebx
  800a0c:	80 fb 09             	cmp    $0x9,%bl
  800a0f:	76 df                	jbe    8009f0 <strtol+0x7c>
  800a11:	8d 70 9f             	lea    -0x61(%eax),%esi
  800a14:	89 f3                	mov    %esi,%ebx
  800a16:	80 fb 19             	cmp    $0x19,%bl
  800a19:	77 08                	ja     800a23 <strtol+0xaf>
  800a1b:	0f be c0             	movsbl %al,%eax
  800a1e:	83 e8 57             	sub    $0x57,%eax
  800a21:	eb d3                	jmp    8009f6 <strtol+0x82>
  800a23:	8d 70 bf             	lea    -0x41(%eax),%esi
  800a26:	89 f3                	mov    %esi,%ebx
  800a28:	80 fb 19             	cmp    $0x19,%bl
  800a2b:	77 08                	ja     800a35 <strtol+0xc1>
  800a2d:	0f be c0             	movsbl %al,%eax
  800a30:	83 e8 37             	sub    $0x37,%eax
  800a33:	eb c1                	jmp    8009f6 <strtol+0x82>
  800a35:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  800a39:	74 05                	je     800a40 <strtol+0xcc>
  800a3b:	8b 45 0c             	mov    0xc(%ebp),%eax
  800a3e:	89 10                	mov    %edx,(%eax)
  800a40:	89 c8                	mov    %ecx,%eax
  800a42:	f7 d8                	neg    %eax
  800a44:	85 ff                	test   %edi,%edi
  800a46:	0f 45 c8             	cmovne %eax,%ecx
  800a49:	89 c8                	mov    %ecx,%eax
  800a4b:	5b                   	pop    %ebx
  800a4c:	5e                   	pop    %esi
  800a4d:	5f                   	pop    %edi
  800a4e:	5d                   	pop    %ebp
  800a4f:	c3                   	ret

00800a50 <syscall>:
  800a50:	55                   	push   %ebp
  800a51:	89 e5                	mov    %esp,%ebp
  800a53:	57                   	push   %edi
  800a54:	56                   	push   %esi
  800a55:	53                   	push   %ebx
  800a56:	83 ec 1c             	sub    $0x1c,%esp
  800a59:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800a5c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  800a5f:	89 ca                	mov    %ecx,%edx
  800a61:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a64:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800a67:	8b 7d 10             	mov    0x10(%ebp),%edi
  800a6a:	8b 75 14             	mov    0x14(%ebp),%esi
  800a6d:	cd 30                	int    $0x30
  800a6f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  800a73:	74 04                	je     800a79 <syscall+0x29>
  800a75:	85 c0                	test   %eax,%eax
  800a77:	7f 08                	jg     800a81 <syscall+0x31>
  800a79:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800a7c:	5b                   	pop    %ebx
  800a7d:	5e                   	pop    %esi
  800a7e:	5f                   	pop    %edi
  800a7f:	5d                   	pop    %ebp
  800a80:	c3                   	ret
  800a81:	83 ec 0c             	sub    $0xc,%esp
  800a84:	50                   	push   %eax
  800a85:	ff 75 e0             	push   -0x20(%ebp)
  800a88:	68 97 14 80 00       	push   $0x801497
  800a8d:	6a 1e                	push   $0x1e
  800a8f:	68 b4 14 80 00       	push   $0x8014b4
  800a94:	e8 11 06 00 00       	call   8010aa <_panic>

00800a99 <sys_cputs>:
  800a99:	55                   	push   %ebp
  800a9a:	89 e5                	mov    %esp,%ebp
  800a9c:	83 ec 08             	sub    $0x8,%esp
  800a9f:	6a 00                	push   $0x0
  800aa1:	6a 00                	push   $0x0
  800aa3:	6a 00                	push   $0x0
  800aa5:	ff 75 0c             	push   0xc(%ebp)
  800aa8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800aab:	ba 00 00 00 00       	mov    $0x0,%edx
  800ab0:	b8 00 00 00 00       	mov    $0x0,%eax
  800ab5:	e8 96 ff ff ff       	call   800a50 <syscall>
  800aba:	83 c4 10             	add    $0x10,%esp
  800abd:	c9                   	leave
  800abe:	c3                   	ret

00800abf <sys_cgetc>:
  800abf:	55                   	push   %ebp
  800ac0:	89 e5                	mov    %esp,%ebp
  800ac2:	83 ec 08             	sub    $0x8,%esp
  800ac5:	6a 00                	push   $0x0
  800ac7:	6a 00                	push   $0x0
  800ac9:	6a 00                	push   $0x0
  800acb:	6a 00                	push   $0x0
  800acd:	b9 00 00 00 00       	mov    $0x0,%ecx
  800ad2:	ba 00 00 00 00       	mov    $0x0,%edx
  800ad7:	b8 01 00 00 00       	mov    $0x1,%eax
  800adc:	e8 6f ff ff ff       	call   800a50 <syscall>
  800ae1:	c9                   	leave
  800ae2:	c3                   	ret

00800ae3 <sys_env_destroy>:
  800ae3:	55                   	push   %ebp
  800ae4:	89 e5                	mov    %esp,%ebp
  800ae6:	83 ec 08             	sub    $0x8,%esp
  800ae9:	6a 00                	push   $0x0
  800aeb:	6a 00                	push   $0x0
  800aed:	6a 00                	push   $0x0
  800aef:	6a 00                	push   $0x0
  800af1:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800af4:	ba 01 00 00 00       	mov    $0x1,%edx
  800af9:	b8 03 00 00 00       	mov    $0x3,%eax
  800afe:	e8 4d ff ff ff       	call   800a50 <syscall>
  800b03:	c9                   	leave
  800b04:	c3                   	ret

00800b05 <sys_getenvid>:
  800b05:	55                   	push   %ebp
  800b06:	89 e5                	mov    %esp,%ebp
  800b08:	83 ec 08             	sub    $0x8,%esp
  800b0b:	6a 00                	push   $0x0
  800b0d:	6a 00                	push   $0x0
  800b0f:	6a 00                	push   $0x0
  800b11:	6a 00                	push   $0x0
  800b13:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b18:	ba 00 00 00 00       	mov    $0x0,%edx
  800b1d:	b8 02 00 00 00       	mov    $0x2,%eax
  800b22:	e8 29 ff ff ff       	call   800a50 <syscall>
  800b27:	c9                   	leave
  800b28:	c3                   	ret

00800b29 <sys_yield>:
  800b29:	55                   	push   %ebp
  800b2a:	89 e5                	mov    %esp,%ebp
  800b2c:	83 ec 08             	sub    $0x8,%esp
  800b2f:	6a 00                	push   $0x0
  800b31:	6a 00                	push   $0x0
  800b33:	6a 00                	push   $0x0
  800b35:	6a 00                	push   $0x0
  800b37:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b3c:	ba 00 00 00 00       	mov    $0x0,%edx
  800b41:	b8 0a 00 00 00       	mov    $0xa,%eax
  800b46:	e8 05 ff ff ff       	call   800a50 <syscall>
  800b4b:	83 c4 10             	add    $0x10,%esp
  800b4e:	c9                   	leave
  800b4f:	c3                   	ret

00800b50 <sys_page_alloc>:
  800b50:	55                   	push   %ebp
  800b51:	89 e5                	mov    %esp,%ebp
  800b53:	83 ec 08             	sub    $0x8,%esp
  800b56:	6a 00                	push   $0x0
  800b58:	6a 00                	push   $0x0
  800b5a:	ff 75 10             	push   0x10(%ebp)
  800b5d:	ff 75 0c             	push   0xc(%ebp)
  800b60:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b63:	ba 01 00 00 00       	mov    $0x1,%edx
  800b68:	b8 04 00 00 00       	mov    $0x4,%eax
  800b6d:	e8 de fe ff ff       	call   800a50 <syscall>
  800b72:	c9                   	leave
  800b73:	c3                   	ret

00800b74 <sys_page_map>:
  800b74:	55                   	push   %ebp
  800b75:	89 e5                	mov    %esp,%ebp
  800b77:	83 ec 08             	sub    $0x8,%esp
  800b7a:	ff 75 18             	push   0x18(%ebp)
  800b7d:	ff 75 14             	push   0x14(%ebp)
  800b80:	ff 75 10             	push   0x10(%ebp)
  800b83:	ff 75 0c             	push   0xc(%ebp)
  800b86:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b89:	ba 01 00 00 00       	mov    $0x1,%edx
  800b8e:	b8 05 00 00 00       	mov    $0x5,%eax
  800b93:	e8 b8 fe ff ff       	call   800a50 <syscall>
  800b98:	c9                   	leave
  800b99:	c3                   	ret

00800b9a <sys_page_unmap>:
  800b9a:	55                   	push   %ebp
  800b9b:	89 e5                	mov    %esp,%ebp
  800b9d:	83 ec 08             	sub    $0x8,%esp
  800ba0:	6a 00                	push   $0x0
  800ba2:	6a 00                	push   $0x0
  800ba4:	6a 00                	push   $0x0
  800ba6:	ff 75 0c             	push   0xc(%ebp)
  800ba9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bac:	ba 01 00 00 00       	mov    $0x1,%edx
  800bb1:	b8 06 00 00 00       	mov    $0x6,%eax
  800bb6:	e8 95 fe ff ff       	call   800a50 <syscall>
  800bbb:	c9                   	leave
  800bbc:	c3                   	ret

00800bbd <sys_env_set_status>:
  800bbd:	55                   	push   %ebp
  800bbe:	89 e5                	mov    %esp,%ebp
  800bc0:	83 ec 08             	sub    $0x8,%esp
  800bc3:	6a 00                	push   $0x0
  800bc5:	6a 00                	push   $0x0
  800bc7:	6a 00                	push   $0x0
  800bc9:	ff 75 0c             	push   0xc(%ebp)
  800bcc:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bcf:	ba 01 00 00 00       	mov    $0x1,%edx
  800bd4:	b8 08 00 00 00       	mov    $0x8,%eax
  800bd9:	e8 72 fe ff ff       	call   800a50 <syscall>
  800bde:	c9                   	leave
  800bdf:	c3                   	ret

00800be0 <sys_env_set_pgfault_upcall>:
  800be0:	55                   	push   %ebp
  800be1:	89 e5                	mov    %esp,%ebp
  800be3:	83 ec 08             	sub    $0x8,%esp
  800be6:	6a 00                	push   $0x0
  800be8:	6a 00                	push   $0x0
  800bea:	6a 00                	push   $0x0
  800bec:	ff 75 0c             	push   0xc(%ebp)
  800bef:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bf2:	ba 01 00 00 00       	mov    $0x1,%edx
  800bf7:	b8 09 00 00 00       	mov    $0x9,%eax
  800bfc:	e8 4f fe ff ff       	call   800a50 <syscall>
  800c01:	c9                   	leave
  800c02:	c3                   	ret

00800c03 <sys_ipc_try_send>:
  800c03:	55                   	push   %ebp
  800c04:	89 e5                	mov    %esp,%ebp
  800c06:	83 ec 08             	sub    $0x8,%esp
  800c09:	6a 00                	push   $0x0
  800c0b:	ff 75 14             	push   0x14(%ebp)
  800c0e:	ff 75 10             	push   0x10(%ebp)
  800c11:	ff 75 0c             	push   0xc(%ebp)
  800c14:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c17:	ba 00 00 00 00       	mov    $0x0,%edx
  800c1c:	b8 0c 00 00 00       	mov    $0xc,%eax
  800c21:	e8 2a fe ff ff       	call   800a50 <syscall>
  800c26:	c9                   	leave
  800c27:	c3                   	ret

00800c28 <sys_ipc_recv>:
  800c28:	55                   	push   %ebp
  800c29:	89 e5                	mov    %esp,%ebp
  800c2b:	83 ec 08             	sub    $0x8,%esp
  800c2e:	6a 00                	push   $0x0
  800c30:	6a 00                	push   $0x0
  800c32:	6a 00                	push   $0x0
  800c34:	6a 00                	push   $0x0
  800c36:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c39:	ba 01 00 00 00       	mov    $0x1,%edx
  800c3e:	b8 0d 00 00 00       	mov    $0xd,%eax
  800c43:	e8 08 fe ff ff       	call   800a50 <syscall>
  800c48:	c9                   	leave
  800c49:	c3                   	ret

00800c4a <duppage>:
  800c4a:	55                   	push   %ebp
  800c4b:	89 e5                	mov    %esp,%ebp
  800c4d:	56                   	push   %esi
  800c4e:	53                   	push   %ebx
  800c4f:	89 c1                	mov    %eax,%ecx
  800c51:	89 d6                	mov    %edx,%esi
  800c53:	c1 e6 0c             	shl    $0xc,%esi
  800c56:	8b 14 95 00 00 40 ef 	mov    -0x10c00000(,%edx,4),%edx
  800c5d:	89 d0                	mov    %edx,%eax
  800c5f:	f7 d0                	not    %eax
  800c61:	a8 05                	test   $0x5,%al
  800c63:	75 5a                	jne    800cbf <duppage+0x75>
  800c65:	89 d0                	mov    %edx,%eax
  800c67:	83 e0 18             	and    $0x18,%eax
  800c6a:	83 f8 01             	cmp    $0x1,%eax
  800c6d:	19 c0                	sbb    %eax,%eax
  800c6f:	83 e0 e8             	and    $0xffffffe8,%eax
  800c72:	83 c0 1d             	add    $0x1d,%eax
  800c75:	f7 c2 02 08 00 00    	test   $0x802,%edx
  800c7b:	74 68                	je     800ce5 <duppage+0x9b>
  800c7d:	80 cc 08             	or     $0x8,%ah
  800c80:	89 c3                	mov    %eax,%ebx
  800c82:	83 ec 0c             	sub    $0xc,%esp
  800c85:	53                   	push   %ebx
  800c86:	56                   	push   %esi
  800c87:	51                   	push   %ecx
  800c88:	56                   	push   %esi
  800c89:	6a 00                	push   $0x0
  800c8b:	e8 e4 fe ff ff       	call   800b74 <sys_page_map>
  800c90:	83 c4 20             	add    $0x20,%esp
  800c93:	85 c0                	test   %eax,%eax
  800c95:	78 3c                	js     800cd3 <duppage+0x89>
  800c97:	83 ec 0c             	sub    $0xc,%esp
  800c9a:	53                   	push   %ebx
  800c9b:	56                   	push   %esi
  800c9c:	6a 00                	push   $0x0
  800c9e:	56                   	push   %esi
  800c9f:	6a 00                	push   $0x0
  800ca1:	e8 ce fe ff ff       	call   800b74 <sys_page_map>
  800ca6:	83 c4 20             	add    $0x20,%esp
  800ca9:	85 c0                	test   %eax,%eax
  800cab:	79 4d                	jns    800cfa <duppage+0xb0>
  800cad:	50                   	push   %eax
  800cae:	68 40 17 80 00       	push   $0x801740
  800cb3:	6a 57                	push   $0x57
  800cb5:	68 c2 14 80 00       	push   $0x8014c2
  800cba:	e8 eb 03 00 00       	call   8010aa <_panic>
  800cbf:	83 ec 04             	sub    $0x4,%esp
  800cc2:	68 e4 16 80 00       	push   $0x8016e4
  800cc7:	6a 47                	push   $0x47
  800cc9:	68 c2 14 80 00       	push   $0x8014c2
  800cce:	e8 d7 03 00 00       	call   8010aa <_panic>
  800cd3:	50                   	push   %eax
  800cd4:	68 14 17 80 00       	push   $0x801714
  800cd9:	6a 53                	push   $0x53
  800cdb:	68 c2 14 80 00       	push   $0x8014c2
  800ce0:	e8 c5 03 00 00       	call   8010aa <_panic>
  800ce5:	83 ec 0c             	sub    $0xc,%esp
  800ce8:	50                   	push   %eax
  800ce9:	56                   	push   %esi
  800cea:	51                   	push   %ecx
  800ceb:	56                   	push   %esi
  800cec:	6a 00                	push   $0x0
  800cee:	e8 81 fe ff ff       	call   800b74 <sys_page_map>
  800cf3:	83 c4 20             	add    $0x20,%esp
  800cf6:	85 c0                	test   %eax,%eax
  800cf8:	78 0c                	js     800d06 <duppage+0xbc>
  800cfa:	b8 00 00 00 00       	mov    $0x0,%eax
  800cff:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800d02:	5b                   	pop    %ebx
  800d03:	5e                   	pop    %esi
  800d04:	5d                   	pop    %ebp
  800d05:	c3                   	ret
  800d06:	50                   	push   %eax
  800d07:	68 68 17 80 00       	push   $0x801768
  800d0c:	6a 5b                	push   $0x5b
  800d0e:	68 c2 14 80 00       	push   $0x8014c2
  800d13:	e8 92 03 00 00       	call   8010aa <_panic>

00800d18 <dup_or_share>:
  800d18:	55                   	push   %ebp
  800d19:	89 e5                	mov    %esp,%ebp
  800d1b:	57                   	push   %edi
  800d1c:	56                   	push   %esi
  800d1d:	53                   	push   %ebx
  800d1e:	83 ec 0c             	sub    $0xc,%esp
  800d21:	89 c7                	mov    %eax,%edi
  800d23:	8b 04 95 00 00 40 ef 	mov    -0x10c00000(,%edx,4),%eax
  800d2a:	a8 01                	test   $0x1,%al
  800d2c:	74 33                	je     800d61 <dup_or_share+0x49>
  800d2e:	89 d6                	mov    %edx,%esi
  800d30:	21 c1                	and    %eax,%ecx
  800d32:	89 cb                	mov    %ecx,%ebx
  800d34:	83 e3 02             	and    $0x2,%ebx
  800d37:	89 da                	mov    %ebx,%edx
  800d39:	83 ca 18             	or     $0x18,%edx
  800d3c:	a8 18                	test   $0x18,%al
  800d3e:	0f 45 da             	cmovne %edx,%ebx
  800d41:	c1 e6 0c             	shl    $0xc,%esi
  800d44:	83 e0 1a             	and    $0x1a,%eax
  800d47:	83 f8 02             	cmp    $0x2,%eax
  800d4a:	74 32                	je     800d7e <dup_or_share+0x66>
  800d4c:	83 ec 0c             	sub    $0xc,%esp
  800d4f:	53                   	push   %ebx
  800d50:	56                   	push   %esi
  800d51:	57                   	push   %edi
  800d52:	56                   	push   %esi
  800d53:	6a 00                	push   $0x0
  800d55:	e8 1a fe ff ff       	call   800b74 <sys_page_map>
  800d5a:	83 c4 20             	add    $0x20,%esp
  800d5d:	85 c0                	test   %eax,%eax
  800d5f:	78 08                	js     800d69 <dup_or_share+0x51>
  800d61:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800d64:	5b                   	pop    %ebx
  800d65:	5e                   	pop    %esi
  800d66:	5f                   	pop    %edi
  800d67:	5d                   	pop    %ebp
  800d68:	c3                   	ret
  800d69:	50                   	push   %eax
  800d6a:	68 94 17 80 00       	push   $0x801794
  800d6f:	68 84 00 00 00       	push   $0x84
  800d74:	68 c2 14 80 00       	push   $0x8014c2
  800d79:	e8 2c 03 00 00       	call   8010aa <_panic>
  800d7e:	83 ec 04             	sub    $0x4,%esp
  800d81:	53                   	push   %ebx
  800d82:	56                   	push   %esi
  800d83:	57                   	push   %edi
  800d84:	e8 c7 fd ff ff       	call   800b50 <sys_page_alloc>
  800d89:	83 c4 10             	add    $0x10,%esp
  800d8c:	85 c0                	test   %eax,%eax
  800d8e:	78 57                	js     800de7 <dup_or_share+0xcf>
  800d90:	83 ec 0c             	sub    $0xc,%esp
  800d93:	53                   	push   %ebx
  800d94:	68 00 00 40 00       	push   $0x400000
  800d99:	6a 00                	push   $0x0
  800d9b:	56                   	push   %esi
  800d9c:	57                   	push   %edi
  800d9d:	e8 d2 fd ff ff       	call   800b74 <sys_page_map>
  800da2:	83 c4 20             	add    $0x20,%esp
  800da5:	85 c0                	test   %eax,%eax
  800da7:	78 53                	js     800dfc <dup_or_share+0xe4>
  800da9:	83 ec 04             	sub    $0x4,%esp
  800dac:	68 00 10 00 00       	push   $0x1000
  800db1:	56                   	push   %esi
  800db2:	68 00 00 40 00       	push   $0x400000
  800db7:	e8 ea fa ff ff       	call   8008a6 <memmove>
  800dbc:	83 c4 08             	add    $0x8,%esp
  800dbf:	68 00 00 40 00       	push   $0x400000
  800dc4:	6a 00                	push   $0x0
  800dc6:	e8 cf fd ff ff       	call   800b9a <sys_page_unmap>
  800dcb:	83 c4 10             	add    $0x10,%esp
  800dce:	85 c0                	test   %eax,%eax
  800dd0:	79 8f                	jns    800d61 <dup_or_share+0x49>
  800dd2:	50                   	push   %eax
  800dd3:	68 0c 15 80 00       	push   $0x80150c
  800dd8:	68 8d 00 00 00       	push   $0x8d
  800ddd:	68 c2 14 80 00       	push   $0x8014c2
  800de2:	e8 c3 02 00 00       	call   8010aa <_panic>
  800de7:	50                   	push   %eax
  800de8:	68 b4 17 80 00       	push   $0x8017b4
  800ded:	68 88 00 00 00       	push   $0x88
  800df2:	68 c2 14 80 00       	push   $0x8014c2
  800df7:	e8 ae 02 00 00       	call   8010aa <_panic>
  800dfc:	50                   	push   %eax
  800dfd:	68 94 17 80 00       	push   $0x801794
  800e02:	68 8a 00 00 00       	push   $0x8a
  800e07:	68 c2 14 80 00       	push   $0x8014c2
  800e0c:	e8 99 02 00 00       	call   8010aa <_panic>

00800e11 <pgfault>:
  800e11:	55                   	push   %ebp
  800e12:	89 e5                	mov    %esp,%ebp
  800e14:	53                   	push   %ebx
  800e15:	83 ec 08             	sub    $0x8,%esp
  800e18:	8b 45 08             	mov    0x8(%ebp),%eax
  800e1b:	8b 18                	mov    (%eax),%ebx
  800e1d:	89 d8                	mov    %ebx,%eax
  800e1f:	c1 e8 0c             	shr    $0xc,%eax
  800e22:	8b 04 85 00 00 40 ef 	mov    -0x10c00000(,%eax,4),%eax
  800e29:	6a 07                	push   $0x7
  800e2b:	68 00 f0 7f 00       	push   $0x7ff000
  800e30:	6a 00                	push   $0x0
  800e32:	e8 19 fd ff ff       	call   800b50 <sys_page_alloc>
  800e37:	83 c4 10             	add    $0x10,%esp
  800e3a:	85 c0                	test   %eax,%eax
  800e3c:	78 51                	js     800e8f <pgfault+0x7e>
  800e3e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  800e44:	83 ec 04             	sub    $0x4,%esp
  800e47:	68 00 10 00 00       	push   $0x1000
  800e4c:	53                   	push   %ebx
  800e4d:	68 00 f0 7f 00       	push   $0x7ff000
  800e52:	e8 4f fa ff ff       	call   8008a6 <memmove>
  800e57:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
  800e5e:	53                   	push   %ebx
  800e5f:	6a 00                	push   $0x0
  800e61:	68 00 f0 7f 00       	push   $0x7ff000
  800e66:	6a 00                	push   $0x0
  800e68:	e8 07 fd ff ff       	call   800b74 <sys_page_map>
  800e6d:	83 c4 20             	add    $0x20,%esp
  800e70:	85 c0                	test   %eax,%eax
  800e72:	78 2d                	js     800ea1 <pgfault+0x90>
  800e74:	83 ec 08             	sub    $0x8,%esp
  800e77:	68 00 f0 7f 00       	push   $0x7ff000
  800e7c:	6a 00                	push   $0x0
  800e7e:	e8 17 fd ff ff       	call   800b9a <sys_page_unmap>
  800e83:	83 c4 10             	add    $0x10,%esp
  800e86:	85 c0                	test   %eax,%eax
  800e88:	78 29                	js     800eb3 <pgfault+0xa2>
  800e8a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800e8d:	c9                   	leave
  800e8e:	c3                   	ret
  800e8f:	50                   	push   %eax
  800e90:	68 cd 14 80 00       	push   $0x8014cd
  800e95:	6a 27                	push   $0x27
  800e97:	68 c2 14 80 00       	push   $0x8014c2
  800e9c:	e8 09 02 00 00       	call   8010aa <_panic>
  800ea1:	50                   	push   %eax
  800ea2:	68 e9 14 80 00       	push   $0x8014e9
  800ea7:	6a 2c                	push   $0x2c
  800ea9:	68 c2 14 80 00       	push   $0x8014c2
  800eae:	e8 f7 01 00 00       	call   8010aa <_panic>
  800eb3:	50                   	push   %eax
  800eb4:	68 03 15 80 00       	push   $0x801503
  800eb9:	6a 2f                	push   $0x2f
  800ebb:	68 c2 14 80 00       	push   $0x8014c2
  800ec0:	e8 e5 01 00 00       	call   8010aa <_panic>

00800ec5 <fork_v0>:
  800ec5:	55                   	push   %ebp
  800ec6:	89 e5                	mov    %esp,%ebp
  800ec8:	56                   	push   %esi
  800ec9:	53                   	push   %ebx
  800eca:	b8 07 00 00 00       	mov    $0x7,%eax
  800ecf:	cd 30                	int    $0x30
  800ed1:	89 c6                	mov    %eax,%esi
  800ed3:	85 c0                	test   %eax,%eax
  800ed5:	78 23                	js     800efa <fork_v0+0x35>
  800ed7:	bb 00 00 00 00       	mov    $0x0,%ebx
  800edc:	75 3c                	jne    800f1a <fork_v0+0x55>
  800ede:	e8 22 fc ff ff       	call   800b05 <sys_getenvid>
  800ee3:	25 ff 03 00 00       	and    $0x3ff,%eax
  800ee8:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800eee:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800ef3:	a3 04 20 80 00       	mov    %eax,0x802004
  800ef8:	eb 54                	jmp    800f4e <fork_v0+0x89>
  800efa:	50                   	push   %eax
  800efb:	68 1f 15 80 00       	push   $0x80151f
  800f00:	68 a2 00 00 00       	push   $0xa2
  800f05:	68 c2 14 80 00       	push   $0x8014c2
  800f0a:	e8 9b 01 00 00       	call   8010aa <_panic>
  800f0f:	83 c3 01             	add    $0x1,%ebx
  800f12:	81 fb 00 ec 0e 00    	cmp    $0xeec00,%ebx
  800f18:	74 22                	je     800f3c <fork_v0+0x77>
  800f1a:	89 d8                	mov    %ebx,%eax
  800f1c:	c1 e8 0a             	shr    $0xa,%eax
  800f1f:	8b 04 85 00 d0 7b ef 	mov    -0x10843000(,%eax,4),%eax
  800f26:	f7 d0                	not    %eax
  800f28:	a8 05                	test   $0x5,%al
  800f2a:	75 e3                	jne    800f0f <fork_v0+0x4a>
  800f2c:	b9 07 00 00 00       	mov    $0x7,%ecx
  800f31:	89 da                	mov    %ebx,%edx
  800f33:	89 f0                	mov    %esi,%eax
  800f35:	e8 de fd ff ff       	call   800d18 <dup_or_share>
  800f3a:	eb d3                	jmp    800f0f <fork_v0+0x4a>
  800f3c:	83 ec 08             	sub    $0x8,%esp
  800f3f:	6a 02                	push   $0x2
  800f41:	56                   	push   %esi
  800f42:	e8 76 fc ff ff       	call   800bbd <sys_env_set_status>
  800f47:	83 c4 10             	add    $0x10,%esp
  800f4a:	85 c0                	test   %eax,%eax
  800f4c:	78 09                	js     800f57 <fork_v0+0x92>
  800f4e:	89 f0                	mov    %esi,%eax
  800f50:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800f53:	5b                   	pop    %ebx
  800f54:	5e                   	pop    %esi
  800f55:	5d                   	pop    %ebp
  800f56:	c3                   	ret
  800f57:	50                   	push   %eax
  800f58:	68 2f 15 80 00       	push   $0x80152f
  800f5d:	68 b8 00 00 00       	push   $0xb8
  800f62:	68 c2 14 80 00       	push   $0x8014c2
  800f67:	e8 3e 01 00 00       	call   8010aa <_panic>

00800f6c <fork>:
  800f6c:	55                   	push   %ebp
  800f6d:	89 e5                	mov    %esp,%ebp
  800f6f:	56                   	push   %esi
  800f70:	53                   	push   %ebx
  800f71:	83 ec 0c             	sub    $0xc,%esp
  800f74:	68 11 0e 80 00       	push   $0x800e11
  800f79:	e8 72 01 00 00       	call   8010f0 <set_pgfault_handler>
  800f7e:	b8 07 00 00 00       	mov    $0x7,%eax
  800f83:	cd 30                	int    $0x30
  800f85:	89 c6                	mov    %eax,%esi
  800f87:	83 c4 10             	add    $0x10,%esp
  800f8a:	85 c0                	test   %eax,%eax
  800f8c:	78 26                	js     800fb4 <fork+0x48>
  800f8e:	bb 00 00 00 00       	mov    $0x0,%ebx
  800f93:	75 47                	jne    800fdc <fork+0x70>
  800f95:	e8 6b fb ff ff       	call   800b05 <sys_getenvid>
  800f9a:	25 ff 03 00 00       	and    $0x3ff,%eax
  800f9f:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800fa5:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800faa:	a3 04 20 80 00       	mov    %eax,0x802004
  800faf:	e9 94 00 00 00       	jmp    801048 <fork+0xdc>
  800fb4:	50                   	push   %eax
  800fb5:	68 1f 15 80 00       	push   $0x80151f
  800fba:	68 d5 00 00 00       	push   $0xd5
  800fbf:	68 c2 14 80 00       	push   $0x8014c2
  800fc4:	e8 e1 00 00 00       	call   8010aa <_panic>
  800fc9:	83 c3 01             	add    $0x1,%ebx
  800fcc:	81 fb 00 ec 0e 00    	cmp    $0xeec00,%ebx
  800fd2:	74 32                	je     801006 <fork+0x9a>
  800fd4:	81 fb ff eb 0e 00    	cmp    $0xeebff,%ebx
  800fda:	74 ed                	je     800fc9 <fork+0x5d>
  800fdc:	89 d8                	mov    %ebx,%eax
  800fde:	c1 e8 0a             	shr    $0xa,%eax
  800fe1:	8b 04 85 00 d0 7b ef 	mov    -0x10843000(,%eax,4),%eax
  800fe8:	f7 d0                	not    %eax
  800fea:	a8 05                	test   $0x5,%al
  800fec:	75 db                	jne    800fc9 <fork+0x5d>
  800fee:	8b 04 9d 00 00 40 ef 	mov    -0x10c00000(,%ebx,4),%eax
  800ff5:	f7 d0                	not    %eax
  800ff7:	a8 05                	test   $0x5,%al
  800ff9:	75 ce                	jne    800fc9 <fork+0x5d>
  800ffb:	89 da                	mov    %ebx,%edx
  800ffd:	89 f0                	mov    %esi,%eax
  800fff:	e8 46 fc ff ff       	call   800c4a <duppage>
  801004:	eb c3                	jmp    800fc9 <fork+0x5d>
  801006:	83 ec 04             	sub    $0x4,%esp
  801009:	6a 07                	push   $0x7
  80100b:	68 00 f0 bf ee       	push   $0xeebff000
  801010:	56                   	push   %esi
  801011:	e8 3a fb ff ff       	call   800b50 <sys_page_alloc>
  801016:	83 c4 10             	add    $0x10,%esp
  801019:	85 c0                	test   %eax,%eax
  80101b:	78 34                	js     801051 <fork+0xe5>
  80101d:	a1 04 20 80 00       	mov    0x802004,%eax
  801022:	8b 40 64             	mov    0x64(%eax),%eax
  801025:	83 ec 08             	sub    $0x8,%esp
  801028:	50                   	push   %eax
  801029:	56                   	push   %esi
  80102a:	e8 b1 fb ff ff       	call   800be0 <sys_env_set_pgfault_upcall>
  80102f:	83 c4 10             	add    $0x10,%esp
  801032:	85 c0                	test   %eax,%eax
  801034:	78 30                	js     801066 <fork+0xfa>
  801036:	83 ec 08             	sub    $0x8,%esp
  801039:	6a 02                	push   $0x2
  80103b:	56                   	push   %esi
  80103c:	e8 7c fb ff ff       	call   800bbd <sys_env_set_status>
  801041:	83 c4 10             	add    $0x10,%esp
  801044:	85 c0                	test   %eax,%eax
  801046:	78 33                	js     80107b <fork+0x10f>
  801048:	89 f0                	mov    %esi,%eax
  80104a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  80104d:	5b                   	pop    %ebx
  80104e:	5e                   	pop    %esi
  80104f:	5d                   	pop    %ebp
  801050:	c3                   	ret
  801051:	50                   	push   %eax
  801052:	68 d8 17 80 00       	push   $0x8017d8
  801057:	68 f2 00 00 00       	push   $0xf2
  80105c:	68 c2 14 80 00       	push   $0x8014c2
  801061:	e8 44 00 00 00       	call   8010aa <_panic>
  801066:	50                   	push   %eax
  801067:	68 04 18 80 00       	push   $0x801804
  80106c:	68 f5 00 00 00       	push   $0xf5
  801071:	68 c2 14 80 00       	push   $0x8014c2
  801076:	e8 2f 00 00 00       	call   8010aa <_panic>
  80107b:	50                   	push   %eax
  80107c:	68 2f 15 80 00       	push   $0x80152f
  801081:	68 f8 00 00 00       	push   $0xf8
  801086:	68 c2 14 80 00       	push   $0x8014c2
  80108b:	e8 1a 00 00 00       	call   8010aa <_panic>

00801090 <sfork>:
  801090:	55                   	push   %ebp
  801091:	89 e5                	mov    %esp,%ebp
  801093:	83 ec 0c             	sub    $0xc,%esp
  801096:	68 46 15 80 00       	push   $0x801546
  80109b:	68 01 01 00 00       	push   $0x101
  8010a0:	68 c2 14 80 00       	push   $0x8014c2
  8010a5:	e8 00 00 00 00       	call   8010aa <_panic>

008010aa <_panic>:
  8010aa:	55                   	push   %ebp
  8010ab:	89 e5                	mov    %esp,%ebp
  8010ad:	56                   	push   %esi
  8010ae:	53                   	push   %ebx
  8010af:	8d 5d 14             	lea    0x14(%ebp),%ebx
  8010b2:	8b 35 00 20 80 00    	mov    0x802000,%esi
  8010b8:	e8 48 fa ff ff       	call   800b05 <sys_getenvid>
  8010bd:	83 ec 0c             	sub    $0xc,%esp
  8010c0:	ff 75 0c             	push   0xc(%ebp)
  8010c3:	ff 75 08             	push   0x8(%ebp)
  8010c6:	56                   	push   %esi
  8010c7:	50                   	push   %eax
  8010c8:	68 38 18 80 00       	push   $0x801838
  8010cd:	e8 05 f1 ff ff       	call   8001d7 <cprintf>
  8010d2:	83 c4 18             	add    $0x18,%esp
  8010d5:	53                   	push   %ebx
  8010d6:	ff 75 10             	push   0x10(%ebp)
  8010d9:	e8 a8 f0 ff ff       	call   800186 <vcprintf>
  8010de:	c7 04 24 cf 13 80 00 	movl   $0x8013cf,(%esp)
  8010e5:	e8 ed f0 ff ff       	call   8001d7 <cprintf>
  8010ea:	83 c4 10             	add    $0x10,%esp
  8010ed:	cc                   	int3
  8010ee:	eb fd                	jmp    8010ed <_panic+0x43>

008010f0 <set_pgfault_handler>:
  8010f0:	55                   	push   %ebp
  8010f1:	89 e5                	mov    %esp,%ebp
  8010f3:	83 ec 08             	sub    $0x8,%esp
  8010f6:	83 3d 08 20 80 00 00 	cmpl   $0x0,0x802008
  8010fd:	74 0a                	je     801109 <set_pgfault_handler+0x19>
  8010ff:	8b 45 08             	mov    0x8(%ebp),%eax
  801102:	a3 08 20 80 00       	mov    %eax,0x802008
  801107:	c9                   	leave
  801108:	c3                   	ret
  801109:	83 ec 04             	sub    $0x4,%esp
  80110c:	6a 07                	push   $0x7
  80110e:	68 00 f0 bf ee       	push   $0xeebff000
  801113:	6a 00                	push   $0x0
  801115:	e8 36 fa ff ff       	call   800b50 <sys_page_alloc>
  80111a:	83 c4 10             	add    $0x10,%esp
  80111d:	85 c0                	test   %eax,%eax
  80111f:	78 e6                	js     801107 <set_pgfault_handler+0x17>
  801121:	83 ec 08             	sub    $0x8,%esp
  801124:	68 39 11 80 00       	push   $0x801139
  801129:	6a 00                	push   $0x0
  80112b:	e8 b0 fa ff ff       	call   800be0 <sys_env_set_pgfault_upcall>
  801130:	83 c4 10             	add    $0x10,%esp
  801133:	85 c0                	test   %eax,%eax
  801135:	79 c8                	jns    8010ff <set_pgfault_handler+0xf>
  801137:	eb ce                	jmp    801107 <set_pgfault_handler+0x17>

00801139 <_pgfault_upcall>:
  801139:	54                   	push   %esp
  80113a:	a1 08 20 80 00       	mov    0x802008,%eax
  80113f:	ff d0                	call   *%eax
  801141:	83 c4 04             	add    $0x4,%esp
  801144:	8b 44 24 28          	mov    0x28(%esp),%eax
  801148:	8b 5c 24 30          	mov    0x30(%esp),%ebx
  80114c:	83 eb 04             	sub    $0x4,%ebx
  80114f:	89 03                	mov    %eax,(%ebx)
  801151:	89 5c 24 30          	mov    %ebx,0x30(%esp)
  801155:	58                   	pop    %eax
  801156:	58                   	pop    %eax
  801157:	61                   	popa
  801158:	83 c4 04             	add    $0x4,%esp
  80115b:	9d                   	popf
  80115c:	5c                   	pop    %esp
  80115d:	c3                   	ret
  80115e:	66 90                	xchg   %ax,%ax

00801160 <__udivdi3>:
  801160:	f3 0f 1e fb          	endbr32
  801164:	55                   	push   %ebp
  801165:	57                   	push   %edi
  801166:	56                   	push   %esi
  801167:	53                   	push   %ebx
  801168:	83 ec 1c             	sub    $0x1c,%esp
  80116b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  80116f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  801173:	8b 74 24 34          	mov    0x34(%esp),%esi
  801177:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  80117b:	85 c0                	test   %eax,%eax
  80117d:	75 19                	jne    801198 <__udivdi3+0x38>
  80117f:	39 de                	cmp    %ebx,%esi
  801181:	73 4d                	jae    8011d0 <__udivdi3+0x70>
  801183:	31 ff                	xor    %edi,%edi
  801185:	89 e8                	mov    %ebp,%eax
  801187:	89 f2                	mov    %esi,%edx
  801189:	f7 f3                	div    %ebx
  80118b:	89 fa                	mov    %edi,%edx
  80118d:	83 c4 1c             	add    $0x1c,%esp
  801190:	5b                   	pop    %ebx
  801191:	5e                   	pop    %esi
  801192:	5f                   	pop    %edi
  801193:	5d                   	pop    %ebp
  801194:	c3                   	ret
  801195:	8d 76 00             	lea    0x0(%esi),%esi
  801198:	39 c6                	cmp    %eax,%esi
  80119a:	73 14                	jae    8011b0 <__udivdi3+0x50>
  80119c:	31 ff                	xor    %edi,%edi
  80119e:	31 c0                	xor    %eax,%eax
  8011a0:	89 fa                	mov    %edi,%edx
  8011a2:	83 c4 1c             	add    $0x1c,%esp
  8011a5:	5b                   	pop    %ebx
  8011a6:	5e                   	pop    %esi
  8011a7:	5f                   	pop    %edi
  8011a8:	5d                   	pop    %ebp
  8011a9:	c3                   	ret
  8011aa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  8011b0:	0f bd f8             	bsr    %eax,%edi
  8011b3:	83 f7 1f             	xor    $0x1f,%edi
  8011b6:	75 48                	jne    801200 <__udivdi3+0xa0>
  8011b8:	39 f0                	cmp    %esi,%eax
  8011ba:	72 06                	jb     8011c2 <__udivdi3+0x62>
  8011bc:	31 c0                	xor    %eax,%eax
  8011be:	39 dd                	cmp    %ebx,%ebp
  8011c0:	72 de                	jb     8011a0 <__udivdi3+0x40>
  8011c2:	b8 01 00 00 00       	mov    $0x1,%eax
  8011c7:	eb d7                	jmp    8011a0 <__udivdi3+0x40>
  8011c9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8011d0:	89 d9                	mov    %ebx,%ecx
  8011d2:	85 db                	test   %ebx,%ebx
  8011d4:	75 0b                	jne    8011e1 <__udivdi3+0x81>
  8011d6:	b8 01 00 00 00       	mov    $0x1,%eax
  8011db:	31 d2                	xor    %edx,%edx
  8011dd:	f7 f3                	div    %ebx
  8011df:	89 c1                	mov    %eax,%ecx
  8011e1:	31 d2                	xor    %edx,%edx
  8011e3:	89 f0                	mov    %esi,%eax
  8011e5:	f7 f1                	div    %ecx
  8011e7:	89 c6                	mov    %eax,%esi
  8011e9:	89 e8                	mov    %ebp,%eax
  8011eb:	89 f7                	mov    %esi,%edi
  8011ed:	f7 f1                	div    %ecx
  8011ef:	89 fa                	mov    %edi,%edx
  8011f1:	83 c4 1c             	add    $0x1c,%esp
  8011f4:	5b                   	pop    %ebx
  8011f5:	5e                   	pop    %esi
  8011f6:	5f                   	pop    %edi
  8011f7:	5d                   	pop    %ebp
  8011f8:	c3                   	ret
  8011f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  801200:	89 f9                	mov    %edi,%ecx
  801202:	ba 20 00 00 00       	mov    $0x20,%edx
  801207:	29 fa                	sub    %edi,%edx
  801209:	d3 e0                	shl    %cl,%eax
  80120b:	89 44 24 08          	mov    %eax,0x8(%esp)
  80120f:	89 d1                	mov    %edx,%ecx
  801211:	89 d8                	mov    %ebx,%eax
  801213:	d3 e8                	shr    %cl,%eax
  801215:	89 c1                	mov    %eax,%ecx
  801217:	8b 44 24 08          	mov    0x8(%esp),%eax
  80121b:	09 c1                	or     %eax,%ecx
  80121d:	89 f0                	mov    %esi,%eax
  80121f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  801223:	89 f9                	mov    %edi,%ecx
  801225:	d3 e3                	shl    %cl,%ebx
  801227:	89 d1                	mov    %edx,%ecx
  801229:	d3 e8                	shr    %cl,%eax
  80122b:	89 f9                	mov    %edi,%ecx
  80122d:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  801231:	89 eb                	mov    %ebp,%ebx
  801233:	d3 e6                	shl    %cl,%esi
  801235:	89 d1                	mov    %edx,%ecx
  801237:	d3 eb                	shr    %cl,%ebx
  801239:	09 f3                	or     %esi,%ebx
  80123b:	89 c6                	mov    %eax,%esi
  80123d:	89 f2                	mov    %esi,%edx
  80123f:	89 d8                	mov    %ebx,%eax
  801241:	f7 74 24 08          	divl   0x8(%esp)
  801245:	89 d6                	mov    %edx,%esi
  801247:	89 c3                	mov    %eax,%ebx
  801249:	f7 64 24 0c          	mull   0xc(%esp)
  80124d:	39 d6                	cmp    %edx,%esi
  80124f:	72 1f                	jb     801270 <__udivdi3+0x110>
  801251:	89 f9                	mov    %edi,%ecx
  801253:	d3 e5                	shl    %cl,%ebp
  801255:	39 c5                	cmp    %eax,%ebp
  801257:	73 04                	jae    80125d <__udivdi3+0xfd>
  801259:	39 d6                	cmp    %edx,%esi
  80125b:	74 13                	je     801270 <__udivdi3+0x110>
  80125d:	89 d8                	mov    %ebx,%eax
  80125f:	31 ff                	xor    %edi,%edi
  801261:	e9 3a ff ff ff       	jmp    8011a0 <__udivdi3+0x40>
  801266:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  80126d:	00 
  80126e:	66 90                	xchg   %ax,%ax
  801270:	8d 43 ff             	lea    -0x1(%ebx),%eax
  801273:	31 ff                	xor    %edi,%edi
  801275:	e9 26 ff ff ff       	jmp    8011a0 <__udivdi3+0x40>
  80127a:	66 90                	xchg   %ax,%ax
  80127c:	66 90                	xchg   %ax,%ax
  80127e:	66 90                	xchg   %ax,%ax

00801280 <__umoddi3>:
  801280:	f3 0f 1e fb          	endbr32
  801284:	55                   	push   %ebp
  801285:	57                   	push   %edi
  801286:	56                   	push   %esi
  801287:	53                   	push   %ebx
  801288:	83 ec 1c             	sub    $0x1c,%esp
  80128b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  80128f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  801293:	8b 74 24 30          	mov    0x30(%esp),%esi
  801297:	8b 7c 24 38          	mov    0x38(%esp),%edi
  80129b:	89 da                	mov    %ebx,%edx
  80129d:	85 c0                	test   %eax,%eax
  80129f:	75 17                	jne    8012b8 <__umoddi3+0x38>
  8012a1:	39 fb                	cmp    %edi,%ebx
  8012a3:	73 53                	jae    8012f8 <__umoddi3+0x78>
  8012a5:	89 f0                	mov    %esi,%eax
  8012a7:	f7 f7                	div    %edi
  8012a9:	89 d0                	mov    %edx,%eax
  8012ab:	31 d2                	xor    %edx,%edx
  8012ad:	83 c4 1c             	add    $0x1c,%esp
  8012b0:	5b                   	pop    %ebx
  8012b1:	5e                   	pop    %esi
  8012b2:	5f                   	pop    %edi
  8012b3:	5d                   	pop    %ebp
  8012b4:	c3                   	ret
  8012b5:	8d 76 00             	lea    0x0(%esi),%esi
  8012b8:	89 f1                	mov    %esi,%ecx
  8012ba:	39 c3                	cmp    %eax,%ebx
  8012bc:	73 12                	jae    8012d0 <__umoddi3+0x50>
  8012be:	89 f0                	mov    %esi,%eax
  8012c0:	83 c4 1c             	add    $0x1c,%esp
  8012c3:	5b                   	pop    %ebx
  8012c4:	5e                   	pop    %esi
  8012c5:	5f                   	pop    %edi
  8012c6:	5d                   	pop    %ebp
  8012c7:	c3                   	ret
  8012c8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  8012cf:	00 
  8012d0:	0f bd e8             	bsr    %eax,%ebp
  8012d3:	83 f5 1f             	xor    $0x1f,%ebp
  8012d6:	75 48                	jne    801320 <__umoddi3+0xa0>
  8012d8:	39 d8                	cmp    %ebx,%eax
  8012da:	0f 82 d0 00 00 00    	jb     8013b0 <__umoddi3+0x130>
  8012e0:	39 fe                	cmp    %edi,%esi
  8012e2:	0f 83 c8 00 00 00    	jae    8013b0 <__umoddi3+0x130>
  8012e8:	89 c8                	mov    %ecx,%eax
  8012ea:	83 c4 1c             	add    $0x1c,%esp
  8012ed:	5b                   	pop    %ebx
  8012ee:	5e                   	pop    %esi
  8012ef:	5f                   	pop    %edi
  8012f0:	5d                   	pop    %ebp
  8012f1:	c3                   	ret
  8012f2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  8012f8:	89 f9                	mov    %edi,%ecx
  8012fa:	85 ff                	test   %edi,%edi
  8012fc:	75 0b                	jne    801309 <__umoddi3+0x89>
  8012fe:	b8 01 00 00 00       	mov    $0x1,%eax
  801303:	31 d2                	xor    %edx,%edx
  801305:	f7 f7                	div    %edi
  801307:	89 c1                	mov    %eax,%ecx
  801309:	89 d8                	mov    %ebx,%eax
  80130b:	31 d2                	xor    %edx,%edx
  80130d:	f7 f1                	div    %ecx
  80130f:	89 f0                	mov    %esi,%eax
  801311:	f7 f1                	div    %ecx
  801313:	89 d0                	mov    %edx,%eax
  801315:	31 d2                	xor    %edx,%edx
  801317:	eb 94                	jmp    8012ad <__umoddi3+0x2d>
  801319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  801320:	89 e9                	mov    %ebp,%ecx
  801322:	ba 20 00 00 00       	mov    $0x20,%edx
  801327:	29 ea                	sub    %ebp,%edx
  801329:	d3 e0                	shl    %cl,%eax
  80132b:	89 44 24 08          	mov    %eax,0x8(%esp)
  80132f:	89 d1                	mov    %edx,%ecx
  801331:	89 f8                	mov    %edi,%eax
  801333:	d3 e8                	shr    %cl,%eax
  801335:	89 54 24 04          	mov    %edx,0x4(%esp)
  801339:	8b 54 24 04          	mov    0x4(%esp),%edx
  80133d:	89 c1                	mov    %eax,%ecx
  80133f:	8b 44 24 08          	mov    0x8(%esp),%eax
  801343:	09 c1                	or     %eax,%ecx
  801345:	89 d8                	mov    %ebx,%eax
  801347:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  80134b:	89 e9                	mov    %ebp,%ecx
  80134d:	d3 e7                	shl    %cl,%edi
  80134f:	89 d1                	mov    %edx,%ecx
  801351:	d3 e8                	shr    %cl,%eax
  801353:	89 e9                	mov    %ebp,%ecx
  801355:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  801359:	d3 e3                	shl    %cl,%ebx
  80135b:	89 c7                	mov    %eax,%edi
  80135d:	89 d1                	mov    %edx,%ecx
  80135f:	89 f0                	mov    %esi,%eax
  801361:	d3 e8                	shr    %cl,%eax
  801363:	89 fa                	mov    %edi,%edx
  801365:	89 e9                	mov    %ebp,%ecx
  801367:	09 d8                	or     %ebx,%eax
  801369:	d3 e6                	shl    %cl,%esi
  80136b:	f7 74 24 08          	divl   0x8(%esp)
  80136f:	89 d3                	mov    %edx,%ebx
  801371:	f7 64 24 0c          	mull   0xc(%esp)
  801375:	89 c7                	mov    %eax,%edi
  801377:	89 d1                	mov    %edx,%ecx
  801379:	39 d3                	cmp    %edx,%ebx
  80137b:	72 06                	jb     801383 <__umoddi3+0x103>
  80137d:	75 10                	jne    80138f <__umoddi3+0x10f>
  80137f:	39 c6                	cmp    %eax,%esi
  801381:	73 0c                	jae    80138f <__umoddi3+0x10f>
  801383:	2b 44 24 0c          	sub    0xc(%esp),%eax
  801387:	1b 54 24 08          	sbb    0x8(%esp),%edx
  80138b:	89 d1                	mov    %edx,%ecx
  80138d:	89 c7                	mov    %eax,%edi
  80138f:	89 f2                	mov    %esi,%edx
  801391:	29 fa                	sub    %edi,%edx
  801393:	19 cb                	sbb    %ecx,%ebx
  801395:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  80139a:	89 d8                	mov    %ebx,%eax
  80139c:	d3 e0                	shl    %cl,%eax
  80139e:	89 e9                	mov    %ebp,%ecx
  8013a0:	d3 ea                	shr    %cl,%edx
  8013a2:	d3 eb                	shr    %cl,%ebx
  8013a4:	09 d0                	or     %edx,%eax
  8013a6:	89 da                	mov    %ebx,%edx
  8013a8:	83 c4 1c             	add    $0x1c,%esp
  8013ab:	5b                   	pop    %ebx
  8013ac:	5e                   	pop    %esi
  8013ad:	5f                   	pop    %edi
  8013ae:	5d                   	pop    %ebp
  8013af:	c3                   	ret
  8013b0:	89 da                	mov    %ebx,%edx
  8013b2:	89 f1                	mov    %esi,%ecx
  8013b4:	29 f9                	sub    %edi,%ecx
  8013b6:	19 c2                	sbb    %eax,%edx
  8013b8:	89 c8                	mov    %ecx,%eax
  8013ba:	e9 2b ff ff ff       	jmp    8012ea <__umoddi3+0x6a>
