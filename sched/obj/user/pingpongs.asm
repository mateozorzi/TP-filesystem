
obj/user/pingpongs:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 d2 00 00 00       	call   800103 <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <umain>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	57                   	push   %edi
  800037:	56                   	push   %esi
  800038:	53                   	push   %ebx
  800039:	83 ec 2c             	sub    $0x2c,%esp
  80003c:	e8 6f 10 00 00       	call   8010b0 <sfork>
  800041:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800044:	85 c0                	test   %eax,%eax
  800046:	75 74                	jne    8000bc <umain+0x89>
  800048:	83 ec 04             	sub    $0x4,%esp
  80004b:	6a 00                	push   $0x0
  80004d:	6a 00                	push   $0x0
  80004f:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  800052:	50                   	push   %eax
  800053:	e8 72 10 00 00       	call   8010ca <ipc_recv>
  800058:	8b 1d 08 20 80 00    	mov    0x802008,%ebx
  80005e:	8b 7b 48             	mov    0x48(%ebx),%edi
  800061:	8b 75 e4             	mov    -0x1c(%ebp),%esi
  800064:	a1 04 20 80 00       	mov    0x802004,%eax
  800069:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  80006c:	e8 b4 0a 00 00       	call   800b25 <sys_getenvid>
  800071:	83 c4 08             	add    $0x8,%esp
  800074:	57                   	push   %edi
  800075:	53                   	push   %ebx
  800076:	56                   	push   %esi
  800077:	ff 75 d4             	push   -0x2c(%ebp)
  80007a:	50                   	push   %eax
  80007b:	68 b0 16 80 00       	push   $0x8016b0
  800080:	e8 72 01 00 00       	call   8001f7 <cprintf>
  800085:	a1 04 20 80 00       	mov    0x802004,%eax
  80008a:	83 c4 20             	add    $0x20,%esp
  80008d:	83 f8 0a             	cmp    $0xa,%eax
  800090:	74 22                	je     8000b4 <umain+0x81>
  800092:	83 c0 01             	add    $0x1,%eax
  800095:	a3 04 20 80 00       	mov    %eax,0x802004
  80009a:	6a 00                	push   $0x0
  80009c:	6a 00                	push   $0x0
  80009e:	6a 00                	push   $0x0
  8000a0:	ff 75 e4             	push   -0x1c(%ebp)
  8000a3:	e8 82 10 00 00       	call   80112a <ipc_send>
  8000a8:	83 c4 10             	add    $0x10,%esp
  8000ab:	83 3d 04 20 80 00 0a 	cmpl   $0xa,0x802004
  8000b2:	75 94                	jne    800048 <umain+0x15>
  8000b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8000b7:	5b                   	pop    %ebx
  8000b8:	5e                   	pop    %esi
  8000b9:	5f                   	pop    %edi
  8000ba:	5d                   	pop    %ebp
  8000bb:	c3                   	ret
  8000bc:	8b 1d 08 20 80 00    	mov    0x802008,%ebx
  8000c2:	e8 5e 0a 00 00       	call   800b25 <sys_getenvid>
  8000c7:	83 ec 04             	sub    $0x4,%esp
  8000ca:	53                   	push   %ebx
  8000cb:	50                   	push   %eax
  8000cc:	68 e0 14 80 00       	push   $0x8014e0
  8000d1:	e8 21 01 00 00       	call   8001f7 <cprintf>
  8000d6:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
  8000d9:	e8 47 0a 00 00       	call   800b25 <sys_getenvid>
  8000de:	83 c4 0c             	add    $0xc,%esp
  8000e1:	53                   	push   %ebx
  8000e2:	50                   	push   %eax
  8000e3:	68 fa 14 80 00       	push   $0x8014fa
  8000e8:	e8 0a 01 00 00       	call   8001f7 <cprintf>
  8000ed:	6a 00                	push   $0x0
  8000ef:	6a 00                	push   $0x0
  8000f1:	6a 00                	push   $0x0
  8000f3:	ff 75 e4             	push   -0x1c(%ebp)
  8000f6:	e8 2f 10 00 00       	call   80112a <ipc_send>
  8000fb:	83 c4 20             	add    $0x20,%esp
  8000fe:	e9 45 ff ff ff       	jmp    800048 <umain+0x15>

00800103 <libmain>:
  800103:	55                   	push   %ebp
  800104:	89 e5                	mov    %esp,%ebp
  800106:	56                   	push   %esi
  800107:	53                   	push   %ebx
  800108:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80010b:	8b 75 0c             	mov    0xc(%ebp),%esi
  80010e:	e8 12 0a 00 00       	call   800b25 <sys_getenvid>
  800113:	85 c0                	test   %eax,%eax
  800115:	78 15                	js     80012c <libmain+0x29>
  800117:	25 ff 03 00 00       	and    $0x3ff,%eax
  80011c:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800122:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800127:	a3 08 20 80 00       	mov    %eax,0x802008
  80012c:	85 db                	test   %ebx,%ebx
  80012e:	7e 07                	jle    800137 <libmain+0x34>
  800130:	8b 06                	mov    (%esi),%eax
  800132:	a3 00 20 80 00       	mov    %eax,0x802000
  800137:	83 ec 08             	sub    $0x8,%esp
  80013a:	56                   	push   %esi
  80013b:	53                   	push   %ebx
  80013c:	e8 f2 fe ff ff       	call   800033 <umain>
  800141:	e8 0a 00 00 00       	call   800150 <exit>
  800146:	83 c4 10             	add    $0x10,%esp
  800149:	8d 65 f8             	lea    -0x8(%ebp),%esp
  80014c:	5b                   	pop    %ebx
  80014d:	5e                   	pop    %esi
  80014e:	5d                   	pop    %ebp
  80014f:	c3                   	ret

00800150 <exit>:
  800150:	55                   	push   %ebp
  800151:	89 e5                	mov    %esp,%ebp
  800153:	83 ec 14             	sub    $0x14,%esp
  800156:	6a 00                	push   $0x0
  800158:	e8 a6 09 00 00       	call   800b03 <sys_env_destroy>
  80015d:	83 c4 10             	add    $0x10,%esp
  800160:	c9                   	leave
  800161:	c3                   	ret

00800162 <putch>:
  800162:	55                   	push   %ebp
  800163:	89 e5                	mov    %esp,%ebp
  800165:	53                   	push   %ebx
  800166:	83 ec 04             	sub    $0x4,%esp
  800169:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  80016c:	8b 13                	mov    (%ebx),%edx
  80016e:	8d 42 01             	lea    0x1(%edx),%eax
  800171:	89 03                	mov    %eax,(%ebx)
  800173:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800176:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  80017a:	3d ff 00 00 00       	cmp    $0xff,%eax
  80017f:	74 09                	je     80018a <putch+0x28>
  800181:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  800185:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800188:	c9                   	leave
  800189:	c3                   	ret
  80018a:	83 ec 08             	sub    $0x8,%esp
  80018d:	68 ff 00 00 00       	push   $0xff
  800192:	8d 43 08             	lea    0x8(%ebx),%eax
  800195:	50                   	push   %eax
  800196:	e8 1e 09 00 00       	call   800ab9 <sys_cputs>
  80019b:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  8001a1:	83 c4 10             	add    $0x10,%esp
  8001a4:	eb db                	jmp    800181 <putch+0x1f>

008001a6 <vcprintf>:
  8001a6:	55                   	push   %ebp
  8001a7:	89 e5                	mov    %esp,%ebp
  8001a9:	81 ec 18 01 00 00    	sub    $0x118,%esp
  8001af:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  8001b6:	00 00 00 
  8001b9:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  8001c0:	00 00 00 
  8001c3:	ff 75 0c             	push   0xc(%ebp)
  8001c6:	ff 75 08             	push   0x8(%ebp)
  8001c9:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  8001cf:	50                   	push   %eax
  8001d0:	68 62 01 80 00       	push   $0x800162
  8001d5:	e8 74 01 00 00       	call   80034e <vprintfmt>
  8001da:	83 c4 08             	add    $0x8,%esp
  8001dd:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  8001e3:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  8001e9:	50                   	push   %eax
  8001ea:	e8 ca 08 00 00       	call   800ab9 <sys_cputs>
  8001ef:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  8001f5:	c9                   	leave
  8001f6:	c3                   	ret

008001f7 <cprintf>:
  8001f7:	55                   	push   %ebp
  8001f8:	89 e5                	mov    %esp,%ebp
  8001fa:	83 ec 10             	sub    $0x10,%esp
  8001fd:	8d 45 0c             	lea    0xc(%ebp),%eax
  800200:	50                   	push   %eax
  800201:	ff 75 08             	push   0x8(%ebp)
  800204:	e8 9d ff ff ff       	call   8001a6 <vcprintf>
  800209:	c9                   	leave
  80020a:	c3                   	ret

0080020b <printnum>:
  80020b:	55                   	push   %ebp
  80020c:	89 e5                	mov    %esp,%ebp
  80020e:	57                   	push   %edi
  80020f:	56                   	push   %esi
  800210:	53                   	push   %ebx
  800211:	83 ec 1c             	sub    $0x1c,%esp
  800214:	89 c7                	mov    %eax,%edi
  800216:	89 d6                	mov    %edx,%esi
  800218:	8b 45 08             	mov    0x8(%ebp),%eax
  80021b:	8b 55 0c             	mov    0xc(%ebp),%edx
  80021e:	89 d1                	mov    %edx,%ecx
  800220:	89 c2                	mov    %eax,%edx
  800222:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800225:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  800228:	8b 45 10             	mov    0x10(%ebp),%eax
  80022b:	8b 5d 14             	mov    0x14(%ebp),%ebx
  80022e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800231:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  800238:	39 c2                	cmp    %eax,%edx
  80023a:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  80023d:	72 3e                	jb     80027d <printnum+0x72>
  80023f:	83 ec 0c             	sub    $0xc,%esp
  800242:	ff 75 18             	push   0x18(%ebp)
  800245:	83 eb 01             	sub    $0x1,%ebx
  800248:	53                   	push   %ebx
  800249:	50                   	push   %eax
  80024a:	83 ec 08             	sub    $0x8,%esp
  80024d:	ff 75 e4             	push   -0x1c(%ebp)
  800250:	ff 75 e0             	push   -0x20(%ebp)
  800253:	ff 75 dc             	push   -0x24(%ebp)
  800256:	ff 75 d8             	push   -0x28(%ebp)
  800259:	e8 22 10 00 00       	call   801280 <__udivdi3>
  80025e:	83 c4 18             	add    $0x18,%esp
  800261:	52                   	push   %edx
  800262:	50                   	push   %eax
  800263:	89 f2                	mov    %esi,%edx
  800265:	89 f8                	mov    %edi,%eax
  800267:	e8 9f ff ff ff       	call   80020b <printnum>
  80026c:	83 c4 20             	add    $0x20,%esp
  80026f:	eb 13                	jmp    800284 <printnum+0x79>
  800271:	83 ec 08             	sub    $0x8,%esp
  800274:	56                   	push   %esi
  800275:	ff 75 18             	push   0x18(%ebp)
  800278:	ff d7                	call   *%edi
  80027a:	83 c4 10             	add    $0x10,%esp
  80027d:	83 eb 01             	sub    $0x1,%ebx
  800280:	85 db                	test   %ebx,%ebx
  800282:	7f ed                	jg     800271 <printnum+0x66>
  800284:	83 ec 08             	sub    $0x8,%esp
  800287:	56                   	push   %esi
  800288:	83 ec 04             	sub    $0x4,%esp
  80028b:	ff 75 e4             	push   -0x1c(%ebp)
  80028e:	ff 75 e0             	push   -0x20(%ebp)
  800291:	ff 75 dc             	push   -0x24(%ebp)
  800294:	ff 75 d8             	push   -0x28(%ebp)
  800297:	e8 04 11 00 00       	call   8013a0 <__umoddi3>
  80029c:	83 c4 14             	add    $0x14,%esp
  80029f:	0f be 80 1a 15 80 00 	movsbl 0x80151a(%eax),%eax
  8002a6:	50                   	push   %eax
  8002a7:	ff d7                	call   *%edi
  8002a9:	83 c4 10             	add    $0x10,%esp
  8002ac:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8002af:	5b                   	pop    %ebx
  8002b0:	5e                   	pop    %esi
  8002b1:	5f                   	pop    %edi
  8002b2:	5d                   	pop    %ebp
  8002b3:	c3                   	ret

008002b4 <getuint>:
  8002b4:	83 fa 01             	cmp    $0x1,%edx
  8002b7:	7f 13                	jg     8002cc <getuint+0x18>
  8002b9:	85 d2                	test   %edx,%edx
  8002bb:	74 1c                	je     8002d9 <getuint+0x25>
  8002bd:	8b 10                	mov    (%eax),%edx
  8002bf:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002c2:	89 08                	mov    %ecx,(%eax)
  8002c4:	8b 02                	mov    (%edx),%eax
  8002c6:	ba 00 00 00 00       	mov    $0x0,%edx
  8002cb:	c3                   	ret
  8002cc:	8b 10                	mov    (%eax),%edx
  8002ce:	8d 4a 08             	lea    0x8(%edx),%ecx
  8002d1:	89 08                	mov    %ecx,(%eax)
  8002d3:	8b 02                	mov    (%edx),%eax
  8002d5:	8b 52 04             	mov    0x4(%edx),%edx
  8002d8:	c3                   	ret
  8002d9:	8b 10                	mov    (%eax),%edx
  8002db:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002de:	89 08                	mov    %ecx,(%eax)
  8002e0:	8b 02                	mov    (%edx),%eax
  8002e2:	ba 00 00 00 00       	mov    $0x0,%edx
  8002e7:	c3                   	ret

008002e8 <getint>:
  8002e8:	83 fa 01             	cmp    $0x1,%edx
  8002eb:	7f 0f                	jg     8002fc <getint+0x14>
  8002ed:	85 d2                	test   %edx,%edx
  8002ef:	74 18                	je     800309 <getint+0x21>
  8002f1:	8b 10                	mov    (%eax),%edx
  8002f3:	8d 4a 04             	lea    0x4(%edx),%ecx
  8002f6:	89 08                	mov    %ecx,(%eax)
  8002f8:	8b 02                	mov    (%edx),%eax
  8002fa:	99                   	cltd
  8002fb:	c3                   	ret
  8002fc:	8b 10                	mov    (%eax),%edx
  8002fe:	8d 4a 08             	lea    0x8(%edx),%ecx
  800301:	89 08                	mov    %ecx,(%eax)
  800303:	8b 02                	mov    (%edx),%eax
  800305:	8b 52 04             	mov    0x4(%edx),%edx
  800308:	c3                   	ret
  800309:	8b 10                	mov    (%eax),%edx
  80030b:	8d 4a 04             	lea    0x4(%edx),%ecx
  80030e:	89 08                	mov    %ecx,(%eax)
  800310:	8b 02                	mov    (%edx),%eax
  800312:	99                   	cltd
  800313:	c3                   	ret

