
obj/user/stresssched:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 b9 00 00 00       	call   8000ea <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <umain>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	56                   	push   %esi
  800037:	53                   	push   %ebx
  800038:	e8 15 0b 00 00       	call   800b52 <sys_getenvid>
  80003d:	89 c6                	mov    %eax,%esi
  80003f:	bb 00 00 00 00       	mov    $0x0,%ebx
  800044:	e8 70 0f 00 00       	call   800fb9 <fork>
  800049:	85 c0                	test   %eax,%eax
  80004b:	74 0f                	je     80005c <umain+0x29>
  80004d:	83 c3 01             	add    $0x1,%ebx
  800050:	83 fb 14             	cmp    $0x14,%ebx
  800053:	75 ef                	jne    800044 <umain+0x11>
  800055:	e8 1c 0b 00 00       	call   800b76 <sys_yield>
  80005a:	eb 70                	jmp    8000cc <umain+0x99>
  80005c:	89 f0                	mov    %esi,%eax
  80005e:	25 ff 03 00 00       	and    $0x3ff,%eax
  800063:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800069:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  80006e:	eb 02                	jmp    800072 <umain+0x3f>
  800070:	f3 90                	pause
  800072:	8b 50 54             	mov    0x54(%eax),%edx
  800075:	85 d2                	test   %edx,%edx
  800077:	75 f7                	jne    800070 <umain+0x3d>
  800079:	bb 0b 00 00 00       	mov    $0xb,%ebx
  80007e:	eb 12                	jmp    800092 <umain+0x5f>
  800080:	a1 04 20 80 00       	mov    0x802004,%eax
  800085:	83 c0 01             	add    $0x1,%eax
  800088:	a3 04 20 80 00       	mov    %eax,0x802004
  80008d:	83 ea 01             	sub    $0x1,%edx
  800090:	75 ee                	jne    800080 <umain+0x4d>
  800092:	83 eb 01             	sub    $0x1,%ebx
  800095:	74 0c                	je     8000a3 <umain+0x70>
  800097:	e8 da 0a 00 00       	call   800b76 <sys_yield>
  80009c:	ba 11 27 00 00       	mov    $0x2711,%edx
  8000a1:	eb ea                	jmp    80008d <umain+0x5a>
  8000a3:	a1 04 20 80 00       	mov    0x802004,%eax
  8000a8:	3d a0 86 01 00       	cmp    $0x186a0,%eax
  8000ad:	75 24                	jne    8000d3 <umain+0xa0>
  8000af:	a1 08 20 80 00       	mov    0x802008,%eax
  8000b4:	8b 50 5c             	mov    0x5c(%eax),%edx
  8000b7:	8b 40 48             	mov    0x48(%eax),%eax
  8000ba:	83 ec 04             	sub    $0x4,%esp
  8000bd:	52                   	push   %edx
  8000be:	50                   	push   %eax
  8000bf:	68 90 15 80 00       	push   $0x801590
  8000c4:	e8 5b 01 00 00       	call   800224 <cprintf>
  8000c9:	83 c4 10             	add    $0x10,%esp
  8000cc:	8d 65 f8             	lea    -0x8(%ebp),%esp
  8000cf:	5b                   	pop    %ebx
  8000d0:	5e                   	pop    %esi
  8000d1:	5d                   	pop    %ebp
  8000d2:	c3                   	ret
  8000d3:	a1 04 20 80 00       	mov    0x802004,%eax
  8000d8:	50                   	push   %eax
  8000d9:	68 e0 13 80 00       	push   $0x8013e0
  8000de:	6a 21                	push   $0x21
  8000e0:	68 7d 15 80 00       	push   $0x80157d
  8000e5:	e8 5f 00 00 00       	call   800149 <_panic>

008000ea <libmain>:
  8000ea:	55                   	push   %ebp
  8000eb:	89 e5                	mov    %esp,%ebp
  8000ed:	56                   	push   %esi
  8000ee:	53                   	push   %ebx
  8000ef:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8000f2:	8b 75 0c             	mov    0xc(%ebp),%esi
  8000f5:	e8 58 0a 00 00       	call   800b52 <sys_getenvid>
  8000fa:	85 c0                	test   %eax,%eax
  8000fc:	78 15                	js     800113 <libmain+0x29>
  8000fe:	25 ff 03 00 00       	and    $0x3ff,%eax
  800103:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800109:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  80010e:	a3 08 20 80 00       	mov    %eax,0x802008
  800113:	85 db                	test   %ebx,%ebx
  800115:	7e 07                	jle    80011e <libmain+0x34>
  800117:	8b 06                	mov    (%esi),%eax
  800119:	a3 00 20 80 00       	mov    %eax,0x802000
  80011e:	83 ec 08             	sub    $0x8,%esp
  800121:	56                   	push   %esi
  800122:	53                   	push   %ebx
  800123:	e8 0b ff ff ff       	call   800033 <umain>
  800128:	e8 0a 00 00 00       	call   800137 <exit>
  80012d:	83 c4 10             	add    $0x10,%esp
  800130:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800133:	5b                   	pop    %ebx
  800134:	5e                   	pop    %esi
  800135:	5d                   	pop    %ebp
  800136:	c3                   	ret

00800137 <exit>:
  800137:	55                   	push   %ebp
  800138:	89 e5                	mov    %esp,%ebp
  80013a:	83 ec 14             	sub    $0x14,%esp
  80013d:	6a 00                	push   $0x0
  80013f:	e8 ec 09 00 00       	call   800b30 <sys_env_destroy>
  800144:	83 c4 10             	add    $0x10,%esp
  800147:	c9                   	leave
  800148:	c3                   	ret

00800149 <_panic>:
  800149:	55                   	push   %ebp
  80014a:	89 e5                	mov    %esp,%ebp
  80014c:	56                   	push   %esi
  80014d:	53                   	push   %ebx
  80014e:	8d 5d 14             	lea    0x14(%ebp),%ebx
  800151:	8b 35 00 20 80 00    	mov    0x802000,%esi
  800157:	e8 f6 09 00 00       	call   800b52 <sys_getenvid>
  80015c:	83 ec 0c             	sub    $0xc,%esp
  80015f:	ff 75 0c             	push   0xc(%ebp)
  800162:	ff 75 08             	push   0x8(%ebp)
  800165:	56                   	push   %esi
  800166:	50                   	push   %eax
  800167:	68 08 14 80 00       	push   $0x801408
  80016c:	e8 b3 00 00 00       	call   800224 <cprintf>
  800171:	83 c4 18             	add    $0x18,%esp
  800174:	53                   	push   %ebx
  800175:	ff 75 10             	push   0x10(%ebp)
  800178:	e8 56 00 00 00       	call   8001d3 <vcprintf>
  80017d:	c7 04 24 ac 15 80 00 	movl   $0x8015ac,(%esp)
  800184:	e8 9b 00 00 00       	call   800224 <cprintf>
  800189:	83 c4 10             	add    $0x10,%esp
  80018c:	cc                   	int3
  80018d:	eb fd                	jmp    80018c <_panic+0x43>

0080018f <putch>:
  80018f:	55                   	push   %ebp
  800190:	89 e5                	mov    %esp,%ebp
  800192:	53                   	push   %ebx
  800193:	83 ec 04             	sub    $0x4,%esp
  800196:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800199:	8b 13                	mov    (%ebx),%edx
  80019b:	8d 42 01             	lea    0x1(%edx),%eax
  80019e:	89 03                	mov    %eax,(%ebx)
  8001a0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001a3:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  8001a7:	3d ff 00 00 00       	cmp    $0xff,%eax
  8001ac:	74 09                	je     8001b7 <putch+0x28>
  8001ae:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  8001b2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8001b5:	c9                   	leave
  8001b6:	c3                   	ret
  8001b7:	83 ec 08             	sub    $0x8,%esp
  8001ba:	68 ff 00 00 00       	push   $0xff
  8001bf:	8d 43 08             	lea    0x8(%ebx),%eax
  8001c2:	50                   	push   %eax
  8001c3:	e8 1e 09 00 00       	call   800ae6 <sys_cputs>
  8001c8:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  8001ce:	83 c4 10             	add    $0x10,%esp
  8001d1:	eb db                	jmp    8001ae <putch+0x1f>

008001d3 <vcprintf>:
  8001d3:	55                   	push   %ebp
  8001d4:	89 e5                	mov    %esp,%ebp
  8001d6:	81 ec 18 01 00 00    	sub    $0x118,%esp
  8001dc:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  8001e3:	00 00 00 
  8001e6:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  8001ed:	00 00 00 
  8001f0:	ff 75 0c             	push   0xc(%ebp)
  8001f3:	ff 75 08             	push   0x8(%ebp)
  8001f6:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  8001fc:	50                   	push   %eax
  8001fd:	68 8f 01 80 00       	push   $0x80018f
  800202:	e8 74 01 00 00       	call   80037b <vprintfmt>
  800207:	83 c4 08             	add    $0x8,%esp
  80020a:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  800210:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  800216:	50                   	push   %eax
  800217:	e8 ca 08 00 00       	call   800ae6 <sys_cputs>
  80021c:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  800222:	c9                   	leave
  800223:	c3                   	ret

00800224 <cprintf>:
  800224:	55                   	push   %ebp
  800225:	89 e5                	mov    %esp,%ebp
  800227:	83 ec 10             	sub    $0x10,%esp
  80022a:	8d 45 0c             	lea    0xc(%ebp),%eax
  80022d:	50                   	push   %eax
  80022e:	ff 75 08             	push   0x8(%ebp)
  800231:	e8 9d ff ff ff       	call   8001d3 <vcprintf>
  800236:	c9                   	leave
  800237:	c3                   	ret

00800238 <printnum>:
  800238:	55                   	push   %ebp
  800239:	89 e5                	mov    %esp,%ebp
  80023b:	57                   	push   %edi
  80023c:	56                   	push   %esi
  80023d:	53                   	push   %ebx
  80023e:	83 ec 1c             	sub    $0x1c,%esp
  800241:	89 c7                	mov    %eax,%edi
  800243:	89 d6                	mov    %edx,%esi
  800245:	8b 45 08             	mov    0x8(%ebp),%eax
  800248:	8b 55 0c             	mov    0xc(%ebp),%edx
  80024b:	89 d1                	mov    %edx,%ecx
  80024d:	89 c2                	mov    %eax,%edx
  80024f:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800252:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  800255:	8b 45 10             	mov    0x10(%ebp),%eax
  800258:	8b 5d 14             	mov    0x14(%ebp),%ebx
  80025b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80025e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  800265:	39 c2                	cmp    %eax,%edx
  800267:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  80026a:	72 3e                	jb     8002aa <printnum+0x72>
  80026c:	83 ec 0c             	sub    $0xc,%esp
  80026f:	ff 75 18             	push   0x18(%ebp)
  800272:	83 eb 01             	sub    $0x1,%ebx
  800275:	53                   	push   %ebx
  800276:	50                   	push   %eax
  800277:	83 ec 08             	sub    $0x8,%esp
  80027a:	ff 75 e4             	push   -0x1c(%ebp)
  80027d:	ff 75 e0             	push   -0x20(%ebp)
  800280:	ff 75 dc             	push   -0x24(%ebp)
  800283:	ff 75 d8             	push   -0x28(%ebp)
  800286:	e8 e5 0e 00 00       	call   801170 <__udivdi3>
  80028b:	83 c4 18             	add    $0x18,%esp
  80028e:	52                   	push   %edx
  80028f:	50                   	push   %eax
  800290:	89 f2                	mov    %esi,%edx
  800292:	89 f8                	mov    %edi,%eax
  800294:	e8 9f ff ff ff       	call   800238 <printnum>
  800299:	83 c4 20             	add    $0x20,%esp
  80029c:	eb 13                	jmp    8002b1 <printnum+0x79>
  80029e:	83 ec 08             	sub    $0x8,%esp
  8002a1:	56                   	push   %esi
  8002a2:	ff 75 18             	push   0x18(%ebp)
  8002a5:	ff d7                	call   *%edi
  8002a7:	83 c4 10             	add    $0x10,%esp
  8002aa:	83 eb 01             	sub    $0x1,%ebx
  8002ad:	85 db                	test   %ebx,%ebx
  8002af:	7f ed                	jg     80029e <printnum+0x66>
  8002b1:	83 ec 08             	sub    $0x8,%esp
  8002b4:	56                   	push   %esi
  8002b5:	83 ec 04             	sub    $0x4,%esp
  8002b8:	ff 75 e4             	push   -0x1c(%ebp)
  8002bb:	ff 75 e0             	push   -0x20(%ebp)
  8002be:	ff 75 dc             	push   -0x24(%ebp)
  8002c1:	ff 75 d8             	push   -0x28(%ebp)
  8002c4:	e8 c7 0f 00 00       	call   801290 <__umoddi3>
  8002c9:	83 c4 14             	add    $0x14,%esp
  8002cc:	0f be 80 b8 15 80 00 	movsbl 0x8015b8(%eax),%eax
  8002d3:	50                   	push   %eax
  8002d4:	ff d7                	call   *%edi
  8002d6:	83 c4 10             	add    $0x10,%esp
  8002d9:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8002dc:	5b                   	pop    %ebx
  8002dd:	5e                   	pop    %esi
  8002de:	5f                   	pop    %edi
  8002df:	5d                   	pop    %ebp
  8002e0:	c3                   	ret

