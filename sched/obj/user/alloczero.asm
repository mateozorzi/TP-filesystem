
obj/user/alloczero:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 03 01 00 00       	call   800134 <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <write>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	56                   	push   %esi
  800037:	53                   	push   %ebx
  800038:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80003b:	8b 75 0c             	mov    0xc(%ebp),%esi
  80003e:	83 ec 04             	sub    $0x4,%esp
  800041:	6a 07                	push   $0x7
  800043:	53                   	push   %ebx
  800044:	6a 00                	push   $0x0
  800046:	e8 9c 0b 00 00       	call   800be7 <sys_page_alloc>
  80004b:	83 c4 10             	add    $0x10,%esp
  80004e:	85 c0                	test   %eax,%eax
  800050:	78 1c                	js     80006e <write+0x3b>
  800052:	66 89 33             	mov    %si,(%ebx)
  800055:	83 ec 08             	sub    $0x8,%esp
  800058:	53                   	push   %ebx
  800059:	6a 00                	push   $0x0
  80005b:	e8 d1 0b 00 00       	call   800c31 <sys_page_unmap>
  800060:	83 c4 10             	add    $0x10,%esp
  800063:	85 c0                	test   %eax,%eax
  800065:	78 19                	js     800080 <write+0x4d>
  800067:	8d 65 f8             	lea    -0x8(%ebp),%esp
  80006a:	5b                   	pop    %ebx
  80006b:	5e                   	pop    %esi
  80006c:	5d                   	pop    %ebp
  80006d:	c3                   	ret
  80006e:	50                   	push   %eax
  80006f:	68 60 0f 80 00       	push   $0x800f60
  800074:	6a 0b                	push   $0xb
  800076:	68 73 0f 80 00       	push   $0x800f73
  80007b:	e8 13 01 00 00       	call   800193 <_panic>
  800080:	50                   	push   %eax
  800081:	68 84 0f 80 00       	push   $0x800f84
  800086:	6a 0e                	push   $0xe
  800088:	68 73 0f 80 00       	push   $0x800f73
  80008d:	e8 01 01 00 00       	call   800193 <_panic>

00800092 <check>:
  800092:	55                   	push   %ebp
  800093:	89 e5                	mov    %esp,%ebp
  800095:	53                   	push   %ebx
  800096:	83 ec 08             	sub    $0x8,%esp
  800099:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80009c:	6a 05                	push   $0x5
  80009e:	53                   	push   %ebx
  80009f:	6a 00                	push   $0x0
  8000a1:	e8 41 0b 00 00       	call   800be7 <sys_page_alloc>
  8000a6:	83 c4 10             	add    $0x10,%esp
  8000a9:	85 c0                	test   %eax,%eax
  8000ab:	78 1d                	js     8000ca <check+0x38>
  8000ad:	66 83 3b 00          	cmpw   $0x0,(%ebx)
  8000b1:	75 29                	jne    8000dc <check+0x4a>
  8000b3:	83 ec 08             	sub    $0x8,%esp
  8000b6:	53                   	push   %ebx
  8000b7:	6a 00                	push   $0x0
  8000b9:	e8 73 0b 00 00       	call   800c31 <sys_page_unmap>
  8000be:	83 c4 10             	add    $0x10,%esp
  8000c1:	85 c0                	test   %eax,%eax
  8000c3:	78 2b                	js     8000f0 <check+0x5e>
  8000c5:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8000c8:	c9                   	leave
  8000c9:	c3                   	ret
  8000ca:	50                   	push   %eax
  8000cb:	68 60 0f 80 00       	push   $0x800f60
  8000d0:	6a 17                	push   $0x17
  8000d2:	68 73 0f 80 00       	push   $0x800f73
  8000d7:	e8 b7 00 00 00       	call   800193 <_panic>
  8000dc:	83 ec 04             	sub    $0x4,%esp
  8000df:	68 88 10 80 00       	push   $0x801088
  8000e4:	6a 19                	push   $0x19
  8000e6:	68 73 0f 80 00       	push   $0x800f73
  8000eb:	e8 a3 00 00 00       	call   800193 <_panic>
  8000f0:	50                   	push   %eax
  8000f1:	68 84 0f 80 00       	push   $0x800f84
  8000f6:	6a 1b                	push   $0x1b
  8000f8:	68 73 0f 80 00       	push   $0x800f73
  8000fd:	e8 91 00 00 00       	call   800193 <_panic>

00800102 <umain>:
  800102:	55                   	push   %ebp
  800103:	89 e5                	mov    %esp,%ebp
  800105:	83 ec 10             	sub    $0x10,%esp
  800108:	68 08 75 00 00       	push   $0x7508
  80010d:	68 00 00 40 00       	push   $0x400000
  800112:	e8 1c ff ff ff       	call   800033 <write>
  800117:	c7 04 24 00 00 40 00 	movl   $0x400000,(%esp)
  80011e:	e8 6f ff ff ff       	call   800092 <check>
  800123:	c7 04 24 b8 10 80 00 	movl   $0x8010b8,(%esp)
  80012a:	e8 3f 01 00 00       	call   80026e <cprintf>
  80012f:	83 c4 10             	add    $0x10,%esp
  800132:	c9                   	leave
  800133:	c3                   	ret

00800134 <libmain>:
  800134:	55                   	push   %ebp
  800135:	89 e5                	mov    %esp,%ebp
  800137:	56                   	push   %esi
  800138:	53                   	push   %ebx
  800139:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80013c:	8b 75 0c             	mov    0xc(%ebp),%esi
  80013f:	e8 58 0a 00 00       	call   800b9c <sys_getenvid>
  800144:	85 c0                	test   %eax,%eax
  800146:	78 15                	js     80015d <libmain+0x29>
  800148:	25 ff 03 00 00       	and    $0x3ff,%eax
  80014d:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800153:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800158:	a3 04 20 80 00       	mov    %eax,0x802004
  80015d:	85 db                	test   %ebx,%ebx
  80015f:	7e 07                	jle    800168 <libmain+0x34>
  800161:	8b 06                	mov    (%esi),%eax
  800163:	a3 00 20 80 00       	mov    %eax,0x802000
  800168:	83 ec 08             	sub    $0x8,%esp
  80016b:	56                   	push   %esi
  80016c:	53                   	push   %ebx
  80016d:	e8 90 ff ff ff       	call   800102 <umain>
  800172:	e8 0a 00 00 00       	call   800181 <exit>
  800177:	83 c4 10             	add    $0x10,%esp
  80017a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  80017d:	5b                   	pop    %ebx
  80017e:	5e                   	pop    %esi
  80017f:	5d                   	pop    %ebp
  800180:	c3                   	ret

00800181 <exit>:
  800181:	55                   	push   %ebp
  800182:	89 e5                	mov    %esp,%ebp
  800184:	83 ec 14             	sub    $0x14,%esp
  800187:	6a 00                	push   $0x0
  800189:	e8 ec 09 00 00       	call   800b7a <sys_env_destroy>
  80018e:	83 c4 10             	add    $0x10,%esp
  800191:	c9                   	leave
  800192:	c3                   	ret

00800193 <_panic>:
  800193:	55                   	push   %ebp
  800194:	89 e5                	mov    %esp,%ebp
  800196:	56                   	push   %esi
  800197:	53                   	push   %ebx
  800198:	8d 5d 14             	lea    0x14(%ebp),%ebx
  80019b:	8b 35 00 20 80 00    	mov    0x802000,%esi
  8001a1:	e8 f6 09 00 00       	call   800b9c <sys_getenvid>
  8001a6:	83 ec 0c             	sub    $0xc,%esp
  8001a9:	ff 75 0c             	push   0xc(%ebp)
  8001ac:	ff 75 08             	push   0x8(%ebp)
  8001af:	56                   	push   %esi
  8001b0:	50                   	push   %eax
  8001b1:	68 e8 10 80 00       	push   $0x8010e8
  8001b6:	e8 b3 00 00 00       	call   80026e <cprintf>
  8001bb:	83 c4 18             	add    $0x18,%esp
  8001be:	53                   	push   %ebx
  8001bf:	ff 75 10             	push   0x10(%ebp)
  8001c2:	e8 56 00 00 00       	call   80021d <vcprintf>
  8001c7:	c7 04 24 a1 0f 80 00 	movl   $0x800fa1,(%esp)
  8001ce:	e8 9b 00 00 00       	call   80026e <cprintf>
  8001d3:	83 c4 10             	add    $0x10,%esp
  8001d6:	cc                   	int3
  8001d7:	eb fd                	jmp    8001d6 <_panic+0x43>

008001d9 <putch>:
  8001d9:	55                   	push   %ebp
  8001da:	89 e5                	mov    %esp,%ebp
  8001dc:	53                   	push   %ebx
  8001dd:	83 ec 04             	sub    $0x4,%esp
  8001e0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8001e3:	8b 13                	mov    (%ebx),%edx
  8001e5:	8d 42 01             	lea    0x1(%edx),%eax
  8001e8:	89 03                	mov    %eax,(%ebx)
  8001ea:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001ed:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  8001f1:	3d ff 00 00 00       	cmp    $0xff,%eax
  8001f6:	74 09                	je     800201 <putch+0x28>
  8001f8:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  8001fc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8001ff:	c9                   	leave
  800200:	c3                   	ret
  800201:	83 ec 08             	sub    $0x8,%esp
  800204:	68 ff 00 00 00       	push   $0xff
  800209:	8d 43 08             	lea    0x8(%ebx),%eax
  80020c:	50                   	push   %eax
  80020d:	e8 1e 09 00 00       	call   800b30 <sys_cputs>
  800212:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  800218:	83 c4 10             	add    $0x10,%esp
  80021b:	eb db                	jmp    8001f8 <putch+0x1f>

0080021d <vcprintf>:
  80021d:	55                   	push   %ebp
  80021e:	89 e5                	mov    %esp,%ebp
  800220:	81 ec 18 01 00 00    	sub    $0x118,%esp
  800226:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  80022d:	00 00 00 
  800230:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  800237:	00 00 00 
  80023a:	ff 75 0c             	push   0xc(%ebp)
  80023d:	ff 75 08             	push   0x8(%ebp)
  800240:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  800246:	50                   	push   %eax
  800247:	68 d9 01 80 00       	push   $0x8001d9
  80024c:	e8 74 01 00 00       	call   8003c5 <vprintfmt>
  800251:	83 c4 08             	add    $0x8,%esp
  800254:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  80025a:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  800260:	50                   	push   %eax
  800261:	e8 ca 08 00 00       	call   800b30 <sys_cputs>
  800266:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  80026c:	c9                   	leave
  80026d:	c3                   	ret