00800314 <sprintputch>:
  800314:	55                   	push   %ebp
  800315:	89 e5                	mov    %esp,%ebp
  800317:	8b 45 0c             	mov    0xc(%ebp),%eax
  80031a:	83 40 08 01          	addl   $0x1,0x8(%eax)
  80031e:	8b 10                	mov    (%eax),%edx
  800320:	3b 50 04             	cmp    0x4(%eax),%edx
  800323:	73 0a                	jae    80032f <sprintputch+0x1b>
  800325:	8d 4a 01             	lea    0x1(%edx),%ecx
  800328:	89 08                	mov    %ecx,(%eax)
  80032a:	8b 45 08             	mov    0x8(%ebp),%eax
  80032d:	88 02                	mov    %al,(%edx)
  80032f:	5d                   	pop    %ebp
  800330:	c3                   	ret

00800331 <printfmt>:
  800331:	55                   	push   %ebp
  800332:	89 e5                	mov    %esp,%ebp
  800334:	83 ec 08             	sub    $0x8,%esp
  800337:	8d 45 14             	lea    0x14(%ebp),%eax
  80033a:	50                   	push   %eax
  80033b:	ff 75 10             	push   0x10(%ebp)
  80033e:	ff 75 0c             	push   0xc(%ebp)
  800341:	ff 75 08             	push   0x8(%ebp)
  800344:	e8 05 00 00 00       	call   80034e <vprintfmt>
  800349:	83 c4 10             	add    $0x10,%esp
  80034c:	c9                   	leave
  80034d:	c3                   	ret

0080034e <vprintfmt>:
  80034e:	55                   	push   %ebp
  80034f:	89 e5                	mov    %esp,%ebp
  800351:	57                   	push   %edi
  800352:	56                   	push   %esi
  800353:	53                   	push   %ebx
  800354:	83 ec 2c             	sub    $0x2c,%esp
  800357:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80035a:	8b 75 0c             	mov    0xc(%ebp),%esi
  80035d:	8b 7d 10             	mov    0x10(%ebp),%edi
  800360:	eb 0a                	jmp    80036c <vprintfmt+0x1e>
  800362:	83 ec 08             	sub    $0x8,%esp
  800365:	56                   	push   %esi
  800366:	50                   	push   %eax
  800367:	ff d3                	call   *%ebx
  800369:	83 c4 10             	add    $0x10,%esp
  80036c:	83 c7 01             	add    $0x1,%edi
  80036f:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  800373:	83 f8 25             	cmp    $0x25,%eax
  800376:	74 0c                	je     800384 <vprintfmt+0x36>
  800378:	85 c0                	test   %eax,%eax
  80037a:	75 e6                	jne    800362 <vprintfmt+0x14>
  80037c:	8d 65 f4             	lea    -0xc(%ebp),%esp
  80037f:	5b                   	pop    %ebx
  800380:	5e                   	pop    %esi
  800381:	5f                   	pop    %edi
  800382:	5d                   	pop    %ebp
  800383:	c3                   	ret
  800384:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  800388:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  80038f:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800396:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  80039d:	b9 00 00 00 00       	mov    $0x0,%ecx
  8003a2:	8d 47 01             	lea    0x1(%edi),%eax
  8003a5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  8003a8:	0f b6 17             	movzbl (%edi),%edx
  8003ab:	8d 42 dd             	lea    -0x23(%edx),%eax
  8003ae:	3c 55                	cmp    $0x55,%al
  8003b0:	0f 87 c3 02 00 00    	ja     800679 <vprintfmt+0x32b>
  8003b6:	0f b6 c0             	movzbl %al,%eax
  8003b9:	ff 24 85 60 18 80 00 	jmp    *0x801860(,%eax,4)
  8003c0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003c3:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  8003c7:	eb d9                	jmp    8003a2 <vprintfmt+0x54>
  8003c9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003cc:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  8003d0:	eb d0                	jmp    8003a2 <vprintfmt+0x54>
  8003d2:	0f b6 d2             	movzbl %dl,%edx
  8003d5:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8003d8:	b8 00 00 00 00       	mov    $0x0,%eax
  8003dd:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  8003e0:	8d 04 80             	lea    (%eax,%eax,4),%eax
  8003e3:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  8003e7:	0f be 17             	movsbl (%edi),%edx
  8003ea:	8d 4a d0             	lea    -0x30(%edx),%ecx
  8003ed:	83 f9 09             	cmp    $0x9,%ecx
  8003f0:	77 52                	ja     800444 <vprintfmt+0xf6>
  8003f2:	83 c7 01             	add    $0x1,%edi
  8003f5:	eb e9                	jmp    8003e0 <vprintfmt+0x92>
  8003f7:	8b 45 14             	mov    0x14(%ebp),%eax
  8003fa:	8d 50 04             	lea    0x4(%eax),%edx
  8003fd:	89 55 14             	mov    %edx,0x14(%ebp)
  800400:	8b 00                	mov    (%eax),%eax
  800402:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800405:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800408:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  80040c:	79 94                	jns    8003a2 <vprintfmt+0x54>
  80040e:	8b 45 d0             	mov    -0x30(%ebp),%eax
  800411:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800414:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  80041b:	eb 85                	jmp    8003a2 <vprintfmt+0x54>
  80041d:	8b 55 e0             	mov    -0x20(%ebp),%edx
  800420:	85 d2                	test   %edx,%edx
  800422:	b8 00 00 00 00       	mov    $0x0,%eax
  800427:	0f 49 c2             	cmovns %edx,%eax
  80042a:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80042d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800430:	e9 6d ff ff ff       	jmp    8003a2 <vprintfmt+0x54>
  800435:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800438:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  80043f:	e9 5e ff ff ff       	jmp    8003a2 <vprintfmt+0x54>
  800444:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  800447:	89 45 d0             	mov    %eax,-0x30(%ebp)
  80044a:	eb bc                	jmp    800408 <vprintfmt+0xba>
  80044c:	83 c1 01             	add    $0x1,%ecx
  80044f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800452:	e9 4b ff ff ff       	jmp    8003a2 <vprintfmt+0x54>
  800457:	8b 45 14             	mov    0x14(%ebp),%eax
  80045a:	8d 50 04             	lea    0x4(%eax),%edx
  80045d:	89 55 14             	mov    %edx,0x14(%ebp)
  800460:	83 ec 08             	sub    $0x8,%esp
  800463:	56                   	push   %esi
  800464:	ff 30                	push   (%eax)
  800466:	ff d3                	call   *%ebx
  800468:	83 c4 10             	add    $0x10,%esp
  80046b:	e9 a0 01 00 00       	jmp    800610 <vprintfmt+0x2c2>
  800470:	8b 45 14             	mov    0x14(%ebp),%eax
  800473:	8d 50 04             	lea    0x4(%eax),%edx
  800476:	89 55 14             	mov    %edx,0x14(%ebp)
  800479:	8b 10                	mov    (%eax),%edx
  80047b:	89 d0                	mov    %edx,%eax
  80047d:	f7 d8                	neg    %eax
  80047f:	0f 48 c2             	cmovs  %edx,%eax
  800482:	83 f8 08             	cmp    $0x8,%eax
  800485:	7f 20                	jg     8004a7 <vprintfmt+0x159>
  800487:	8b 14 85 c0 19 80 00 	mov    0x8019c0(,%eax,4),%edx
  80048e:	85 d2                	test   %edx,%edx
  800490:	74 15                	je     8004a7 <vprintfmt+0x159>
  800492:	52                   	push   %edx
  800493:	68 3b 15 80 00       	push   $0x80153b
  800498:	56                   	push   %esi
  800499:	53                   	push   %ebx
  80049a:	e8 92 fe ff ff       	call   800331 <printfmt>
  80049f:	83 c4 10             	add    $0x10,%esp
  8004a2:	e9 69 01 00 00       	jmp    800610 <vprintfmt+0x2c2>
  8004a7:	50                   	push   %eax
  8004a8:	68 32 15 80 00       	push   $0x801532
  8004ad:	56                   	push   %esi
  8004ae:	53                   	push   %ebx
  8004af:	e8 7d fe ff ff       	call   800331 <printfmt>
  8004b4:	83 c4 10             	add    $0x10,%esp
  8004b7:	e9 54 01 00 00       	jmp    800610 <vprintfmt+0x2c2>
  8004bc:	8b 45 14             	mov    0x14(%ebp),%eax
  8004bf:	8d 50 04             	lea    0x4(%eax),%edx
  8004c2:	89 55 14             	mov    %edx,0x14(%ebp)
  8004c5:	8b 08                	mov    (%eax),%ecx
  8004c7:	85 c9                	test   %ecx,%ecx
  8004c9:	b8 2b 15 80 00       	mov    $0x80152b,%eax
  8004ce:	0f 45 c1             	cmovne %ecx,%eax
  8004d1:	89 45 cc             	mov    %eax,-0x34(%ebp)
  8004d4:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  8004d8:	7e 06                	jle    8004e0 <vprintfmt+0x192>
  8004da:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  8004de:	75 0b                	jne    8004eb <vprintfmt+0x19d>
  8004e0:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  8004e3:	8b 7d d0             	mov    -0x30(%ebp),%edi
  8004e6:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8004e9:	eb 5c                	jmp    800547 <vprintfmt+0x1f9>
  8004eb:	83 ec 08             	sub    $0x8,%esp
  8004ee:	ff 75 d0             	push   -0x30(%ebp)
  8004f1:	ff 75 cc             	push   -0x34(%ebp)
  8004f4:	e8 20 02 00 00       	call   800719 <strnlen>
  8004f9:	89 c2                	mov    %eax,%edx
  8004fb:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8004fe:	29 d0                	sub    %edx,%eax
  800500:	83 c4 10             	add    $0x10,%esp
  800503:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  800507:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80050a:	89 5d 08             	mov    %ebx,0x8(%ebp)
  80050d:	89 c3                	mov    %eax,%ebx
  80050f:	eb 0e                	jmp    80051f <vprintfmt+0x1d1>
  800511:	83 ec 08             	sub    $0x8,%esp
  800514:	56                   	push   %esi
  800515:	57                   	push   %edi
  800516:	ff 55 08             	call   *0x8(%ebp)
  800519:	83 eb 01             	sub    $0x1,%ebx
  80051c:	83 c4 10             	add    $0x10,%esp
  80051f:	85 db                	test   %ebx,%ebx
  800521:	7f ee                	jg     800511 <vprintfmt+0x1c3>
  800523:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800526:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800529:	85 c0                	test   %eax,%eax
  80052b:	ba 00 00 00 00       	mov    $0x0,%edx
  800530:	0f 49 d0             	cmovns %eax,%edx
  800533:	29 d0                	sub    %edx,%eax
  800535:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800538:	eb a6                	jmp    8004e0 <vprintfmt+0x192>
  80053a:	83 ec 08             	sub    $0x8,%esp
  80053d:	56                   	push   %esi
  80053e:	52                   	push   %edx
  80053f:	ff 55 08             	call   *0x8(%ebp)
  800542:	83 c4 10             	add    $0x10,%esp
  800545:	89 d9                	mov    %ebx,%ecx
  800547:	8d 59 01             	lea    0x1(%ecx),%ebx
  80054a:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  80054e:	0f be d0             	movsbl %al,%edx
  800551:	85 d2                	test   %edx,%edx
  800553:	74 28                	je     80057d <vprintfmt+0x22f>
  800555:	85 ff                	test   %edi,%edi
  800557:	78 05                	js     80055e <vprintfmt+0x210>
  800559:	83 ef 01             	sub    $0x1,%edi
  80055c:	78 2e                	js     80058c <vprintfmt+0x23e>
  80055e:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  800562:	74 d6                	je     80053a <vprintfmt+0x1ec>
  800564:	0f be c0             	movsbl %al,%eax
  800567:	83 e8 20             	sub    $0x20,%eax
  80056a:	83 f8 5e             	cmp    $0x5e,%eax
  80056d:	76 cb                	jbe    80053a <vprintfmt+0x1ec>
  80056f:	83 ec 08             	sub    $0x8,%esp
  800572:	56                   	push   %esi
  800573:	6a 3f                	push   $0x3f
  800575:	ff 55 08             	call   *0x8(%ebp)
  800578:	83 c4 10             	add    $0x10,%esp
  80057b:	eb c8                	jmp    800545 <vprintfmt+0x1f7>
  80057d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800580:	8b 7d cc             	mov    -0x34(%ebp),%edi
  800583:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800586:	01 c7                	add    %eax,%edi
  800588:	29 cf                	sub    %ecx,%edi
  80058a:	eb 13                	jmp    80059f <vprintfmt+0x251>
  80058c:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80058f:	eb ef                	jmp    800580 <vprintfmt+0x232>
  800591:	83 ec 08             	sub    $0x8,%esp
  800594:	56                   	push   %esi
  800595:	6a 20                	push   $0x20
  800597:	ff d3                	call   *%ebx
  800599:	83 ef 01             	sub    $0x1,%edi
  80059c:	83 c4 10             	add    $0x10,%esp
  80059f:	85 ff                	test   %edi,%edi
  8005a1:	7f ee                	jg     800591 <vprintfmt+0x243>
  8005a3:	eb 6b                	jmp    800610 <vprintfmt+0x2c2>
  8005a5:	89 ca                	mov    %ecx,%edx
  8005a7:	8d 45 14             	lea    0x14(%ebp),%eax
  8005aa:	e8 39 fd ff ff       	call   8002e8 <getint>
  8005af:	89 45 d8             	mov    %eax,-0x28(%ebp)
  8005b2:	89 55 dc             	mov    %edx,-0x24(%ebp)
  8005b5:	85 d2                	test   %edx,%edx
  8005b7:	78 0b                	js     8005c4 <vprintfmt+0x276>
  8005b9:	89 d1                	mov    %edx,%ecx
  8005bb:	89 c2                	mov    %eax,%edx
  8005bd:	bf 0a 00 00 00       	mov    $0xa,%edi
  8005c2:	eb 32                	jmp    8005f6 <vprintfmt+0x2a8>
  8005c4:	83 ec 08             	sub    $0x8,%esp
  8005c7:	56                   	push   %esi
  8005c8:	6a 2d                	push   $0x2d
  8005ca:	ff d3                	call   *%ebx
  8005cc:	8b 55 d8             	mov    -0x28(%ebp),%edx
  8005cf:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  8005d2:	f7 da                	neg    %edx
  8005d4:	83 d1 00             	adc    $0x0,%ecx
  8005d7:	f7 d9                	neg    %ecx
  8005d9:	83 c4 10             	add    $0x10,%esp
  8005dc:	bf 0a 00 00 00       	mov    $0xa,%edi
  8005e1:	eb 13                	jmp    8005f6 <vprintfmt+0x2a8>
  8005e3:	89 ca                	mov    %ecx,%edx
  8005e5:	8d 45 14             	lea    0x14(%ebp),%eax
  8005e8:	e8 c7 fc ff ff       	call   8002b4 <getuint>
  8005ed:	89 d1                	mov    %edx,%ecx
  8005ef:	89 c2                	mov    %eax,%edx
  8005f1:	bf 0a 00 00 00       	mov    $0xa,%edi
  8005f6:	83 ec 0c             	sub    $0xc,%esp
  8005f9:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  8005fd:	50                   	push   %eax
  8005fe:	ff 75 e0             	push   -0x20(%ebp)
  800601:	57                   	push   %edi
  800602:	51                   	push   %ecx
  800603:	52                   	push   %edx
  800604:	89 f2                	mov    %esi,%edx
  800606:	89 d8                	mov    %ebx,%eax
  800608:	e8 fe fb ff ff       	call   80020b <printnum>
  80060d:	83 c4 20             	add    $0x20,%esp
  800610:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800613:	e9 54 fd ff ff       	jmp    80036c <vprintfmt+0x1e>
  800618:	89 ca                	mov    %ecx,%edx
  80061a:	8d 45 14             	lea    0x14(%ebp),%eax
  80061d:	e8 92 fc ff ff       	call   8002b4 <getuint>
  800622:	89 d1                	mov    %edx,%ecx
  800624:	89 c2                	mov    %eax,%edx
  800626:	bf 08 00 00 00       	mov    $0x8,%edi
  80062b:	eb c9                	jmp    8005f6 <vprintfmt+0x2a8>
  80062d:	83 ec 08             	sub    $0x8,%esp
  800630:	56                   	push   %esi
  800631:	6a 30                	push   $0x30
  800633:	ff d3                	call   *%ebx
  800635:	83 c4 08             	add    $0x8,%esp
  800638:	56                   	push   %esi
  800639:	6a 78                	push   $0x78
  80063b:	ff d3                	call   *%ebx
  80063d:	8b 45 14             	mov    0x14(%ebp),%eax
  800640:	8d 50 04             	lea    0x4(%eax),%edx
  800643:	89 55 14             	mov    %edx,0x14(%ebp)
  800646:	8b 10                	mov    (%eax),%edx
  800648:	b9 00 00 00 00       	mov    $0x0,%ecx
  80064d:	83 c4 10             	add    $0x10,%esp
  800650:	bf 10 00 00 00       	mov    $0x10,%edi
  800655:	eb 9f                	jmp    8005f6 <vprintfmt+0x2a8>
  800657:	89 ca                	mov    %ecx,%edx
  800659:	8d 45 14             	lea    0x14(%ebp),%eax
  80065c:	e8 53 fc ff ff       	call   8002b4 <getuint>
  800661:	89 d1                	mov    %edx,%ecx
  800663:	89 c2                	mov    %eax,%edx
  800665:	bf 10 00 00 00       	mov    $0x10,%edi
  80066a:	eb 8a                	jmp    8005f6 <vprintfmt+0x2a8>
  80066c:	83 ec 08             	sub    $0x8,%esp
  80066f:	56                   	push   %esi
  800670:	6a 25                	push   $0x25
  800672:	ff d3                	call   *%ebx
  800674:	83 c4 10             	add    $0x10,%esp
  800677:	eb 97                	jmp    800610 <vprintfmt+0x2c2>
  800679:	83 ec 08             	sub    $0x8,%esp
  80067c:	56                   	push   %esi
  80067d:	6a 25                	push   $0x25
  80067f:	ff d3                	call   *%ebx
  800681:	83 c4 10             	add    $0x10,%esp
  800684:	89 f8                	mov    %edi,%eax
  800686:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  80068a:	74 05                	je     800691 <vprintfmt+0x343>
  80068c:	83 e8 01             	sub    $0x1,%eax
  80068f:	eb f5                	jmp    800686 <vprintfmt+0x338>
  800691:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800694:	e9 77 ff ff ff       	jmp    800610 <vprintfmt+0x2c2>