008002e1 <getuint>:
  8002e1:	83 fa 01             	cmp    $0x1,%edx
  8002e4:	7f 13                	jg     8002f9 <getuint+0x18>
  8002e6:	85 d2                	test   %edx,%edx
  8002e8:	74 1c                	je     800306 <getuint+0x25>
  8002ea:	8b 10                	mov    (%eax),%edx
  8002ec:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002ef:	89 08                	mov    %ecx,(%eax)
  8002f1:	8b 02                	mov    (%edx),%eax
  8002f3:	ba 00 00 00 00       	mov    $0x0,%edx
  8002f8:	c3                   	ret
  8002f9:	8b 10                	mov    (%eax),%edx
  8002fb:	8d 4a 08             	lea    0x8(%edx),%ecx
  8002fe:	89 08                	mov    %ecx,(%eax)
  800300:	8b 02                	mov    (%edx),%eax
  800302:	8b 52 04             	mov    0x4(%edx),%edx
  800305:	c3                   	ret
  800306:	8b 10                	mov    (%eax),%edx
  800308:	8d 4a 04             	lea    0x4(%edx),%ecx
  80030b:	89 08                	mov    %ecx,(%eax)
  80030d:	8b 02                	mov    (%edx),%eax
  80030f:	ba 00 00 00 00       	mov    $0x0,%edx
  800314:	c3                   	ret

00800315 <getint>:
  800315:	83 fa 01             	cmp    $0x1,%edx
  800318:	7f 0f                	jg     800329 <getint+0x14>
  80031a:	85 d2                	test   %edx,%edx
  80031c:	74 18                	je     800336 <getint+0x21>
  80031e:	8b 10                	mov    (%eax),%edx
  800320:	8d 4a 04             	lea    0x4(%edx),%ecx
  800323:	89 08                	mov    %ecx,(%eax)
  800325:	8b 02                	mov    (%edx),%eax
  800327:	99                   	cltd
  800328:	c3                   	ret
  800329:	8b 10                	mov    (%eax),%edx
  80032b:	8d 4a 08             	lea    0x8(%edx),%ecx
  80032e:	89 08                	mov    %ecx,(%eax)
  800330:	8b 02                	mov    (%edx),%eax
  800332:	8b 52 04             	mov    0x4(%edx),%edx
  800335:	c3                   	ret
  800336:	8b 10                	mov    (%eax),%edx
  800338:	8d 4a 04             	lea    0x4(%edx),%ecx
  80033b:	89 08                	mov    %ecx,(%eax)
  80033d:	8b 02                	mov    (%edx),%eax
  80033f:	99                   	cltd
  800340:	c3                   	ret

00800341 <sprintputch>:
  800341:	55                   	push   %ebp
  800342:	89 e5                	mov    %esp,%ebp
  800344:	8b 45 0c             	mov    0xc(%ebp),%eax
  800347:	83 40 08 01          	addl   $0x1,0x8(%eax)
  80034b:	8b 10                	mov    (%eax),%edx
  80034d:	3b 50 04             	cmp    0x4(%eax),%edx
  800350:	73 0a                	jae    80035c <sprintputch+0x1b>
  800352:	8d 4a 01             	lea    0x1(%edx),%ecx
  800355:	89 08                	mov    %ecx,(%eax)
  800357:	8b 45 08             	mov    0x8(%ebp),%eax
  80035a:	88 02                	mov    %al,(%edx)
  80035c:	5d                   	pop    %ebp
  80035d:	c3                   	ret

0080035e <printfmt>:
  80035e:	55                   	push   %ebp
  80035f:	89 e5                	mov    %esp,%ebp
  800361:	83 ec 08             	sub    $0x8,%esp
  800364:	8d 45 14             	lea    0x14(%ebp),%eax
  800367:	50                   	push   %eax
  800368:	ff 75 10             	push   0x10(%ebp)
  80036b:	ff 75 0c             	push   0xc(%ebp)
  80036e:	ff 75 08             	push   0x8(%ebp)
  800371:	e8 05 00 00 00       	call   80037b <vprintfmt>
  800376:	83 c4 10             	add    $0x10,%esp
  800379:	c9                   	leave
  80037a:	c3                   	ret

0080037b <vprintfmt>:
  80037b:	55                   	push   %ebp
  80037c:	89 e5                	mov    %esp,%ebp
  80037e:	57                   	push   %edi
  80037f:	56                   	push   %esi
  800380:	53                   	push   %ebx
  800381:	83 ec 2c             	sub    $0x2c,%esp
  800384:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800387:	8b 75 0c             	mov    0xc(%ebp),%esi
  80038a:	8b 7d 10             	mov    0x10(%ebp),%edi
  80038d:	eb 0a                	jmp    800399 <vprintfmt+0x1e>
  80038f:	83 ec 08             	sub    $0x8,%esp
  800392:	56                   	push   %esi
  800393:	50                   	push   %eax
  800394:	ff d3                	call   *%ebx
  800396:	83 c4 10             	add    $0x10,%esp
  800399:	83 c7 01             	add    $0x1,%edi
  80039c:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  8003a0:	83 f8 25             	cmp    $0x25,%eax
  8003a3:	74 0c                	je     8003b1 <vprintfmt+0x36>
  8003a5:	85 c0                	test   %eax,%eax
  8003a7:	75 e6                	jne    80038f <vprintfmt+0x14>
  8003a9:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8003ac:	5b                   	pop    %ebx
  8003ad:	5e                   	pop    %esi
  8003ae:	5f                   	pop    %edi
  8003af:	5d                   	pop    %ebp
  8003b0:	c3                   	ret
  8003b1:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  8003b5:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  8003bc:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  8003c3:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  8003ca:	b9 00 00 00 00       	mov    $0x0,%ecx
  8003cf:	8d 47 01             	lea    0x1(%edi),%eax
  8003d2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  8003d5:	0f b6 17             	movzbl (%edi),%edx
  8003d8:	8d 42 dd             	lea    -0x23(%edx),%eax
  8003db:	3c 55                	cmp    $0x55,%al
  8003dd:	0f 87 c3 02 00 00    	ja     8006a6 <vprintfmt+0x32b>
  8003e3:	0f b6 c0             	movzbl %al,%eax
  8003e6:	ff 24 85 40 17 80 00 	jmp    *0x801740(,%eax,4)
  8003ed:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003f0:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  8003f4:	eb d9                	jmp    8003cf <vprintfmt+0x54>
  8003f6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003f9:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  8003fd:	eb d0                	jmp    8003cf <vprintfmt+0x54>
  8003ff:	0f b6 d2             	movzbl %dl,%edx
  800402:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800405:	b8 00 00 00 00       	mov    $0x0,%eax
  80040a:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  80040d:	8d 04 80             	lea    (%eax,%eax,4),%eax
  800410:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  800414:	0f be 17             	movsbl (%edi),%edx
  800417:	8d 4a d0             	lea    -0x30(%edx),%ecx
  80041a:	83 f9 09             	cmp    $0x9,%ecx
  80041d:	77 52                	ja     800471 <vprintfmt+0xf6>
  80041f:	83 c7 01             	add    $0x1,%edi
  800422:	eb e9                	jmp    80040d <vprintfmt+0x92>
  800424:	8b 45 14             	mov    0x14(%ebp),%eax
  800427:	8d 50 04             	lea    0x4(%eax),%edx
  80042a:	89 55 14             	mov    %edx,0x14(%ebp)
  80042d:	8b 00                	mov    (%eax),%eax
  80042f:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800432:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800435:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800439:	79 94                	jns    8003cf <vprintfmt+0x54>
  80043b:	8b 45 d0             	mov    -0x30(%ebp),%eax
  80043e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800441:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800448:	eb 85                	jmp    8003cf <vprintfmt+0x54>
  80044a:	8b 55 e0             	mov    -0x20(%ebp),%edx
  80044d:	85 d2                	test   %edx,%edx
  80044f:	b8 00 00 00 00       	mov    $0x0,%eax
  800454:	0f 49 c2             	cmovns %edx,%eax
  800457:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80045a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80045d:	e9 6d ff ff ff       	jmp    8003cf <vprintfmt+0x54>
  800462:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800465:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  80046c:	e9 5e ff ff ff       	jmp    8003cf <vprintfmt+0x54>
  800471:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  800474:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800477:	eb bc                	jmp    800435 <vprintfmt+0xba>
  800479:	83 c1 01             	add    $0x1,%ecx
  80047c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80047f:	e9 4b ff ff ff       	jmp    8003cf <vprintfmt+0x54>
  800484:	8b 45 14             	mov    0x14(%ebp),%eax
  800487:	8d 50 04             	lea    0x4(%eax),%edx
  80048a:	89 55 14             	mov    %edx,0x14(%ebp)
  80048d:	83 ec 08             	sub    $0x8,%esp
  800490:	56                   	push   %esi
  800491:	ff 30                	push   (%eax)
  800493:	ff d3                	call   *%ebx
  800495:	83 c4 10             	add    $0x10,%esp
  800498:	e9 a0 01 00 00       	jmp    80063d <vprintfmt+0x2c2>
  80049d:	8b 45 14             	mov    0x14(%ebp),%eax
  8004a0:	8d 50 04             	lea    0x4(%eax),%edx
  8004a3:	89 55 14             	mov    %edx,0x14(%ebp)
  8004a6:	8b 10                	mov    (%eax),%edx
  8004a8:	89 d0                	mov    %edx,%eax
  8004aa:	f7 d8                	neg    %eax
  8004ac:	0f 48 c2             	cmovs  %edx,%eax
  8004af:	83 f8 08             	cmp    $0x8,%eax
  8004b2:	7f 20                	jg     8004d4 <vprintfmt+0x159>
  8004b4:	8b 14 85 a0 18 80 00 	mov    0x8018a0(,%eax,4),%edx
  8004bb:	85 d2                	test   %edx,%edx
  8004bd:	74 15                	je     8004d4 <vprintfmt+0x159>
  8004bf:	52                   	push   %edx
  8004c0:	68 d9 15 80 00       	push   $0x8015d9
  8004c5:	56                   	push   %esi
  8004c6:	53                   	push   %ebx
  8004c7:	e8 92 fe ff ff       	call   80035e <printfmt>
  8004cc:	83 c4 10             	add    $0x10,%esp
  8004cf:	e9 69 01 00 00       	jmp    80063d <vprintfmt+0x2c2>
  8004d4:	50                   	push   %eax
  8004d5:	68 d0 15 80 00       	push   $0x8015d0
  8004da:	56                   	push   %esi
  8004db:	53                   	push   %ebx
  8004dc:	e8 7d fe ff ff       	call   80035e <printfmt>
  8004e1:	83 c4 10             	add    $0x10,%esp
  8004e4:	e9 54 01 00 00       	jmp    80063d <vprintfmt+0x2c2>
  8004e9:	8b 45 14             	mov    0x14(%ebp),%eax
  8004ec:	8d 50 04             	lea    0x4(%eax),%edx
  8004ef:	89 55 14             	mov    %edx,0x14(%ebp)
  8004f2:	8b 08                	mov    (%eax),%ecx
  8004f4:	85 c9                	test   %ecx,%ecx
  8004f6:	b8 c9 15 80 00       	mov    $0x8015c9,%eax
  8004fb:	0f 45 c1             	cmovne %ecx,%eax
  8004fe:	89 45 cc             	mov    %eax,-0x34(%ebp)
  800501:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800505:	7e 06                	jle    80050d <vprintfmt+0x192>
  800507:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  80050b:	75 0b                	jne    800518 <vprintfmt+0x19d>
  80050d:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  800510:	8b 7d d0             	mov    -0x30(%ebp),%edi
  800513:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800516:	eb 5c                	jmp    800574 <vprintfmt+0x1f9>
  800518:	83 ec 08             	sub    $0x8,%esp
  80051b:	ff 75 d0             	push   -0x30(%ebp)
  80051e:	ff 75 cc             	push   -0x34(%ebp)
  800521:	e8 20 02 00 00       	call   800746 <strnlen>
  800526:	89 c2                	mov    %eax,%edx
  800528:	8b 45 e0             	mov    -0x20(%ebp),%eax
  80052b:	29 d0                	sub    %edx,%eax
  80052d:	83 c4 10             	add    $0x10,%esp
  800530:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  800534:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800537:	89 5d 08             	mov    %ebx,0x8(%ebp)
  80053a:	89 c3                	mov    %eax,%ebx
  80053c:	eb 0e                	jmp    80054c <vprintfmt+0x1d1>
  80053e:	83 ec 08             	sub    $0x8,%esp
  800541:	56                   	push   %esi
  800542:	57                   	push   %edi
  800543:	ff 55 08             	call   *0x8(%ebp)
  800546:	83 eb 01             	sub    $0x1,%ebx
  800549:	83 c4 10             	add    $0x10,%esp
  80054c:	85 db                	test   %ebx,%ebx
  80054e:	7f ee                	jg     80053e <vprintfmt+0x1c3>
  800550:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800553:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800556:	85 c0                	test   %eax,%eax
  800558:	ba 00 00 00 00       	mov    $0x0,%edx
  80055d:	0f 49 d0             	cmovns %eax,%edx
  800560:	29 d0                	sub    %edx,%eax
  800562:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800565:	eb a6                	jmp    80050d <vprintfmt+0x192>
  800567:	83 ec 08             	sub    $0x8,%esp
  80056a:	56                   	push   %esi
  80056b:	52                   	push   %edx
  80056c:	ff 55 08             	call   *0x8(%ebp)
  80056f:	83 c4 10             	add    $0x10,%esp
  800572:	89 d9                	mov    %ebx,%ecx
  800574:	8d 59 01             	lea    0x1(%ecx),%ebx
  800577:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  80057b:	0f be d0             	movsbl %al,%edx
  80057e:	85 d2                	test   %edx,%edx
  800580:	74 28                	je     8005aa <vprintfmt+0x22f>
  800582:	85 ff                	test   %edi,%edi
  800584:	78 05                	js     80058b <vprintfmt+0x210>
  800586:	83 ef 01             	sub    $0x1,%edi
  800589:	78 2e                	js     8005b9 <vprintfmt+0x23e>
  80058b:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  80058f:	74 d6                	je     800567 <vprintfmt+0x1ec>
  800591:	0f be c0             	movsbl %al,%eax
  800594:	83 e8 20             	sub    $0x20,%eax
  800597:	83 f8 5e             	cmp    $0x5e,%eax
  80059a:	76 cb                	jbe    800567 <vprintfmt+0x1ec>
  80059c:	83 ec 08             	sub    $0x8,%esp
  80059f:	56                   	push   %esi
  8005a0:	6a 3f                	push   $0x3f
  8005a2:	ff 55 08             	call   *0x8(%ebp)
  8005a5:	83 c4 10             	add    $0x10,%esp
  8005a8:	eb c8                	jmp    800572 <vprintfmt+0x1f7>
  8005aa:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8005ad:	8b 7d cc             	mov    -0x34(%ebp),%edi
  8005b0:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8005b3:	01 c7                	add    %eax,%edi
  8005b5:	29 cf                	sub    %ecx,%edi
  8005b7:	eb 13                	jmp    8005cc <vprintfmt+0x251>
  8005b9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8005bc:	eb ef                	jmp    8005ad <vprintfmt+0x232>
  8005be:	83 ec 08             	sub    $0x8,%esp
  8005c1:	56                   	push   %esi
  8005c2:	6a 20                	push   $0x20
  8005c4:	ff d3                	call   *%ebx
  8005c6:	83 ef 01             	sub    $0x1,%edi
  8005c9:	83 c4 10             	add    $0x10,%esp
  8005cc:	85 ff                	test   %edi,%edi
  8005ce:	7f ee                	jg     8005be <vprintfmt+0x243>
  8005d0:	eb 6b                	jmp    80063d <vprintfmt+0x2c2>
  8005d2:	89 ca                	mov    %ecx,%edx
  8005d4:	8d 45 14             	lea    0x14(%ebp),%eax
  8005d7:	e8 39 fd ff ff       	call   800315 <getint>
  8005dc:	89 45 d8             	mov    %eax,-0x28(%ebp)
  8005df:	89 55 dc             	mov    %edx,-0x24(%ebp)
  8005e2:	85 d2                	test   %edx,%edx
  8005e4:	78 0b                	js     8005f1 <vprintfmt+0x276>
  8005e6:	89 d1                	mov    %edx,%ecx
  8005e8:	89 c2                	mov    %eax,%edx
  8005ea:	bf 0a 00 00 00       	mov    $0xa,%edi
  8005ef:	eb 32                	jmp    800623 <vprintfmt+0x2a8>
  8005f1:	83 ec 08             	sub    $0x8,%esp
  8005f4:	56                   	push   %esi
  8005f5:	6a 2d                	push   $0x2d
  8005f7:	ff d3                	call   *%ebx
  8005f9:	8b 55 d8             	mov    -0x28(%ebp),%edx
  8005fc:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  8005ff:	f7 da                	neg    %edx
  800601:	83 d1 00             	adc    $0x0,%ecx
  800604:	f7 d9                	neg    %ecx
  800606:	83 c4 10             	add    $0x10,%esp
  800609:	bf 0a 00 00 00       	mov    $0xa,%edi
  80060e:	eb 13                	jmp    800623 <vprintfmt+0x2a8>
  800610:	89 ca                	mov    %ecx,%edx
  800612:	8d 45 14             	lea    0x14(%ebp),%eax
  800615:	e8 c7 fc ff ff       	call   8002e1 <getuint>
  80061a:	89 d1                	mov    %edx,%ecx
  80061c:	89 c2                	mov    %eax,%edx
  80061e:	bf 0a 00 00 00       	mov    $0xa,%edi
  800623:	83 ec 0c             	sub    $0xc,%esp
  800626:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  80062a:	50                   	push   %eax
  80062b:	ff 75 e0             	push   -0x20(%ebp)
  80062e:	57                   	push   %edi
  80062f:	51                   	push   %ecx
  800630:	52                   	push   %edx
  800631:	89 f2                	mov    %esi,%edx
  800633:	89 d8                	mov    %ebx,%eax
  800635:	e8 fe fb ff ff       	call   800238 <printnum>
  80063a:	83 c4 20             	add    $0x20,%esp
  80063d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800640:	e9 54 fd ff ff       	jmp    800399 <vprintfmt+0x1e>
  800645:	89 ca                	mov    %ecx,%edx
  800647:	8d 45 14             	lea    0x14(%ebp),%eax
  80064a:	e8 92 fc ff ff       	call   8002e1 <getuint>
  80064f:	89 d1                	mov    %edx,%ecx
  800651:	89 c2                	mov    %eax,%edx
  800653:	bf 08 00 00 00       	mov    $0x8,%edi
  800658:	eb c9                	jmp    800623 <vprintfmt+0x2a8>
  80065a:	83 ec 08             	sub    $0x8,%esp
  80065d:	56                   	push   %esi
  80065e:	6a 30                	push   $0x30
  800660:	ff d3                	call   *%ebx
  800662:	83 c4 08             	add    $0x8,%esp
  800665:	56                   	push   %esi
  800666:	6a 78                	push   $0x78
  800668:	ff d3                	call   *%ebx
  80066a:	8b 45 14             	mov    0x14(%ebp),%eax
  80066d:	8d 50 04             	lea    0x4(%eax),%edx
  800670:	89 55 14             	mov    %edx,0x14(%ebp)
  800673:	8b 10                	mov    (%eax),%edx
  800675:	b9 00 00 00 00       	mov    $0x0,%ecx
  80067a:	83 c4 10             	add    $0x10,%esp
  80067d:	bf 10 00 00 00       	mov    $0x10,%edi
  800682:	eb 9f                	jmp    800623 <vprintfmt+0x2a8>
  800684:	89 ca                	mov    %ecx,%edx
  800686:	8d 45 14             	lea    0x14(%ebp),%eax
  800689:	e8 53 fc ff ff       	call   8002e1 <getuint>
  80068e:	89 d1                	mov    %edx,%ecx
  800690:	89 c2                	mov    %eax,%edx
  800692:	bf 10 00 00 00       	mov    $0x10,%edi
  800697:	eb 8a                	jmp    800623 <vprintfmt+0x2a8>
  800699:	83 ec 08             	sub    $0x8,%esp
  80069c:	56                   	push   %esi
  80069d:	6a 25                	push   $0x25
  80069f:	ff d3                	call   *%ebx
  8006a1:	83 c4 10             	add    $0x10,%esp
  8006a4:	eb 97                	jmp    80063d <vprintfmt+0x2c2>
  8006a6:	83 ec 08             	sub    $0x8,%esp
  8006a9:	56                   	push   %esi
  8006aa:	6a 25                	push   $0x25
  8006ac:	ff d3                	call   *%ebx
  8006ae:	83 c4 10             	add    $0x10,%esp
  8006b1:	89 f8                	mov    %edi,%eax
  8006b3:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  8006b7:	74 05                	je     8006be <vprintfmt+0x343>
  8006b9:	83 e8 01             	sub    $0x1,%eax
  8006bc:	eb f5                	jmp    8006b3 <vprintfmt+0x338>
  8006be:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  8006c1:	e9 77 ff ff ff       	jmp    80063d <vprintfmt+0x2c2>