0080026e <cprintf>:
  80026e:	55                   	push   %ebp
  80026f:	89 e5                	mov    %esp,%ebp
  800271:	83 ec 10             	sub    $0x10,%esp
  800274:	8d 45 0c             	lea    0xc(%ebp),%eax
  800277:	50                   	push   %eax
  800278:	ff 75 08             	push   0x8(%ebp)
  80027b:	e8 9d ff ff ff       	call   80021d <vcprintf>
  800280:	c9                   	leave
  800281:	c3                   	ret

00800282 <printnum>:
  800282:	55                   	push   %ebp
  800283:	89 e5                	mov    %esp,%ebp
  800285:	57                   	push   %edi
  800286:	56                   	push   %esi
  800287:	53                   	push   %ebx
  800288:	83 ec 1c             	sub    $0x1c,%esp
  80028b:	89 c7                	mov    %eax,%edi
  80028d:	89 d6                	mov    %edx,%esi
  80028f:	8b 45 08             	mov    0x8(%ebp),%eax
  800292:	8b 55 0c             	mov    0xc(%ebp),%edx
  800295:	89 d1                	mov    %edx,%ecx
  800297:	89 c2                	mov    %eax,%edx
  800299:	89 45 d8             	mov    %eax,-0x28(%ebp)
  80029c:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  80029f:	8b 45 10             	mov    0x10(%ebp),%eax
  8002a2:	8b 5d 14             	mov    0x14(%ebp),%ebx
  8002a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8002a8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  8002af:	39 c2                	cmp    %eax,%edx
  8002b1:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  8002b4:	72 3e                	jb     8002f4 <printnum+0x72>
  8002b6:	83 ec 0c             	sub    $0xc,%esp
  8002b9:	ff 75 18             	push   0x18(%ebp)
  8002bc:	83 eb 01             	sub    $0x1,%ebx
  8002bf:	53                   	push   %ebx
  8002c0:	50                   	push   %eax
  8002c1:	83 ec 08             	sub    $0x8,%esp
  8002c4:	ff 75 e4             	push   -0x1c(%ebp)
  8002c7:	ff 75 e0             	push   -0x20(%ebp)
  8002ca:	ff 75 dc             	push   -0x24(%ebp)
  8002cd:	ff 75 d8             	push   -0x28(%ebp)
  8002d0:	e8 1b 0a 00 00       	call   800cf0 <__udivdi3>
  8002d5:	83 c4 18             	add    $0x18,%esp
  8002d8:	52                   	push   %edx
  8002d9:	50                   	push   %eax
  8002da:	89 f2                	mov    %esi,%edx
  8002dc:	89 f8                	mov    %edi,%eax
  8002de:	e8 9f ff ff ff       	call   800282 <printnum>
  8002e3:	83 c4 20             	add    $0x20,%esp
  8002e6:	eb 13                	jmp    8002fb <printnum+0x79>
  8002e8:	83 ec 08             	sub    $0x8,%esp
  8002eb:	56                   	push   %esi
  8002ec:	ff 75 18             	push   0x18(%ebp)
  8002ef:	ff d7                	call   *%edi
  8002f1:	83 c4 10             	add    $0x10,%esp
  8002f4:	83 eb 01             	sub    $0x1,%ebx
  8002f7:	85 db                	test   %ebx,%ebx
  8002f9:	7f ed                	jg     8002e8 <printnum+0x66>
  8002fb:	83 ec 08             	sub    $0x8,%esp
  8002fe:	56                   	push   %esi
  8002ff:	83 ec 04             	sub    $0x4,%esp
  800302:	ff 75 e4             	push   -0x1c(%ebp)
  800305:	ff 75 e0             	push   -0x20(%ebp)
  800308:	ff 75 dc             	push   -0x24(%ebp)
  80030b:	ff 75 d8             	push   -0x28(%ebp)
  80030e:	e8 fd 0a 00 00       	call   800e10 <__umoddi3>
  800313:	83 c4 14             	add    $0x14,%esp
  800316:	0f be 80 a3 0f 80 00 	movsbl 0x800fa3(%eax),%eax
  80031d:	50                   	push   %eax
  80031e:	ff d7                	call   *%edi
  800320:	83 c4 10             	add    $0x10,%esp
  800323:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800326:	5b                   	pop    %ebx
  800327:	5e                   	pop    %esi
  800328:	5f                   	pop    %edi
  800329:	5d                   	pop    %ebp
  80032a:	c3                   	ret

0080032b <getuint>:
  80032b:	83 fa 01             	cmp    $0x1,%edx
  80032e:	7f 13                	jg     800343 <getuint+0x18>
  800330:	85 d2                	test   %edx,%edx
  800332:	74 1c                	je     800350 <getuint+0x25>
  800334:	8b 10                	mov    (%eax),%edx
  800336:	8d 4a 04             	lea    0x4(%edx),%ecx
  800339:	89 08                	mov    %ecx,(%eax)
  80033b:	8b 02                	mov    (%edx),%eax
  80033d:	ba 00 00 00 00       	mov    $0x0,%edx
  800342:	c3                   	ret
  800343:	8b 10                	mov    (%eax),%edx
  800345:	8d 4a 08             	lea    0x8(%edx),%ecx
  800348:	89 08                	mov    %ecx,(%eax)
  80034a:	8b 02                	mov    (%edx),%eax
  80034c:	8b 52 04             	mov    0x4(%edx),%edx
  80034f:	c3                   	ret
  800350:	8b 10                	mov    (%eax),%edx
  800352:	8d 4a 04             	lea    0x4(%edx),%ecx
  800355:	89 08                	mov    %ecx,(%eax)
  800357:	8b 02                	mov    (%edx),%eax
  800359:	ba 00 00 00 00       	mov    $0x0,%edx
  80035e:	c3                   	ret

0080035f <getint>:
  80035f:	83 fa 01             	cmp    $0x1,%edx
  800362:	7f 0f                	jg     800373 <getint+0x14>
  800364:	85 d2                	test   %edx,%edx
  800366:	74 18                	je     800380 <getint+0x21>
  800368:	8b 10                	mov    (%eax),%edx
  80036a:	8d 4a 04             	lea    0x4(%edx),%ecx
  80036d:	89 08                	mov    %ecx,(%eax)
  80036f:	8b 02                	mov    (%edx),%eax
  800371:	99                   	cltd
  800372:	c3                   	ret
  800373:	8b 10                	mov    (%eax),%edx
  800375:	8d 4a 08             	lea    0x8(%edx),%ecx
  800378:	89 08                	mov    %ecx,(%eax)
  80037a:	8b 02                	mov    (%edx),%eax
  80037c:	8b 52 04             	mov    0x4(%edx),%edx
  80037f:	c3                   	ret
  800380:	8b 10                	mov    (%eax),%edx
  800382:	8d 4a 04             	lea    0x4(%edx),%ecx
  800385:	89 08                	mov    %ecx,(%eax)
  800387:	8b 02                	mov    (%edx),%eax
  800389:	99                   	cltd
  80038a:	c3                   	ret

0080038b <sprintputch>:
  80038b:	55                   	push   %ebp
  80038c:	89 e5                	mov    %esp,%ebp
  80038e:	8b 45 0c             	mov    0xc(%ebp),%eax
  800391:	83 40 08 01          	addl   $0x1,0x8(%eax)
  800395:	8b 10                	mov    (%eax),%edx
  800397:	3b 50 04             	cmp    0x4(%eax),%edx
  80039a:	73 0a                	jae    8003a6 <sprintputch+0x1b>
  80039c:	8d 4a 01             	lea    0x1(%edx),%ecx
  80039f:	89 08                	mov    %ecx,(%eax)
  8003a1:	8b 45 08             	mov    0x8(%ebp),%eax
  8003a4:	88 02                	mov    %al,(%edx)
  8003a6:	5d                   	pop    %ebp
  8003a7:	c3                   	ret

008003a8 <printfmt>:
  8003a8:	55                   	push   %ebp
  8003a9:	89 e5                	mov    %esp,%ebp
  8003ab:	83 ec 08             	sub    $0x8,%esp
  8003ae:	8d 45 14             	lea    0x14(%ebp),%eax
  8003b1:	50                   	push   %eax
  8003b2:	ff 75 10             	push   0x10(%ebp)
  8003b5:	ff 75 0c             	push   0xc(%ebp)
  8003b8:	ff 75 08             	push   0x8(%ebp)
  8003bb:	e8 05 00 00 00       	call   8003c5 <vprintfmt>
  8003c0:	83 c4 10             	add    $0x10,%esp
  8003c3:	c9                   	leave
  8003c4:	c3                   	ret