00800699 <vsnprintf>:
  800699:	55                   	push   %ebp
  80069a:	89 e5                	mov    %esp,%ebp
  80069c:	83 ec 18             	sub    $0x18,%esp
  80069f:	8b 45 08             	mov    0x8(%ebp),%eax
  8006a2:	8b 55 0c             	mov    0xc(%ebp),%edx
  8006a5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  8006a8:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  8006ac:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  8006af:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  8006b6:	85 c0                	test   %eax,%eax
  8006b8:	74 26                	je     8006e0 <vsnprintf+0x47>
  8006ba:	85 d2                	test   %edx,%edx
  8006bc:	7e 22                	jle    8006e0 <vsnprintf+0x47>
  8006be:	ff 75 14             	push   0x14(%ebp)
  8006c1:	ff 75 10             	push   0x10(%ebp)
  8006c4:	8d 45 ec             	lea    -0x14(%ebp),%eax
  8006c7:	50                   	push   %eax
  8006c8:	68 14 03 80 00       	push   $0x800314
  8006cd:	e8 7c fc ff ff       	call   80034e <vprintfmt>
  8006d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
  8006d5:	c6 00 00             	movb   $0x0,(%eax)
  8006d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  8006db:	83 c4 10             	add    $0x10,%esp
  8006de:	c9                   	leave
  8006df:	c3                   	ret
  8006e0:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  8006e5:	eb f7                	jmp    8006de <vsnprintf+0x45>

008006e7 <snprintf>:
  8006e7:	55                   	push   %ebp
  8006e8:	89 e5                	mov    %esp,%ebp
  8006ea:	83 ec 08             	sub    $0x8,%esp
  8006ed:	8d 45 14             	lea    0x14(%ebp),%eax
  8006f0:	50                   	push   %eax
  8006f1:	ff 75 10             	push   0x10(%ebp)
  8006f4:	ff 75 0c             	push   0xc(%ebp)
  8006f7:	ff 75 08             	push   0x8(%ebp)
  8006fa:	e8 9a ff ff ff       	call   800699 <vsnprintf>
  8006ff:	c9                   	leave
  800700:	c3                   	ret

00800701 <strlen>:
  800701:	55                   	push   %ebp
  800702:	89 e5                	mov    %esp,%ebp
  800704:	8b 55 08             	mov    0x8(%ebp),%edx
  800707:	b8 00 00 00 00       	mov    $0x0,%eax
  80070c:	eb 03                	jmp    800711 <strlen+0x10>
  80070e:	83 c0 01             	add    $0x1,%eax
  800711:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  800715:	75 f7                	jne    80070e <strlen+0xd>
  800717:	5d                   	pop    %ebp
  800718:	c3                   	ret

00800719 <strnlen>:
  800719:	55                   	push   %ebp
  80071a:	89 e5                	mov    %esp,%ebp
  80071c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80071f:	8b 55 0c             	mov    0xc(%ebp),%edx
  800722:	b8 00 00 00 00       	mov    $0x0,%eax
  800727:	eb 03                	jmp    80072c <strnlen+0x13>
  800729:	83 c0 01             	add    $0x1,%eax
  80072c:	39 d0                	cmp    %edx,%eax
  80072e:	74 08                	je     800738 <strnlen+0x1f>
  800730:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  800734:	75 f3                	jne    800729 <strnlen+0x10>
  800736:	89 c2                	mov    %eax,%edx
  800738:	89 d0                	mov    %edx,%eax
  80073a:	5d                   	pop    %ebp
  80073b:	c3                   	ret

0080073c <strcpy>:
  80073c:	55                   	push   %ebp
  80073d:	89 e5                	mov    %esp,%ebp
  80073f:	53                   	push   %ebx
  800740:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800743:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800746:	b8 00 00 00 00       	mov    $0x0,%eax
  80074b:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  80074f:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  800752:	83 c0 01             	add    $0x1,%eax
  800755:	84 d2                	test   %dl,%dl
  800757:	75 f2                	jne    80074b <strcpy+0xf>
  800759:	89 c8                	mov    %ecx,%eax
  80075b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  80075e:	c9                   	leave
  80075f:	c3                   	ret

00800760 <strcat>:
  800760:	55                   	push   %ebp
  800761:	89 e5                	mov    %esp,%ebp
  800763:	53                   	push   %ebx
  800764:	83 ec 10             	sub    $0x10,%esp
  800767:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80076a:	53                   	push   %ebx
  80076b:	e8 91 ff ff ff       	call   800701 <strlen>
  800770:	83 c4 08             	add    $0x8,%esp
  800773:	ff 75 0c             	push   0xc(%ebp)
  800776:	01 d8                	add    %ebx,%eax
  800778:	50                   	push   %eax
  800779:	e8 be ff ff ff       	call   80073c <strcpy>
  80077e:	89 d8                	mov    %ebx,%eax
  800780:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800783:	c9                   	leave
  800784:	c3                   	ret

00800785 <strncpy>:
  800785:	55                   	push   %ebp
  800786:	89 e5                	mov    %esp,%ebp
  800788:	56                   	push   %esi
  800789:	53                   	push   %ebx
  80078a:	8b 75 08             	mov    0x8(%ebp),%esi
  80078d:	8b 55 0c             	mov    0xc(%ebp),%edx
  800790:	89 f3                	mov    %esi,%ebx
  800792:	03 5d 10             	add    0x10(%ebp),%ebx
  800795:	89 f0                	mov    %esi,%eax
  800797:	eb 0f                	jmp    8007a8 <strncpy+0x23>
  800799:	83 c0 01             	add    $0x1,%eax
  80079c:	0f b6 0a             	movzbl (%edx),%ecx
  80079f:	88 48 ff             	mov    %cl,-0x1(%eax)
  8007a2:	80 f9 01             	cmp    $0x1,%cl
  8007a5:	83 da ff             	sbb    $0xffffffff,%edx
  8007a8:	39 d8                	cmp    %ebx,%eax
  8007aa:	75 ed                	jne    800799 <strncpy+0x14>
  8007ac:	89 f0                	mov    %esi,%eax
  8007ae:	5b                   	pop    %ebx
  8007af:	5e                   	pop    %esi
  8007b0:	5d                   	pop    %ebp
  8007b1:	c3                   	ret

008007b2 <strlcpy>:
  8007b2:	55                   	push   %ebp
  8007b3:	89 e5                	mov    %esp,%ebp
  8007b5:	56                   	push   %esi
  8007b6:	53                   	push   %ebx
  8007b7:	8b 75 08             	mov    0x8(%ebp),%esi
  8007ba:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8007bd:	8b 55 10             	mov    0x10(%ebp),%edx
  8007c0:	89 f0                	mov    %esi,%eax
  8007c2:	85 d2                	test   %edx,%edx
  8007c4:	74 21                	je     8007e7 <strlcpy+0x35>
  8007c6:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  8007ca:	89 f2                	mov    %esi,%edx
  8007cc:	eb 09                	jmp    8007d7 <strlcpy+0x25>
  8007ce:	83 c1 01             	add    $0x1,%ecx
  8007d1:	83 c2 01             	add    $0x1,%edx
  8007d4:	88 5a ff             	mov    %bl,-0x1(%edx)
  8007d7:	39 c2                	cmp    %eax,%edx
  8007d9:	74 09                	je     8007e4 <strlcpy+0x32>
  8007db:	0f b6 19             	movzbl (%ecx),%ebx
  8007de:	84 db                	test   %bl,%bl
  8007e0:	75 ec                	jne    8007ce <strlcpy+0x1c>
  8007e2:	89 d0                	mov    %edx,%eax
  8007e4:	c6 00 00             	movb   $0x0,(%eax)
  8007e7:	29 f0                	sub    %esi,%eax
  8007e9:	5b                   	pop    %ebx
  8007ea:	5e                   	pop    %esi
  8007eb:	5d                   	pop    %ebp
  8007ec:	c3                   	ret

008007ed <strcmp>:
  8007ed:	55                   	push   %ebp
  8007ee:	89 e5                	mov    %esp,%ebp
  8007f0:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8007f3:	8b 55 0c             	mov    0xc(%ebp),%edx
  8007f6:	eb 06                	jmp    8007fe <strcmp+0x11>
  8007f8:	83 c1 01             	add    $0x1,%ecx
  8007fb:	83 c2 01             	add    $0x1,%edx
  8007fe:	0f b6 01             	movzbl (%ecx),%eax
  800801:	84 c0                	test   %al,%al
  800803:	74 04                	je     800809 <strcmp+0x1c>
  800805:	3a 02                	cmp    (%edx),%al
  800807:	74 ef                	je     8007f8 <strcmp+0xb>
  800809:	0f b6 c0             	movzbl %al,%eax
  80080c:	0f b6 12             	movzbl (%edx),%edx
  80080f:	29 d0                	sub    %edx,%eax
  800811:	5d                   	pop    %ebp
  800812:	c3                   	ret

00800813 <strncmp>:
  800813:	55                   	push   %ebp
  800814:	89 e5                	mov    %esp,%ebp
  800816:	53                   	push   %ebx
  800817:	8b 45 08             	mov    0x8(%ebp),%eax
  80081a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80081d:	8b 55 10             	mov    0x10(%ebp),%edx
  800820:	eb 09                	jmp    80082b <strncmp+0x18>
  800822:	83 ea 01             	sub    $0x1,%edx
  800825:	83 c0 01             	add    $0x1,%eax
  800828:	83 c1 01             	add    $0x1,%ecx
  80082b:	85 d2                	test   %edx,%edx
  80082d:	74 18                	je     800847 <strncmp+0x34>
  80082f:	0f b6 18             	movzbl (%eax),%ebx
  800832:	84 db                	test   %bl,%bl
  800834:	74 04                	je     80083a <strncmp+0x27>
  800836:	3a 19                	cmp    (%ecx),%bl
  800838:	74 e8                	je     800822 <strncmp+0xf>
  80083a:	0f b6 00             	movzbl (%eax),%eax
  80083d:	0f b6 11             	movzbl (%ecx),%edx
  800840:	29 d0                	sub    %edx,%eax
  800842:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800845:	c9                   	leave
  800846:	c3                   	ret
  800847:	b8 00 00 00 00       	mov    $0x0,%eax
  80084c:	eb f4                	jmp    800842 <strncmp+0x2f>