008006c6 <vsnprintf>:
  8006c6:	55                   	push   %ebp
  8006c7:	89 e5                	mov    %esp,%ebp
  8006c9:	83 ec 18             	sub    $0x18,%esp
  8006cc:	8b 45 08             	mov    0x8(%ebp),%eax
  8006cf:	8b 55 0c             	mov    0xc(%ebp),%edx
  8006d2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  8006d5:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  8006d9:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  8006dc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  8006e3:	85 c0                	test   %eax,%eax
  8006e5:	74 26                	je     80070d <vsnprintf+0x47>
  8006e7:	85 d2                	test   %edx,%edx
  8006e9:	7e 22                	jle    80070d <vsnprintf+0x47>
  8006eb:	ff 75 14             	push   0x14(%ebp)
  8006ee:	ff 75 10             	push   0x10(%ebp)
  8006f1:	8d 45 ec             	lea    -0x14(%ebp),%eax
  8006f4:	50                   	push   %eax
  8006f5:	68 41 03 80 00       	push   $0x800341
  8006fa:	e8 7c fc ff ff       	call   80037b <vprintfmt>
  8006ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
  800702:	c6 00 00             	movb   $0x0,(%eax)
  800705:	8b 45 f4             	mov    -0xc(%ebp),%eax
  800708:	83 c4 10             	add    $0x10,%esp
  80070b:	c9                   	leave
  80070c:	c3                   	ret
  80070d:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800712:	eb f7                	jmp    80070b <vsnprintf+0x45>

00800714 <snprintf>:
  800714:	55                   	push   %ebp
  800715:	89 e5                	mov    %esp,%ebp
  800717:	83 ec 08             	sub    $0x8,%esp
  80071a:	8d 45 14             	lea    0x14(%ebp),%eax
  80071d:	50                   	push   %eax
  80071e:	ff 75 10             	push   0x10(%ebp)
  800721:	ff 75 0c             	push   0xc(%ebp)
  800724:	ff 75 08             	push   0x8(%ebp)
  800727:	e8 9a ff ff ff       	call   8006c6 <vsnprintf>
  80072c:	c9                   	leave
  80072d:	c3                   	ret

0080072e <strlen>:
  80072e:	55                   	push   %ebp
  80072f:	89 e5                	mov    %esp,%ebp
  800731:	8b 55 08             	mov    0x8(%ebp),%edx
  800734:	b8 00 00 00 00       	mov    $0x0,%eax
  800739:	eb 03                	jmp    80073e <strlen+0x10>
  80073b:	83 c0 01             	add    $0x1,%eax
  80073e:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  800742:	75 f7                	jne    80073b <strlen+0xd>
  800744:	5d                   	pop    %ebp
  800745:	c3                   	ret

00800746 <strnlen>:
  800746:	55                   	push   %ebp
  800747:	89 e5                	mov    %esp,%ebp
  800749:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80074c:	8b 55 0c             	mov    0xc(%ebp),%edx
  80074f:	b8 00 00 00 00       	mov    $0x0,%eax
  800754:	eb 03                	jmp    800759 <strnlen+0x13>
  800756:	83 c0 01             	add    $0x1,%eax
  800759:	39 d0                	cmp    %edx,%eax
  80075b:	74 08                	je     800765 <strnlen+0x1f>
  80075d:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  800761:	75 f3                	jne    800756 <strnlen+0x10>
  800763:	89 c2                	mov    %eax,%edx
  800765:	89 d0                	mov    %edx,%eax
  800767:	5d                   	pop    %ebp
  800768:	c3                   	ret

00800769 <strcpy>:
  800769:	55                   	push   %ebp
  80076a:	89 e5                	mov    %esp,%ebp
  80076c:	53                   	push   %ebx
  80076d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800770:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800773:	b8 00 00 00 00       	mov    $0x0,%eax
  800778:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  80077c:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  80077f:	83 c0 01             	add    $0x1,%eax
  800782:	84 d2                	test   %dl,%dl
  800784:	75 f2                	jne    800778 <strcpy+0xf>
  800786:	89 c8                	mov    %ecx,%eax
  800788:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  80078b:	c9                   	leave
  80078c:	c3                   	ret

0080078d <strcat>:
  80078d:	55                   	push   %ebp
  80078e:	89 e5                	mov    %esp,%ebp
  800790:	53                   	push   %ebx
  800791:	83 ec 10             	sub    $0x10,%esp
  800794:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800797:	53                   	push   %ebx
  800798:	e8 91 ff ff ff       	call   80072e <strlen>
  80079d:	83 c4 08             	add    $0x8,%esp
  8007a0:	ff 75 0c             	push   0xc(%ebp)
  8007a3:	01 d8                	add    %ebx,%eax
  8007a5:	50                   	push   %eax
  8007a6:	e8 be ff ff ff       	call   800769 <strcpy>
  8007ab:	89 d8                	mov    %ebx,%eax
  8007ad:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8007b0:	c9                   	leave
  8007b1:	c3                   	ret

008007b2 <strncpy>:
  8007b2:	55                   	push   %ebp
  8007b3:	89 e5                	mov    %esp,%ebp
  8007b5:	56                   	push   %esi
  8007b6:	53                   	push   %ebx
  8007b7:	8b 75 08             	mov    0x8(%ebp),%esi
  8007ba:	8b 55 0c             	mov    0xc(%ebp),%edx
  8007bd:	89 f3                	mov    %esi,%ebx
  8007bf:	03 5d 10             	add    0x10(%ebp),%ebx
  8007c2:	89 f0                	mov    %esi,%eax
  8007c4:	eb 0f                	jmp    8007d5 <strncpy+0x23>
  8007c6:	83 c0 01             	add    $0x1,%eax
  8007c9:	0f b6 0a             	movzbl (%edx),%ecx
  8007cc:	88 48 ff             	mov    %cl,-0x1(%eax)
  8007cf:	80 f9 01             	cmp    $0x1,%cl
  8007d2:	83 da ff             	sbb    $0xffffffff,%edx
  8007d5:	39 d8                	cmp    %ebx,%eax
  8007d7:	75 ed                	jne    8007c6 <strncpy+0x14>
  8007d9:	89 f0                	mov    %esi,%eax
  8007db:	5b                   	pop    %ebx
  8007dc:	5e                   	pop    %esi
  8007dd:	5d                   	pop    %ebp
  8007de:	c3                   	ret