008003c5 <vprintfmt>:
  8003c5:	55                   	push   %ebp
  8003c6:	89 e5                	mov    %esp,%ebp
  8003c8:	57                   	push   %edi
  8003c9:	56                   	push   %esi
  8003ca:	53                   	push   %ebx
  8003cb:	83 ec 2c             	sub    $0x2c,%esp
  8003ce:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8003d1:	8b 75 0c             	mov    0xc(%ebp),%esi
  8003d4:	8b 7d 10             	mov    0x10(%ebp),%edi
  8003d7:	eb 0a                	jmp    8003e3 <vprintfmt+0x1e>
  8003d9:	83 ec 08             	sub    $0x8,%esp
  8003dc:	56                   	push   %esi
  8003dd:	50                   	push   %eax
  8003de:	ff d3                	call   *%ebx
  8003e0:	83 c4 10             	add    $0x10,%esp
  8003e3:	83 c7 01             	add    $0x1,%edi
  8003e6:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  8003ea:	83 f8 25             	cmp    $0x25,%eax
  8003ed:	74 0c                	je     8003fb <vprintfmt+0x36>
  8003ef:	85 c0                	test   %eax,%eax
  8003f1:	75 e6                	jne    8003d9 <vprintfmt+0x14>
  8003f3:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8003f6:	5b                   	pop    %ebx
  8003f7:	5e                   	pop    %esi
  8003f8:	5f                   	pop    %edi
  8003f9:	5d                   	pop    %ebp
  8003fa:	c3                   	ret
  8003fb:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  8003ff:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  800406:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  80040d:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  800414:	b9 00 00 00 00       	mov    $0x0,%ecx
  800419:	8d 47 01             	lea    0x1(%edi),%eax
  80041c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  80041f:	0f b6 17             	movzbl (%edi),%edx
  800422:	8d 42 dd             	lea    -0x23(%edx),%eax
  800425:	3c 55                	cmp    $0x55,%al
  800427:	0f 87 c3 02 00 00    	ja     8006f0 <vprintfmt+0x32b>
  80042d:	0f b6 c0             	movzbl %al,%eax
  800430:	ff 24 85 20 11 80 00 	jmp    *0x801120(,%eax,4)
  800437:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80043a:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  80043e:	eb d9                	jmp    800419 <vprintfmt+0x54>
  800440:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800443:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  800447:	eb d0                	jmp    800419 <vprintfmt+0x54>
  800449:	0f b6 d2             	movzbl %dl,%edx
  80044c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80044f:	b8 00 00 00 00       	mov    $0x0,%eax
  800454:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  800457:	8d 04 80             	lea    (%eax,%eax,4),%eax
  80045a:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  80045e:	0f be 17             	movsbl (%edi),%edx
  800461:	8d 4a d0             	lea    -0x30(%edx),%ecx
  800464:	83 f9 09             	cmp    $0x9,%ecx
  800467:	77 52                	ja     8004bb <vprintfmt+0xf6>
  800469:	83 c7 01             	add    $0x1,%edi
  80046c:	eb e9                	jmp    800457 <vprintfmt+0x92>
  80046e:	8b 45 14             	mov    0x14(%ebp),%eax
  800471:	8d 50 04             	lea    0x4(%eax),%edx
  800474:	89 55 14             	mov    %edx,0x14(%ebp)
  800477:	8b 00                	mov    (%eax),%eax
  800479:	89 45 d0             	mov    %eax,-0x30(%ebp)
  80047c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80047f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800483:	79 94                	jns    800419 <vprintfmt+0x54>
  800485:	8b 45 d0             	mov    -0x30(%ebp),%eax
  800488:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80048b:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800492:	eb 85                	jmp    800419 <vprintfmt+0x54>
  800494:	8b 55 e0             	mov    -0x20(%ebp),%edx
  800497:	85 d2                	test   %edx,%edx
  800499:	b8 00 00 00 00       	mov    $0x0,%eax
  80049e:	0f 49 c2             	cmovns %edx,%eax
  8004a1:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8004a4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8004a7:	e9 6d ff ff ff       	jmp    800419 <vprintfmt+0x54>
  8004ac:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8004af:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  8004b6:	e9 5e ff ff ff       	jmp    800419 <vprintfmt+0x54>
  8004bb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  8004be:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8004c1:	eb bc                	jmp    80047f <vprintfmt+0xba>
  8004c3:	83 c1 01             	add    $0x1,%ecx
  8004c6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8004c9:	e9 4b ff ff ff       	jmp    800419 <vprintfmt+0x54>
  8004ce:	8b 45 14             	mov    0x14(%ebp),%eax
  8004d1:	8d 50 04             	lea    0x4(%eax),%edx
  8004d4:	89 55 14             	mov    %edx,0x14(%ebp)
  8004d7:	83 ec 08             	sub    $0x8,%esp
  8004da:	56                   	push   %esi
  8004db:	ff 30                	push   (%eax)
  8004dd:	ff d3                	call   *%ebx
  8004df:	83 c4 10             	add    $0x10,%esp
  8004e2:	e9 a0 01 00 00       	jmp    800687 <vprintfmt+0x2c2>
  8004e7:	8b 45 14             	mov    0x14(%ebp),%eax
  8004ea:	8d 50 04             	lea    0x4(%eax),%edx
  8004ed:	89 55 14             	mov    %edx,0x14(%ebp)
  8004f0:	8b 10                	mov    (%eax),%edx
  8004f2:	89 d0                	mov    %edx,%eax
  8004f4:	f7 d8                	neg    %eax
  8004f6:	0f 48 c2             	cmovs  %edx,%eax
  8004f9:	83 f8 08             	cmp    $0x8,%eax
  8004fc:	7f 20                	jg     80051e <vprintfmt+0x159>
  8004fe:	8b 14 85 80 12 80 00 	mov    0x801280(,%eax,4),%edx
  800505:	85 d2                	test   %edx,%edx
  800507:	74 15                	je     80051e <vprintfmt+0x159>
  800509:	52                   	push   %edx
  80050a:	68 c4 0f 80 00       	push   $0x800fc4
  80050f:	56                   	push   %esi
  800510:	53                   	push   %ebx
  800511:	e8 92 fe ff ff       	call   8003a8 <printfmt>
  800516:	83 c4 10             	add    $0x10,%esp
  800519:	e9 69 01 00 00       	jmp    800687 <vprintfmt+0x2c2>
  80051e:	50                   	push   %eax
  80051f:	68 bb 0f 80 00       	push   $0x800fbb
  800524:	56                   	push   %esi
  800525:	53                   	push   %ebx
  800526:	e8 7d fe ff ff       	call   8003a8 <printfmt>
  80052b:	83 c4 10             	add    $0x10,%esp
  80052e:	e9 54 01 00 00       	jmp    800687 <vprintfmt+0x2c2>
  800533:	8b 45 14             	mov    0x14(%ebp),%eax
  800536:	8d 50 04             	lea    0x4(%eax),%edx
  800539:	89 55 14             	mov    %edx,0x14(%ebp)
  80053c:	8b 08                	mov    (%eax),%ecx
  80053e:	85 c9                	test   %ecx,%ecx
  800540:	b8 b4 0f 80 00       	mov    $0x800fb4,%eax
  800545:	0f 45 c1             	cmovne %ecx,%eax
  800548:	89 45 cc             	mov    %eax,-0x34(%ebp)
  80054b:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  80054f:	7e 06                	jle    800557 <vprintfmt+0x192>
  800551:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  800555:	75 0b                	jne    800562 <vprintfmt+0x19d>
  800557:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  80055a:	8b 7d d0             	mov    -0x30(%ebp),%edi
  80055d:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800560:	eb 5c                	jmp    8005be <vprintfmt+0x1f9>
  800562:	83 ec 08             	sub    $0x8,%esp
  800565:	ff 75 d0             	push   -0x30(%ebp)
  800568:	ff 75 cc             	push   -0x34(%ebp)
  80056b:	e8 20 02 00 00       	call   800790 <strnlen>
  800570:	89 c2                	mov    %eax,%edx
  800572:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800575:	29 d0                	sub    %edx,%eax
  800577:	83 c4 10             	add    $0x10,%esp
  80057a:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  80057e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800581:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800584:	89 c3                	mov    %eax,%ebx
  800586:	eb 0e                	jmp    800596 <vprintfmt+0x1d1>
  800588:	83 ec 08             	sub    $0x8,%esp
  80058b:	56                   	push   %esi
  80058c:	57                   	push   %edi
  80058d:	ff 55 08             	call   *0x8(%ebp)
  800590:	83 eb 01             	sub    $0x1,%ebx
  800593:	83 c4 10             	add    $0x10,%esp
  800596:	85 db                	test   %ebx,%ebx
  800598:	7f ee                	jg     800588 <vprintfmt+0x1c3>
  80059a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  80059d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8005a0:	85 c0                	test   %eax,%eax
  8005a2:	ba 00 00 00 00       	mov    $0x0,%edx
  8005a7:	0f 49 d0             	cmovns %eax,%edx
  8005aa:	29 d0                	sub    %edx,%eax
  8005ac:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8005af:	eb a6                	jmp    800557 <vprintfmt+0x192>
  8005b1:	83 ec 08             	sub    $0x8,%esp
  8005b4:	56                   	push   %esi
  8005b5:	52                   	push   %edx
  8005b6:	ff 55 08             	call   *0x8(%ebp)
  8005b9:	83 c4 10             	add    $0x10,%esp
  8005bc:	89 d9                	mov    %ebx,%ecx
  8005be:	8d 59 01             	lea    0x1(%ecx),%ebx
  8005c1:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  8005c5:	0f be d0             	movsbl %al,%edx
  8005c8:	85 d2                	test   %edx,%edx
  8005ca:	74 28                	je     8005f4 <vprintfmt+0x22f>
  8005cc:	85 ff                	test   %edi,%edi
  8005ce:	78 05                	js     8005d5 <vprintfmt+0x210>
  8005d0:	83 ef 01             	sub    $0x1,%edi
  8005d3:	78 2e                	js     800603 <vprintfmt+0x23e>
  8005d5:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  8005d9:	74 d6                	je     8005b1 <vprintfmt+0x1ec>
  8005db:	0f be c0             	movsbl %al,%eax
  8005de:	83 e8 20             	sub    $0x20,%eax
  8005e1:	83 f8 5e             	cmp    $0x5e,%eax
  8005e4:	76 cb                	jbe    8005b1 <vprintfmt+0x1ec>
  8005e6:	83 ec 08             	sub    $0x8,%esp
  8005e9:	56                   	push   %esi
  8005ea:	6a 3f                	push   $0x3f
  8005ec:	ff 55 08             	call   *0x8(%ebp)
  8005ef:	83 c4 10             	add    $0x10,%esp
  8005f2:	eb c8                	jmp    8005bc <vprintfmt+0x1f7>
  8005f4:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8005f7:	8b 7d cc             	mov    -0x34(%ebp),%edi
  8005fa:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8005fd:	01 c7                	add    %eax,%edi
  8005ff:	29 cf                	sub    %ecx,%edi
  800601:	eb 13                	jmp    800616 <vprintfmt+0x251>
  800603:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800606:	eb ef                	jmp    8005f7 <vprintfmt+0x232>
  800608:	83 ec 08             	sub    $0x8,%esp
  80060b:	56                   	push   %esi
  80060c:	6a 20                	push   $0x20
  80060e:	ff d3                	call   *%ebx
  800610:	83 ef 01             	sub    $0x1,%edi
  800613:	83 c4 10             	add    $0x10,%esp
  800616:	85 ff                	test   %edi,%edi
  800618:	7f ee                	jg     800608 <vprintfmt+0x243>
  80061a:	eb 6b                	jmp    800687 <vprintfmt+0x2c2>
  80061c:	89 ca                	mov    %ecx,%edx
  80061e:	8d 45 14             	lea    0x14(%ebp),%eax
  800621:	e8 39 fd ff ff       	call   80035f <getint>
  800626:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800629:	89 55 dc             	mov    %edx,-0x24(%ebp)
  80062c:	85 d2                	test   %edx,%edx
  80062e:	78 0b                	js     80063b <vprintfmt+0x276>
  800630:	89 d1                	mov    %edx,%ecx
  800632:	89 c2                	mov    %eax,%edx
  800634:	bf 0a 00 00 00       	mov    $0xa,%edi
  800639:	eb 32                	jmp    80066d <vprintfmt+0x2a8>
  80063b:	83 ec 08             	sub    $0x8,%esp
  80063e:	56                   	push   %esi
  80063f:	6a 2d                	push   $0x2d
  800641:	ff d3                	call   *%ebx
  800643:	8b 55 d8             	mov    -0x28(%ebp),%edx
  800646:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  800649:	f7 da                	neg    %edx
  80064b:	83 d1 00             	adc    $0x0,%ecx
  80064e:	f7 d9                	neg    %ecx
  800650:	83 c4 10             	add    $0x10,%esp
  800653:	bf 0a 00 00 00       	mov    $0xa,%edi
  800658:	eb 13                	jmp    80066d <vprintfmt+0x2a8>
  80065a:	89 ca                	mov    %ecx,%edx
  80065c:	8d 45 14             	lea    0x14(%ebp),%eax
  80065f:	e8 c7 fc ff ff       	call   80032b <getuint>
  800664:	89 d1                	mov    %edx,%ecx
  800666:	89 c2                	mov    %eax,%edx
  800668:	bf 0a 00 00 00       	mov    $0xa,%edi
  80066d:	83 ec 0c             	sub    $0xc,%esp
  800670:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  800674:	50                   	push   %eax
  800675:	ff 75 e0             	push   -0x20(%ebp)
  800678:	57                   	push   %edi
  800679:	51                   	push   %ecx
  80067a:	52                   	push   %edx
  80067b:	89 f2                	mov    %esi,%edx
  80067d:	89 d8                	mov    %ebx,%eax
  80067f:	e8 fe fb ff ff       	call   800282 <printnum>
  800684:	83 c4 20             	add    $0x20,%esp
  800687:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80068a:	e9 54 fd ff ff       	jmp    8003e3 <vprintfmt+0x1e>
  80068f:	89 ca                	mov    %ecx,%edx
  800691:	8d 45 14             	lea    0x14(%ebp),%eax
  800694:	e8 92 fc ff ff       	call   80032b <getuint>
  800699:	89 d1                	mov    %edx,%ecx
  80069b:	89 c2                	mov    %eax,%edx
  80069d:	bf 08 00 00 00       	mov    $0x8,%edi
  8006a2:	eb c9                	jmp    80066d <vprintfmt+0x2a8>
  8006a4:	83 ec 08             	sub    $0x8,%esp
  8006a7:	56                   	push   %esi
  8006a8:	6a 30                	push   $0x30
  8006aa:	ff d3                	call   *%ebx
  8006ac:	83 c4 08             	add    $0x8,%esp
  8006af:	56                   	push   %esi
  8006b0:	6a 78                	push   $0x78
  8006b2:	ff d3                	call   *%ebx
  8006b4:	8b 45 14             	mov    0x14(%ebp),%eax
  8006b7:	8d 50 04             	lea    0x4(%eax),%edx
  8006ba:	89 55 14             	mov    %edx,0x14(%ebp)
  8006bd:	8b 10                	mov    (%eax),%edx
  8006bf:	b9 00 00 00 00       	mov    $0x0,%ecx
  8006c4:	83 c4 10             	add    $0x10,%esp
  8006c7:	bf 10 00 00 00       	mov    $0x10,%edi
  8006cc:	eb 9f                	jmp    80066d <vprintfmt+0x2a8>
  8006ce:	89 ca                	mov    %ecx,%edx
  8006d0:	8d 45 14             	lea    0x14(%ebp),%eax
  8006d3:	e8 53 fc ff ff       	call   80032b <getuint>
  8006d8:	89 d1                	mov    %edx,%ecx
  8006da:	89 c2                	mov    %eax,%edx
  8006dc:	bf 10 00 00 00       	mov    $0x10,%edi
  8006e1:	eb 8a                	jmp    80066d <vprintfmt+0x2a8>
  8006e3:	83 ec 08             	sub    $0x8,%esp
  8006e6:	56                   	push   %esi
  8006e7:	6a 25                	push   $0x25
  8006e9:	ff d3                	call   *%ebx
  8006eb:	83 c4 10             	add    $0x10,%esp
  8006ee:	eb 97                	jmp    800687 <vprintfmt+0x2c2>
  8006f0:	83 ec 08             	sub    $0x8,%esp
  8006f3:	56                   	push   %esi
  8006f4:	6a 25                	push   $0x25
  8006f6:	ff d3                	call   *%ebx
  8006f8:	83 c4 10             	add    $0x10,%esp
  8006fb:	89 f8                	mov    %edi,%eax
  8006fd:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  800701:	74 05                	je     800708 <vprintfmt+0x343>
  800703:	83 e8 01             	sub    $0x1,%eax
  800706:	eb f5                	jmp    8006fd <vprintfmt+0x338>
  800708:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  80070b:	e9 77 ff ff ff       	jmp    800687 <vprintfmt+0x2c2>