0080084e <strchr>:
  80084e:	55                   	push   %ebp
  80084f:	89 e5                	mov    %esp,%ebp
  800851:	8b 45 08             	mov    0x8(%ebp),%eax
  800854:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  800858:	eb 03                	jmp    80085d <strchr+0xf>
  80085a:	83 c0 01             	add    $0x1,%eax
  80085d:	0f b6 10             	movzbl (%eax),%edx
  800860:	84 d2                	test   %dl,%dl
  800862:	74 06                	je     80086a <strchr+0x1c>
  800864:	38 ca                	cmp    %cl,%dl
  800866:	75 f2                	jne    80085a <strchr+0xc>
  800868:	eb 05                	jmp    80086f <strchr+0x21>
  80086a:	b8 00 00 00 00       	mov    $0x0,%eax
  80086f:	5d                   	pop    %ebp
  800870:	c3                   	ret

00800871 <strfind>:
  800871:	55                   	push   %ebp
  800872:	89 e5                	mov    %esp,%ebp
  800874:	8b 45 08             	mov    0x8(%ebp),%eax
  800877:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  80087b:	0f b6 10             	movzbl (%eax),%edx
  80087e:	38 ca                	cmp    %cl,%dl
  800880:	74 09                	je     80088b <strfind+0x1a>
  800882:	84 d2                	test   %dl,%dl
  800884:	74 05                	je     80088b <strfind+0x1a>
  800886:	83 c0 01             	add    $0x1,%eax
  800889:	eb f0                	jmp    80087b <strfind+0xa>
  80088b:	5d                   	pop    %ebp
  80088c:	c3                   	ret

0080088d <memset>:
  80088d:	55                   	push   %ebp
  80088e:	89 e5                	mov    %esp,%ebp
  800890:	57                   	push   %edi
  800891:	8b 55 08             	mov    0x8(%ebp),%edx
  800894:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800897:	85 c9                	test   %ecx,%ecx
  800899:	74 24                	je     8008bf <memset+0x32>
  80089b:	89 d0                	mov    %edx,%eax
  80089d:	09 c8                	or     %ecx,%eax
  80089f:	a8 03                	test   $0x3,%al
  8008a1:	75 14                	jne    8008b7 <memset+0x2a>
  8008a3:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  8008a7:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  8008ad:	c1 e9 02             	shr    $0x2,%ecx
  8008b0:	89 d7                	mov    %edx,%edi
  8008b2:	fc                   	cld
  8008b3:	f3 ab                	rep stos %eax,%es:(%edi)
  8008b5:	eb 08                	jmp    8008bf <memset+0x32>
  8008b7:	89 d7                	mov    %edx,%edi
  8008b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  8008bc:	fc                   	cld
  8008bd:	f3 aa                	rep stos %al,%es:(%edi)
  8008bf:	89 d0                	mov    %edx,%eax
  8008c1:	8b 7d fc             	mov    -0x4(%ebp),%edi
  8008c4:	c9                   	leave
  8008c5:	c3                   	ret

008008c6 <memmove>:
  8008c6:	55                   	push   %ebp
  8008c7:	89 e5                	mov    %esp,%ebp
  8008c9:	57                   	push   %edi
  8008ca:	56                   	push   %esi
  8008cb:	8b 45 08             	mov    0x8(%ebp),%eax
  8008ce:	8b 75 0c             	mov    0xc(%ebp),%esi
  8008d1:	8b 4d 10             	mov    0x10(%ebp),%ecx
  8008d4:	39 c6                	cmp    %eax,%esi
  8008d6:	73 32                	jae    80090a <memmove+0x44>
  8008d8:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  8008db:	39 d0                	cmp    %edx,%eax
  8008dd:	73 2b                	jae    80090a <memmove+0x44>
  8008df:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  8008e2:	89 fe                	mov    %edi,%esi
  8008e4:	09 ce                	or     %ecx,%esi
  8008e6:	09 d6                	or     %edx,%esi
  8008e8:	f7 c6 03 00 00 00    	test   $0x3,%esi
  8008ee:	75 0e                	jne    8008fe <memmove+0x38>
  8008f0:	83 ef 04             	sub    $0x4,%edi
  8008f3:	8d 72 fc             	lea    -0x4(%edx),%esi
  8008f6:	c1 e9 02             	shr    $0x2,%ecx
  8008f9:	fd                   	std
  8008fa:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  8008fc:	eb 09                	jmp    800907 <memmove+0x41>
  8008fe:	83 ef 01             	sub    $0x1,%edi
  800901:	8d 72 ff             	lea    -0x1(%edx),%esi
  800904:	fd                   	std
  800905:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800907:	fc                   	cld
  800908:	eb 1a                	jmp    800924 <memmove+0x5e>
  80090a:	89 c2                	mov    %eax,%edx
  80090c:	09 ca                	or     %ecx,%edx
  80090e:	09 f2                	or     %esi,%edx
  800910:	f6 c2 03             	test   $0x3,%dl
  800913:	75 0a                	jne    80091f <memmove+0x59>
  800915:	c1 e9 02             	shr    $0x2,%ecx
  800918:	89 c7                	mov    %eax,%edi
  80091a:	fc                   	cld
  80091b:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  80091d:	eb 05                	jmp    800924 <memmove+0x5e>
  80091f:	89 c7                	mov    %eax,%edi
  800921:	fc                   	cld
  800922:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800924:	5e                   	pop    %esi
  800925:	5f                   	pop    %edi
  800926:	5d                   	pop    %ebp
  800927:	c3                   	ret

00800928 <memcpy>:
  800928:	55                   	push   %ebp
  800929:	89 e5                	mov    %esp,%ebp
  80092b:	83 ec 0c             	sub    $0xc,%esp
  80092e:	ff 75 10             	push   0x10(%ebp)
  800931:	ff 75 0c             	push   0xc(%ebp)
  800934:	ff 75 08             	push   0x8(%ebp)
  800937:	e8 8a ff ff ff       	call   8008c6 <memmove>
  80093c:	c9                   	leave
  80093d:	c3                   	ret

0080093e <memcmp>:
  80093e:	55                   	push   %ebp
  80093f:	89 e5                	mov    %esp,%ebp
  800941:	56                   	push   %esi
  800942:	53                   	push   %ebx
  800943:	8b 45 08             	mov    0x8(%ebp),%eax
  800946:	8b 55 0c             	mov    0xc(%ebp),%edx
  800949:	89 c6                	mov    %eax,%esi
  80094b:	03 75 10             	add    0x10(%ebp),%esi
  80094e:	eb 06                	jmp    800956 <memcmp+0x18>
  800950:	83 c0 01             	add    $0x1,%eax
  800953:	83 c2 01             	add    $0x1,%edx
  800956:	39 f0                	cmp    %esi,%eax
  800958:	74 14                	je     80096e <memcmp+0x30>
  80095a:	0f b6 08             	movzbl (%eax),%ecx
  80095d:	0f b6 1a             	movzbl (%edx),%ebx
  800960:	38 d9                	cmp    %bl,%cl
  800962:	74 ec                	je     800950 <memcmp+0x12>
  800964:	0f b6 c1             	movzbl %cl,%eax
  800967:	0f b6 db             	movzbl %bl,%ebx
  80096a:	29 d8                	sub    %ebx,%eax
  80096c:	eb 05                	jmp    800973 <memcmp+0x35>
  80096e:	b8 00 00 00 00       	mov    $0x0,%eax
  800973:	5b                   	pop    %ebx
  800974:	5e                   	pop    %esi
  800975:	5d                   	pop    %ebp
  800976:	c3                   	ret

00800977 <memfind>:
  800977:	55                   	push   %ebp
  800978:	89 e5                	mov    %esp,%ebp
  80097a:	8b 45 08             	mov    0x8(%ebp),%eax
  80097d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800980:	89 c2                	mov    %eax,%edx
  800982:	03 55 10             	add    0x10(%ebp),%edx
  800985:	eb 03                	jmp    80098a <memfind+0x13>
  800987:	83 c0 01             	add    $0x1,%eax
  80098a:	39 d0                	cmp    %edx,%eax
  80098c:	73 04                	jae    800992 <memfind+0x1b>
  80098e:	38 08                	cmp    %cl,(%eax)
  800990:	75 f5                	jne    800987 <memfind+0x10>
  800992:	5d                   	pop    %ebp
  800993:	c3                   	ret

00800994 <strtol>:
  800994:	55                   	push   %ebp
  800995:	89 e5                	mov    %esp,%ebp
  800997:	57                   	push   %edi
  800998:	56                   	push   %esi
  800999:	53                   	push   %ebx
  80099a:	8b 55 08             	mov    0x8(%ebp),%edx
  80099d:	8b 5d 10             	mov    0x10(%ebp),%ebx
  8009a0:	eb 03                	jmp    8009a5 <strtol+0x11>
  8009a2:	83 c2 01             	add    $0x1,%edx
  8009a5:	0f b6 02             	movzbl (%edx),%eax
  8009a8:	3c 20                	cmp    $0x20,%al
  8009aa:	74 f6                	je     8009a2 <strtol+0xe>
  8009ac:	3c 09                	cmp    $0x9,%al
  8009ae:	74 f2                	je     8009a2 <strtol+0xe>
  8009b0:	3c 2b                	cmp    $0x2b,%al
  8009b2:	74 2a                	je     8009de <strtol+0x4a>
  8009b4:	bf 00 00 00 00       	mov    $0x0,%edi
  8009b9:	3c 2d                	cmp    $0x2d,%al
  8009bb:	74 2b                	je     8009e8 <strtol+0x54>
  8009bd:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  8009c3:	75 0f                	jne    8009d4 <strtol+0x40>
  8009c5:	80 3a 30             	cmpb   $0x30,(%edx)
  8009c8:	74 28                	je     8009f2 <strtol+0x5e>
  8009ca:	85 db                	test   %ebx,%ebx
  8009cc:	b8 0a 00 00 00       	mov    $0xa,%eax
  8009d1:	0f 44 d8             	cmove  %eax,%ebx
  8009d4:	b9 00 00 00 00       	mov    $0x0,%ecx
  8009d9:	89 5d 10             	mov    %ebx,0x10(%ebp)
  8009dc:	eb 46                	jmp    800a24 <strtol+0x90>
  8009de:	83 c2 01             	add    $0x1,%edx
  8009e1:	bf 00 00 00 00       	mov    $0x0,%edi
  8009e6:	eb d5                	jmp    8009bd <strtol+0x29>
  8009e8:	83 c2 01             	add    $0x1,%edx
  8009eb:	bf 01 00 00 00       	mov    $0x1,%edi
  8009f0:	eb cb                	jmp    8009bd <strtol+0x29>
  8009f2:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  8009f6:	74 0e                	je     800a06 <strtol+0x72>
  8009f8:	85 db                	test   %ebx,%ebx
  8009fa:	75 d8                	jne    8009d4 <strtol+0x40>
  8009fc:	83 c2 01             	add    $0x1,%edx
  8009ff:	bb 08 00 00 00       	mov    $0x8,%ebx
  800a04:	eb ce                	jmp    8009d4 <strtol+0x40>
  800a06:	83 c2 02             	add    $0x2,%edx
  800a09:	bb 10 00 00 00       	mov    $0x10,%ebx
  800a0e:	eb c4                	jmp    8009d4 <strtol+0x40>
  800a10:	0f be c0             	movsbl %al,%eax
  800a13:	83 e8 30             	sub    $0x30,%eax
  800a16:	3b 45 10             	cmp    0x10(%ebp),%eax
  800a19:	7d 3a                	jge    800a55 <strtol+0xc1>
  800a1b:	83 c2 01             	add    $0x1,%edx
  800a1e:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  800a22:	01 c1                	add    %eax,%ecx
  800a24:	0f b6 02             	movzbl (%edx),%eax
  800a27:	8d 70 d0             	lea    -0x30(%eax),%esi
  800a2a:	89 f3                	mov    %esi,%ebx
  800a2c:	80 fb 09             	cmp    $0x9,%bl
  800a2f:	76 df                	jbe    800a10 <strtol+0x7c>
  800a31:	8d 70 9f             	lea    -0x61(%eax),%esi
  800a34:	89 f3                	mov    %esi,%ebx
  800a36:	80 fb 19             	cmp    $0x19,%bl
  800a39:	77 08                	ja     800a43 <strtol+0xaf>
  800a3b:	0f be c0             	movsbl %al,%eax
  800a3e:	83 e8 57             	sub    $0x57,%eax
  800a41:	eb d3                	jmp    800a16 <strtol+0x82>
  800a43:	8d 70 bf             	lea    -0x41(%eax),%esi
  800a46:	89 f3                	mov    %esi,%ebx
  800a48:	80 fb 19             	cmp    $0x19,%bl
  800a4b:	77 08                	ja     800a55 <strtol+0xc1>
  800a4d:	0f be c0             	movsbl %al,%eax
  800a50:	83 e8 37             	sub    $0x37,%eax
  800a53:	eb c1                	jmp    800a16 <strtol+0x82>
  800a55:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  800a59:	74 05                	je     800a60 <strtol+0xcc>
  800a5b:	8b 45 0c             	mov    0xc(%ebp),%eax
  800a5e:	89 10                	mov    %edx,(%eax)
  800a60:	89 c8                	mov    %ecx,%eax
  800a62:	f7 d8                	neg    %eax
  800a64:	85 ff                	test   %edi,%edi
  800a66:	0f 45 c8             	cmovne %eax,%ecx
  800a69:	89 c8                	mov    %ecx,%eax
  800a6b:	5b                   	pop    %ebx
  800a6c:	5e                   	pop    %esi
  800a6d:	5f                   	pop    %edi
  800a6e:	5d                   	pop    %ebp
  800a6f:	c3                   	ret