008007df <strlcpy>:
  8007df:	55                   	push   %ebp
  8007e0:	89 e5                	mov    %esp,%ebp
  8007e2:	56                   	push   %esi
  8007e3:	53                   	push   %ebx
  8007e4:	8b 75 08             	mov    0x8(%ebp),%esi
  8007e7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8007ea:	8b 55 10             	mov    0x10(%ebp),%edx
  8007ed:	89 f0                	mov    %esi,%eax
  8007ef:	85 d2                	test   %edx,%edx
  8007f1:	74 21                	je     800814 <strlcpy+0x35>
  8007f3:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  8007f7:	89 f2                	mov    %esi,%edx
  8007f9:	eb 09                	jmp    800804 <strlcpy+0x25>
  8007fb:	83 c1 01             	add    $0x1,%ecx
  8007fe:	83 c2 01             	add    $0x1,%edx
  800801:	88 5a ff             	mov    %bl,-0x1(%edx)
  800804:	39 c2                	cmp    %eax,%edx
  800806:	74 09                	je     800811 <strlcpy+0x32>
  800808:	0f b6 19             	movzbl (%ecx),%ebx
  80080b:	84 db                	test   %bl,%bl
  80080d:	75 ec                	jne    8007fb <strlcpy+0x1c>
  80080f:	89 d0                	mov    %edx,%eax
  800811:	c6 00 00             	movb   $0x0,(%eax)
  800814:	29 f0                	sub    %esi,%eax
  800816:	5b                   	pop    %ebx
  800817:	5e                   	pop    %esi
  800818:	5d                   	pop    %ebp
  800819:	c3                   	ret

0080081a <strcmp>:
  80081a:	55                   	push   %ebp
  80081b:	89 e5                	mov    %esp,%ebp
  80081d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800820:	8b 55 0c             	mov    0xc(%ebp),%edx
  800823:	eb 06                	jmp    80082b <strcmp+0x11>
  800825:	83 c1 01             	add    $0x1,%ecx
  800828:	83 c2 01             	add    $0x1,%edx
  80082b:	0f b6 01             	movzbl (%ecx),%eax
  80082e:	84 c0                	test   %al,%al
  800830:	74 04                	je     800836 <strcmp+0x1c>
  800832:	3a 02                	cmp    (%edx),%al
  800834:	74 ef                	je     800825 <strcmp+0xb>
  800836:	0f b6 c0             	movzbl %al,%eax
  800839:	0f b6 12             	movzbl (%edx),%edx
  80083c:	29 d0                	sub    %edx,%eax
  80083e:	5d                   	pop    %ebp
  80083f:	c3                   	ret

00800840 <strncmp>:
  800840:	55                   	push   %ebp
  800841:	89 e5                	mov    %esp,%ebp
  800843:	53                   	push   %ebx
  800844:	8b 45 08             	mov    0x8(%ebp),%eax
  800847:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80084a:	8b 55 10             	mov    0x10(%ebp),%edx
  80084d:	eb 09                	jmp    800858 <strncmp+0x18>
  80084f:	83 ea 01             	sub    $0x1,%edx
  800852:	83 c0 01             	add    $0x1,%eax
  800855:	83 c1 01             	add    $0x1,%ecx
  800858:	85 d2                	test   %edx,%edx
  80085a:	74 18                	je     800874 <strncmp+0x34>
  80085c:	0f b6 18             	movzbl (%eax),%ebx
  80085f:	84 db                	test   %bl,%bl
  800861:	74 04                	je     800867 <strncmp+0x27>
  800863:	3a 19                	cmp    (%ecx),%bl
  800865:	74 e8                	je     80084f <strncmp+0xf>
  800867:	0f b6 00             	movzbl (%eax),%eax
  80086a:	0f b6 11             	movzbl (%ecx),%edx
  80086d:	29 d0                	sub    %edx,%eax
  80086f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800872:	c9                   	leave
  800873:	c3                   	ret
  800874:	b8 00 00 00 00       	mov    $0x0,%eax
  800879:	eb f4                	jmp    80086f <strncmp+0x2f>

0080087b <strchr>:
  80087b:	55                   	push   %ebp
  80087c:	89 e5                	mov    %esp,%ebp
  80087e:	8b 45 08             	mov    0x8(%ebp),%eax
  800881:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  800885:	eb 03                	jmp    80088a <strchr+0xf>
  800887:	83 c0 01             	add    $0x1,%eax
  80088a:	0f b6 10             	movzbl (%eax),%edx
  80088d:	84 d2                	test   %dl,%dl
  80088f:	74 06                	je     800897 <strchr+0x1c>
  800891:	38 ca                	cmp    %cl,%dl
  800893:	75 f2                	jne    800887 <strchr+0xc>
  800895:	eb 05                	jmp    80089c <strchr+0x21>
  800897:	b8 00 00 00 00       	mov    $0x0,%eax
  80089c:	5d                   	pop    %ebp
  80089d:	c3                   	ret

0080089e <strfind>:
  80089e:	55                   	push   %ebp
  80089f:	89 e5                	mov    %esp,%ebp
  8008a1:	8b 45 08             	mov    0x8(%ebp),%eax
  8008a4:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8008a8:	0f b6 10             	movzbl (%eax),%edx
  8008ab:	38 ca                	cmp    %cl,%dl
  8008ad:	74 09                	je     8008b8 <strfind+0x1a>
  8008af:	84 d2                	test   %dl,%dl
  8008b1:	74 05                	je     8008b8 <strfind+0x1a>
  8008b3:	83 c0 01             	add    $0x1,%eax
  8008b6:	eb f0                	jmp    8008a8 <strfind+0xa>
  8008b8:	5d                   	pop    %ebp
  8008b9:	c3                   	ret

008008ba <memset>:
  8008ba:	55                   	push   %ebp
  8008bb:	89 e5                	mov    %esp,%ebp
  8008bd:	57                   	push   %edi
  8008be:	8b 55 08             	mov    0x8(%ebp),%edx
  8008c1:	8b 4d 10             	mov    0x10(%ebp),%ecx
  8008c4:	85 c9                	test   %ecx,%ecx
  8008c6:	74 24                	je     8008ec <memset+0x32>
  8008c8:	89 d0                	mov    %edx,%eax
  8008ca:	09 c8                	or     %ecx,%eax
  8008cc:	a8 03                	test   $0x3,%al
  8008ce:	75 14                	jne    8008e4 <memset+0x2a>
  8008d0:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  8008d4:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  8008da:	c1 e9 02             	shr    $0x2,%ecx
  8008dd:	89 d7                	mov    %edx,%edi
  8008df:	fc                   	cld
  8008e0:	f3 ab                	rep stos %eax,%es:(%edi)
  8008e2:	eb 08                	jmp    8008ec <memset+0x32>
  8008e4:	89 d7                	mov    %edx,%edi
  8008e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  8008e9:	fc                   	cld
  8008ea:	f3 aa                	rep stos %al,%es:(%edi)
  8008ec:	89 d0                	mov    %edx,%eax
  8008ee:	8b 7d fc             	mov    -0x4(%ebp),%edi
  8008f1:	c9                   	leave
  8008f2:	c3                   	ret

008008f3 <memmove>:
  8008f3:	55                   	push   %ebp
  8008f4:	89 e5                	mov    %esp,%ebp
  8008f6:	57                   	push   %edi
  8008f7:	56                   	push   %esi
  8008f8:	8b 45 08             	mov    0x8(%ebp),%eax
  8008fb:	8b 75 0c             	mov    0xc(%ebp),%esi
  8008fe:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800901:	39 c6                	cmp    %eax,%esi
  800903:	73 32                	jae    800937 <memmove+0x44>
  800905:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  800908:	39 d0                	cmp    %edx,%eax
  80090a:	73 2b                	jae    800937 <memmove+0x44>
  80090c:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  80090f:	89 fe                	mov    %edi,%esi
  800911:	09 ce                	or     %ecx,%esi
  800913:	09 d6                	or     %edx,%esi
  800915:	f7 c6 03 00 00 00    	test   $0x3,%esi
  80091b:	75 0e                	jne    80092b <memmove+0x38>
  80091d:	83 ef 04             	sub    $0x4,%edi
  800920:	8d 72 fc             	lea    -0x4(%edx),%esi
  800923:	c1 e9 02             	shr    $0x2,%ecx
  800926:	fd                   	std
  800927:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800929:	eb 09                	jmp    800934 <memmove+0x41>
  80092b:	83 ef 01             	sub    $0x1,%edi
  80092e:	8d 72 ff             	lea    -0x1(%edx),%esi
  800931:	fd                   	std
  800932:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800934:	fc                   	cld
  800935:	eb 1a                	jmp    800951 <memmove+0x5e>
  800937:	89 c2                	mov    %eax,%edx
  800939:	09 ca                	or     %ecx,%edx
  80093b:	09 f2                	or     %esi,%edx
  80093d:	f6 c2 03             	test   $0x3,%dl
  800940:	75 0a                	jne    80094c <memmove+0x59>
  800942:	c1 e9 02             	shr    $0x2,%ecx
  800945:	89 c7                	mov    %eax,%edi
  800947:	fc                   	cld
  800948:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  80094a:	eb 05                	jmp    800951 <memmove+0x5e>
  80094c:	89 c7                	mov    %eax,%edi
  80094e:	fc                   	cld
  80094f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800951:	5e                   	pop    %esi
  800952:	5f                   	pop    %edi
  800953:	5d                   	pop    %ebp
  800954:	c3                   	ret

00800955 <memcpy>:
  800955:	55                   	push   %ebp
  800956:	89 e5                	mov    %esp,%ebp
  800958:	83 ec 0c             	sub    $0xc,%esp
  80095b:	ff 75 10             	push   0x10(%ebp)
  80095e:	ff 75 0c             	push   0xc(%ebp)
  800961:	ff 75 08             	push   0x8(%ebp)
  800964:	e8 8a ff ff ff       	call   8008f3 <memmove>
  800969:	c9                   	leave
  80096a:	c3                   	ret

0080096b <memcmp>:
  80096b:	55                   	push   %ebp
  80096c:	89 e5                	mov    %esp,%ebp
  80096e:	56                   	push   %esi
  80096f:	53                   	push   %ebx
  800970:	8b 45 08             	mov    0x8(%ebp),%eax
  800973:	8b 55 0c             	mov    0xc(%ebp),%edx
  800976:	89 c6                	mov    %eax,%esi
  800978:	03 75 10             	add    0x10(%ebp),%esi
  80097b:	eb 06                	jmp    800983 <memcmp+0x18>
  80097d:	83 c0 01             	add    $0x1,%eax
  800980:	83 c2 01             	add    $0x1,%edx
  800983:	39 f0                	cmp    %esi,%eax
  800985:	74 14                	je     80099b <memcmp+0x30>
  800987:	0f b6 08             	movzbl (%eax),%ecx
  80098a:	0f b6 1a             	movzbl (%edx),%ebx
  80098d:	38 d9                	cmp    %bl,%cl
  80098f:	74 ec                	je     80097d <memcmp+0x12>
  800991:	0f b6 c1             	movzbl %cl,%eax
  800994:	0f b6 db             	movzbl %bl,%ebx
  800997:	29 d8                	sub    %ebx,%eax
  800999:	eb 05                	jmp    8009a0 <memcmp+0x35>
  80099b:	b8 00 00 00 00       	mov    $0x0,%eax
  8009a0:	5b                   	pop    %ebx
  8009a1:	5e                   	pop    %esi
  8009a2:	5d                   	pop    %ebp
  8009a3:	c3                   	ret

008009a4 <memfind>:
  8009a4:	55                   	push   %ebp
  8009a5:	89 e5                	mov    %esp,%ebp
  8009a7:	8b 45 08             	mov    0x8(%ebp),%eax
  8009aa:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8009ad:	89 c2                	mov    %eax,%edx
  8009af:	03 55 10             	add    0x10(%ebp),%edx
  8009b2:	eb 03                	jmp    8009b7 <memfind+0x13>
  8009b4:	83 c0 01             	add    $0x1,%eax
  8009b7:	39 d0                	cmp    %edx,%eax
  8009b9:	73 04                	jae    8009bf <memfind+0x1b>
  8009bb:	38 08                	cmp    %cl,(%eax)
  8009bd:	75 f5                	jne    8009b4 <memfind+0x10>
  8009bf:	5d                   	pop    %ebp
  8009c0:	c3                   	ret