00800710 <vsnprintf>:
  800710:	55                   	push   %ebp
  800711:	89 e5                	mov    %esp,%ebp
  800713:	83 ec 18             	sub    $0x18,%esp
  800716:	8b 45 08             	mov    0x8(%ebp),%eax
  800719:	8b 55 0c             	mov    0xc(%ebp),%edx
  80071c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  80071f:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  800723:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  800726:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  80072d:	85 c0                	test   %eax,%eax
  80072f:	74 26                	je     800757 <vsnprintf+0x47>
  800731:	85 d2                	test   %edx,%edx
  800733:	7e 22                	jle    800757 <vsnprintf+0x47>
  800735:	ff 75 14             	push   0x14(%ebp)
  800738:	ff 75 10             	push   0x10(%ebp)
  80073b:	8d 45 ec             	lea    -0x14(%ebp),%eax
  80073e:	50                   	push   %eax
  80073f:	68 8b 03 80 00       	push   $0x80038b
  800744:	e8 7c fc ff ff       	call   8003c5 <vprintfmt>
  800749:	8b 45 ec             	mov    -0x14(%ebp),%eax
  80074c:	c6 00 00             	movb   $0x0,(%eax)
  80074f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  800752:	83 c4 10             	add    $0x10,%esp
  800755:	c9                   	leave
  800756:	c3                   	ret
  800757:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80075c:	eb f7                	jmp    800755 <vsnprintf+0x45>

0080075e <snprintf>:
  80075e:	55                   	push   %ebp
  80075f:	89 e5                	mov    %esp,%ebp
  800761:	83 ec 08             	sub    $0x8,%esp
  800764:	8d 45 14             	lea    0x14(%ebp),%eax
  800767:	50                   	push   %eax
  800768:	ff 75 10             	push   0x10(%ebp)
  80076b:	ff 75 0c             	push   0xc(%ebp)
  80076e:	ff 75 08             	push   0x8(%ebp)
  800771:	e8 9a ff ff ff       	call   800710 <vsnprintf>
  800776:	c9                   	leave
  800777:	c3                   	ret

00800778 <strlen>:
  800778:	55                   	push   %ebp
  800779:	89 e5                	mov    %esp,%ebp
  80077b:	8b 55 08             	mov    0x8(%ebp),%edx
  80077e:	b8 00 00 00 00       	mov    $0x0,%eax
  800783:	eb 03                	jmp    800788 <strlen+0x10>
  800785:	83 c0 01             	add    $0x1,%eax
  800788:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  80078c:	75 f7                	jne    800785 <strlen+0xd>
  80078e:	5d                   	pop    %ebp
  80078f:	c3                   	ret

00800790 <strnlen>:
  800790:	55                   	push   %ebp
  800791:	89 e5                	mov    %esp,%ebp
  800793:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800796:	8b 55 0c             	mov    0xc(%ebp),%edx
  800799:	b8 00 00 00 00       	mov    $0x0,%eax
  80079e:	eb 03                	jmp    8007a3 <strnlen+0x13>
  8007a0:	83 c0 01             	add    $0x1,%eax
  8007a3:	39 d0                	cmp    %edx,%eax
  8007a5:	74 08                	je     8007af <strnlen+0x1f>
  8007a7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  8007ab:	75 f3                	jne    8007a0 <strnlen+0x10>
  8007ad:	89 c2                	mov    %eax,%edx
  8007af:	89 d0                	mov    %edx,%eax
  8007b1:	5d                   	pop    %ebp
  8007b2:	c3                   	ret

008007b3 <strcpy>:
  8007b3:	55                   	push   %ebp
  8007b4:	89 e5                	mov    %esp,%ebp
  8007b6:	53                   	push   %ebx
  8007b7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8007ba:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8007bd:	b8 00 00 00 00       	mov    $0x0,%eax
  8007c2:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  8007c6:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  8007c9:	83 c0 01             	add    $0x1,%eax
  8007cc:	84 d2                	test   %dl,%dl
  8007ce:	75 f2                	jne    8007c2 <strcpy+0xf>
  8007d0:	89 c8                	mov    %ecx,%eax
  8007d2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8007d5:	c9                   	leave
  8007d6:	c3                   	ret

008007d7 <strcat>:
  8007d7:	55                   	push   %ebp
  8007d8:	89 e5                	mov    %esp,%ebp
  8007da:	53                   	push   %ebx
  8007db:	83 ec 10             	sub    $0x10,%esp
  8007de:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8007e1:	53                   	push   %ebx
  8007e2:	e8 91 ff ff ff       	call   800778 <strlen>
  8007e7:	83 c4 08             	add    $0x8,%esp
  8007ea:	ff 75 0c             	push   0xc(%ebp)
  8007ed:	01 d8                	add    %ebx,%eax
  8007ef:	50                   	push   %eax
  8007f0:	e8 be ff ff ff       	call   8007b3 <strcpy>
  8007f5:	89 d8                	mov    %ebx,%eax
  8007f7:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8007fa:	c9                   	leave
  8007fb:	c3                   	ret

008007fc <strncpy>:
  8007fc:	55                   	push   %ebp
  8007fd:	89 e5                	mov    %esp,%ebp
  8007ff:	56                   	push   %esi
  800800:	53                   	push   %ebx
  800801:	8b 75 08             	mov    0x8(%ebp),%esi
  800804:	8b 55 0c             	mov    0xc(%ebp),%edx
  800807:	89 f3                	mov    %esi,%ebx
  800809:	03 5d 10             	add    0x10(%ebp),%ebx
  80080c:	89 f0                	mov    %esi,%eax
  80080e:	eb 0f                	jmp    80081f <strncpy+0x23>
  800810:	83 c0 01             	add    $0x1,%eax
  800813:	0f b6 0a             	movzbl (%edx),%ecx
  800816:	88 48 ff             	mov    %cl,-0x1(%eax)
  800819:	80 f9 01             	cmp    $0x1,%cl
  80081c:	83 da ff             	sbb    $0xffffffff,%edx
  80081f:	39 d8                	cmp    %ebx,%eax
  800821:	75 ed                	jne    800810 <strncpy+0x14>
  800823:	89 f0                	mov    %esi,%eax
  800825:	5b                   	pop    %ebx
  800826:	5e                   	pop    %esi
  800827:	5d                   	pop    %ebp
  800828:	c3                   	ret