00800a70 <syscall>:
  800a70:	55                   	push   %ebp
  800a71:	89 e5                	mov    %esp,%ebp
  800a73:	57                   	push   %edi
  800a74:	56                   	push   %esi
  800a75:	53                   	push   %ebx
  800a76:	83 ec 1c             	sub    $0x1c,%esp
  800a79:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800a7c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  800a7f:	89 ca                	mov    %ecx,%edx
  800a81:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800a84:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800a87:	8b 7d 10             	mov    0x10(%ebp),%edi
  800a8a:	8b 75 14             	mov    0x14(%ebp),%esi
  800a8d:	cd 30                	int    $0x30
  800a8f:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  800a93:	74 04                	je     800a99 <syscall+0x29>
  800a95:	85 c0                	test   %eax,%eax
  800a97:	7f 08                	jg     800aa1 <syscall+0x31>
  800a99:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800a9c:	5b                   	pop    %ebx
  800a9d:	5e                   	pop    %esi
  800a9e:	5f                   	pop    %edi
  800a9f:	5d                   	pop    %ebp
  800aa0:	c3                   	ret
  800aa1:	83 ec 0c             	sub    $0xc,%esp
  800aa4:	50                   	push   %eax
  800aa5:	ff 75 e0             	push   -0x20(%ebp)
  800aa8:	68 d1 15 80 00       	push   $0x8015d1
  800aad:	6a 1e                	push   $0x1e
  800aaf:	68 ee 15 80 00       	push   $0x8015ee
  800ab4:	e8 12 07 00 00       	call   8011cb <_panic>

00800ab9 <sys_cputs>:
  800ab9:	55                   	push   %ebp
  800aba:	89 e5                	mov    %esp,%ebp
  800abc:	83 ec 08             	sub    $0x8,%esp
  800abf:	6a 00                	push   $0x0
  800ac1:	6a 00                	push   $0x0
  800ac3:	6a 00                	push   $0x0
  800ac5:	ff 75 0c             	push   0xc(%ebp)
  800ac8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800acb:	ba 00 00 00 00       	mov    $0x0,%edx
  800ad0:	b8 00 00 00 00       	mov    $0x0,%eax
  800ad5:	e8 96 ff ff ff       	call   800a70 <syscall>
  800ada:	83 c4 10             	add    $0x10,%esp
  800add:	c9                   	leave
  800ade:	c3                   	ret

00800adf <sys_cgetc>:
  800adf:	55                   	push   %ebp
  800ae0:	89 e5                	mov    %esp,%ebp
  800ae2:	83 ec 08             	sub    $0x8,%esp
  800ae5:	6a 00                	push   $0x0
  800ae7:	6a 00                	push   $0x0
  800ae9:	6a 00                	push   $0x0
  800aeb:	6a 00                	push   $0x0
  800aed:	b9 00 00 00 00       	mov    $0x0,%ecx
  800af2:	ba 00 00 00 00       	mov    $0x0,%edx
  800af7:	b8 01 00 00 00       	mov    $0x1,%eax
  800afc:	e8 6f ff ff ff       	call   800a70 <syscall>
  800b01:	c9                   	leave
  800b02:	c3                   	ret

00800b03 <sys_env_destroy>:
  800b03:	55                   	push   %ebp
  800b04:	89 e5                	mov    %esp,%ebp
  800b06:	83 ec 08             	sub    $0x8,%esp
  800b09:	6a 00                	push   $0x0
  800b0b:	6a 00                	push   $0x0
  800b0d:	6a 00                	push   $0x0
  800b0f:	6a 00                	push   $0x0
  800b11:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b14:	ba 01 00 00 00       	mov    $0x1,%edx
  800b19:	b8 03 00 00 00       	mov    $0x3,%eax
  800b1e:	e8 4d ff ff ff       	call   800a70 <syscall>
  800b23:	c9                   	leave
  800b24:	c3                   	ret

00800b25 <sys_getenvid>:
  800b25:	55                   	push   %ebp
  800b26:	89 e5                	mov    %esp,%ebp
  800b28:	83 ec 08             	sub    $0x8,%esp
  800b2b:	6a 00                	push   $0x0
  800b2d:	6a 00                	push   $0x0
  800b2f:	6a 00                	push   $0x0
  800b31:	6a 00                	push   $0x0
  800b33:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b38:	ba 00 00 00 00       	mov    $0x0,%edx
  800b3d:	b8 02 00 00 00       	mov    $0x2,%eax
  800b42:	e8 29 ff ff ff       	call   800a70 <syscall>
  800b47:	c9                   	leave
  800b48:	c3                   	ret

00800b49 <sys_yield>:
  800b49:	55                   	push   %ebp
  800b4a:	89 e5                	mov    %esp,%ebp
  800b4c:	83 ec 08             	sub    $0x8,%esp
  800b4f:	6a 00                	push   $0x0
  800b51:	6a 00                	push   $0x0
  800b53:	6a 00                	push   $0x0
  800b55:	6a 00                	push   $0x0
  800b57:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b5c:	ba 00 00 00 00       	mov    $0x0,%edx
  800b61:	b8 0a 00 00 00       	mov    $0xa,%eax
  800b66:	e8 05 ff ff ff       	call   800a70 <syscall>
  800b6b:	83 c4 10             	add    $0x10,%esp
  800b6e:	c9                   	leave
  800b6f:	c3                   	ret

00800b70 <sys_page_alloc>:
  800b70:	55                   	push   %ebp
  800b71:	89 e5                	mov    %esp,%ebp
  800b73:	83 ec 08             	sub    $0x8,%esp
  800b76:	6a 00                	push   $0x0
  800b78:	6a 00                	push   $0x0
  800b7a:	ff 75 10             	push   0x10(%ebp)
  800b7d:	ff 75 0c             	push   0xc(%ebp)
  800b80:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b83:	ba 01 00 00 00       	mov    $0x1,%edx
  800b88:	b8 04 00 00 00       	mov    $0x4,%eax
  800b8d:	e8 de fe ff ff       	call   800a70 <syscall>
  800b92:	c9                   	leave
  800b93:	c3                   	ret

00800b94 <sys_page_map>:
  800b94:	55                   	push   %ebp
  800b95:	89 e5                	mov    %esp,%ebp
  800b97:	83 ec 08             	sub    $0x8,%esp
  800b9a:	ff 75 18             	push   0x18(%ebp)
  800b9d:	ff 75 14             	push   0x14(%ebp)
  800ba0:	ff 75 10             	push   0x10(%ebp)
  800ba3:	ff 75 0c             	push   0xc(%ebp)
  800ba6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800ba9:	ba 01 00 00 00       	mov    $0x1,%edx
  800bae:	b8 05 00 00 00       	mov    $0x5,%eax
  800bb3:	e8 b8 fe ff ff       	call   800a70 <syscall>
  800bb8:	c9                   	leave
  800bb9:	c3                   	ret

00800bba <sys_page_unmap>:
  800bba:	55                   	push   %ebp
  800bbb:	89 e5                	mov    %esp,%ebp
  800bbd:	83 ec 08             	sub    $0x8,%esp
  800bc0:	6a 00                	push   $0x0
  800bc2:	6a 00                	push   $0x0
  800bc4:	6a 00                	push   $0x0
  800bc6:	ff 75 0c             	push   0xc(%ebp)
  800bc9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bcc:	ba 01 00 00 00       	mov    $0x1,%edx
  800bd1:	b8 06 00 00 00       	mov    $0x6,%eax
  800bd6:	e8 95 fe ff ff       	call   800a70 <syscall>
  800bdb:	c9                   	leave
  800bdc:	c3                   	ret

00800bdd <sys_env_set_status>:
  800bdd:	55                   	push   %ebp
  800bde:	89 e5                	mov    %esp,%ebp
  800be0:	83 ec 08             	sub    $0x8,%esp
  800be3:	6a 00                	push   $0x0
  800be5:	6a 00                	push   $0x0
  800be7:	6a 00                	push   $0x0
  800be9:	ff 75 0c             	push   0xc(%ebp)
  800bec:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bef:	ba 01 00 00 00       	mov    $0x1,%edx
  800bf4:	b8 08 00 00 00       	mov    $0x8,%eax
  800bf9:	e8 72 fe ff ff       	call   800a70 <syscall>
  800bfe:	c9                   	leave
  800bff:	c3                   	ret

00800c00 <sys_env_set_pgfault_upcall>:
  800c00:	55                   	push   %ebp
  800c01:	89 e5                	mov    %esp,%ebp
  800c03:	83 ec 08             	sub    $0x8,%esp
  800c06:	6a 00                	push   $0x0
  800c08:	6a 00                	push   $0x0
  800c0a:	6a 00                	push   $0x0
  800c0c:	ff 75 0c             	push   0xc(%ebp)
  800c0f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c12:	ba 01 00 00 00       	mov    $0x1,%edx
  800c17:	b8 09 00 00 00       	mov    $0x9,%eax
  800c1c:	e8 4f fe ff ff       	call   800a70 <syscall>
  800c21:	c9                   	leave
  800c22:	c3                   	ret

00800c23 <sys_ipc_try_send>:
  800c23:	55                   	push   %ebp
  800c24:	89 e5                	mov    %esp,%ebp
  800c26:	83 ec 08             	sub    $0x8,%esp
  800c29:	6a 00                	push   $0x0
  800c2b:	ff 75 14             	push   0x14(%ebp)
  800c2e:	ff 75 10             	push   0x10(%ebp)
  800c31:	ff 75 0c             	push   0xc(%ebp)
  800c34:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c37:	ba 00 00 00 00       	mov    $0x0,%edx
  800c3c:	b8 0c 00 00 00       	mov    $0xc,%eax
  800c41:	e8 2a fe ff ff       	call   800a70 <syscall>
  800c46:	c9                   	leave
  800c47:	c3                   	ret

00800c48 <sys_ipc_recv>:
  800c48:	55                   	push   %ebp
  800c49:	89 e5                	mov    %esp,%ebp
  800c4b:	83 ec 08             	sub    $0x8,%esp
  800c4e:	6a 00                	push   $0x0
  800c50:	6a 00                	push   $0x0
  800c52:	6a 00                	push   $0x0
  800c54:	6a 00                	push   $0x0
  800c56:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c59:	ba 01 00 00 00       	mov    $0x1,%edx
  800c5e:	b8 0d 00 00 00       	mov    $0xd,%eax
  800c63:	e8 08 fe ff ff       	call   800a70 <syscall>
  800c68:	c9                   	leave
  800c69:	c3                   	ret

00800c6a <duppage>:
  800c6a:	55                   	push   %ebp
  800c6b:	89 e5                	mov    %esp,%ebp
  800c6d:	56                   	push   %esi
  800c6e:	53                   	push   %ebx
  800c6f:	89 c1                	mov    %eax,%ecx
  800c71:	89 d6                	mov    %edx,%esi
  800c73:	c1 e6 0c             	shl    $0xc,%esi
  800c76:	8b 14 95 00 00 40 ef 	mov    -0x10c00000(,%edx,4),%edx
  800c7d:	89 d0                	mov    %edx,%eax
  800c7f:	f7 d0                	not    %eax
  800c81:	a8 05                	test   $0x5,%al
  800c83:	75 5a                	jne    800cdf <duppage+0x75>
  800c85:	89 d0                	mov    %edx,%eax
  800c87:	83 e0 18             	and    $0x18,%eax
  800c8a:	83 f8 01             	cmp    $0x1,%eax
  800c8d:	19 c0                	sbb    %eax,%eax
  800c8f:	83 e0 e8             	and    $0xffffffe8,%eax
  800c92:	83 c0 1d             	add    $0x1d,%eax
  800c95:	f7 c2 02 08 00 00    	test   $0x802,%edx
  800c9b:	74 68                	je     800d05 <duppage+0x9b>
  800c9d:	80 cc 08             	or     $0x8,%ah
  800ca0:	89 c3                	mov    %eax,%ebx
  800ca2:	83 ec 0c             	sub    $0xc,%esp
  800ca5:	53                   	push   %ebx
  800ca6:	56                   	push   %esi
  800ca7:	51                   	push   %ecx
  800ca8:	56                   	push   %esi
  800ca9:	6a 00                	push   $0x0
  800cab:	e8 e4 fe ff ff       	call   800b94 <sys_page_map>
  800cb0:	83 c4 20             	add    $0x20,%esp
  800cb3:	85 c0                	test   %eax,%eax
  800cb5:	78 3c                	js     800cf3 <duppage+0x89>
  800cb7:	83 ec 0c             	sub    $0xc,%esp
  800cba:	53                   	push   %ebx
  800cbb:	56                   	push   %esi
  800cbc:	6a 00                	push   $0x0
  800cbe:	56                   	push   %esi
  800cbf:	6a 00                	push   $0x0
  800cc1:	e8 ce fe ff ff       	call   800b94 <sys_page_map>
  800cc6:	83 c4 20             	add    $0x20,%esp
  800cc9:	85 c0                	test   %eax,%eax
  800ccb:	79 4d                	jns    800d1a <duppage+0xb0>
  800ccd:	50                   	push   %eax
  800cce:	68 34 17 80 00       	push   $0x801734
  800cd3:	6a 57                	push   $0x57
  800cd5:	68 fc 15 80 00       	push   $0x8015fc
  800cda:	e8 ec 04 00 00       	call   8011cb <_panic>
  800cdf:	83 ec 04             	sub    $0x4,%esp
  800ce2:	68 d8 16 80 00       	push   $0x8016d8
  800ce7:	6a 47                	push   $0x47
  800ce9:	68 fc 15 80 00       	push   $0x8015fc
  800cee:	e8 d8 04 00 00       	call   8011cb <_panic>
  800cf3:	50                   	push   %eax
  800cf4:	68 08 17 80 00       	push   $0x801708
  800cf9:	6a 53                	push   $0x53
  800cfb:	68 fc 15 80 00       	push   $0x8015fc
  800d00:	e8 c6 04 00 00       	call   8011cb <_panic>
  800d05:	83 ec 0c             	sub    $0xc,%esp
  800d08:	50                   	push   %eax
  800d09:	56                   	push   %esi
  800d0a:	51                   	push   %ecx
  800d0b:	56                   	push   %esi
  800d0c:	6a 00                	push   $0x0
  800d0e:	e8 81 fe ff ff       	call   800b94 <sys_page_map>
  800d13:	83 c4 20             	add    $0x20,%esp
  800d16:	85 c0                	test   %eax,%eax
  800d18:	78 0c                	js     800d26 <duppage+0xbc>
  800d1a:	b8 00 00 00 00       	mov    $0x0,%eax
  800d1f:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800d22:	5b                   	pop    %ebx
  800d23:	5e                   	pop    %esi
  800d24:	5d                   	pop    %ebp
  800d25:	c3                   	ret
  800d26:	50                   	push   %eax
  800d27:	68 5c 17 80 00       	push   $0x80175c
  800d2c:	6a 5b                	push   $0x5b
  800d2e:	68 fc 15 80 00       	push   $0x8015fc
  800d33:	e8 93 04 00 00       	call   8011cb <_panic>