008009c1 <strtol>:
  8009c1:	55                   	push   %ebp
  8009c2:	89 e5                	mov    %esp,%ebp
  8009c4:	57                   	push   %edi
  8009c5:	56                   	push   %esi
  8009c6:	53                   	push   %ebx
  8009c7:	8b 55 08             	mov    0x8(%ebp),%edx
  8009ca:	8b 5d 10             	mov    0x10(%ebp),%ebx
  8009cd:	eb 03                	jmp    8009d2 <strtol+0x11>
  8009cf:	83 c2 01             	add    $0x1,%edx
  8009d2:	0f b6 02             	movzbl (%edx),%eax
  8009d5:	3c 20                	cmp    $0x20,%al
  8009d7:	74 f6                	je     8009cf <strtol+0xe>
  8009d9:	3c 09                	cmp    $0x9,%al
  8009db:	74 f2                	je     8009cf <strtol+0xe>
  8009dd:	3c 2b                	cmp    $0x2b,%al
  8009df:	74 2a                	je     800a0b <strtol+0x4a>
  8009e1:	bf 00 00 00 00       	mov    $0x0,%edi
  8009e6:	3c 2d                	cmp    $0x2d,%al
  8009e8:	74 2b                	je     800a15 <strtol+0x54>
  8009ea:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  8009f0:	75 0f                	jne    800a01 <strtol+0x40>
  8009f2:	80 3a 30             	cmpb   $0x30,(%edx)
  8009f5:	74 28                	je     800a1f <strtol+0x5e>
  8009f7:	85 db                	test   %ebx,%ebx
  8009f9:	b8 0a 00 00 00       	mov    $0xa,%eax
  8009fe:	0f 44 d8             	cmove  %eax,%ebx
  800a01:	b9 00 00 00 00       	mov    $0x0,%ecx
  800a06:	89 5d 10             	mov    %ebx,0x10(%ebp)
  800a09:	eb 46                	jmp    800a51 <strtol+0x90>
  800a0b:	83 c2 01             	add    $0x1,%edx
  800a0e:	bf 00 00 00 00       	mov    $0x0,%edi
  800a13:	eb d5                	jmp    8009ea <strtol+0x29>
  800a15:	83 c2 01             	add    $0x1,%edx
  800a18:	bf 01 00 00 00       	mov    $0x1,%edi
  800a1d:	eb cb                	jmp    8009ea <strtol+0x29>
  800a1f:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800a23:	74 0e                	je     800a33 <strtol+0x72>
  800a25:	85 db                	test   %ebx,%ebx
  800a27:	75 d8                	jne    800a01 <strtol+0x40>
  800a29:	83 c2 01             	add    $0x1,%edx
  800a2c:	bb 08 00 00 00       	mov    $0x8,%ebx
  800a31:	eb ce                	jmp    800a01 <strtol+0x40>
  800a33:	83 c2 02             	add    $0x2,%edx
  800a36:	bb 10 00 00 00       	mov    $0x10,%ebx
  800a3b:	eb c4                	jmp    800a01 <strtol+0x40>
  800a3d:	0f be c0             	movsbl %al,%eax
  800a40:	83 e8 30             	sub    $0x30,%eax
  800a43:	3b 45 10             	cmp    0x10(%ebp),%eax
  800a46:	7d 3a                	jge    800a82 <strtol+0xc1>
  800a48:	83 c2 01             	add    $0x1,%edx
  800a4b:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  800a4f:	01 c1                	add    %eax,%ecx
  800a51:	0f b6 02             	movzbl (%edx),%eax
  800a54:	8d 70 d0             	lea    -0x30(%eax),%esi
  800a57:	89 f3                	mov    %esi,%ebx
  800a59:	80 fb 09             	cmp    $0x9,%bl
  800a5c:	76 df                	jbe    800a3d <strtol+0x7c>
  800a5e:	8d 70 9f             	lea    -0x61(%eax),%esi
  800a61:	89 f3                	mov    %esi,%ebx
  800a63:	80 fb 19             	cmp    $0x19,%bl
  800a66:	77 08                	ja     800a70 <strtol+0xaf>
  800a68:	0f be c0             	movsbl %al,%eax
  800a6b:	83 e8 57             	sub    $0x57,%eax
  800a6e:	eb d3                	jmp    800a43 <strtol+0x82>
  800a70:	8d 70 bf             	lea    -0x41(%eax),%esi
  800a73:	89 f3                	mov    %esi,%ebx
  800a75:	80 fb 19             	cmp    $0x19,%bl
  800a78:	77 08                	ja     800a82 <strtol+0xc1>
  800a7a:	0f be c0             	movsbl %al,%eax
  800a7d:	83 e8 37             	sub    $0x37,%eax
  800a80:	eb c1                	jmp    800a43 <strtol+0x82>
  800a82:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  800a86:	74 05                	je     800a8d <strtol+0xcc>
  800a88:	8b 45 0c             	mov    0xc(%ebp),%eax
  800a8b:	89 10                	mov    %edx,(%eax)
  800a8d:	89 c8                	mov    %ecx,%eax
  800a8f:	f7 d8                	neg    %eax
  800a91:	85 ff                	test   %edi,%edi
  800a93:	0f 45 c8             	cmovne %eax,%ecx
  800a96:	89 c8                	mov    %ecx,%eax
  800a98:	5b                   	pop    %ebx
  800a99:	5e                   	pop    %esi
  800a9a:	5f                   	pop    %edi
  800a9b:	5d                   	pop    %ebp
  800a9c:	c3                   	ret

00800a9d <syscall>:
  800a9d:	55                   	push   %ebp
  800a9e:	89 e5                	mov    %esp,%ebp
  800aa0:	57                   	push   %edi
  800aa1:	56                   	push   %esi
  800aa2:	53                   	push   %ebx
  800aa3:	83 ec 1c             	sub    $0x1c,%esp
  800aa6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800aa9:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  800aac:	89 ca                	mov    %ecx,%edx
  800aae:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800ab1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800ab4:	8b 7d 10             	mov    0x10(%ebp),%edi
  800ab7:	8b 75 14             	mov    0x14(%ebp),%esi
  800aba:	cd 30                	int    $0x30
  800abc:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  800ac0:	74 04                	je     800ac6 <syscall+0x29>
  800ac2:	85 c0                	test   %eax,%eax
  800ac4:	7f 08                	jg     800ace <syscall+0x31>
  800ac6:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800ac9:	5b                   	pop    %ebx
  800aca:	5e                   	pop    %esi
  800acb:	5f                   	pop    %edi
  800acc:	5d                   	pop    %ebp
  800acd:	c3                   	ret
  800ace:	83 ec 0c             	sub    $0xc,%esp
  800ad1:	50                   	push   %eax
  800ad2:	ff 75 e0             	push   -0x20(%ebp)
  800ad5:	68 6f 16 80 00       	push   $0x80166f
  800ada:	6a 1e                	push   $0x1e
  800adc:	68 8c 16 80 00       	push   $0x80168c
  800ae1:	e8 63 f6 ff ff       	call   800149 <_panic>

00800ae6 <sys_cputs>:
  800ae6:	55                   	push   %ebp
  800ae7:	89 e5                	mov    %esp,%ebp
  800ae9:	83 ec 08             	sub    $0x8,%esp
  800aec:	6a 00                	push   $0x0
  800aee:	6a 00                	push   $0x0
  800af0:	6a 00                	push   $0x0
  800af2:	ff 75 0c             	push   0xc(%ebp)
  800af5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800af8:	ba 00 00 00 00       	mov    $0x0,%edx
  800afd:	b8 00 00 00 00       	mov    $0x0,%eax
  800b02:	e8 96 ff ff ff       	call   800a9d <syscall>
  800b07:	83 c4 10             	add    $0x10,%esp
  800b0a:	c9                   	leave
  800b0b:	c3                   	ret

00800b0c <sys_cgetc>:
  800b0c:	55                   	push   %ebp
  800b0d:	89 e5                	mov    %esp,%ebp
  800b0f:	83 ec 08             	sub    $0x8,%esp
  800b12:	6a 00                	push   $0x0
  800b14:	6a 00                	push   $0x0
  800b16:	6a 00                	push   $0x0
  800b18:	6a 00                	push   $0x0
  800b1a:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b1f:	ba 00 00 00 00       	mov    $0x0,%edx
  800b24:	b8 01 00 00 00       	mov    $0x1,%eax
  800b29:	e8 6f ff ff ff       	call   800a9d <syscall>
  800b2e:	c9                   	leave
  800b2f:	c3                   	ret

00800b30 <sys_env_destroy>:
  800b30:	55                   	push   %ebp
  800b31:	89 e5                	mov    %esp,%ebp
  800b33:	83 ec 08             	sub    $0x8,%esp
  800b36:	6a 00                	push   $0x0
  800b38:	6a 00                	push   $0x0
  800b3a:	6a 00                	push   $0x0
  800b3c:	6a 00                	push   $0x0
  800b3e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b41:	ba 01 00 00 00       	mov    $0x1,%edx
  800b46:	b8 03 00 00 00       	mov    $0x3,%eax
  800b4b:	e8 4d ff ff ff       	call   800a9d <syscall>
  800b50:	c9                   	leave
  800b51:	c3                   	ret

00800b52 <sys_getenvid>:
  800b52:	55                   	push   %ebp
  800b53:	89 e5                	mov    %esp,%ebp
  800b55:	83 ec 08             	sub    $0x8,%esp
  800b58:	6a 00                	push   $0x0
  800b5a:	6a 00                	push   $0x0
  800b5c:	6a 00                	push   $0x0
  800b5e:	6a 00                	push   $0x0
  800b60:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b65:	ba 00 00 00 00       	mov    $0x0,%edx
  800b6a:	b8 02 00 00 00       	mov    $0x2,%eax
  800b6f:	e8 29 ff ff ff       	call   800a9d <syscall>
  800b74:	c9                   	leave
  800b75:	c3                   	ret

00800b76 <sys_yield>:
  800b76:	55                   	push   %ebp
  800b77:	89 e5                	mov    %esp,%ebp
  800b79:	83 ec 08             	sub    $0x8,%esp
  800b7c:	6a 00                	push   $0x0
  800b7e:	6a 00                	push   $0x0
  800b80:	6a 00                	push   $0x0
  800b82:	6a 00                	push   $0x0
  800b84:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b89:	ba 00 00 00 00       	mov    $0x0,%edx
  800b8e:	b8 0a 00 00 00       	mov    $0xa,%eax
  800b93:	e8 05 ff ff ff       	call   800a9d <syscall>
  800b98:	83 c4 10             	add    $0x10,%esp
  800b9b:	c9                   	leave
  800b9c:	c3                   	ret

00800b9d <sys_page_alloc>:
  800b9d:	55                   	push   %ebp
  800b9e:	89 e5                	mov    %esp,%ebp
  800ba0:	83 ec 08             	sub    $0x8,%esp
  800ba3:	6a 00                	push   $0x0
  800ba5:	6a 00                	push   $0x0
  800ba7:	ff 75 10             	push   0x10(%ebp)
  800baa:	ff 75 0c             	push   0xc(%ebp)
  800bad:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bb0:	ba 01 00 00 00       	mov    $0x1,%edx
  800bb5:	b8 04 00 00 00       	mov    $0x4,%eax
  800bba:	e8 de fe ff ff       	call   800a9d <syscall>
  800bbf:	c9                   	leave
  800bc0:	c3                   	ret

00800bc1 <sys_page_map>:
  800bc1:	55                   	push   %ebp
  800bc2:	89 e5                	mov    %esp,%ebp
  800bc4:	83 ec 08             	sub    $0x8,%esp
  800bc7:	ff 75 18             	push   0x18(%ebp)
  800bca:	ff 75 14             	push   0x14(%ebp)
  800bcd:	ff 75 10             	push   0x10(%ebp)
  800bd0:	ff 75 0c             	push   0xc(%ebp)
  800bd3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bd6:	ba 01 00 00 00       	mov    $0x1,%edx
  800bdb:	b8 05 00 00 00       	mov    $0x5,%eax
  800be0:	e8 b8 fe ff ff       	call   800a9d <syscall>
  800be5:	c9                   	leave
  800be6:	c3                   	ret

00800be7 <sys_page_unmap>:
  800be7:	55                   	push   %ebp
  800be8:	89 e5                	mov    %esp,%ebp
  800bea:	83 ec 08             	sub    $0x8,%esp
  800bed:	6a 00                	push   $0x0
  800bef:	6a 00                	push   $0x0
  800bf1:	6a 00                	push   $0x0
  800bf3:	ff 75 0c             	push   0xc(%ebp)
  800bf6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bf9:	ba 01 00 00 00       	mov    $0x1,%edx
  800bfe:	b8 06 00 00 00       	mov    $0x6,%eax
  800c03:	e8 95 fe ff ff       	call   800a9d <syscall>
  800c08:	c9                   	leave
  800c09:	c3                   	ret

00800c0a <sys_env_set_status>:
  800c0a:	55                   	push   %ebp
  800c0b:	89 e5                	mov    %esp,%ebp
  800c0d:	83 ec 08             	sub    $0x8,%esp
  800c10:	6a 00                	push   $0x0
  800c12:	6a 00                	push   $0x0
  800c14:	6a 00                	push   $0x0
  800c16:	ff 75 0c             	push   0xc(%ebp)
  800c19:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c1c:	ba 01 00 00 00       	mov    $0x1,%edx
  800c21:	b8 08 00 00 00       	mov    $0x8,%eax
  800c26:	e8 72 fe ff ff       	call   800a9d <syscall>
  800c2b:	c9                   	leave
  800c2c:	c3                   	ret

00800c2d <sys_env_set_pgfault_upcall>:
  800c2d:	55                   	push   %ebp
  800c2e:	89 e5                	mov    %esp,%ebp
  800c30:	83 ec 08             	sub    $0x8,%esp
  800c33:	6a 00                	push   $0x0
  800c35:	6a 00                	push   $0x0
  800c37:	6a 00                	push   $0x0
  800c39:	ff 75 0c             	push   0xc(%ebp)
  800c3c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c3f:	ba 01 00 00 00       	mov    $0x1,%edx
  800c44:	b8 09 00 00 00       	mov    $0x9,%eax
  800c49:	e8 4f fe ff ff       	call   800a9d <syscall>
  800c4e:	c9                   	leave
  800c4f:	c3                   	ret

00800c50 <sys_ipc_try_send>:
  800c50:	55                   	push   %ebp
  800c51:	89 e5                	mov    %esp,%ebp
  800c53:	83 ec 08             	sub    $0x8,%esp
  800c56:	6a 00                	push   $0x0
  800c58:	ff 75 14             	push   0x14(%ebp)
  800c5b:	ff 75 10             	push   0x10(%ebp)
  800c5e:	ff 75 0c             	push   0xc(%ebp)
  800c61:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c64:	ba 00 00 00 00       	mov    $0x0,%edx
  800c69:	b8 0c 00 00 00       	mov    $0xc,%eax
  800c6e:	e8 2a fe ff ff       	call   800a9d <syscall>
  800c73:	c9                   	leave
  800c74:	c3                   	ret