00800829 <strlcpy>:
  800829:	55                   	push   %ebp
  80082a:	89 e5                	mov    %esp,%ebp
  80082c:	56                   	push   %esi
  80082d:	53                   	push   %ebx
  80082e:	8b 75 08             	mov    0x8(%ebp),%esi
  800831:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800834:	8b 55 10             	mov    0x10(%ebp),%edx
  800837:	89 f0                	mov    %esi,%eax
  800839:	85 d2                	test   %edx,%edx
  80083b:	74 21                	je     80085e <strlcpy+0x35>
  80083d:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  800841:	89 f2                	mov    %esi,%edx
  800843:	eb 09                	jmp    80084e <strlcpy+0x25>
  800845:	83 c1 01             	add    $0x1,%ecx
  800848:	83 c2 01             	add    $0x1,%edx
  80084b:	88 5a ff             	mov    %bl,-0x1(%edx)
  80084e:	39 c2                	cmp    %eax,%edx
  800850:	74 09                	je     80085b <strlcpy+0x32>
  800852:	0f b6 19             	movzbl (%ecx),%ebx
  800855:	84 db                	test   %bl,%bl
  800857:	75 ec                	jne    800845 <strlcpy+0x1c>
  800859:	89 d0                	mov    %edx,%eax
  80085b:	c6 00 00             	movb   $0x0,(%eax)
  80085e:	29 f0                	sub    %esi,%eax
  800860:	5b                   	pop    %ebx
  800861:	5e                   	pop    %esi
  800862:	5d                   	pop    %ebp
  800863:	c3                   	ret

00800864 <strcmp>:
  800864:	55                   	push   %ebp
  800865:	89 e5                	mov    %esp,%ebp
  800867:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80086a:	8b 55 0c             	mov    0xc(%ebp),%edx
  80086d:	eb 06                	jmp    800875 <strcmp+0x11>
  80086f:	83 c1 01             	add    $0x1,%ecx
  800872:	83 c2 01             	add    $0x1,%edx
  800875:	0f b6 01             	movzbl (%ecx),%eax
  800878:	84 c0                	test   %al,%al
  80087a:	74 04                	je     800880 <strcmp+0x1c>
  80087c:	3a 02                	cmp    (%edx),%al
  80087e:	74 ef                	je     80086f <strcmp+0xb>
  800880:	0f b6 c0             	movzbl %al,%eax
  800883:	0f b6 12             	movzbl (%edx),%edx
  800886:	29 d0                	sub    %edx,%eax
  800888:	5d                   	pop    %ebp
  800889:	c3                   	ret

0080088a <strncmp>:
  80088a:	55                   	push   %ebp
  80088b:	89 e5                	mov    %esp,%ebp
  80088d:	53                   	push   %ebx
  80088e:	8b 45 08             	mov    0x8(%ebp),%eax
  800891:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800894:	8b 55 10             	mov    0x10(%ebp),%edx
  800897:	eb 09                	jmp    8008a2 <strncmp+0x18>
  800899:	83 ea 01             	sub    $0x1,%edx
  80089c:	83 c0 01             	add    $0x1,%eax
  80089f:	83 c1 01             	add    $0x1,%ecx
  8008a2:	85 d2                	test   %edx,%edx
  8008a4:	74 18                	je     8008be <strncmp+0x34>
  8008a6:	0f b6 18             	movzbl (%eax),%ebx
  8008a9:	84 db                	test   %bl,%bl
  8008ab:	74 04                	je     8008b1 <strncmp+0x27>
  8008ad:	3a 19                	cmp    (%ecx),%bl
  8008af:	74 e8                	je     800899 <strncmp+0xf>
  8008b1:	0f b6 00             	movzbl (%eax),%eax
  8008b4:	0f b6 11             	movzbl (%ecx),%edx
  8008b7:	29 d0                	sub    %edx,%eax
  8008b9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8008bc:	c9                   	leave
  8008bd:	c3                   	ret
  8008be:	b8 00 00 00 00       	mov    $0x0,%eax
  8008c3:	eb f4                	jmp    8008b9 <strncmp+0x2f>

008008c5 <strchr>:
  8008c5:	55                   	push   %ebp
  8008c6:	89 e5                	mov    %esp,%ebp
  8008c8:	8b 45 08             	mov    0x8(%ebp),%eax
  8008cb:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8008cf:	eb 03                	jmp    8008d4 <strchr+0xf>
  8008d1:	83 c0 01             	add    $0x1,%eax
  8008d4:	0f b6 10             	movzbl (%eax),%edx
  8008d7:	84 d2                	test   %dl,%dl
  8008d9:	74 06                	je     8008e1 <strchr+0x1c>
  8008db:	38 ca                	cmp    %cl,%dl
  8008dd:	75 f2                	jne    8008d1 <strchr+0xc>
  8008df:	eb 05                	jmp    8008e6 <strchr+0x21>
  8008e1:	b8 00 00 00 00       	mov    $0x0,%eax
  8008e6:	5d                   	pop    %ebp
  8008e7:	c3                   	ret

008008e8 <strfind>:
  8008e8:	55                   	push   %ebp
  8008e9:	89 e5                	mov    %esp,%ebp
  8008eb:	8b 45 08             	mov    0x8(%ebp),%eax
  8008ee:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8008f2:	0f b6 10             	movzbl (%eax),%edx
  8008f5:	38 ca                	cmp    %cl,%dl
  8008f7:	74 09                	je     800902 <strfind+0x1a>
  8008f9:	84 d2                	test   %dl,%dl
  8008fb:	74 05                	je     800902 <strfind+0x1a>
  8008fd:	83 c0 01             	add    $0x1,%eax
  800900:	eb f0                	jmp    8008f2 <strfind+0xa>
  800902:	5d                   	pop    %ebp
  800903:	c3                   	ret

00800904 <memset>:
  800904:	55                   	push   %ebp
  800905:	89 e5                	mov    %esp,%ebp
  800907:	57                   	push   %edi
  800908:	8b 55 08             	mov    0x8(%ebp),%edx
  80090b:	8b 4d 10             	mov    0x10(%ebp),%ecx
  80090e:	85 c9                	test   %ecx,%ecx
  800910:	74 24                	je     800936 <memset+0x32>
  800912:	89 d0                	mov    %edx,%eax
  800914:	09 c8                	or     %ecx,%eax
  800916:	a8 03                	test   $0x3,%al
  800918:	75 14                	jne    80092e <memset+0x2a>
  80091a:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  80091e:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  800924:	c1 e9 02             	shr    $0x2,%ecx
  800927:	89 d7                	mov    %edx,%edi
  800929:	fc                   	cld
  80092a:	f3 ab                	rep stos %eax,%es:(%edi)
  80092c:	eb 08                	jmp    800936 <memset+0x32>
  80092e:	89 d7                	mov    %edx,%edi
  800930:	8b 45 0c             	mov    0xc(%ebp),%eax
  800933:	fc                   	cld
  800934:	f3 aa                	rep stos %al,%es:(%edi)
  800936:	89 d0                	mov    %edx,%eax
  800938:	8b 7d fc             	mov    -0x4(%ebp),%edi
  80093b:	c9                   	leave
  80093c:	c3                   	ret

0080093d <memmove>:
  80093d:	55                   	push   %ebp
  80093e:	89 e5                	mov    %esp,%ebp
  800940:	57                   	push   %edi
  800941:	56                   	push   %esi
  800942:	8b 45 08             	mov    0x8(%ebp),%eax
  800945:	8b 75 0c             	mov    0xc(%ebp),%esi
  800948:	8b 4d 10             	mov    0x10(%ebp),%ecx
  80094b:	39 c6                	cmp    %eax,%esi
  80094d:	73 32                	jae    800981 <memmove+0x44>
  80094f:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  800952:	39 d0                	cmp    %edx,%eax
  800954:	73 2b                	jae    800981 <memmove+0x44>
  800956:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  800959:	89 fe                	mov    %edi,%esi
  80095b:	09 ce                	or     %ecx,%esi
  80095d:	09 d6                	or     %edx,%esi
  80095f:	f7 c6 03 00 00 00    	test   $0x3,%esi
  800965:	75 0e                	jne    800975 <memmove+0x38>
  800967:	83 ef 04             	sub    $0x4,%edi
  80096a:	8d 72 fc             	lea    -0x4(%edx),%esi
  80096d:	c1 e9 02             	shr    $0x2,%ecx
  800970:	fd                   	std
  800971:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800973:	eb 09                	jmp    80097e <memmove+0x41>
  800975:	83 ef 01             	sub    $0x1,%edi
  800978:	8d 72 ff             	lea    -0x1(%edx),%esi
  80097b:	fd                   	std
  80097c:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  80097e:	fc                   	cld
  80097f:	eb 1a                	jmp    80099b <memmove+0x5e>
  800981:	89 c2                	mov    %eax,%edx
  800983:	09 ca                	or     %ecx,%edx
  800985:	09 f2                	or     %esi,%edx
  800987:	f6 c2 03             	test   $0x3,%dl
  80098a:	75 0a                	jne    800996 <memmove+0x59>
  80098c:	c1 e9 02             	shr    $0x2,%ecx
  80098f:	89 c7                	mov    %eax,%edi
  800991:	fc                   	cld
  800992:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800994:	eb 05                	jmp    80099b <memmove+0x5e>
  800996:	89 c7                	mov    %eax,%edi
  800998:	fc                   	cld
  800999:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  80099b:	5e                   	pop    %esi
  80099c:	5f                   	pop    %edi
  80099d:	5d                   	pop    %ebp
  80099e:	c3                   	ret

0080099f <memcpy>:
  80099f:	55                   	push   %ebp
  8009a0:	89 e5                	mov    %esp,%ebp
  8009a2:	83 ec 0c             	sub    $0xc,%esp
  8009a5:	ff 75 10             	push   0x10(%ebp)
  8009a8:	ff 75 0c             	push   0xc(%ebp)
  8009ab:	ff 75 08             	push   0x8(%ebp)
  8009ae:	e8 8a ff ff ff       	call   80093d <memmove>
  8009b3:	c9                   	leave
  8009b4:	c3                   	ret

008009b5 <memcmp>:
  8009b5:	55                   	push   %ebp
  8009b6:	89 e5                	mov    %esp,%ebp
  8009b8:	56                   	push   %esi
  8009b9:	53                   	push   %ebx
  8009ba:	8b 45 08             	mov    0x8(%ebp),%eax
  8009bd:	8b 55 0c             	mov    0xc(%ebp),%edx
  8009c0:	89 c6                	mov    %eax,%esi
  8009c2:	03 75 10             	add    0x10(%ebp),%esi
  8009c5:	eb 06                	jmp    8009cd <memcmp+0x18>
  8009c7:	83 c0 01             	add    $0x1,%eax
  8009ca:	83 c2 01             	add    $0x1,%edx
  8009cd:	39 f0                	cmp    %esi,%eax
  8009cf:	74 14                	je     8009e5 <memcmp+0x30>
  8009d1:	0f b6 08             	movzbl (%eax),%ecx
  8009d4:	0f b6 1a             	movzbl (%edx),%ebx
  8009d7:	38 d9                	cmp    %bl,%cl
  8009d9:	74 ec                	je     8009c7 <memcmp+0x12>
  8009db:	0f b6 c1             	movzbl %cl,%eax
  8009de:	0f b6 db             	movzbl %bl,%ebx
  8009e1:	29 d8                	sub    %ebx,%eax
  8009e3:	eb 05                	jmp    8009ea <memcmp+0x35>
  8009e5:	b8 00 00 00 00       	mov    $0x0,%eax
  8009ea:	5b                   	pop    %ebx
  8009eb:	5e                   	pop    %esi
  8009ec:	5d                   	pop    %ebp
  8009ed:	c3                   	ret