00800d38 <dup_or_share>:
  800d38:	55                   	push   %ebp
  800d39:	89 e5                	mov    %esp,%ebp
  800d3b:	57                   	push   %edi
  800d3c:	56                   	push   %esi
  800d3d:	53                   	push   %ebx
  800d3e:	83 ec 0c             	sub    $0xc,%esp
  800d41:	89 c7                	mov    %eax,%edi
  800d43:	8b 04 95 00 00 40 ef 	mov    -0x10c00000(,%edx,4),%eax
  800d4a:	a8 01                	test   $0x1,%al
  800d4c:	74 33                	je     800d81 <dup_or_share+0x49>
  800d4e:	89 d6                	mov    %edx,%esi
  800d50:	21 c1                	and    %eax,%ecx
  800d52:	89 cb                	mov    %ecx,%ebx
  800d54:	83 e3 02             	and    $0x2,%ebx
  800d57:	89 da                	mov    %ebx,%edx
  800d59:	83 ca 18             	or     $0x18,%edx
  800d5c:	a8 18                	test   $0x18,%al
  800d5e:	0f 45 da             	cmovne %edx,%ebx
  800d61:	c1 e6 0c             	shl    $0xc,%esi
  800d64:	83 e0 1a             	and    $0x1a,%eax
  800d67:	83 f8 02             	cmp    $0x2,%eax
  800d6a:	74 32                	je     800d9e <dup_or_share+0x66>
  800d6c:	83 ec 0c             	sub    $0xc,%esp
  800d6f:	53                   	push   %ebx
  800d70:	56                   	push   %esi
  800d71:	57                   	push   %edi
  800d72:	56                   	push   %esi
  800d73:	6a 00                	push   $0x0
  800d75:	e8 1a fe ff ff       	call   800b94 <sys_page_map>
  800d7a:	83 c4 20             	add    $0x20,%esp
  800d7d:	85 c0                	test   %eax,%eax
  800d7f:	78 08                	js     800d89 <dup_or_share+0x51>
  800d81:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800d84:	5b                   	pop    %ebx
  800d85:	5e                   	pop    %esi
  800d86:	5f                   	pop    %edi
  800d87:	5d                   	pop    %ebp
  800d88:	c3                   	ret
  800d89:	50                   	push   %eax
  800d8a:	68 88 17 80 00       	push   $0x801788
  800d8f:	68 84 00 00 00       	push   $0x84
  800d94:	68 fc 15 80 00       	push   $0x8015fc
  800d99:	e8 2d 04 00 00       	call   8011cb <_panic>
  800d9e:	83 ec 04             	sub    $0x4,%esp
  800da1:	53                   	push   %ebx
  800da2:	56                   	push   %esi
  800da3:	57                   	push   %edi
  800da4:	e8 c7 fd ff ff       	call   800b70 <sys_page_alloc>
  800da9:	83 c4 10             	add    $0x10,%esp
  800dac:	85 c0                	test   %eax,%eax
  800dae:	78 57                	js     800e07 <dup_or_share+0xcf>
  800db0:	83 ec 0c             	sub    $0xc,%esp
  800db3:	53                   	push   %ebx
  800db4:	68 00 00 40 00       	push   $0x400000
  800db9:	6a 00                	push   $0x0
  800dbb:	56                   	push   %esi
  800dbc:	57                   	push   %edi
  800dbd:	e8 d2 fd ff ff       	call   800b94 <sys_page_map>
  800dc2:	83 c4 20             	add    $0x20,%esp
  800dc5:	85 c0                	test   %eax,%eax
  800dc7:	78 53                	js     800e1c <dup_or_share+0xe4>
  800dc9:	83 ec 04             	sub    $0x4,%esp
  800dcc:	68 00 10 00 00       	push   $0x1000
  800dd1:	56                   	push   %esi
  800dd2:	68 00 00 40 00       	push   $0x400000
  800dd7:	e8 ea fa ff ff       	call   8008c6 <memmove>
  800ddc:	83 c4 08             	add    $0x8,%esp
  800ddf:	68 00 00 40 00       	push   $0x400000
  800de4:	6a 00                	push   $0x0
  800de6:	e8 cf fd ff ff       	call   800bba <sys_page_unmap>
  800deb:	83 c4 10             	add    $0x10,%esp
  800dee:	85 c0                	test   %eax,%eax
  800df0:	79 8f                	jns    800d81 <dup_or_share+0x49>
  800df2:	50                   	push   %eax
  800df3:	68 46 16 80 00       	push   $0x801646
  800df8:	68 8d 00 00 00       	push   $0x8d
  800dfd:	68 fc 15 80 00       	push   $0x8015fc
  800e02:	e8 c4 03 00 00       	call   8011cb <_panic>
  800e07:	50                   	push   %eax
  800e08:	68 a8 17 80 00       	push   $0x8017a8
  800e0d:	68 88 00 00 00       	push   $0x88
  800e12:	68 fc 15 80 00       	push   $0x8015fc
  800e17:	e8 af 03 00 00       	call   8011cb <_panic>
  800e1c:	50                   	push   %eax
  800e1d:	68 88 17 80 00       	push   $0x801788
  800e22:	68 8a 00 00 00       	push   $0x8a
  800e27:	68 fc 15 80 00       	push   $0x8015fc
  800e2c:	e8 9a 03 00 00       	call   8011cb <_panic>

00800e31 <pgfault>:
  800e31:	55                   	push   %ebp
  800e32:	89 e5                	mov    %esp,%ebp
  800e34:	53                   	push   %ebx
  800e35:	83 ec 08             	sub    $0x8,%esp
  800e38:	8b 45 08             	mov    0x8(%ebp),%eax
  800e3b:	8b 18                	mov    (%eax),%ebx
  800e3d:	89 d8                	mov    %ebx,%eax
  800e3f:	c1 e8 0c             	shr    $0xc,%eax
  800e42:	8b 04 85 00 00 40 ef 	mov    -0x10c00000(,%eax,4),%eax
  800e49:	6a 07                	push   $0x7
  800e4b:	68 00 f0 7f 00       	push   $0x7ff000
  800e50:	6a 00                	push   $0x0
  800e52:	e8 19 fd ff ff       	call   800b70 <sys_page_alloc>
  800e57:	83 c4 10             	add    $0x10,%esp
  800e5a:	85 c0                	test   %eax,%eax
  800e5c:	78 51                	js     800eaf <pgfault+0x7e>
  800e5e:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
  800e64:	83 ec 04             	sub    $0x4,%esp
  800e67:	68 00 10 00 00       	push   $0x1000
  800e6c:	53                   	push   %ebx
  800e6d:	68 00 f0 7f 00       	push   $0x7ff000
  800e72:	e8 4f fa ff ff       	call   8008c6 <memmove>
  800e77:	c7 04 24 07 00 00 00 	movl   $0x7,(%esp)
  800e7e:	53                   	push   %ebx
  800e7f:	6a 00                	push   $0x0
  800e81:	68 00 f0 7f 00       	push   $0x7ff000
  800e86:	6a 00                	push   $0x0
  800e88:	e8 07 fd ff ff       	call   800b94 <sys_page_map>
  800e8d:	83 c4 20             	add    $0x20,%esp
  800e90:	85 c0                	test   %eax,%eax
  800e92:	78 2d                	js     800ec1 <pgfault+0x90>
  800e94:	83 ec 08             	sub    $0x8,%esp
  800e97:	68 00 f0 7f 00       	push   $0x7ff000
  800e9c:	6a 00                	push   $0x0
  800e9e:	e8 17 fd ff ff       	call   800bba <sys_page_unmap>
  800ea3:	83 c4 10             	add    $0x10,%esp
  800ea6:	85 c0                	test   %eax,%eax
  800ea8:	78 29                	js     800ed3 <pgfault+0xa2>
  800eaa:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800ead:	c9                   	leave
  800eae:	c3                   	ret
  800eaf:	50                   	push   %eax
  800eb0:	68 07 16 80 00       	push   $0x801607
  800eb5:	6a 27                	push   $0x27
  800eb7:	68 fc 15 80 00       	push   $0x8015fc
  800ebc:	e8 0a 03 00 00       	call   8011cb <_panic>
  800ec1:	50                   	push   %eax
  800ec2:	68 23 16 80 00       	push   $0x801623
  800ec7:	6a 2c                	push   $0x2c
  800ec9:	68 fc 15 80 00       	push   $0x8015fc
  800ece:	e8 f8 02 00 00       	call   8011cb <_panic>
  800ed3:	50                   	push   %eax
  800ed4:	68 3d 16 80 00       	push   $0x80163d
  800ed9:	6a 2f                	push   $0x2f
  800edb:	68 fc 15 80 00       	push   $0x8015fc
  800ee0:	e8 e6 02 00 00       	call   8011cb <_panic>

00800ee5 <fork_v0>:
  800ee5:	55                   	push   %ebp
  800ee6:	89 e5                	mov    %esp,%ebp
  800ee8:	56                   	push   %esi
  800ee9:	53                   	push   %ebx
  800eea:	b8 07 00 00 00       	mov    $0x7,%eax
  800eef:	cd 30                	int    $0x30
  800ef1:	89 c6                	mov    %eax,%esi
  800ef3:	85 c0                	test   %eax,%eax
  800ef5:	78 23                	js     800f1a <fork_v0+0x35>
  800ef7:	bb 00 00 00 00       	mov    $0x0,%ebx
  800efc:	75 3c                	jne    800f3a <fork_v0+0x55>
  800efe:	e8 22 fc ff ff       	call   800b25 <sys_getenvid>
  800f03:	25 ff 03 00 00       	and    $0x3ff,%eax
  800f08:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800f0e:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800f13:	a3 08 20 80 00       	mov    %eax,0x802008
  800f18:	eb 54                	jmp    800f6e <fork_v0+0x89>
  800f1a:	50                   	push   %eax
  800f1b:	68 59 16 80 00       	push   $0x801659
  800f20:	68 a2 00 00 00       	push   $0xa2
  800f25:	68 fc 15 80 00       	push   $0x8015fc
  800f2a:	e8 9c 02 00 00       	call   8011cb <_panic>
  800f2f:	83 c3 01             	add    $0x1,%ebx
  800f32:	81 fb 00 ec 0e 00    	cmp    $0xeec00,%ebx
  800f38:	74 22                	je     800f5c <fork_v0+0x77>
  800f3a:	89 d8                	mov    %ebx,%eax
  800f3c:	c1 e8 0a             	shr    $0xa,%eax
  800f3f:	8b 04 85 00 d0 7b ef 	mov    -0x10843000(,%eax,4),%eax
  800f46:	f7 d0                	not    %eax
  800f48:	a8 05                	test   $0x5,%al
  800f4a:	75 e3                	jne    800f2f <fork_v0+0x4a>
  800f4c:	b9 07 00 00 00       	mov    $0x7,%ecx
  800f51:	89 da                	mov    %ebx,%edx
  800f53:	89 f0                	mov    %esi,%eax
  800f55:	e8 de fd ff ff       	call   800d38 <dup_or_share>
  800f5a:	eb d3                	jmp    800f2f <fork_v0+0x4a>
  800f5c:	83 ec 08             	sub    $0x8,%esp
  800f5f:	6a 02                	push   $0x2
  800f61:	56                   	push   %esi
  800f62:	e8 76 fc ff ff       	call   800bdd <sys_env_set_status>
  800f67:	83 c4 10             	add    $0x10,%esp
  800f6a:	85 c0                	test   %eax,%eax
  800f6c:	78 09                	js     800f77 <fork_v0+0x92>
  800f6e:	89 f0                	mov    %esi,%eax
  800f70:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800f73:	5b                   	pop    %ebx
  800f74:	5e                   	pop    %esi
  800f75:	5d                   	pop    %ebp
  800f76:	c3                   	ret
  800f77:	50                   	push   %eax
  800f78:	68 69 16 80 00       	push   $0x801669
  800f7d:	68 b8 00 00 00       	push   $0xb8
  800f82:	68 fc 15 80 00       	push   $0x8015fc
  800f87:	e8 3f 02 00 00       	call   8011cb <_panic>