00800c75 <sys_ipc_recv>:
  800c75:	55                   	push   %ebp
  800c76:	89 e5                	mov    %esp,%ebp
  800c78:	83 ec 08             	sub    $0x8,%esp
  800c7b:	6a 00                	push   $0x0
  800c7d:	6a 00                	push   $0x0
  800c7f:	6a 00                	push   $0x0
  800c81:	6a 00                	push   $0x0
  800c83:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c86:	ba 01 00 00 00       	mov    $0x1,%edx
  800c8b:	b8 0d 00 00 00       	mov    $0xd,%eax
  800c90:	e8 08 fe ff ff       	call   800a9d <syscall>
  800c95:	c9                   	leave
  800c96:	c3                   	ret

00800c97 <duppage>:
  800c97:	55                   	push   %ebp
  800c98:	89 e5                	mov    %esp,%ebp
  800c9a:	56                   	push   %esi
  800c9b:	53                   	push   %ebx
  800c9c:	89 c1                	mov    %eax,%ecx
  800c9e:	89 d6                	mov    %edx,%esi
  800ca0:	c1 e6 0c             	shl    $0xc,%esi
  800ca3:	8b 14 95 00 00 40 ef 	mov    -0x10c00000(,%edx,4),%edx
  800caa:	89 d0                	mov    %edx,%eax
  800cac:	f7 d0                	not    %eax
  800cae:	a8 05                	test   $0x5,%al
  800cb0:	75 5a                	jne    800d0c <duppage+0x75>
  800cb2:	89 d0                	mov    %edx,%eax
  800cb4:	83 e0 18             	and    $0x18,%eax
  800cb7:	83 f8 01             	cmp    $0x1,%eax
  800cba:	19 c0                	sbb    %eax,%eax
  800cbc:	83 e0 e8             	and    $0xffffffe8,%eax
  800cbf:	83 c0 1d             	add    $0x1d,%eax
  800cc2:	f7 c2 02 08 00 00    	test   $0x802,%edx
  800cc8:	74 68                	je     800d32 <duppage+0x9b>
  800cca:	80 cc 08             	or     $0x8,%ah
  800ccd:	89 c3                	mov    %eax,%ebx
  800ccf:	83 ec 0c             	sub    $0xc,%esp
  800cd2:	53                   	push   %ebx
  800cd3:	56                   	push   %esi
  800cd4:	51                   	push   %ecx
  800cd5:	56                   	push   %esi
  800cd6:	6a 00                	push   $0x0
  800cd8:	e8 e4 fe ff ff       	call   800bc1 <sys_page_map>
  800cdd:	83 c4 20             	add    $0x20,%esp
  800ce0:	85 c0                	test   %eax,%eax
  800ce2:	78 3c                	js     800d20 <duppage+0x89>
  800ce4:	83 ec 0c             	sub    $0xc,%esp
  800ce7:	53                   	push   %ebx
  800ce8:	56                   	push   %esi
  800ce9:	6a 00                	push   $0x0
  800ceb:	56                   	push   %esi
  800cec:	6a 00                	push   $0x0
  800cee:	e8 ce fe ff ff       	call   800bc1 <sys_page_map>
  800cf3:	83 c4 20             	add    $0x20,%esp
  800cf6:	85 c0                	test   %eax,%eax
  800cf8:	79 4d                	jns    800d47 <duppage+0xb0>
  800cfa:	50                   	push   %eax
  800cfb:	68 88 14 80 00       	push   $0x801488
  800d00:	6a 57                	push   $0x57
  800d02:	68 9a 16 80 00       	push   $0x80169a
  800d07:	e8 3d f4 ff ff       	call   800149 <_panic>
  800d0c:	83 ec 04             	sub    $0x4,%esp
  800d0f:	68 2c 14 80 00       	push   $0x80142c
  800d14:	6a 47                	push   $0x47
  800d16:	68 9a 16 80 00       	push   $0x80169a
  800d1b:	e8 29 f4 ff ff       	call   800149 <_panic>
  800d20:	50                   	push   %eax
  800d21:	68 5c 14 80 00       	push   $0x80145c
  800d26:	6a 53                	push   $0x53
  800d28:	68 9a 16 80 00       	push   $0x80169a
  800d2d:	e8 17 f4 ff ff       	call   800149 <_panic>
  800d32:	83 ec 0c             	sub    $0xc,%esp
  800d35:	50                   	push   %eax
  800d36:	56                   	push   %esi
  800d37:	51                   	push   %ecx
  800d38:	56                   	push   %esi
  800d39:	6a 00                	push   $0x0
  800d3b:	e8 81 fe ff ff       	call   800bc1 <sys_page_map>
  800d40:	83 c4 20             	add    $0x20,%esp
  800d43:	85 c0                	test   %eax,%eax
  800d45:	78 0c                	js     800d53 <duppage+0xbc>
  800d47:	b8 00 00 00 00       	mov    $0x0,%eax
  800d4c:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800d4f:	5b                   	pop    %ebx
  800d50:	5e                   	pop    %esi
  800d51:	5d                   	pop    %ebp
  800d52:	c3                   	ret
  800d53:	50                   	push   %eax
  800d54:	68 b0 14 80 00       	push   $0x8014b0
  800d59:	6a 5b                	push   $0x5b
  800d5b:	68 9a 16 80 00       	push   $0x80169a
  800d60:	e8 e4 f3 ff ff       	call   800149 <_panic>

00800d65 <dup_or_share>:
  800d65:	55                   	push   %ebp
  800d66:	89 e5                	mov    %esp,%ebp
  800d68:	57                   	push   %edi
  800d69:	56                   	push   %esi
  800d6a:	53                   	push   %ebx
  800d6b:	83 ec 0c             	sub    $0xc,%esp
  800d6e:	89 c7                	mov    %eax,%edi
  800d70:	8b 04 95 00 00 40 ef 	mov    -0x10c00000(,%edx,4),%eax
  800d77:	a8 01                	test   $0x1,%al
  800d79:	74 33                	je     800dae <dup_or_share+0x49>
  800d7b:	89 d6                	mov    %edx,%esi
  800d7d:	21 c1                	and    %eax,%ecx
  800d7f:	89 cb                	mov    %ecx,%ebx
  800d81:	83 e3 02             	and    $0x2,%ebx
  800d84:	89 da                	mov    %ebx,%edx
  800d86:	83 ca 18             	or     $0x18,%edx
  800d89:	a8 18                	test   $0x18,%al
  800d8b:	0f 45 da             	cmovne %edx,%ebx
  800d8e:	c1 e6 0c             	shl    $0xc,%esi
  800d91:	83 e0 1a             	and    $0x1a,%eax
  800d94:	83 f8 02             	cmp    $0x2,%eax
  800d97:	74 32                	je     800dcb <dup_or_share+0x66>
  800d99:	83 ec 0c             	sub    $0xc,%esp
  800d9c:	53                   	push   %ebx
  800d9d:	56                   	push   %esi
  800d9e:	57                   	push   %edi
  800d9f:	56                   	push   %esi
  800da0:	6a 00                	push   $0x0
  800da2:	e8 1a fe ff ff       	call   800bc1 <sys_page_map>
  800da7:	83 c4 20             	add    $0x20,%esp
  800daa:	85 c0                	test   %eax,%eax
  800dac:	78 08                	js     800db6 <dup_or_share+0x51>
  800dae:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800db1:	5b                   	pop    %ebx
  800db2:	5e                   	pop    %esi
  800db3:	5f                   	pop    %edi
  800db4:	5d                   	pop    %ebp
  800db5:	c3                   	ret
  800db6:	50                   	push   %eax
  800db7:	68 dc 14 80 00       	push   $0x8014dc
  800dbc:	68 84 00 00 00       	push   $0x84
  800dc1:	68 9a 16 80 00       	push   $0x80169a
  800dc6:	e8 7e f3 ff ff       	call   800149 <_panic>
  800dcb:	83 ec 04             	sub    $0x4,%esp
  800dce:	53                   	push   %ebx
  800dcf:	56                   	push   %esi
  800dd0:	57                   	push   %edi
  800dd1:	e8 c7 fd ff ff       	call   800b9d <sys_page_alloc>
  800dd6:	83 c4 10             	add    $0x10,%esp
  800dd9:	85 c0                	test   %eax,%eax
  800ddb:	78 57                	js     800e34 <dup_or_share+0xcf>
  800ddd:	83 ec 0c             	sub    $0xc,%esp
  800de0:	53                   	push   %ebx
  800de1:	68 00 00 40 00       	push   $0x400000
  800de6:	6a 00                	push   $0x0
  800de8:	56                   	push   %esi
  800de9:	57                   	push   %edi
  800dea:	e8 d2 fd ff ff       	call   800bc1 <sys_page_map>
  800def:	83 c4 20             	add    $0x20,%esp
  800df2:	85 c0                	test   %eax,%eax
  800df4:	78 53                	js     800e49 <dup_or_share+0xe4>
  800df6:	83 ec 04             	sub    $0x4,%esp
  800df9:	68 00 10 00 00       	push   $0x1000
  800dfe:	56                   	push   %esi
  800dff:	68 00 00 40 00       	push   $0x400000
  800e04:	e8 ea fa ff ff       	call   8008f3 <memmove>
  800e09:	83 c4 08             	add    $0x8,%esp
  800e0c:	68 00 00 40 00       	push   $0x400000
  800e11:	6a 00                	push   $0x0
  800e13:	e8 cf fd ff ff       	call   800be7 <sys_page_unmap>
  800e18:	83 c4 10             	add    $0x10,%esp
  800e1b:	85 c0                	test   %eax,%eax
  800e1d:	79 8f                	jns    800dae <dup_or_share+0x49>
  800e1f:	50                   	push   %eax
  800e20:	68 e4 16 80 00       	push   $0x8016e4
  800e25:	68 8d 00 00 00       	push   $0x8d
  800e2a:	68 9a 16 80 00       	push   $0x80169a
  800e2f:	e8 15 f3 ff ff       	call   800149 <_panic>
  800e34:	50                   	push   %eax
  800e35:	68 fc 14 80 00       	push   $0x8014fc
  800e3a:	68 88 00 00 00       	push   $0x88
  800e3f:	68 9a 16 80 00       	push   $0x80169a
  800e44:	e8 00 f3 ff ff       	call   800149 <_panic>
  800e49:	50                   	push   %eax
  800e4a:	68 dc 14 80 00       	push   $0x8014dc
  800e4f:	68 8a 00 00 00       	push   $0x8a
  800e54:	68 9a 16 80 00       	push   $0x80169a
  800e59:	e8 eb f2 ff ff       	call   800149 <_panic>

00800e5e <pgfault>:
  800e5e:	55                   	push   %ebp
  800e5f:	89 e5                	mov    %esp,%ebp
  800e61:	53                   	push   %ebx
  800e62:	83 ec 08             	sub    $0x8,%esp
  800e65:	8b 45 08             	mov    0x8(%ebp),%eax
  800e68:	8b 18                	mov    (%eax),%ebx
  800e6a:	89 d8                	mov    %ebx,%eax
  800e6c:	c1 e8 0c             	shr    $0xc,%eax
  800e6f:	8b 04 85 00 00 40 ef 	mov    -0x10c00000(,%eax,4),%eax
  800e76:	6a 07                	push   $0x7
  800e78:	68 00 f0 7f 00       	push   $0x7ff000
  800e7d:	6a 00                	push   $0x0
  800e7f:	e8 19 fd ff ff       	call   800b9d <sys_page_alloc>
  800e84:	83 c4 10             	add    $0x10,%esp
  800e87:	85 c0                	test   %eax,%eax
  800e89:	78 51                	js     800edc <pgfault+0x7e>
  800e8b:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  800e91:	83 ec 04             	sub    $0x4,%esp
  800e94:	68 00 10 00 00       	push   $0x1000
  800e99:	53                   	push   %ebx
  800e9a:	68 00 f0 7f 00       	push   $0x7ff000
  800e9f:	e8 4f fa ff ff       	call   8008f3 <memmove>
  800ea4:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
  800eab:	53                   	push   %ebx
  800eac:	6a 00                	push   $0x0
  800eae:	68 00 f0 7f 00       	push   $0x7ff000
  800eb3:	6a 00                	push   $0x0
  800eb5:	e8 07 fd ff ff       	call   800bc1 <sys_page_map>
  800eba:	83 c4 20             	add    $0x20,%esp
  800ebd:	85 c0                	test   %eax,%eax
  800ebf:	78 2d                	js     800eee <pgfault+0x90>
  800ec1:	83 ec 08             	sub    $0x8,%esp
  800ec4:	68 00 f0 7f 00       	push   $0x7ff000
  800ec9:	6a 00                	push   $0x0
  800ecb:	e8 17 fd ff ff       	call   800be7 <sys_page_unmap>
  800ed0:	83 c4 10             	add    $0x10,%esp
  800ed3:	85 c0                	test   %eax,%eax
  800ed5:	78 29                	js     800f00 <pgfault+0xa2>
  800ed7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800eda:	c9                   	leave
  800edb:	c3                   	ret
  800edc:	50                   	push   %eax
  800edd:	68 a5 16 80 00       	push   $0x8016a5
  800ee2:	6a 27                	push   $0x27
  800ee4:	68 9a 16 80 00       	push   $0x80169a
  800ee9:	e8 5b f2 ff ff       	call   800149 <_panic>
  800eee:	50                   	push   %eax
  800eef:	68 c1 16 80 00       	push   $0x8016c1
  800ef4:	6a 2c                	push   $0x2c
  800ef6:	68 9a 16 80 00       	push   $0x80169a
  800efb:	e8 49 f2 ff ff       	call   800149 <_panic>
  800f00:	50                   	push   %eax
  800f01:	68 db 16 80 00       	push   $0x8016db
  800f06:	6a 2f                	push   $0x2f
  800f08:	68 9a 16 80 00       	push   $0x80169a
  800f0d:	e8 37 f2 ff ff       	call   800149 <_panic>