008009ee <memfind>:
  8009ee:	55                   	push   %ebp
  8009ef:	89 e5                	mov    %esp,%ebp
  8009f1:	8b 45 08             	mov    0x8(%ebp),%eax
  8009f4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8009f7:	89 c2                	mov    %eax,%edx
  8009f9:	03 55 10             	add    0x10(%ebp),%edx
  8009fc:	eb 03                	jmp    800a01 <memfind+0x13>
  8009fe:	83 c0 01             	add    $0x1,%eax
  800a01:	39 d0                	cmp    %edx,%eax
  800a03:	73 04                	jae    800a09 <memfind+0x1b>
  800a05:	38 08                	cmp    %cl,(%eax)
  800a07:	75 f5                	jne    8009fe <memfind+0x10>
  800a09:	5d                   	pop    %ebp
  800a0a:	c3                   	ret

00800a0b <strtol>:
  800a0b:	55                   	push   %ebp
  800a0c:	89 e5                	mov    %esp,%ebp
  800a0e:	57                   	push   %edi
  800a0f:	56                   	push   %esi
  800a10:	53                   	push   %ebx
  800a11:	8b 55 08             	mov    0x8(%ebp),%edx
  800a14:	8b 5d 10             	mov    0x10(%ebp),%ebx
  800a17:	eb 03                	jmp    800a1c <strtol+0x11>
  800a19:	83 c2 01             	add    $0x1,%edx
  800a1c:	0f b6 02             	movzbl (%edx),%eax
  800a1f:	3c 20                	cmp    $0x20,%al
  800a21:	74 f6                	je     800a19 <strtol+0xe>
  800a23:	3c 09                	cmp    $0x9,%al
  800a25:	74 f2                	je     800a19 <strtol+0xe>
  800a27:	3c 2b                	cmp    $0x2b,%al
  800a29:	74 2a                	je     800a55 <strtol+0x4a>
  800a2b:	bf 00 00 00 00       	mov    $0x0,%edi
  800a30:	3c 2d                	cmp    $0x2d,%al
  800a32:	74 2b                	je     800a5f <strtol+0x54>
  800a34:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  800a3a:	75 0f                	jne    800a4b <strtol+0x40>
  800a3c:	80 3a 30             	cmpb   $0x30,(%edx)
  800a3f:	74 28                	je     800a69 <strtol+0x5e>
  800a41:	85 db                	test   %ebx,%ebx
  800a43:	b8 0a 00 00 00       	mov    $0xa,%eax
  800a48:	0f 44 d8             	cmove  %eax,%ebx
  800a4b:	b9 00 00 00 00       	mov    $0x0,%ecx
  800a50:	89 5d 10             	mov    %ebx,0x10(%ebp)
  800a53:	eb 46                	jmp    800a9b <strtol+0x90>
  800a55:	83 c2 01             	add    $0x1,%edx
  800a58:	bf 00 00 00 00       	mov    $0x0,%edi
  800a5d:	eb d5                	jmp    800a34 <strtol+0x29>
  800a5f:	83 c2 01             	add    $0x1,%edx
  800a62:	bf 01 00 00 00       	mov    $0x1,%edi
  800a67:	eb cb                	jmp    800a34 <strtol+0x29>
  800a69:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800a6d:	74 0e                	je     800a7d <strtol+0x72>
  800a6f:	85 db                	test   %ebx,%ebx
  800a71:	75 d8                	jne    800a4b <strtol+0x40>
  800a73:	83 c2 01             	add    $0x1,%edx
  800a76:	bb 08 00 00 00       	mov    $0x8,%ebx
  800a7b:	eb ce                	jmp    800a4b <strtol+0x40>
  800a7d:	83 c2 02             	add    $0x2,%edx
  800a80:	bb 10 00 00 00       	mov    $0x10,%ebx
  800a85:	eb c4                	jmp    800a4b <strtol+0x40>
  800a87:	0f be c0             	movsbl %al,%eax
  800a8a:	83 e8 30             	sub    $0x30,%eax
  800a8d:	3b 45 10             	cmp    0x10(%ebp),%eax
  800a90:	7d 3a                	jge    800acc <strtol+0xc1>
  800a92:	83 c2 01             	add    $0x1,%edx
  800a95:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  800a99:	01 c1                	add    %eax,%ecx
  800a9b:	0f b6 02             	movzbl (%edx),%eax
  800a9e:	8d 70 d0             	lea    -0x30(%eax),%esi
  800aa1:	89 f3                	mov    %esi,%ebx
  800aa3:	80 fb 09             	cmp    $0x9,%bl
  800aa6:	76 df                	jbe    800a87 <strtol+0x7c>
  800aa8:	8d 70 9f             	lea    -0x61(%eax),%esi
  800aab:	89 f3                	mov    %esi,%ebx
  800aad:	80 fb 19             	cmp    $0x19,%bl
  800ab0:	77 08                	ja     800aba <strtol+0xaf>
  800ab2:	0f be c0             	movsbl %al,%eax
  800ab5:	83 e8 57             	sub    $0x57,%eax
  800ab8:	eb d3                	jmp    800a8d <strtol+0x82>
  800aba:	8d 70 bf             	lea    -0x41(%eax),%esi
  800abd:	89 f3                	mov    %esi,%ebx
  800abf:	80 fb 19             	cmp    $0x19,%bl
  800ac2:	77 08                	ja     800acc <strtol+0xc1>
  800ac4:	0f be c0             	movsbl %al,%eax
  800ac7:	83 e8 37             	sub    $0x37,%eax
  800aca:	eb c1                	jmp    800a8d <strtol+0x82>
  800acc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  800ad0:	74 05                	je     800ad7 <strtol+0xcc>
  800ad2:	8b 45 0c             	mov    0xc(%ebp),%eax
  800ad5:	89 10                	mov    %edx,(%eax)
  800ad7:	89 c8                	mov    %ecx,%eax
  800ad9:	f7 d8                	neg    %eax
  800adb:	85 ff                	test   %edi,%edi
  800add:	0f 45 c8             	cmovne %eax,%ecx
  800ae0:	89 c8                	mov    %ecx,%eax
  800ae2:	5b                   	pop    %ebx
  800ae3:	5e                   	pop    %esi
  800ae4:	5f                   	pop    %edi
  800ae5:	5d                   	pop    %ebp
  800ae6:	c3                   	ret

00800ae7 <syscall>:
  800ae7:	55                   	push   %ebp
  800ae8:	89 e5                	mov    %esp,%ebp
  800aea:	57                   	push   %edi
  800aeb:	56                   	push   %esi
  800aec:	53                   	push   %ebx
  800aed:	83 ec 1c             	sub    $0x1c,%esp
  800af0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800af3:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  800af6:	89 ca                	mov    %ecx,%edx
  800af8:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800afb:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800afe:	8b 7d 10             	mov    0x10(%ebp),%edi
  800b01:	8b 75 14             	mov    0x14(%ebp),%esi
  800b04:	cd 30                	int    $0x30
  800b06:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  800b0a:	74 04                	je     800b10 <syscall+0x29>
  800b0c:	85 c0                	test   %eax,%eax
  800b0e:	7f 08                	jg     800b18 <syscall+0x31>
  800b10:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800b13:	5b                   	pop    %ebx
  800b14:	5e                   	pop    %esi
  800b15:	5f                   	pop    %edi
  800b16:	5d                   	pop    %ebp
  800b17:	c3                   	ret
  800b18:	83 ec 0c             	sub    $0xc,%esp
  800b1b:	50                   	push   %eax
  800b1c:	ff 75 e0             	push   -0x20(%ebp)
  800b1f:	68 5a 10 80 00       	push   $0x80105a
  800b24:	6a 1e                	push   $0x1e
  800b26:	68 77 10 80 00       	push   $0x801077
  800b2b:	e8 63 f6 ff ff       	call   800193 <_panic>

00800b30 <sys_cputs>:
  800b30:	55                   	push   %ebp
  800b31:	89 e5                	mov    %esp,%ebp
  800b33:	83 ec 08             	sub    $0x8,%esp
  800b36:	6a 00                	push   $0x0
  800b38:	6a 00                	push   $0x0
  800b3a:	6a 00                	push   $0x0
  800b3c:	ff 75 0c             	push   0xc(%ebp)
  800b3f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b42:	ba 00 00 00 00       	mov    $0x0,%edx
  800b47:	b8 00 00 00 00       	mov    $0x0,%eax
  800b4c:	e8 96 ff ff ff       	call   800ae7 <syscall>
  800b51:	83 c4 10             	add    $0x10,%esp
  800b54:	c9                   	leave
  800b55:	c3                   	ret

00800b56 <sys_cgetc>:
  800b56:	55                   	push   %ebp
  800b57:	89 e5                	mov    %esp,%ebp
  800b59:	83 ec 08             	sub    $0x8,%esp
  800b5c:	6a 00                	push   $0x0
  800b5e:	6a 00                	push   $0x0
  800b60:	6a 00                	push   $0x0
  800b62:	6a 00                	push   $0x0
  800b64:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b69:	ba 00 00 00 00       	mov    $0x0,%edx
  800b6e:	b8 01 00 00 00       	mov    $0x1,%eax
  800b73:	e8 6f ff ff ff       	call   800ae7 <syscall>
  800b78:	c9                   	leave
  800b79:	c3                   	ret

00800b7a <sys_env_destroy>:
  800b7a:	55                   	push   %ebp
  800b7b:	89 e5                	mov    %esp,%ebp
  800b7d:	83 ec 08             	sub    $0x8,%esp
  800b80:	6a 00                	push   $0x0
  800b82:	6a 00                	push   $0x0
  800b84:	6a 00                	push   $0x0
  800b86:	6a 00                	push   $0x0
  800b88:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800b8b:	ba 01 00 00 00       	mov    $0x1,%edx
  800b90:	b8 03 00 00 00       	mov    $0x3,%eax
  800b95:	e8 4d ff ff ff       	call   800ae7 <syscall>
  800b9a:	c9                   	leave
  800b9b:	c3                   	ret

00800b9c <sys_getenvid>:
  800b9c:	55                   	push   %ebp
  800b9d:	89 e5                	mov    %esp,%ebp
  800b9f:	83 ec 08             	sub    $0x8,%esp
  800ba2:	6a 00                	push   $0x0
  800ba4:	6a 00                	push   $0x0
  800ba6:	6a 00                	push   $0x0
  800ba8:	6a 00                	push   $0x0
  800baa:	b9 00 00 00 00       	mov    $0x0,%ecx
  800baf:	ba 00 00 00 00       	mov    $0x0,%edx
  800bb4:	b8 02 00 00 00       	mov    $0x2,%eax
  800bb9:	e8 29 ff ff ff       	call   800ae7 <syscall>
  800bbe:	c9                   	leave
  800bbf:	c3                   	ret