00800f8c <fork>:
  800f8c:	55                   	push   %ebp
  800f8d:	89 e5                	mov    %esp,%ebp
  800f8f:	56                   	push   %esi
  800f90:	53                   	push   %ebx
  800f91:	83 ec 0c             	sub    $0xc,%esp
  800f94:	68 31 0e 80 00       	push   $0x800e31
  800f99:	e8 73 02 00 00       	call   801211 <set_pgfault_handler>
  800f9e:	b8 07 00 00 00       	mov    $0x7,%eax
  800fa3:	cd 30                	int    $0x30
  800fa5:	89 c6                	mov    %eax,%esi
  800fa7:	83 c4 10             	add    $0x10,%esp
  800faa:	85 c0                	test   %eax,%eax
  800fac:	78 26                	js     800fd4 <fork+0x48>
  800fae:	bb 00 00 00 00       	mov    $0x0,%ebx
  800fb3:	75 47                	jne    800ffc <fork+0x70>
  800fb5:	e8 6b fb ff ff       	call   800b25 <sys_getenvid>
  800fba:	25 ff 03 00 00       	and    $0x3ff,%eax
  800fbf:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800fc5:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800fca:	a3 08 20 80 00       	mov    %eax,0x802008
  800fcf:	e9 94 00 00 00       	jmp    801068 <fork+0xdc>
  800fd4:	50                   	push   %eax
  800fd5:	68 59 16 80 00       	push   $0x801659
  800fda:	68 d5 00 00 00       	push   $0xd5
  800fdf:	68 fc 15 80 00       	push   $0x8015fc
  800fe4:	e8 e2 01 00 00       	call   8011cb <_panic>
  800fe9:	83 c3 01             	add    $0x1,%ebx
  800fec:	81 fb 00 ec 0e 00    	cmp    $0xeec00,%ebx
  800ff2:	74 32                	je     801026 <fork+0x9a>
  800ff4:	81 fb ff eb 0e 00    	cmp    $0xeebff,%ebx
  800ffa:	74 ed                	je     800fe9 <fork+0x5d>
  800ffc:	89 d8                	mov    %ebx,%eax
  800ffe:	c1 e8 0a             	shr    $0xa,%eax
  801001:	8b 04 85 00 d0 7b ef 	mov    -0x10843000(,%eax,4),%eax
  801008:	f7 d0                	not    %eax
  80100a:	a8 05                	test   $0x5,%al
  80100c:	75 db                	jne    800fe9 <fork+0x5d>
  80100e:	8b 04 9d 00 00 40 ef 	mov    -0x10c00000(,%ebx,4),%eax
  801015:	f7 d0                	not    %eax
  801017:	a8 05                	test   $0x5,%al
  801019:	75 ce                	jne    800fe9 <fork+0x5d>
  80101b:	89 da                	mov    %ebx,%edx
  80101d:	89 f0                	mov    %esi,%eax
  80101f:	e8 46 fc ff ff       	call   800c6a <duppage>
  801024:	eb c3                	jmp    800fe9 <fork+0x5d>
  801026:	83 ec 04             	sub    $0x4,%esp
  801029:	6a 07                	push   $0x7
  80102b:	68 00 f0 bf ee       	push   $0xeebff000
  801030:	56                   	push   %esi
  801031:	e8 3a fb ff ff       	call   800b70 <sys_page_alloc>
  801036:	83 c4 10             	add    $0x10,%esp
  801039:	85 c0                	test   %eax,%eax
  80103b:	78 34                	js     801071 <fork+0xe5>
  80103d:	a1 08 20 80 00       	mov    0x802008,%eax
  801042:	8b 40 64             	mov    0x64(%eax),%eax
  801045:	83 ec 08             	sub    $0x8,%esp
  801048:	50                   	push   %eax
  801049:	56                   	push   %esi
  80104a:	e8 b1 fb ff ff       	call   800c00 <sys_env_set_pgfault_upcall>
  80104f:	83 c4 10             	add    $0x10,%esp
  801052:	85 c0                	test   %eax,%eax
  801054:	78 30                	js     801086 <fork+0xfa>
  801056:	83 ec 08             	sub    $0x8,%esp
  801059:	6a 02                	push   $0x2
  80105b:	56                   	push   %esi
  80105c:	e8 7c fb ff ff       	call   800bdd <sys_env_set_status>
  801061:	83 c4 10             	add    $0x10,%esp
  801064:	85 c0                	test   %eax,%eax
  801066:	78 33                	js     80109b <fork+0x10f>
  801068:	89 f0                	mov    %esi,%eax
  80106a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  80106d:	5b                   	pop    %ebx
  80106e:	5e                   	pop    %esi
  80106f:	5d                   	pop    %ebp
  801070:	c3                   	ret
  801071:	50                   	push   %eax
  801072:	68 cc 17 80 00       	push   $0x8017cc
  801077:	68 f2 00 00 00       	push   $0xf2
  80107c:	68 fc 15 80 00       	push   $0x8015fc
  801081:	e8 45 01 00 00       	call   8011cb <_panic>
  801086:	50                   	push   %eax
  801087:	68 f8 17 80 00       	push   $0x8017f8
  80108c:	68 f5 00 00 00       	push   $0xf5
  801091:	68 fc 15 80 00       	push   $0x8015fc
  801096:	e8 30 01 00 00       	call   8011cb <_panic>
  80109b:	50                   	push   %eax
  80109c:	68 69 16 80 00       	push   $0x801669
  8010a1:	68 f8 00 00 00       	push   $0xf8
  8010a6:	68 fc 15 80 00       	push   $0x8015fc
  8010ab:	e8 1b 01 00 00       	call   8011cb <_panic>

008010b0 <sfork>:
  8010b0:	55                   	push   %ebp
  8010b1:	89 e5                	mov    %esp,%ebp
  8010b3:	83 ec 0c             	sub    $0xc,%esp
  8010b6:	68 80 16 80 00       	push   $0x801680
  8010bb:	68 01 01 00 00       	push   $0x101
  8010c0:	68 fc 15 80 00       	push   $0x8015fc
  8010c5:	e8 01 01 00 00       	call   8011cb <_panic>

008010ca <ipc_recv>:
  8010ca:	55                   	push   %ebp
  8010cb:	89 e5                	mov    %esp,%ebp
  8010cd:	56                   	push   %esi
  8010ce:	53                   	push   %ebx
  8010cf:	8b 75 08             	mov    0x8(%ebp),%esi
  8010d2:	8b 5d 10             	mov    0x10(%ebp),%ebx
  8010d5:	83 ec 0c             	sub    $0xc,%esp
  8010d8:	ff 75 0c             	push   0xc(%ebp)
  8010db:	e8 68 fb ff ff       	call   800c48 <sys_ipc_recv>
  8010e0:	83 c4 10             	add    $0x10,%esp
  8010e3:	85 f6                	test   %esi,%esi
  8010e5:	74 14                	je     8010fb <ipc_recv+0x31>
  8010e7:	ba 00 00 00 00       	mov    $0x0,%edx
  8010ec:	85 c0                	test   %eax,%eax
  8010ee:	75 09                	jne    8010f9 <ipc_recv+0x2f>
  8010f0:	8b 15 08 20 80 00    	mov    0x802008,%edx
  8010f6:	8b 52 74             	mov    0x74(%edx),%edx
  8010f9:	89 16                	mov    %edx,(%esi)
  8010fb:	85 db                	test   %ebx,%ebx
  8010fd:	74 25                	je     801124 <ipc_recv+0x5a>
  8010ff:	85 c0                	test   %eax,%eax
  801101:	74 0d                	je     801110 <ipc_recv+0x46>
  801103:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  801109:	8d 65 f8             	lea    -0x8(%ebp),%esp
  80110c:	5b                   	pop    %ebx
  80110d:	5e                   	pop    %esi
  80110e:	5d                   	pop    %ebp
  80110f:	c3                   	ret
  801110:	a1 08 20 80 00       	mov    0x802008,%eax
  801115:	8b 40 78             	mov    0x78(%eax),%eax
  801118:	89 03                	mov    %eax,(%ebx)
  80111a:	a1 08 20 80 00       	mov    0x802008,%eax
  80111f:	8b 40 70             	mov    0x70(%eax),%eax
  801122:	eb e5                	jmp    801109 <ipc_recv+0x3f>
  801124:	85 c0                	test   %eax,%eax
  801126:	75 e1                	jne    801109 <ipc_recv+0x3f>
  801128:	eb f0                	jmp    80111a <ipc_recv+0x50>

0080112a <ipc_send>:
  80112a:	55                   	push   %ebp
  80112b:	89 e5                	mov    %esp,%ebp
  80112d:	57                   	push   %edi
  80112e:	56                   	push   %esi
  80112f:	53                   	push   %ebx
  801130:	83 ec 0c             	sub    $0xc,%esp
  801133:	8b 75 0c             	mov    0xc(%ebp),%esi
  801136:	8b 5d 10             	mov    0x10(%ebp),%ebx
  801139:	8b 7d 14             	mov    0x14(%ebp),%edi
  80113c:	85 db                	test   %ebx,%ebx
  80113e:	b8 00 00 c0 ee       	mov    $0xeec00000,%eax
  801143:	0f 44 d8             	cmove  %eax,%ebx
  801146:	57                   	push   %edi
  801147:	53                   	push   %ebx
  801148:	56                   	push   %esi
  801149:	ff 75 08             	push   0x8(%ebp)
  80114c:	e8 d2 fa ff ff       	call   800c23 <sys_ipc_try_send>
  801151:	83 c4 10             	add    $0x10,%esp
  801154:	eb 13                	jmp    801169 <ipc_send+0x3f>
  801156:	e8 ee f9 ff ff       	call   800b49 <sys_yield>
  80115b:	57                   	push   %edi
  80115c:	53                   	push   %ebx
  80115d:	56                   	push   %esi
  80115e:	ff 75 08             	push   0x8(%ebp)
  801161:	e8 bd fa ff ff       	call   800c23 <sys_ipc_try_send>
  801166:	83 c4 10             	add    $0x10,%esp
  801169:	83 f8 f9             	cmp    $0xfffffff9,%eax
  80116c:	74 e8                	je     801156 <ipc_send+0x2c>
  80116e:	85 c0                	test   %eax,%eax
  801170:	78 08                	js     80117a <ipc_send+0x50>
  801172:	8d 65 f4             	lea    -0xc(%ebp),%esp
  801175:	5b                   	pop    %ebx
  801176:	5e                   	pop    %esi
  801177:	5f                   	pop    %edi
  801178:	5d                   	pop    %ebp
  801179:	c3                   	ret
  80117a:	50                   	push   %eax
  80117b:	68 96 16 80 00       	push   $0x801696
  801180:	6a 3b                	push   $0x3b
  801182:	68 a3 16 80 00       	push   $0x8016a3
  801187:	e8 3f 00 00 00       	call   8011cb <_panic>

0080118c <ipc_find_env>:
  80118c:	55                   	push   %ebp
  80118d:	89 e5                	mov    %esp,%ebp
  80118f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  801192:	b8 00 00 00 00       	mov    $0x0,%eax
  801197:	69 d0 84 00 00 00    	imul   $0x84,%eax,%edx
  80119d:	81 c2 00 00 c0 ee    	add    $0xeec00000,%edx
  8011a3:	8b 52 50             	mov    0x50(%edx),%edx
  8011a6:	39 ca                	cmp    %ecx,%edx
  8011a8:	74 11                	je     8011bb <ipc_find_env+0x2f>
  8011aa:	83 c0 01             	add    $0x1,%eax
  8011ad:	3d 00 04 00 00       	cmp    $0x400,%eax
  8011b2:	75 e3                	jne    801197 <ipc_find_env+0xb>
  8011b4:	b8 00 00 00 00       	mov    $0x0,%eax
  8011b9:	eb 0e                	jmp    8011c9 <ipc_find_env+0x3d>
  8011bb:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  8011c1:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  8011c6:	8b 40 48             	mov    0x48(%eax),%eax
  8011c9:	5d                   	pop    %ebp
  8011ca:	c3                   	ret

008011cb <_panic>:
  8011cb:	55                   	push   %ebp
  8011cc:	89 e5                	mov    %esp,%ebp
  8011ce:	56                   	push   %esi
  8011cf:	53                   	push   %ebx
  8011d0:	8d 5d 14             	lea    0x14(%ebp),%ebx
  8011d3:	8b 35 00 20 80 00    	mov    0x802000,%esi
  8011d9:	e8 47 f9 ff ff       	call   800b25 <sys_getenvid>
  8011de:	83 ec 0c             	sub    $0xc,%esp
  8011e1:	ff 75 0c             	push   0xc(%ebp)
  8011e4:	ff 75 08             	push   0x8(%ebp)
  8011e7:	56                   	push   %esi
  8011e8:	50                   	push   %eax
  8011e9:	68 2c 18 80 00       	push   $0x80182c
  8011ee:	e8 04 f0 ff ff       	call   8001f7 <cprintf>
  8011f3:	83 c4 18             	add    $0x18,%esp
  8011f6:	53                   	push   %ebx
  8011f7:	ff 75 10             	push   0x10(%ebp)
  8011fa:	e8 a7 ef ff ff       	call   8001a6 <vcprintf>
  8011ff:	c7 04 24 f8 14 80 00 	movl   $0x8014f8,(%esp)
  801206:	e8 ec ef ff ff       	call   8001f7 <cprintf>
  80120b:	83 c4 10             	add    $0x10,%esp
  80120e:	cc                   	int3
  80120f:	eb fd                	jmp    80120e <_panic+0x43>

00801211 <set_pgfault_handler>:
  801211:	55                   	push   %ebp
  801212:	89 e5                	mov    %esp,%ebp
  801214:	83 ec 08             	sub    $0x8,%esp
  801217:	83 3d 0c 20 80 00 00 	cmpl   $0x0,0x80200c
  80121e:	74 0a                	je     80122a <set_pgfault_handler+0x19>
  801220:	8b 45 08             	mov    0x8(%ebp),%eax
  801223:	a3 0c 20 80 00       	mov    %eax,0x80200c
  801228:	c9                   	leave
  801229:	c3                   	ret
  80122a:	83 ec 04             	sub    $0x4,%esp
  80122d:	6a 07                	push   $0x7
  80122f:	68 00 f0 bf ee       	push   $0xeebff000
  801234:	6a 00                	push   $0x0
  801236:	e8 35 f9 ff ff       	call   800b70 <sys_page_alloc>
  80123b:	83 c4 10             	add    $0x10,%esp
  80123e:	85 c0                	test   %eax,%eax
  801240:	78 e6                	js     801228 <set_pgfault_handler+0x17>
  801242:	83 ec 08             	sub    $0x8,%esp
  801245:	68 5a 12 80 00       	push   $0x80125a
  80124a:	6a 00                	push   $0x0
  80124c:	e8 af f9 ff ff       	call   800c00 <sys_env_set_pgfault_upcall>
  801251:	83 c4 10             	add    $0x10,%esp
  801254:	85 c0                	test   %eax,%eax
  801256:	79 c8                	jns    801220 <set_pgfault_handler+0xf>
  801258:	eb ce                	jmp    801228 <set_pgfault_handler+0x17>

0080125a <_pgfault_upcall>:
  80125a:	54                   	push   %esp
  80125b:	a1 0c 20 80 00       	mov    0x80200c,%eax
  801260:	ff d0                	call   *%eax
  801262:	83 c4 04             	add    $0x4,%esp
  801265:	8b 44 24 28          	mov    0x28(%esp),%eax
  801269:	8b 5c 24 30          	mov    0x30(%esp),%ebx
  80126d:	83 eb 04             	sub    $0x4,%ebx
  801270:	89 03                	mov    %eax,(%ebx)
  801272:	89 5c 24 30          	mov    %ebx,0x30(%esp)
  801276:	58                   	pop    %eax
  801277:	58                   	pop    %eax
  801278:	61                   	popa
  801279:	83 c4 04             	add    $0x4,%esp
  80127c:	9d                   	popf
  80127d:	5c                   	pop    %esp
  80127e:	c3                   	ret
  80127f:	90                   	nop