00800f12 <fork_v0>:
  800f12:	55                   	push   %ebp
  800f13:	89 e5                	mov    %esp,%ebp
  800f15:	56                   	push   %esi
  800f16:	53                   	push   %ebx
  800f17:	b8 07 00 00 00       	mov    $0x7,%eax
  800f1c:	cd 30                	int    $0x30
  800f1e:	89 c6                	mov    %eax,%esi
  800f20:	85 c0                	test   %eax,%eax
  800f22:	78 23                	js     800f47 <fork_v0+0x35>
  800f24:	bb 00 00 00 00       	mov    $0x0,%ebx
  800f29:	75 3c                	jne    800f67 <fork_v0+0x55>
  800f2b:	e8 22 fc ff ff       	call   800b52 <sys_getenvid>
  800f30:	25 ff 03 00 00       	and    $0x3ff,%eax
  800f35:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800f3b:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800f40:	a3 08 20 80 00       	mov    %eax,0x802008
  800f45:	eb 54                	jmp    800f9b <fork_v0+0x89>
  800f47:	50                   	push   %eax
  800f48:	68 f7 16 80 00       	push   $0x8016f7
  800f4d:	68 a2 00 00 00       	push   $0xa2
  800f52:	68 9a 16 80 00       	push   $0x80169a
  800f57:	e8 ed f1 ff ff       	call   800149 <_panic>
  800f5c:	83 c3 01             	add    $0x1,%ebx
  800f5f:	81 fb 00 ec 0e 00    	cmp    $0xeec00,%ebx
  800f65:	74 22                	je     800f89 <fork_v0+0x77>
  800f67:	89 d8                	mov    %ebx,%eax
  800f69:	c1 e8 0a             	shr    $0xa,%eax
  800f6c:	8b 04 85 00 d0 7b ef 	mov    -0x10843000(,%eax,4),%eax
  800f73:	f7 d0                	not    %eax
  800f75:	a8 05                	test   $0x5,%al
  800f77:	75 e3                	jne    800f5c <fork_v0+0x4a>
  800f79:	b9 07 00 00 00       	mov    $0x7,%ecx
  800f7e:	89 da                	mov    %ebx,%edx
  800f80:	89 f0                	mov    %esi,%eax
  800f82:	e8 de fd ff ff       	call   800d65 <dup_or_share>
  800f87:	eb d3                	jmp    800f5c <fork_v0+0x4a>
  800f89:	83 ec 08             	sub    $0x8,%esp
  800f8c:	6a 02                	push   $0x2
  800f8e:	56                   	push   %esi
  800f8f:	e8 76 fc ff ff       	call   800c0a <sys_env_set_status>
  800f94:	83 c4 10             	add    $0x10,%esp
  800f97:	85 c0                	test   %eax,%eax
  800f99:	78 09                	js     800fa4 <fork_v0+0x92>
  800f9b:	89 f0                	mov    %esi,%eax
  800f9d:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800fa0:	5b                   	pop    %ebx
  800fa1:	5e                   	pop    %esi
  800fa2:	5d                   	pop    %ebp
  800fa3:	c3                   	ret
  800fa4:	50                   	push   %eax
  800fa5:	68 07 17 80 00       	push   $0x801707
  800faa:	68 b8 00 00 00       	push   $0xb8
  800faf:	68 9a 16 80 00       	push   $0x80169a
  800fb4:	e8 90 f1 ff ff       	call   800149 <_panic>

00800fb9 <fork>:
  800fb9:	55                   	push   %ebp
  800fba:	89 e5                	mov    %esp,%ebp
  800fbc:	56                   	push   %esi
  800fbd:	53                   	push   %ebx
  800fbe:	83 ec 0c             	sub    $0xc,%esp
  800fc1:	68 5e 0e 80 00       	push   $0x800e5e
  800fc6:	e8 2c 01 00 00       	call   8010f7 <set_pgfault_handler>
  800fcb:	b8 07 00 00 00       	mov    $0x7,%eax
  800fd0:	cd 30                	int    $0x30
  800fd2:	89 c6                	mov    %eax,%esi
  800fd4:	83 c4 10             	add    $0x10,%esp
  800fd7:	85 c0                	test   %eax,%eax
  800fd9:	78 26                	js     801001 <fork+0x48>
  800fdb:	bb 00 00 00 00       	mov    $0x0,%ebx
  800fe0:	75 47                	jne    801029 <fork+0x70>
  800fe2:	e8 6b fb ff ff       	call   800b52 <sys_getenvid>
  800fe7:	25 ff 03 00 00       	and    $0x3ff,%eax
  800fec:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800ff2:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800ff7:	a3 08 20 80 00       	mov    %eax,0x802008
  800ffc:	e9 94 00 00 00       	jmp    801095 <fork+0xdc>
  801001:	50                   	push   %eax
  801002:	68 f7 16 80 00       	push   $0x8016f7
  801007:	68 d5 00 00 00       	push   $0xd5
  80100c:	68 9a 16 80 00       	push   $0x80169a
  801011:	e8 33 f1 ff ff       	call   800149 <_panic>
  801016:	83 c3 01             	add    $0x1,%ebx
  801019:	81 fb 00 ec 0e 00    	cmp    $0xeec00,%ebx
  80101f:	74 32                	je     801053 <fork+0x9a>
  801021:	81 fb ff eb 0e 00    	cmp    $0xeebff,%ebx
  801027:	74 ed                	je     801016 <fork+0x5d>
  801029:	89 d8                	mov    %ebx,%eax
  80102b:	c1 e8 0a             	shr    $0xa,%eax
  80102e:	8b 04 85 00 d0 7b ef 	mov    -0x10843000(,%eax,4),%eax
  801035:	f7 d0                	not    %eax
  801037:	a8 05                	test   $0x5,%al
  801039:	75 db                	jne    801016 <fork+0x5d>
  80103b:	8b 04 9d 00 00 40 ef 	mov    -0x10c00000(,%ebx,4),%eax
  801042:	f7 d0                	not    %eax
  801044:	a8 05                	test   $0x5,%al
  801046:	75 ce                	jne    801016 <fork+0x5d>
  801048:	89 da                	mov    %ebx,%edx
  80104a:	89 f0                	mov    %esi,%eax
  80104c:	e8 46 fc ff ff       	call   800c97 <duppage>
  801051:	eb c3                	jmp    801016 <fork+0x5d>
  801053:	83 ec 04             	sub    $0x4,%esp
  801056:	6a 07                	push   $0x7
  801058:	68 00 f0 bf ee       	push   $0xeebff000
  80105d:	56                   	push   %esi
  80105e:	e8 3a fb ff ff       	call   800b9d <sys_page_alloc>
  801063:	83 c4 10             	add    $0x10,%esp
  801066:	85 c0                	test   %eax,%eax
  801068:	78 34                	js     80109e <fork+0xe5>
  80106a:	a1 08 20 80 00       	mov    0x802008,%eax
  80106f:	8b 40 64             	mov    0x64(%eax),%eax
  801072:	83 ec 08             	sub    $0x8,%esp
  801075:	50                   	push   %eax
  801076:	56                   	push   %esi
  801077:	e8 b1 fb ff ff       	call   800c2d <sys_env_set_pgfault_upcall>
  80107c:	83 c4 10             	add    $0x10,%esp
  80107f:	85 c0                	test   %eax,%eax
  801081:	78 30                	js     8010b3 <fork+0xfa>
  801083:	83 ec 08             	sub    $0x8,%esp
  801086:	6a 02                	push   $0x2
  801088:	56                   	push   %esi
  801089:	e8 7c fb ff ff       	call   800c0a <sys_env_set_status>
  80108e:	83 c4 10             	add    $0x10,%esp
  801091:	85 c0                	test   %eax,%eax
  801093:	78 33                	js     8010c8 <fork+0x10f>
  801095:	89 f0                	mov    %esi,%eax
  801097:	8d 65 f8             	lea    -0x8(%ebp),%esp
  80109a:	5b                   	pop    %ebx
  80109b:	5e                   	pop    %esi
  80109c:	5d                   	pop    %ebp
  80109d:	c3                   	ret
  80109e:	50                   	push   %eax
  80109f:	68 20 15 80 00       	push   $0x801520
  8010a4:	68 f2 00 00 00       	push   $0xf2
  8010a9:	68 9a 16 80 00       	push   $0x80169a
  8010ae:	e8 96 f0 ff ff       	call   800149 <_panic>
  8010b3:	50                   	push   %eax
  8010b4:	68 4c 15 80 00       	push   $0x80154c
  8010b9:	68 f5 00 00 00       	push   $0xf5
  8010be:	68 9a 16 80 00       	push   $0x80169a
  8010c3:	e8 81 f0 ff ff       	call   800149 <_panic>
  8010c8:	50                   	push   %eax
  8010c9:	68 07 17 80 00       	push   $0x801707
  8010ce:	68 f8 00 00 00       	push   $0xf8
  8010d3:	68 9a 16 80 00       	push   $0x80169a
  8010d8:	e8 6c f0 ff ff       	call   800149 <_panic>

008010dd <sfork>:
  8010dd:	55                   	push   %ebp
  8010de:	89 e5                	mov    %esp,%ebp
  8010e0:	83 ec 0c             	sub    $0xc,%esp
  8010e3:	68 1e 17 80 00       	push   $0x80171e
  8010e8:	68 01 01 00 00       	push   $0x101
  8010ed:	68 9a 16 80 00       	push   $0x80169a
  8010f2:	e8 52 f0 ff ff       	call   800149 <_panic>

008010f7 <set_pgfault_handler>:
  8010f7:	55                   	push   %ebp
  8010f8:	89 e5                	mov    %esp,%ebp
  8010fa:	83 ec 08             	sub    $0x8,%esp
  8010fd:	83 3d 0c 20 80 00 00 	cmpl   $0x0,0x80200c
  801104:	74 0a                	je     801110 <set_pgfault_handler+0x19>
  801106:	8b 45 08             	mov    0x8(%ebp),%eax
  801109:	a3 0c 20 80 00       	mov    %eax,0x80200c
  80110e:	c9                   	leave
  80110f:	c3                   	ret
  801110:	83 ec 04             	sub    $0x4,%esp
  801113:	6a 07                	push   $0x7
  801115:	68 00 f0 bf ee       	push   $0xeebff000
  80111a:	6a 00                	push   $0x0
  80111c:	e8 7c fa ff ff       	call   800b9d <sys_page_alloc>
  801121:	83 c4 10             	add    $0x10,%esp
  801124:	85 c0                	test   %eax,%eax
  801126:	78 e6                	js     80110e <set_pgfault_handler+0x17>
  801128:	83 ec 08             	sub    $0x8,%esp
  80112b:	68 40 11 80 00       	push   $0x801140
  801130:	6a 00                	push   $0x0
  801132:	e8 f6 fa ff ff       	call   800c2d <sys_env_set_pgfault_upcall>
  801137:	83 c4 10             	add    $0x10,%esp
  80113a:	85 c0                	test   %eax,%eax
  80113c:	79 c8                	jns    801106 <set_pgfault_handler+0xf>
  80113e:	eb ce                	jmp    80110e <set_pgfault_handler+0x17>

00801140 <_pgfault_upcall>:
  801140:	54                   	push   %esp
  801141:	a1 0c 20 80 00       	mov    0x80200c,%eax
  801146:	ff d0                	call   *%eax
  801148:	83 c4 04             	add    $0x4,%esp
  80114b:	8b 44 24 28          	mov    0x28(%esp),%eax
  80114f:	8b 5c 24 30          	mov    0x30(%esp),%ebx
  801153:	83 eb 04             	sub    $0x4,%ebx
  801156:	89 03                	mov    %eax,(%ebx)
  801158:	89 5c 24 30          	mov    %ebx,0x30(%esp)
  80115c:	58                   	pop    %eax
  80115d:	58                   	pop    %eax
  80115e:	61                   	popa
  80115f:	83 c4 04             	add    $0x4,%esp
  801162:	9d                   	popf
  801163:	5c                   	pop    %esp
  801164:	c3                   	ret
  801165:	66 90                	xchg   %ax,%ax
  801167:	66 90                	xchg   %ax,%ax
  801169:	66 90                	xchg   %ax,%ax
  80116b:	66 90                	xchg   %ax,%ax
  80116d:	66 90                	xchg   %ax,%ax
  80116f:	90                   	nop