00800bc0 <sys_yield>:
  800bc0:	55                   	push   %ebp
  800bc1:	89 e5                	mov    %esp,%ebp
  800bc3:	83 ec 08             	sub    $0x8,%esp
  800bc6:	6a 00                	push   $0x0
  800bc8:	6a 00                	push   $0x0
  800bca:	6a 00                	push   $0x0
  800bcc:	6a 00                	push   $0x0
  800bce:	b9 00 00 00 00       	mov    $0x0,%ecx
  800bd3:	ba 00 00 00 00       	mov    $0x0,%edx
  800bd8:	b8 0a 00 00 00       	mov    $0xa,%eax
  800bdd:	e8 05 ff ff ff       	call   800ae7 <syscall>
  800be2:	83 c4 10             	add    $0x10,%esp
  800be5:	c9                   	leave
  800be6:	c3                   	ret

00800be7 <sys_page_alloc>:
  800be7:	55                   	push   %ebp
  800be8:	89 e5                	mov    %esp,%ebp
  800bea:	83 ec 08             	sub    $0x8,%esp
  800bed:	6a 00                	push   $0x0
  800bef:	6a 00                	push   $0x0
  800bf1:	ff 75 10             	push   0x10(%ebp)
  800bf4:	ff 75 0c             	push   0xc(%ebp)
  800bf7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800bfa:	ba 01 00 00 00       	mov    $0x1,%edx
  800bff:	b8 04 00 00 00       	mov    $0x4,%eax
  800c04:	e8 de fe ff ff       	call   800ae7 <syscall>
  800c09:	c9                   	leave
  800c0a:	c3                   	ret

00800c0b <sys_page_map>:
  800c0b:	55                   	push   %ebp
  800c0c:	89 e5                	mov    %esp,%ebp
  800c0e:	83 ec 08             	sub    $0x8,%esp
  800c11:	ff 75 18             	push   0x18(%ebp)
  800c14:	ff 75 14             	push   0x14(%ebp)
  800c17:	ff 75 10             	push   0x10(%ebp)
  800c1a:	ff 75 0c             	push   0xc(%ebp)
  800c1d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c20:	ba 01 00 00 00       	mov    $0x1,%edx
  800c25:	b8 05 00 00 00       	mov    $0x5,%eax
  800c2a:	e8 b8 fe ff ff       	call   800ae7 <syscall>
  800c2f:	c9                   	leave
  800c30:	c3                   	ret

00800c31 <sys_page_unmap>:
  800c31:	55                   	push   %ebp
  800c32:	89 e5                	mov    %esp,%ebp
  800c34:	83 ec 08             	sub    $0x8,%esp
  800c37:	6a 00                	push   $0x0
  800c39:	6a 00                	push   $0x0
  800c3b:	6a 00                	push   $0x0
  800c3d:	ff 75 0c             	push   0xc(%ebp)
  800c40:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c43:	ba 01 00 00 00       	mov    $0x1,%edx
  800c48:	b8 06 00 00 00       	mov    $0x6,%eax
  800c4d:	e8 95 fe ff ff       	call   800ae7 <syscall>
  800c52:	c9                   	leave
  800c53:	c3                   	ret

00800c54 <sys_env_set_status>:
  800c54:	55                   	push   %ebp
  800c55:	89 e5                	mov    %esp,%ebp
  800c57:	83 ec 08             	sub    $0x8,%esp
  800c5a:	6a 00                	push   $0x0
  800c5c:	6a 00                	push   $0x0
  800c5e:	6a 00                	push   $0x0
  800c60:	ff 75 0c             	push   0xc(%ebp)
  800c63:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c66:	ba 01 00 00 00       	mov    $0x1,%edx
  800c6b:	b8 08 00 00 00       	mov    $0x8,%eax
  800c70:	e8 72 fe ff ff       	call   800ae7 <syscall>
  800c75:	c9                   	leave
  800c76:	c3                   	ret

00800c77 <sys_env_set_pgfault_upcall>:
  800c77:	55                   	push   %ebp
  800c78:	89 e5                	mov    %esp,%ebp
  800c7a:	83 ec 08             	sub    $0x8,%esp
  800c7d:	6a 00                	push   $0x0
  800c7f:	6a 00                	push   $0x0
  800c81:	6a 00                	push   $0x0
  800c83:	ff 75 0c             	push   0xc(%ebp)
  800c86:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c89:	ba 01 00 00 00       	mov    $0x1,%edx
  800c8e:	b8 09 00 00 00       	mov    $0x9,%eax
  800c93:	e8 4f fe ff ff       	call   800ae7 <syscall>
  800c98:	c9                   	leave
  800c99:	c3                   	ret

00800c9a <sys_ipc_try_send>:
  800c9a:	55                   	push   %ebp
  800c9b:	89 e5                	mov    %esp,%ebp
  800c9d:	83 ec 08             	sub    $0x8,%esp
  800ca0:	6a 00                	push   $0x0
  800ca2:	ff 75 14             	push   0x14(%ebp)
  800ca5:	ff 75 10             	push   0x10(%ebp)
  800ca8:	ff 75 0c             	push   0xc(%ebp)
  800cab:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800cae:	ba 00 00 00 00       	mov    $0x0,%edx
  800cb3:	b8 0c 00 00 00       	mov    $0xc,%eax
  800cb8:	e8 2a fe ff ff       	call   800ae7 <syscall>
  800cbd:	c9                   	leave
  800cbe:	c3                   	ret

00800cbf <sys_ipc_recv>:
  800cbf:	55                   	push   %ebp
  800cc0:	89 e5                	mov    %esp,%ebp
  800cc2:	83 ec 08             	sub    $0x8,%esp
  800cc5:	6a 00                	push   $0x0
  800cc7:	6a 00                	push   $0x0
  800cc9:	6a 00                	push   $0x0
  800ccb:	6a 00                	push   $0x0
  800ccd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800cd0:	ba 01 00 00 00       	mov    $0x1,%edx
  800cd5:	b8 0d 00 00 00       	mov    $0xd,%eax
  800cda:	e8 08 fe ff ff       	call   800ae7 <syscall>
  800cdf:	c9                   	leave
  800ce0:	c3                   	ret
  800ce1:	66 90                	xchg   %ax,%ax
  800ce3:	66 90                	xchg   %ax,%ax
  800ce5:	66 90                	xchg   %ax,%ax
  800ce7:	66 90                	xchg   %ax,%ax
  800ce9:	66 90                	xchg   %ax,%ax
  800ceb:	66 90                	xchg   %ax,%ax
  800ced:	66 90                	xchg   %ax,%ax
  800cef:	90                   	nop

00800cf0 <__udivdi3>:
  800cf0:	f3 0f 1e fb          	endbr32
  800cf4:	55                   	push   %ebp
  800cf5:	57                   	push   %edi
  800cf6:	56                   	push   %esi
  800cf7:	53                   	push   %ebx
  800cf8:	83 ec 1c             	sub    $0x1c,%esp
  800cfb:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800cff:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  800d03:	8b 74 24 34          	mov    0x34(%esp),%esi
  800d07:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  800d0b:	85 c0                	test   %eax,%eax
  800d0d:	75 19                	jne    800d28 <__udivdi3+0x38>
  800d0f:	39 de                	cmp    %ebx,%esi
  800d11:	73 4d                	jae    800d60 <__udivdi3+0x70>
  800d13:	31 ff                	xor    %edi,%edi
  800d15:	89 e8                	mov    %ebp,%eax
  800d17:	89 f2                	mov    %esi,%edx
  800d19:	f7 f3                	div    %ebx
  800d1b:	89 fa                	mov    %edi,%edx
  800d1d:	83 c4 1c             	add    $0x1c,%esp
  800d20:	5b                   	pop    %ebx
  800d21:	5e                   	pop    %esi
  800d22:	5f                   	pop    %edi
  800d23:	5d                   	pop    %ebp
  800d24:	c3                   	ret
  800d25:	8d 76 00             	lea    0x0(%esi),%esi
  800d28:	39 c6                	cmp    %eax,%esi
  800d2a:	73 14                	jae    800d40 <__udivdi3+0x50>
  800d2c:	31 ff                	xor    %edi,%edi
  800d2e:	31 c0                	xor    %eax,%eax
  800d30:	89 fa                	mov    %edi,%edx
  800d32:	83 c4 1c             	add    $0x1c,%esp
  800d35:	5b                   	pop    %ebx
  800d36:	5e                   	pop    %esi
  800d37:	5f                   	pop    %edi
  800d38:	5d                   	pop    %ebp
  800d39:	c3                   	ret
  800d3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800d40:	0f bd f8             	bsr    %eax,%edi
  800d43:	83 f7 1f             	xor    $0x1f,%edi
  800d46:	75 48                	jne    800d90 <__udivdi3+0xa0>
  800d48:	39 f0                	cmp    %esi,%eax
  800d4a:	72 06                	jb     800d52 <__udivdi3+0x62>
  800d4c:	31 c0                	xor    %eax,%eax
  800d4e:	39 dd                	cmp    %ebx,%ebp
  800d50:	72 de                	jb     800d30 <__udivdi3+0x40>
  800d52:	b8 01 00 00 00       	mov    $0x1,%eax
  800d57:	eb d7                	jmp    800d30 <__udivdi3+0x40>
  800d59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800d60:	89 d9                	mov    %ebx,%ecx
  800d62:	85 db                	test   %ebx,%ebx
  800d64:	75 0b                	jne    800d71 <__udivdi3+0x81>
  800d66:	b8 01 00 00 00       	mov    $0x1,%eax
  800d6b:	31 d2                	xor    %edx,%edx
  800d6d:	f7 f3                	div    %ebx
  800d6f:	89 c1                	mov    %eax,%ecx
  800d71:	31 d2                	xor    %edx,%edx
  800d73:	89 f0                	mov    %esi,%eax
  800d75:	f7 f1                	div    %ecx
  800d77:	89 c6                	mov    %eax,%esi
  800d79:	89 e8                	mov    %ebp,%eax
  800d7b:	89 f7                	mov    %esi,%edi
  800d7d:	f7 f1                	div    %ecx
  800d7f:	89 fa                	mov    %edi,%edx
  800d81:	83 c4 1c             	add    $0x1c,%esp
  800d84:	5b                   	pop    %ebx
  800d85:	5e                   	pop    %esi
  800d86:	5f                   	pop    %edi
  800d87:	5d                   	pop    %ebp
  800d88:	c3                   	ret
  800d89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800d90:	89 f9                	mov    %edi,%ecx
  800d92:	ba 20 00 00 00       	mov    $0x20,%edx
  800d97:	29 fa                	sub    %edi,%edx
  800d99:	d3 e0                	shl    %cl,%eax
  800d9b:	89 44 24 08          	mov    %eax,0x8(%esp)
  800d9f:	89 d1                	mov    %edx,%ecx
  800da1:	89 d8                	mov    %ebx,%eax
  800da3:	d3 e8                	shr    %cl,%eax
  800da5:	89 c1                	mov    %eax,%ecx
  800da7:	8b 44 24 08          	mov    0x8(%esp),%eax
  800dab:	09 c1                	or     %eax,%ecx
  800dad:	89 f0                	mov    %esi,%eax
  800daf:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800db3:	89 f9                	mov    %edi,%ecx
  800db5:	d3 e3                	shl    %cl,%ebx
  800db7:	89 d1                	mov    %edx,%ecx
  800db9:	d3 e8                	shr    %cl,%eax
  800dbb:	89 f9                	mov    %edi,%ecx
  800dbd:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  800dc1:	89 eb                	mov    %ebp,%ebx
  800dc3:	d3 e6                	shl    %cl,%esi
  800dc5:	89 d1                	mov    %edx,%ecx
  800dc7:	d3 eb                	shr    %cl,%ebx
  800dc9:	09 f3                	or     %esi,%ebx
  800dcb:	89 c6                	mov    %eax,%esi
  800dcd:	89 f2                	mov    %esi,%edx
  800dcf:	89 d8                	mov    %ebx,%eax
  800dd1:	f7 74 24 08          	divl   0x8(%esp)
  800dd5:	89 d6                	mov    %edx,%esi
  800dd7:	89 c3                	mov    %eax,%ebx
  800dd9:	f7 64 24 0c          	mull   0xc(%esp)
  800ddd:	39 d6                	cmp    %edx,%esi
  800ddf:	72 1f                	jb     800e00 <__udivdi3+0x110>
  800de1:	89 f9                	mov    %edi,%ecx
  800de3:	d3 e5                	shl    %cl,%ebp
  800de5:	39 c5                	cmp    %eax,%ebp
  800de7:	73 04                	jae    800ded <__udivdi3+0xfd>
  800de9:	39 d6                	cmp    %edx,%esi
  800deb:	74 13                	je     800e00 <__udivdi3+0x110>
  800ded:	89 d8                	mov    %ebx,%eax
  800def:	31 ff                	xor    %edi,%edi
  800df1:	e9 3a ff ff ff       	jmp    800d30 <__udivdi3+0x40>
  800df6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800dfd:	00 
  800dfe:	66 90                	xchg   %ax,%ax
  800e00:	8d 43 ff             	lea    -0x1(%ebx),%eax
  800e03:	31 ff                	xor    %edi,%edi
  800e05:	e9 26 ff ff ff       	jmp    800d30 <__udivdi3+0x40>
  800e0a:	66 90                	xchg   %ax,%ax
  800e0c:	66 90                	xchg   %ax,%ax
  800e0e:	66 90                	xchg   %ax,%ax