00801280 <__udivdi3>:
  801280:	f3 0f 1e fb          	endbr32
  801284:	55                   	push   %ebp
  801285:	57                   	push   %edi
  801286:	56                   	push   %esi
  801287:	53                   	push   %ebx
  801288:	83 ec 1c             	sub    $0x1c,%esp
  80128b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  80128f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  801293:	8b 74 24 34          	mov    0x34(%esp),%esi
  801297:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  80129b:	85 c0                	test   %eax,%eax
  80129d:	75 19                	jne    8012b8 <__udivdi3+0x38>
  80129f:	39 de                	cmp    %ebx,%esi
  8012a1:	73 4d                	jae    8012f0 <__udivdi3+0x70>
  8012a3:	31 ff                	xor    %edi,%edi
  8012a5:	89 e8                	mov    %ebp,%eax
  8012a7:	89 f2                	mov    %esi,%edx
  8012a9:	f7 f3                	div    %ebx
  8012ab:	89 fa                	mov    %edi,%edx
  8012ad:	83 c4 1c             	add    $0x1c,%esp
  8012b0:	5b                   	pop    %ebx
  8012b1:	5e                   	pop    %esi
  8012b2:	5f                   	pop    %edi
  8012b3:	5d                   	pop    %ebp
  8012b4:	c3                   	ret
  8012b5:	8d 76 00             	lea    0x0(%esi),%esi
  8012b8:	39 c6                	cmp    %eax,%esi
  8012ba:	73 14                	jae    8012d0 <__udivdi3+0x50>
  8012bc:	31 ff                	xor    %edi,%edi
  8012be:	31 c0                	xor    %eax,%eax
  8012c0:	89 fa                	mov    %edi,%edx
  8012c2:	83 c4 1c             	add    $0x1c,%esp
  8012c5:	5b                   	pop    %ebx
  8012c6:	5e                   	pop    %esi
  8012c7:	5f                   	pop    %edi
  8012c8:	5d                   	pop    %ebp
  8012c9:	c3                   	ret
  8012ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  8012d0:	0f bd f8             	bsr    %eax,%edi
  8012d3:	83 f7 1f             	xor    $0x1f,%edi
  8012d6:	75 48                	jne    801320 <__udivdi3+0xa0>
  8012d8:	39 f0                	cmp    %esi,%eax
  8012da:	72 06                	jb     8012e2 <__udivdi3+0x62>
  8012dc:	31 c0                	xor    %eax,%eax
  8012de:	39 dd                	cmp    %ebx,%ebp
  8012e0:	72 de                	jb     8012c0 <__udivdi3+0x40>
  8012e2:	b8 01 00 00 00       	mov    $0x1,%eax
  8012e7:	eb d7                	jmp    8012c0 <__udivdi3+0x40>
  8012e9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8012f0:	89 d9                	mov    %ebx,%ecx
  8012f2:	85 db                	test   %ebx,%ebx
  8012f4:	75 0b                	jne    801301 <__udivdi3+0x81>
  8012f6:	b8 01 00 00 00       	mov    $0x1,%eax
  8012fb:	31 d2                	xor    %edx,%edx
  8012fd:	f7 f3                	div    %ebx
  8012ff:	89 c1                	mov    %eax,%ecx
  801301:	31 d2                	xor    %edx,%edx
  801303:	89 f0                	mov    %esi,%eax
  801305:	f7 f1                	div    %ecx
  801307:	89 c6                	mov    %eax,%esi
  801309:	89 e8                	mov    %ebp,%eax
  80130b:	89 f7                	mov    %esi,%edi
  80130d:	f7 f1                	div    %ecx
  80130f:	89 fa                	mov    %edi,%edx
  801311:	83 c4 1c             	add    $0x1c,%esp
  801314:	5b                   	pop    %ebx
  801315:	5e                   	pop    %esi
  801316:	5f                   	pop    %edi
  801317:	5d                   	pop    %ebp
  801318:	c3                   	ret
  801319:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  801320:	89 f9                	mov    %edi,%ecx
  801322:	ba 20 00 00 00       	mov    $0x20,%edx
  801327:	29 fa                	sub    %edi,%edx
  801329:	d3 e0                	shl    %cl,%eax
  80132b:	89 44 24 08          	mov    %eax,0x8(%esp)
  80132f:	89 d1                	mov    %edx,%ecx
  801331:	89 d8                	mov    %ebx,%eax
  801333:	d3 e8                	shr    %cl,%eax
  801335:	89 c1                	mov    %eax,%ecx
  801337:	8b 44 24 08          	mov    0x8(%esp),%eax
  80133b:	09 c1                	or     %eax,%ecx
  80133d:	89 f0                	mov    %esi,%eax
  80133f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  801343:	89 f9                	mov    %edi,%ecx
  801345:	d3 e3                	shl    %cl,%ebx
  801347:	89 d1                	mov    %edx,%ecx
  801349:	d3 e8                	shr    %cl,%eax
  80134b:	89 f9                	mov    %edi,%ecx
  80134d:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  801351:	89 eb                	mov    %ebp,%ebx
  801353:	d3 e6                	shl    %cl,%esi
  801355:	89 d1                	mov    %edx,%ecx
  801357:	d3 eb                	shr    %cl,%ebx
  801359:	09 f3                	or     %esi,%ebx
  80135b:	89 c6                	mov    %eax,%esi
  80135d:	89 f2                	mov    %esi,%edx
  80135f:	89 d8                	mov    %ebx,%eax
  801361:	f7 74 24 08          	divl   0x8(%esp)
  801365:	89 d6                	mov    %edx,%esi
  801367:	89 c3                	mov    %eax,%ebx
  801369:	f7 64 24 0c          	mull   0xc(%esp)
  80136d:	39 d6                	cmp    %edx,%esi
  80136f:	72 1f                	jb     801390 <__udivdi3+0x110>
  801371:	89 f9                	mov    %edi,%ecx
  801373:	d3 e5                	shl    %cl,%ebp
  801375:	39 c5                	cmp    %eax,%ebp
  801377:	73 04                	jae    80137d <__udivdi3+0xfd>
  801379:	39 d6                	cmp    %edx,%esi
  80137b:	74 13                	je     801390 <__udivdi3+0x110>
  80137d:	89 d8                	mov    %ebx,%eax
  80137f:	31 ff                	xor    %edi,%edi
  801381:	e9 3a ff ff ff       	jmp    8012c0 <__udivdi3+0x40>
  801386:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  80138d:	00 
  80138e:	66 90                	xchg   %ax,%ax
  801390:	8d 43 ff             	lea    -0x1(%ebx),%eax
  801393:	31 ff                	xor    %edi,%edi
  801395:	e9 26 ff ff ff       	jmp    8012c0 <__udivdi3+0x40>
  80139a:	66 90                	xchg   %ax,%ax
  80139c:	66 90                	xchg   %ax,%ax
  80139e:	66 90                	xchg   %ax,%ax

008013a0 <__umoddi3>:
  8013a0:	f3 0f 1e fb          	endbr32
  8013a4:	55                   	push   %ebp
  8013a5:	57                   	push   %edi
  8013a6:	56                   	push   %esi
  8013a7:	53                   	push   %ebx
  8013a8:	83 ec 1c             	sub    $0x1c,%esp
  8013ab:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  8013af:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  8013b3:	8b 74 24 30          	mov    0x30(%esp),%esi
  8013b7:	8b 7c 24 38          	mov    0x38(%esp),%edi
  8013bb:	89 da                	mov    %ebx,%edx
  8013bd:	85 c0                	test   %eax,%eax
  8013bf:	75 17                	jne    8013d8 <__umoddi3+0x38>
  8013c1:	39 fb                	cmp    %edi,%ebx
  8013c3:	73 53                	jae    801418 <__umoddi3+0x78>
  8013c5:	89 f0                	mov    %esi,%eax
  8013c7:	f7 f7                	div    %edi
  8013c9:	89 d0                	mov    %edx,%eax
  8013cb:	31 d2                	xor    %edx,%edx
  8013cd:	83 c4 1c             	add    $0x1c,%esp
  8013d0:	5b                   	pop    %ebx
  8013d1:	5e                   	pop    %esi
  8013d2:	5f                   	pop    %edi
  8013d3:	5d                   	pop    %ebp
  8013d4:	c3                   	ret
  8013d5:	8d 76 00             	lea    0x0(%esi),%esi
  8013d8:	89 f1                	mov    %esi,%ecx
  8013da:	39 c3                	cmp    %eax,%ebx
  8013dc:	73 12                	jae    8013f0 <__umoddi3+0x50>
  8013de:	89 f0                	mov    %esi,%eax
  8013e0:	83 c4 1c             	add    $0x1c,%esp
  8013e3:	5b                   	pop    %ebx
  8013e4:	5e                   	pop    %esi
  8013e5:	5f                   	pop    %edi
  8013e6:	5d                   	pop    %ebp
  8013e7:	c3                   	ret
  8013e8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  8013ef:	00 
  8013f0:	0f bd e8             	bsr    %eax,%ebp
  8013f3:	83 f5 1f             	xor    $0x1f,%ebp
  8013f6:	75 48                	jne    801440 <__umoddi3+0xa0>
  8013f8:	39 d8                	cmp    %ebx,%eax
  8013fa:	0f 82 d0 00 00 00    	jb     8014d0 <__umoddi3+0x130>
  801400:	39 fe                	cmp    %edi,%esi
  801402:	0f 83 c8 00 00 00    	jae    8014d0 <__umoddi3+0x130>
  801408:	89 c8                	mov    %ecx,%eax
  80140a:	83 c4 1c             	add    $0x1c,%esp
  80140d:	5b                   	pop    %ebx
  80140e:	5e                   	pop    %esi
  80140f:	5f                   	pop    %edi
  801410:	5d                   	pop    %ebp
  801411:	c3                   	ret
  801412:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  801418:	89 f9                	mov    %edi,%ecx
  80141a:	85 ff                	test   %edi,%edi
  80141c:	75 0b                	jne    801429 <__umoddi3+0x89>
  80141e:	b8 01 00 00 00       	mov    $0x1,%eax
  801423:	31 d2                	xor    %edx,%edx
  801425:	f7 f7                	div    %edi
  801427:	89 c1                	mov    %eax,%ecx
  801429:	89 d8                	mov    %ebx,%eax
  80142b:	31 d2                	xor    %edx,%edx
  80142d:	f7 f1                	div    %ecx
  80142f:	89 f0                	mov    %esi,%eax
  801431:	f7 f1                	div    %ecx
  801433:	89 d0                	mov    %edx,%eax
  801435:	31 d2                	xor    %edx,%edx
  801437:	eb 94                	jmp    8013cd <__umoddi3+0x2d>
  801439:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  801440:	89 e9                	mov    %ebp,%ecx
  801442:	ba 20 00 00 00       	mov    $0x20,%edx
  801447:	29 ea                	sub    %ebp,%edx
  801449:	d3 e0                	shl    %cl,%eax
  80144b:	89 44 24 08          	mov    %eax,0x8(%esp)
  80144f:	89 d1                	mov    %edx,%ecx
  801451:	89 f8                	mov    %edi,%eax
  801453:	d3 e8                	shr    %cl,%eax
  801455:	89 54 24 04          	mov    %edx,0x4(%esp)
  801459:	8b 54 24 04          	mov    0x4(%esp),%edx
  80145d:	89 c1                	mov    %eax,%ecx
  80145f:	8b 44 24 08          	mov    0x8(%esp),%eax
  801463:	09 c1                	or     %eax,%ecx
  801465:	89 d8                	mov    %ebx,%eax
  801467:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  80146b:	89 e9                	mov    %ebp,%ecx
  80146d:	d3 e7                	shl    %cl,%edi
  80146f:	89 d1                	mov    %edx,%ecx
  801471:	d3 e8                	shr    %cl,%eax
  801473:	89 e9                	mov    %ebp,%ecx
  801475:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  801479:	d3 e3                	shl    %cl,%ebx
  80147b:	89 c7                	mov    %eax,%edi
  80147d:	89 d1                	mov    %edx,%ecx
  80147f:	89 f0                	mov    %esi,%eax
  801481:	d3 e8                	shr    %cl,%eax
  801483:	89 fa                	mov    %edi,%edx
  801485:	89 e9                	mov    %ebp,%ecx
  801487:	09 d8                	or     %ebx,%eax
  801489:	d3 e6                	shl    %cl,%esi
  80148b:	f7 74 24 08          	divl   0x8(%esp)
  80148f:	89 d3                	mov    %edx,%ebx
  801491:	f7 64 24 0c          	mull   0xc(%esp)
  801495:	89 c7                	mov    %eax,%edi
  801497:	89 d1                	mov    %edx,%ecx
  801499:	39 d3                	cmp    %edx,%ebx
  80149b:	72 06                	jb     8014a3 <__umoddi3+0x103>
  80149d:	75 10                	jne    8014af <__umoddi3+0x10f>
  80149f:	39 c6                	cmp    %eax,%esi
  8014a1:	73 0c                	jae    8014af <__umoddi3+0x10f>
  8014a3:	2b 44 24 0c          	sub    0xc(%esp),%eax
  8014a7:	1b 54 24 08          	sbb    0x8(%esp),%edx
  8014ab:	89 d1                	mov    %edx,%ecx
  8014ad:	89 c7                	mov    %eax,%edi
  8014af:	89 f2                	mov    %esi,%edx
  8014b1:	29 fa                	sub    %edi,%edx
  8014b3:	19 cb                	sbb    %ecx,%ebx
  8014b5:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  8014ba:	89 d8                	mov    %ebx,%eax
  8014bc:	d3 e0                	shl    %cl,%eax
  8014be:	89 e9                	mov    %ebp,%ecx
  8014c0:	d3 ea                	shr    %cl,%edx
  8014c2:	d3 eb                	shr    %cl,%ebx
  8014c4:	09 d0                	or     %edx,%eax
  8014c6:	89 da                	mov    %ebx,%edx
  8014c8:	83 c4 1c             	add    $0x1c,%esp
  8014cb:	5b                   	pop    %ebx
  8014cc:	5e                   	pop    %esi
  8014cd:	5f                   	pop    %edi
  8014ce:	5d                   	pop    %ebp
  8014cf:	c3                   	ret
  8014d0:	89 da                	mov    %ebx,%edx
  8014d2:	89 f1                	mov    %esi,%ecx
  8014d4:	29 f9                	sub    %edi,%ecx
  8014d6:	19 c2                	sbb    %eax,%edx
  8014d8:	89 c8                	mov    %ecx,%eax
  8014da:	e9 2b ff ff ff       	jmp    80140a <__umoddi3+0x6a>