00801170 <__udivdi3>:
  801170:	f3 0f 1e fb          	endbr32
  801174:	55                   	push   %ebp
  801175:	57                   	push   %edi
  801176:	56                   	push   %esi
  801177:	53                   	push   %ebx
  801178:	83 ec 1c             	sub    $0x1c,%esp
  80117b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  80117f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  801183:	8b 74 24 34          	mov    0x34(%esp),%esi
  801187:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  80118b:	85 c0                	test   %eax,%eax
  80118d:	75 19                	jne    8011a8 <__udivdi3+0x38>
  80118f:	39 de                	cmp    %ebx,%esi
  801191:	73 4d                	jae    8011e0 <__udivdi3+0x70>
  801193:	31 ff                	xor    %edi,%edi
  801195:	89 e8                	mov    %ebp,%eax
  801197:	89 f2                	mov    %esi,%edx
  801199:	f7 f3                	div    %ebx
  80119b:	89 fa                	mov    %edi,%edx
  80119d:	83 c4 1c             	add    $0x1c,%esp
  8011a0:	5b                   	pop    %ebx
  8011a1:	5e                   	pop    %esi
  8011a2:	5f                   	pop    %edi
  8011a3:	5d                   	pop    %ebp
  8011a4:	c3                   	ret
  8011a5:	8d 76 00             	lea    0x0(%esi),%esi
  8011a8:	39 c6                	cmp    %eax,%esi
  8011aa:	73 14                	jae    8011c0 <__udivdi3+0x50>
  8011ac:	31 ff                	xor    %edi,%edi
  8011ae:	31 c0                	xor    %eax,%eax
  8011b0:	89 fa                	mov    %edi,%edx
  8011b2:	83 c4 1c             	add    $0x1c,%esp
  8011b5:	5b                   	pop    %ebx
  8011b6:	5e                   	pop    %esi
  8011b7:	5f                   	pop    %edi
  8011b8:	5d                   	pop    %ebp
  8011b9:	c3                   	ret
  8011ba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  8011c0:	0f bd f8             	bsr    %eax,%edi
  8011c3:	83 f7 1f             	xor    $0x1f,%edi
  8011c6:	75 48                	jne    801210 <__udivdi3+0xa0>
  8011c8:	39 f0                	cmp    %esi,%eax
  8011ca:	72 06                	jb     8011d2 <__udivdi3+0x62>
  8011cc:	31 c0                	xor    %eax,%eax
  8011ce:	39 dd                	cmp    %ebx,%ebp
  8011d0:	72 de                	jb     8011b0 <__udivdi3+0x40>
  8011d2:	b8 01 00 00 00       	mov    $0x1,%eax
  8011d7:	eb d7                	jmp    8011b0 <__udivdi3+0x40>
  8011d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8011e0:	89 d9                	mov    %ebx,%ecx
  8011e2:	85 db                	test   %ebx,%ebx
  8011e4:	75 0b                	jne    8011f1 <__udivdi3+0x81>
  8011e6:	b8 01 00 00 00       	mov    $0x1,%eax
  8011eb:	31 d2                	xor    %edx,%edx
  8011ed:	f7 f3                	div    %ebx
  8011ef:	89 c1                	mov    %eax,%ecx
  8011f1:	31 d2                	xor    %edx,%edx
  8011f3:	89 f0                	mov    %esi,%eax
  8011f5:	f7 f1                	div    %ecx
  8011f7:	89 c6                	mov    %eax,%esi
  8011f9:	89 e8                	mov    %ebp,%eax
  8011fb:	89 f7                	mov    %esi,%edi
  8011fd:	f7 f1                	div    %ecx
  8011ff:	89 fa                	mov    %edi,%edx
  801201:	83 c4 1c             	add    $0x1c,%esp
  801204:	5b                   	pop    %ebx
  801205:	5e                   	pop    %esi
  801206:	5f                   	pop    %edi
  801207:	5d                   	pop    %ebp
  801208:	c3                   	ret
  801209:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  801210:	89 f9                	mov    %edi,%ecx
  801212:	ba 20 00 00 00       	mov    $0x20,%edx
  801217:	29 fa                	sub    %edi,%edx
  801219:	d3 e0                	shl    %cl,%eax
  80121b:	89 44 24 08          	mov    %eax,0x8(%esp)
  80121f:	89 d1                	mov    %edx,%ecx
  801221:	89 d8                	mov    %ebx,%eax
  801223:	d3 e8                	shr    %cl,%eax
  801225:	89 c1                	mov    %eax,%ecx
  801227:	8b 44 24 08          	mov    0x8(%esp),%eax
  80122b:	09 c1                	or     %eax,%ecx
  80122d:	89 f0                	mov    %esi,%eax
  80122f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  801233:	89 f9                	mov    %edi,%ecx
  801235:	d3 e3                	shl    %cl,%ebx
  801237:	89 d1                	mov    %edx,%ecx
  801239:	d3 e8                	shr    %cl,%eax
  80123b:	89 f9                	mov    %edi,%ecx
  80123d:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  801241:	89 eb                	mov    %ebp,%ebx
  801243:	d3 e6                	shl    %cl,%esi
  801245:	89 d1                	mov    %edx,%ecx
  801247:	d3 eb                	shr    %cl,%ebx
  801249:	09 f3                	or     %esi,%ebx
  80124b:	89 c6                	mov    %eax,%esi
  80124d:	89 f2                	mov    %esi,%edx
  80124f:	89 d8                	mov    %ebx,%eax
  801251:	f7 74 24 08          	divl   0x8(%esp)
  801255:	89 d6                	mov    %edx,%esi
  801257:	89 c3                	mov    %eax,%ebx
  801259:	f7 64 24 0c          	mull   0xc(%esp)
  80125d:	39 d6                	cmp    %edx,%esi
  80125f:	72 1f                	jb     801280 <__udivdi3+0x110>
  801261:	89 f9                	mov    %edi,%ecx
  801263:	d3 e5                	shl    %cl,%ebp
  801265:	39 c5                	cmp    %eax,%ebp
  801267:	73 04                	jae    80126d <__udivdi3+0xfd>
  801269:	39 d6                	cmp    %edx,%esi
  80126b:	74 13                	je     801280 <__udivdi3+0x110>
  80126d:	89 d8                	mov    %ebx,%eax
  80126f:	31 ff                	xor    %edi,%edi
  801271:	e9 3a ff ff ff       	jmp    8011b0 <__udivdi3+0x40>
  801276:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  80127d:	00 
  80127e:	66 90                	xchg   %ax,%ax
  801280:	8d 43 ff             	lea    -0x1(%ebx),%eax
  801283:	31 ff                	xor    %edi,%edi
  801285:	e9 26 ff ff ff       	jmp    8011b0 <__udivdi3+0x40>
  80128a:	66 90                	xchg   %ax,%ax
  80128c:	66 90                	xchg   %ax,%ax
  80128e:	66 90                	xchg   %ax,%ax

00801290 <__umoddi3>:
  801290:	f3 0f 1e fb          	endbr32
  801294:	55                   	push   %ebp
  801295:	57                   	push   %edi
  801296:	56                   	push   %esi
  801297:	53                   	push   %ebx
  801298:	83 ec 1c             	sub    $0x1c,%esp
  80129b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  80129f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  8012a3:	8b 74 24 30          	mov    0x30(%esp),%esi
  8012a7:	8b 7c 24 38          	mov    0x38(%esp),%edi
  8012ab:	89 da                	mov    %ebx,%edx
  8012ad:	85 c0                	test   %eax,%eax
  8012af:	75 17                	jne    8012c8 <__umoddi3+0x38>
  8012b1:	39 fb                	cmp    %edi,%ebx
  8012b3:	73 53                	jae    801308 <__umoddi3+0x78>
  8012b5:	89 f0                	mov    %esi,%eax
  8012b7:	f7 f7                	div    %edi
  8012b9:	89 d0                	mov    %edx,%eax
  8012bb:	31 d2                	xor    %edx,%edx
  8012bd:	83 c4 1c             	add    $0x1c,%esp
  8012c0:	5b                   	pop    %ebx
  8012c1:	5e                   	pop    %esi
  8012c2:	5f                   	pop    %edi
  8012c3:	5d                   	pop    %ebp
  8012c4:	c3                   	ret
  8012c5:	8d 76 00             	lea    0x0(%esi),%esi
  8012c8:	89 f1                	mov    %esi,%ecx
  8012ca:	39 c3                	cmp    %eax,%ebx
  8012cc:	73 12                	jae    8012e0 <__umoddi3+0x50>
  8012ce:	89 f0                	mov    %esi,%eax
  8012d0:	83 c4 1c             	add    $0x1c,%esp
  8012d3:	5b                   	pop    %ebx
  8012d4:	5e                   	pop    %esi
  8012d5:	5f                   	pop    %edi
  8012d6:	5d                   	pop    %ebp
  8012d7:	c3                   	ret
  8012d8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  8012df:	00 
  8012e0:	0f bd e8             	bsr    %eax,%ebp
  8012e3:	83 f5 1f             	xor    $0x1f,%ebp
  8012e6:	75 48                	jne    801330 <__umoddi3+0xa0>
  8012e8:	39 d8                	cmp    %ebx,%eax
  8012ea:	0f 82 d0 00 00 00    	jb     8013c0 <__umoddi3+0x130>
  8012f0:	39 fe                	cmp    %edi,%esi
  8012f2:	0f 83 c8 00 00 00    	jae    8013c0 <__umoddi3+0x130>
  8012f8:	89 c8                	mov    %ecx,%eax
  8012fa:	83 c4 1c             	add    $0x1c,%esp
  8012fd:	5b                   	pop    %ebx
  8012fe:	5e                   	pop    %esi
  8012ff:	5f                   	pop    %edi
  801300:	5d                   	pop    %ebp
  801301:	c3                   	ret
  801302:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  801308:	89 f9                	mov    %edi,%ecx
  80130a:	85 ff                	test   %edi,%edi
  80130c:	75 0b                	jne    801319 <__umoddi3+0x89>
  80130e:	b8 01 00 00 00       	mov    $0x1,%eax
  801313:	31 d2                	xor    %edx,%edx
  801315:	f7 f7                	div    %edi
  801317:	89 c1                	mov    %eax,%ecx
  801319:	89 d8                	mov    %ebx,%eax
  80131b:	31 d2                	xor    %edx,%edx
  80131d:	f7 f1                	div    %ecx
  80131f:	89 f0                	mov    %esi,%eax
  801321:	f7 f1                	div    %ecx
  801323:	89 d0                	mov    %edx,%eax
  801325:	31 d2                	xor    %edx,%edx
  801327:	eb 94                	jmp    8012bd <__umoddi3+0x2d>
  801329:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  801330:	89 e9                	mov    %ebp,%ecx
  801332:	ba 20 00 00 00       	mov    $0x20,%edx
  801337:	29 ea                	sub    %ebp,%edx
  801339:	d3 e0                	shl    %cl,%eax
  80133b:	89 44 24 08          	mov    %eax,0x8(%esp)
  80133f:	89 d1                	mov    %edx,%ecx
  801341:	89 f8                	mov    %edi,%eax
  801343:	d3 e8                	shr    %cl,%eax
  801345:	89 54 24 04          	mov    %edx,0x4(%esp)
  801349:	8b 54 24 04          	mov    0x4(%esp),%edx
  80134d:	89 c1                	mov    %eax,%ecx
  80134f:	8b 44 24 08          	mov    0x8(%esp),%eax
  801353:	09 c1                	or     %eax,%ecx
  801355:	89 d8                	mov    %ebx,%eax
  801357:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  80135b:	89 e9                	mov    %ebp,%ecx
  80135d:	d3 e7                	shl    %cl,%edi
  80135f:	89 d1                	mov    %edx,%ecx
  801361:	d3 e8                	shr    %cl,%eax
  801363:	89 e9                	mov    %ebp,%ecx
  801365:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  801369:	d3 e3                	shl    %cl,%ebx
  80136b:	89 c7                	mov    %eax,%edi
  80136d:	89 d1                	mov    %edx,%ecx
  80136f:	89 f0                	mov    %esi,%eax
  801371:	d3 e8                	shr    %cl,%eax
  801373:	89 fa                	mov    %edi,%edx
  801375:	89 e9                	mov    %ebp,%ecx
  801377:	09 d8                	or     %ebx,%eax
  801379:	d3 e6                	shl    %cl,%esi
  80137b:	f7 74 24 08          	divl   0x8(%esp)
  80137f:	89 d3                	mov    %edx,%ebx
  801381:	f7 64 24 0c          	mull   0xc(%esp)
  801385:	89 c7                	mov    %eax,%edi
  801387:	89 d1                	mov    %edx,%ecx
  801389:	39 d3                	cmp    %edx,%ebx
  80138b:	72 06                	jb     801393 <__umoddi3+0x103>
  80138d:	75 10                	jne    80139f <__umoddi3+0x10f>
  80138f:	39 c6                	cmp    %eax,%esi
  801391:	73 0c                	jae    80139f <__umoddi3+0x10f>
  801393:	2b 44 24 0c          	sub    0xc(%esp),%eax
  801397:	1b 54 24 08          	sbb    0x8(%esp),%edx
  80139b:	89 d1                	mov    %edx,%ecx
  80139d:	89 c7                	mov    %eax,%edi
  80139f:	89 f2                	mov    %esi,%edx
  8013a1:	29 fa                	sub    %edi,%edx
  8013a3:	19 cb                	sbb    %ecx,%ebx
  8013a5:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  8013aa:	89 d8                	mov    %ebx,%eax
  8013ac:	d3 e0                	shl    %cl,%eax
  8013ae:	89 e9                	mov    %ebp,%ecx
  8013b0:	d3 ea                	shr    %cl,%edx
  8013b2:	d3 eb                	shr    %cl,%ebx
  8013b4:	09 d0                	or     %edx,%eax
  8013b6:	89 da                	mov    %ebx,%edx
  8013b8:	83 c4 1c             	add    $0x1c,%esp
  8013bb:	5b                   	pop    %ebx
  8013bc:	5e                   	pop    %esi
  8013bd:	5f                   	pop    %edi
  8013be:	5d                   	pop    %ebp
  8013bf:	c3                   	ret
  8013c0:	89 da                	mov    %ebx,%edx
  8013c2:	89 f1                	mov    %esi,%ecx
  8013c4:	29 f9                	sub    %edi,%ecx
  8013c6:	19 c2                	sbb    %eax,%edx
  8013c8:	89 c8                	mov    %ecx,%eax
  8013ca:	e9 2b ff ff ff       	jmp    8012fa <__umoddi3+0x6a>