00800e10 <__umoddi3>:
  800e10:	f3 0f 1e fb          	endbr32
  800e14:	55                   	push   %ebp
  800e15:	57                   	push   %edi
  800e16:	56                   	push   %esi
  800e17:	53                   	push   %ebx
  800e18:	83 ec 1c             	sub    $0x1c,%esp
  800e1b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  800e1f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800e23:	8b 74 24 30          	mov    0x30(%esp),%esi
  800e27:	8b 7c 24 38          	mov    0x38(%esp),%edi
  800e2b:	89 da                	mov    %ebx,%edx
  800e2d:	85 c0                	test   %eax,%eax
  800e2f:	75 17                	jne    800e48 <__umoddi3+0x38>
  800e31:	39 fb                	cmp    %edi,%ebx
  800e33:	73 53                	jae    800e88 <__umoddi3+0x78>
  800e35:	89 f0                	mov    %esi,%eax
  800e37:	f7 f7                	div    %edi
  800e39:	89 d0                	mov    %edx,%eax
  800e3b:	31 d2                	xor    %edx,%edx
  800e3d:	83 c4 1c             	add    $0x1c,%esp
  800e40:	5b                   	pop    %ebx
  800e41:	5e                   	pop    %esi
  800e42:	5f                   	pop    %edi
  800e43:	5d                   	pop    %ebp
  800e44:	c3                   	ret
  800e45:	8d 76 00             	lea    0x0(%esi),%esi
  800e48:	89 f1                	mov    %esi,%ecx
  800e4a:	39 c3                	cmp    %eax,%ebx
  800e4c:	73 12                	jae    800e60 <__umoddi3+0x50>
  800e4e:	89 f0                	mov    %esi,%eax
  800e50:	83 c4 1c             	add    $0x1c,%esp
  800e53:	5b                   	pop    %ebx
  800e54:	5e                   	pop    %esi
  800e55:	5f                   	pop    %edi
  800e56:	5d                   	pop    %ebp
  800e57:	c3                   	ret
  800e58:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800e5f:	00 
  800e60:	0f bd e8             	bsr    %eax,%ebp
  800e63:	83 f5 1f             	xor    $0x1f,%ebp
  800e66:	75 48                	jne    800eb0 <__umoddi3+0xa0>
  800e68:	39 d8                	cmp    %ebx,%eax
  800e6a:	0f 82 d0 00 00 00    	jb     800f40 <__umoddi3+0x130>
  800e70:	39 fe                	cmp    %edi,%esi
  800e72:	0f 83 c8 00 00 00    	jae    800f40 <__umoddi3+0x130>
  800e78:	89 c8                	mov    %ecx,%eax
  800e7a:	83 c4 1c             	add    $0x1c,%esp
  800e7d:	5b                   	pop    %ebx
  800e7e:	5e                   	pop    %esi
  800e7f:	5f                   	pop    %edi
  800e80:	5d                   	pop    %ebp
  800e81:	c3                   	ret
  800e82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800e88:	89 f9                	mov    %edi,%ecx
  800e8a:	85 ff                	test   %edi,%edi
  800e8c:	75 0b                	jne    800e99 <__umoddi3+0x89>
  800e8e:	b8 01 00 00 00       	mov    $0x1,%eax
  800e93:	31 d2                	xor    %edx,%edx
  800e95:	f7 f7                	div    %edi
  800e97:	89 c1                	mov    %eax,%ecx
  800e99:	89 d8                	mov    %ebx,%eax
  800e9b:	31 d2                	xor    %edx,%edx
  800e9d:	f7 f1                	div    %ecx
  800e9f:	89 f0                	mov    %esi,%eax
  800ea1:	f7 f1                	div    %ecx
  800ea3:	89 d0                	mov    %edx,%eax
  800ea5:	31 d2                	xor    %edx,%edx
  800ea7:	eb 94                	jmp    800e3d <__umoddi3+0x2d>
  800ea9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800eb0:	89 e9                	mov    %ebp,%ecx
  800eb2:	ba 20 00 00 00       	mov    $0x20,%edx
  800eb7:	29 ea                	sub    %ebp,%edx
  800eb9:	d3 e0                	shl    %cl,%eax
  800ebb:	89 44 24 08          	mov    %eax,0x8(%esp)
  800ebf:	89 d1                	mov    %edx,%ecx
  800ec1:	89 f8                	mov    %edi,%eax
  800ec3:	d3 e8                	shr    %cl,%eax
  800ec5:	89 54 24 04          	mov    %edx,0x4(%esp)
  800ec9:	8b 54 24 04          	mov    0x4(%esp),%edx
  800ecd:	89 c1                	mov    %eax,%ecx
  800ecf:	8b 44 24 08          	mov    0x8(%esp),%eax
  800ed3:	09 c1                	or     %eax,%ecx
  800ed5:	89 d8                	mov    %ebx,%eax
  800ed7:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800edb:	89 e9                	mov    %ebp,%ecx
  800edd:	d3 e7                	shl    %cl,%edi
  800edf:	89 d1                	mov    %edx,%ecx
  800ee1:	d3 e8                	shr    %cl,%eax
  800ee3:	89 e9                	mov    %ebp,%ecx
  800ee5:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  800ee9:	d3 e3                	shl    %cl,%ebx
  800eeb:	89 c7                	mov    %eax,%edi
  800eed:	89 d1                	mov    %edx,%ecx
  800eef:	89 f0                	mov    %esi,%eax
  800ef1:	d3 e8                	shr    %cl,%eax
  800ef3:	89 fa                	mov    %edi,%edx
  800ef5:	89 e9                	mov    %ebp,%ecx
  800ef7:	09 d8                	or     %ebx,%eax
  800ef9:	d3 e6                	shl    %cl,%esi
  800efb:	f7 74 24 08          	divl   0x8(%esp)
  800eff:	89 d3                	mov    %edx,%ebx
  800f01:	f7 64 24 0c          	mull   0xc(%esp)
  800f05:	89 c7                	mov    %eax,%edi
  800f07:	89 d1                	mov    %edx,%ecx
  800f09:	39 d3                	cmp    %edx,%ebx
  800f0b:	72 06                	jb     800f13 <__umoddi3+0x103>
  800f0d:	75 10                	jne    800f1f <__umoddi3+0x10f>
  800f0f:	39 c6                	cmp    %eax,%esi
  800f11:	73 0c                	jae    800f1f <__umoddi3+0x10f>
  800f13:	2b 44 24 0c          	sub    0xc(%esp),%eax
  800f17:	1b 54 24 08          	sbb    0x8(%esp),%edx
  800f1b:	89 d1                	mov    %edx,%ecx
  800f1d:	89 c7                	mov    %eax,%edi
  800f1f:	89 f2                	mov    %esi,%edx
  800f21:	29 fa                	sub    %edi,%edx
  800f23:	19 cb                	sbb    %ecx,%ebx
  800f25:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  800f2a:	89 d8                	mov    %ebx,%eax
  800f2c:	d3 e0                	shl    %cl,%eax
  800f2e:	89 e9                	mov    %ebp,%ecx
  800f30:	d3 ea                	shr    %cl,%edx
  800f32:	d3 eb                	shr    %cl,%ebx
  800f34:	09 d0                	or     %edx,%eax
  800f36:	89 da                	mov    %ebx,%edx
  800f38:	83 c4 1c             	add    $0x1c,%esp
  800f3b:	5b                   	pop    %ebx
  800f3c:	5e                   	pop    %esi
  800f3d:	5f                   	pop    %edi
  800f3e:	5d                   	pop    %ebp
  800f3f:	c3                   	ret
  800f40:	89 da                	mov    %ebx,%edx
  800f42:	89 f1                	mov    %esi,%ecx
  800f44:	29 f9                	sub    %edi,%ecx
  800f46:	19 c2                	sbb    %eax,%edx
  800f48:	89 c8                	mov    %ecx,%eax
  800f4a:	e9 2b ff ff ff       	jmp    800e7a <__umoddi3+0x6a>
