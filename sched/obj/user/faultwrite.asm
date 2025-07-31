
obj/user/faultwrite:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 0d 00 00 00       	call   80003e <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <umain>:
  800033:	c7 05 00 00 00 00 00 	movl   $0x0,0x0
  80003a:	00 00 00 
  80003d:	c3                   	ret

0080003e <libmain>:
  80003e:	55                   	push   %ebp
  80003f:	89 e5                	mov    %esp,%ebp
  800041:	56                   	push   %esi
  800042:	53                   	push   %ebx
  800043:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800046:	8b 75 0c             	mov    0xc(%ebp),%esi
  800049:	e8 04 01 00 00       	call   800152 <sys_getenvid>
  80004e:	85 c0                	test   %eax,%eax
  800050:	78 15                	js     800067 <libmain+0x29>
  800052:	25 ff 03 00 00       	and    $0x3ff,%eax
  800057:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  80005d:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800062:	a3 04 20 80 00       	mov    %eax,0x802004
  800067:	85 db                	test   %ebx,%ebx
  800069:	7e 07                	jle    800072 <libmain+0x34>
  80006b:	8b 06                	mov    (%esi),%eax
  80006d:	a3 00 20 80 00       	mov    %eax,0x802000
  800072:	83 ec 08             	sub    $0x8,%esp
  800075:	56                   	push   %esi
  800076:	53                   	push   %ebx
  800077:	e8 b7 ff ff ff       	call   800033 <umain>
  80007c:	e8 0a 00 00 00       	call   80008b <exit>
  800081:	83 c4 10             	add    $0x10,%esp
  800084:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800087:	5b                   	pop    %ebx
  800088:	5e                   	pop    %esi
  800089:	5d                   	pop    %ebp
  80008a:	c3                   	ret

0080008b <exit>:
  80008b:	55                   	push   %ebp
  80008c:	89 e5                	mov    %esp,%ebp
  80008e:	83 ec 14             	sub    $0x14,%esp
  800091:	6a 00                	push   $0x0
  800093:	e8 98 00 00 00       	call   800130 <sys_env_destroy>
  800098:	83 c4 10             	add    $0x10,%esp
  80009b:	c9                   	leave
  80009c:	c3                   	ret

0080009d <syscall>:
  80009d:	55                   	push   %ebp
  80009e:	89 e5                	mov    %esp,%ebp
  8000a0:	57                   	push   %edi
  8000a1:	56                   	push   %esi
  8000a2:	53                   	push   %ebx
  8000a3:	83 ec 1c             	sub    $0x1c,%esp
  8000a6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8000a9:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  8000ac:	89 ca                	mov    %ecx,%edx
  8000ae:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8000b1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8000b4:	8b 7d 10             	mov    0x10(%ebp),%edi
  8000b7:	8b 75 14             	mov    0x14(%ebp),%esi
  8000ba:	cd 30                	int    $0x30
  8000bc:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  8000c0:	74 04                	je     8000c6 <syscall+0x29>
  8000c2:	85 c0                	test   %eax,%eax
  8000c4:	7f 08                	jg     8000ce <syscall+0x31>
  8000c6:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8000c9:	5b                   	pop    %ebx
  8000ca:	5e                   	pop    %esi
  8000cb:	5f                   	pop    %edi
  8000cc:	5d                   	pop    %ebp
  8000cd:	c3                   	ret
  8000ce:	83 ec 0c             	sub    $0xc,%esp
  8000d1:	50                   	push   %eax
  8000d2:	ff 75 e0             	push   -0x20(%ebp)
  8000d5:	68 6a 0e 80 00       	push   $0x800e6a
  8000da:	6a 1e                	push   $0x1e
  8000dc:	68 87 0e 80 00       	push   $0x800e87
  8000e1:	e8 b1 01 00 00       	call   800297 <_panic>

008000e6 <sys_cputs>:
  8000e6:	55                   	push   %ebp
  8000e7:	89 e5                	mov    %esp,%ebp
  8000e9:	83 ec 08             	sub    $0x8,%esp
  8000ec:	6a 00                	push   $0x0
  8000ee:	6a 00                	push   $0x0
  8000f0:	6a 00                	push   $0x0
  8000f2:	ff 75 0c             	push   0xc(%ebp)
  8000f5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8000f8:	ba 00 00 00 00       	mov    $0x0,%edx
  8000fd:	b8 00 00 00 00       	mov    $0x0,%eax
  800102:	e8 96 ff ff ff       	call   80009d <syscall>
  800107:	83 c4 10             	add    $0x10,%esp
  80010a:	c9                   	leave
  80010b:	c3                   	ret

0080010c <sys_cgetc>:
  80010c:	55                   	push   %ebp
  80010d:	89 e5                	mov    %esp,%ebp
  80010f:	83 ec 08             	sub    $0x8,%esp
  800112:	6a 00                	push   $0x0
  800114:	6a 00                	push   $0x0
  800116:	6a 00                	push   $0x0
  800118:	6a 00                	push   $0x0
  80011a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80011f:	ba 00 00 00 00       	mov    $0x0,%edx
  800124:	b8 01 00 00 00       	mov    $0x1,%eax
  800129:	e8 6f ff ff ff       	call   80009d <syscall>
  80012e:	c9                   	leave
  80012f:	c3                   	ret

00800130 <sys_env_destroy>:
  800130:	55                   	push   %ebp
  800131:	89 e5                	mov    %esp,%ebp
  800133:	83 ec 08             	sub    $0x8,%esp
  800136:	6a 00                	push   $0x0
  800138:	6a 00                	push   $0x0
  80013a:	6a 00                	push   $0x0
  80013c:	6a 00                	push   $0x0
  80013e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800141:	ba 01 00 00 00       	mov    $0x1,%edx
  800146:	b8 03 00 00 00       	mov    $0x3,%eax
  80014b:	e8 4d ff ff ff       	call   80009d <syscall>
  800150:	c9                   	leave
  800151:	c3                   	ret

00800152 <sys_getenvid>:
  800152:	55                   	push   %ebp
  800153:	89 e5                	mov    %esp,%ebp
  800155:	83 ec 08             	sub    $0x8,%esp
  800158:	6a 00                	push   $0x0
  80015a:	6a 00                	push   $0x0
  80015c:	6a 00                	push   $0x0
  80015e:	6a 00                	push   $0x0
  800160:	b9 00 00 00 00       	mov    $0x0,%ecx
  800165:	ba 00 00 00 00       	mov    $0x0,%edx
  80016a:	b8 02 00 00 00       	mov    $0x2,%eax
  80016f:	e8 29 ff ff ff       	call   80009d <syscall>
  800174:	c9                   	leave
  800175:	c3                   	ret

00800176 <sys_yield>:
  800176:	55                   	push   %ebp
  800177:	89 e5                	mov    %esp,%ebp
  800179:	83 ec 08             	sub    $0x8,%esp
  80017c:	6a 00                	push   $0x0
  80017e:	6a 00                	push   $0x0
  800180:	6a 00                	push   $0x0
  800182:	6a 00                	push   $0x0
  800184:	b9 00 00 00 00       	mov    $0x0,%ecx
  800189:	ba 00 00 00 00       	mov    $0x0,%edx
  80018e:	b8 0a 00 00 00       	mov    $0xa,%eax
  800193:	e8 05 ff ff ff       	call   80009d <syscall>
  800198:	83 c4 10             	add    $0x10,%esp
  80019b:	c9                   	leave
  80019c:	c3                   	ret

0080019d <sys_page_alloc>:
  80019d:	55                   	push   %ebp
  80019e:	89 e5                	mov    %esp,%ebp
  8001a0:	83 ec 08             	sub    $0x8,%esp
  8001a3:	6a 00                	push   $0x0
  8001a5:	6a 00                	push   $0x0
  8001a7:	ff 75 10             	push   0x10(%ebp)
  8001aa:	ff 75 0c             	push   0xc(%ebp)
  8001ad:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001b0:	ba 01 00 00 00       	mov    $0x1,%edx
  8001b5:	b8 04 00 00 00       	mov    $0x4,%eax
  8001ba:	e8 de fe ff ff       	call   80009d <syscall>
  8001bf:	c9                   	leave
  8001c0:	c3                   	ret

008001c1 <sys_page_map>:
  8001c1:	55                   	push   %ebp
  8001c2:	89 e5                	mov    %esp,%ebp
  8001c4:	83 ec 08             	sub    $0x8,%esp
  8001c7:	ff 75 18             	push   0x18(%ebp)
  8001ca:	ff 75 14             	push   0x14(%ebp)
  8001cd:	ff 75 10             	push   0x10(%ebp)
  8001d0:	ff 75 0c             	push   0xc(%ebp)
  8001d3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001d6:	ba 01 00 00 00       	mov    $0x1,%edx
  8001db:	b8 05 00 00 00       	mov    $0x5,%eax
  8001e0:	e8 b8 fe ff ff       	call   80009d <syscall>
  8001e5:	c9                   	leave
  8001e6:	c3                   	ret

008001e7 <sys_page_unmap>:
  8001e7:	55                   	push   %ebp
  8001e8:	89 e5                	mov    %esp,%ebp
  8001ea:	83 ec 08             	sub    $0x8,%esp
  8001ed:	6a 00                	push   $0x0
  8001ef:	6a 00                	push   $0x0
  8001f1:	6a 00                	push   $0x0
  8001f3:	ff 75 0c             	push   0xc(%ebp)
  8001f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001f9:	ba 01 00 00 00       	mov    $0x1,%edx
  8001fe:	b8 06 00 00 00       	mov    $0x6,%eax
  800203:	e8 95 fe ff ff       	call   80009d <syscall>
  800208:	c9                   	leave
  800209:	c3                   	ret

0080020a <sys_env_set_status>:
  80020a:	55                   	push   %ebp
  80020b:	89 e5                	mov    %esp,%ebp
  80020d:	83 ec 08             	sub    $0x8,%esp
  800210:	6a 00                	push   $0x0
  800212:	6a 00                	push   $0x0
  800214:	6a 00                	push   $0x0
  800216:	ff 75 0c             	push   0xc(%ebp)
  800219:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80021c:	ba 01 00 00 00       	mov    $0x1,%edx
  800221:	b8 08 00 00 00       	mov    $0x8,%eax
  800226:	e8 72 fe ff ff       	call   80009d <syscall>
  80022b:	c9                   	leave
  80022c:	c3                   	ret

0080022d <sys_env_set_pgfault_upcall>:
  80022d:	55                   	push   %ebp
  80022e:	89 e5                	mov    %esp,%ebp
  800230:	83 ec 08             	sub    $0x8,%esp
  800233:	6a 00                	push   $0x0
  800235:	6a 00                	push   $0x0
  800237:	6a 00                	push   $0x0
  800239:	ff 75 0c             	push   0xc(%ebp)
  80023c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80023f:	ba 01 00 00 00       	mov    $0x1,%edx
  800244:	b8 09 00 00 00       	mov    $0x9,%eax
  800249:	e8 4f fe ff ff       	call   80009d <syscall>
  80024e:	c9                   	leave
  80024f:	c3                   	ret

00800250 <sys_ipc_try_send>:
  800250:	55                   	push   %ebp
  800251:	89 e5                	mov    %esp,%ebp
  800253:	83 ec 08             	sub    $0x8,%esp
  800256:	6a 00                	push   $0x0
  800258:	ff 75 14             	push   0x14(%ebp)
  80025b:	ff 75 10             	push   0x10(%ebp)
  80025e:	ff 75 0c             	push   0xc(%ebp)
  800261:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800264:	ba 00 00 00 00       	mov    $0x0,%edx
  800269:	b8 0c 00 00 00       	mov    $0xc,%eax
  80026e:	e8 2a fe ff ff       	call   80009d <syscall>
  800273:	c9                   	leave
  800274:	c3                   	ret

00800275 <sys_ipc_recv>:
  800275:	55                   	push   %ebp
  800276:	89 e5                	mov    %esp,%ebp
  800278:	83 ec 08             	sub    $0x8,%esp
  80027b:	6a 00                	push   $0x0
  80027d:	6a 00                	push   $0x0
  80027f:	6a 00                	push   $0x0
  800281:	6a 00                	push   $0x0
  800283:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800286:	ba 01 00 00 00       	mov    $0x1,%edx
  80028b:	b8 0d 00 00 00       	mov    $0xd,%eax
  800290:	e8 08 fe ff ff       	call   80009d <syscall>
  800295:	c9                   	leave
  800296:	c3                   	ret

00800297 <_panic>:
  800297:	55                   	push   %ebp
  800298:	89 e5                	mov    %esp,%ebp
  80029a:	56                   	push   %esi
  80029b:	53                   	push   %ebx
  80029c:	8d 5d 14             	lea    0x14(%ebp),%ebx
  80029f:	8b 35 00 20 80 00    	mov    0x802000,%esi
  8002a5:	e8 a8 fe ff ff       	call   800152 <sys_getenvid>
  8002aa:	83 ec 0c             	sub    $0xc,%esp
  8002ad:	ff 75 0c             	push   0xc(%ebp)
  8002b0:	ff 75 08             	push   0x8(%ebp)
  8002b3:	56                   	push   %esi
  8002b4:	50                   	push   %eax
  8002b5:	68 50 0f 80 00       	push   $0x800f50
  8002ba:	e8 b3 00 00 00       	call   800372 <cprintf>
  8002bf:	83 c4 18             	add    $0x18,%esp
  8002c2:	53                   	push   %ebx
  8002c3:	ff 75 10             	push   0x10(%ebp)
  8002c6:	e8 56 00 00 00       	call   800321 <vcprintf>
  8002cb:	c7 04 24 95 0e 80 00 	movl   $0x800e95,(%esp)
  8002d2:	e8 9b 00 00 00       	call   800372 <cprintf>
  8002d7:	83 c4 10             	add    $0x10,%esp
  8002da:	cc                   	int3
  8002db:	eb fd                	jmp    8002da <_panic+0x43>

008002dd <putch>:
  8002dd:	55                   	push   %ebp
  8002de:	89 e5                	mov    %esp,%ebp
  8002e0:	53                   	push   %ebx
  8002e1:	83 ec 04             	sub    $0x4,%esp
  8002e4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8002e7:	8b 13                	mov    (%ebx),%edx
  8002e9:	8d 42 01             	lea    0x1(%edx),%eax
  8002ec:	89 03                	mov    %eax,(%ebx)
  8002ee:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8002f1:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  8002f5:	3d ff 00 00 00       	cmp    $0xff,%eax
  8002fa:	74 09                	je     800305 <putch+0x28>
  8002fc:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  800300:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800303:	c9                   	leave
  800304:	c3                   	ret
  800305:	83 ec 08             	sub    $0x8,%esp
  800308:	68 ff 00 00 00       	push   $0xff
  80030d:	8d 43 08             	lea    0x8(%ebx),%eax
  800310:	50                   	push   %eax
  800311:	e8 d0 fd ff ff       	call   8000e6 <sys_cputs>
  800316:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  80031c:	83 c4 10             	add    $0x10,%esp
  80031f:	eb db                	jmp    8002fc <putch+0x1f>

00800321 <vcprintf>:
  800321:	55                   	push   %ebp
  800322:	89 e5                	mov    %esp,%ebp
  800324:	81 ec 18 01 00 00    	sub    $0x118,%esp
  80032a:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  800331:	00 00 00 
  800334:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  80033b:	00 00 00 
  80033e:	ff 75 0c             	push   0xc(%ebp)
  800341:	ff 75 08             	push   0x8(%ebp)
  800344:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  80034a:	50                   	push   %eax
  80034b:	68 dd 02 80 00       	push   $0x8002dd
  800350:	e8 74 01 00 00       	call   8004c9 <vprintfmt>
  800355:	83 c4 08             	add    $0x8,%esp
  800358:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  80035e:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  800364:	50                   	push   %eax
  800365:	e8 7c fd ff ff       	call   8000e6 <sys_cputs>
  80036a:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  800370:	c9                   	leave
  800371:	c3                   	ret

00800372 <cprintf>:
  800372:	55                   	push   %ebp
  800373:	89 e5                	mov    %esp,%ebp
  800375:	83 ec 10             	sub    $0x10,%esp
  800378:	8d 45 0c             	lea    0xc(%ebp),%eax
  80037b:	50                   	push   %eax
  80037c:	ff 75 08             	push   0x8(%ebp)
  80037f:	e8 9d ff ff ff       	call   800321 <vcprintf>
  800384:	c9                   	leave
  800385:	c3                   	ret

00800386 <printnum>:
  800386:	55                   	push   %ebp
  800387:	89 e5                	mov    %esp,%ebp
  800389:	57                   	push   %edi
  80038a:	56                   	push   %esi
  80038b:	53                   	push   %ebx
  80038c:	83 ec 1c             	sub    $0x1c,%esp
  80038f:	89 c7                	mov    %eax,%edi
  800391:	89 d6                	mov    %edx,%esi
  800393:	8b 45 08             	mov    0x8(%ebp),%eax
  800396:	8b 55 0c             	mov    0xc(%ebp),%edx
  800399:	89 d1                	mov    %edx,%ecx
  80039b:	89 c2                	mov    %eax,%edx
  80039d:	89 45 d8             	mov    %eax,-0x28(%ebp)
  8003a0:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  8003a3:	8b 45 10             	mov    0x10(%ebp),%eax
  8003a6:	8b 5d 14             	mov    0x14(%ebp),%ebx
  8003a9:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8003ac:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  8003b3:	39 c2                	cmp    %eax,%edx
  8003b5:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  8003b8:	72 3e                	jb     8003f8 <printnum+0x72>
  8003ba:	83 ec 0c             	sub    $0xc,%esp
  8003bd:	ff 75 18             	push   0x18(%ebp)
  8003c0:	83 eb 01             	sub    $0x1,%ebx
  8003c3:	53                   	push   %ebx
  8003c4:	50                   	push   %eax
  8003c5:	83 ec 08             	sub    $0x8,%esp
  8003c8:	ff 75 e4             	push   -0x1c(%ebp)
  8003cb:	ff 75 e0             	push   -0x20(%ebp)
  8003ce:	ff 75 dc             	push   -0x24(%ebp)
  8003d1:	ff 75 d8             	push   -0x28(%ebp)
  8003d4:	e8 17 08 00 00       	call   800bf0 <__udivdi3>
  8003d9:	83 c4 18             	add    $0x18,%esp
  8003dc:	52                   	push   %edx
  8003dd:	50                   	push   %eax
  8003de:	89 f2                	mov    %esi,%edx
  8003e0:	89 f8                	mov    %edi,%eax
  8003e2:	e8 9f ff ff ff       	call   800386 <printnum>
  8003e7:	83 c4 20             	add    $0x20,%esp
  8003ea:	eb 13                	jmp    8003ff <printnum+0x79>
  8003ec:	83 ec 08             	sub    $0x8,%esp
  8003ef:	56                   	push   %esi
  8003f0:	ff 75 18             	push   0x18(%ebp)
  8003f3:	ff d7                	call   *%edi
  8003f5:	83 c4 10             	add    $0x10,%esp
  8003f8:	83 eb 01             	sub    $0x1,%ebx
  8003fb:	85 db                	test   %ebx,%ebx
  8003fd:	7f ed                	jg     8003ec <printnum+0x66>
  8003ff:	83 ec 08             	sub    $0x8,%esp
  800402:	56                   	push   %esi
  800403:	83 ec 04             	sub    $0x4,%esp
  800406:	ff 75 e4             	push   -0x1c(%ebp)
  800409:	ff 75 e0             	push   -0x20(%ebp)
  80040c:	ff 75 dc             	push   -0x24(%ebp)
  80040f:	ff 75 d8             	push   -0x28(%ebp)
  800412:	e8 f9 08 00 00       	call   800d10 <__umoddi3>
  800417:	83 c4 14             	add    $0x14,%esp
  80041a:	0f be 80 97 0e 80 00 	movsbl 0x800e97(%eax),%eax
  800421:	50                   	push   %eax
  800422:	ff d7                	call   *%edi
  800424:	83 c4 10             	add    $0x10,%esp
  800427:	8d 65 f4             	lea    -0xc(%ebp),%esp
  80042a:	5b                   	pop    %ebx
  80042b:	5e                   	pop    %esi
  80042c:	5f                   	pop    %edi
  80042d:	5d                   	pop    %ebp
  80042e:	c3                   	ret

0080042f <getuint>:
  80042f:	83 fa 01             	cmp    $0x1,%edx
  800432:	7f 13                	jg     800447 <getuint+0x18>
  800434:	85 d2                	test   %edx,%edx
  800436:	74 1c                	je     800454 <getuint+0x25>
  800438:	8b 10                	mov    (%eax),%edx
  80043a:	8d 4a 04             	lea    0x4(%edx),%ecx
  80043d:	89 08                	mov    %ecx,(%eax)
  80043f:	8b 02                	mov    (%edx),%eax
  800441:	ba 00 00 00 00       	mov    $0x0,%edx
  800446:	c3                   	ret
  800447:	8b 10                	mov    (%eax),%edx
  800449:	8d 4a 08             	lea    0x8(%edx),%ecx
  80044c:	89 08                	mov    %ecx,(%eax)
  80044e:	8b 02                	mov    (%edx),%eax
  800450:	8b 52 04             	mov    0x4(%edx),%edx
  800453:	c3                   	ret
  800454:	8b 10                	mov    (%eax),%edx
  800456:	8d 4a 04             	lea    0x4(%edx),%ecx
  800459:	89 08                	mov    %ecx,(%eax)
  80045b:	8b 02                	mov    (%edx),%eax
  80045d:	ba 00 00 00 00       	mov    $0x0,%edx
  800462:	c3                   	ret

00800463 <getint>:
  800463:	83 fa 01             	cmp    $0x1,%edx
  800466:	7f 0f                	jg     800477 <getint+0x14>
  800468:	85 d2                	test   %edx,%edx
  80046a:	74 18                	je     800484 <getint+0x21>
  80046c:	8b 10                	mov    (%eax),%edx
  80046e:	8d 4a 04             	lea    0x4(%edx),%ecx
  800471:	89 08                	mov    %ecx,(%eax)
  800473:	8b 02                	mov    (%edx),%eax
  800475:	99                   	cltd
  800476:	c3                   	ret
  800477:	8b 10                	mov    (%eax),%edx
  800479:	8d 4a 08             	lea    0x8(%edx),%ecx
  80047c:	89 08                	mov    %ecx,(%eax)
  80047e:	8b 02                	mov    (%edx),%eax
  800480:	8b 52 04             	mov    0x4(%edx),%edx
  800483:	c3                   	ret
  800484:	8b 10                	mov    (%eax),%edx
  800486:	8d 4a 04             	lea    0x4(%edx),%ecx
  800489:	89 08                	mov    %ecx,(%eax)
  80048b:	8b 02                	mov    (%edx),%eax
  80048d:	99                   	cltd
  80048e:	c3                   	ret

0080048f <sprintputch>:
  80048f:	55                   	push   %ebp
  800490:	89 e5                	mov    %esp,%ebp
  800492:	8b 45 0c             	mov    0xc(%ebp),%eax
  800495:	83 40 08 01          	addl   $0x1,0x8(%eax)
  800499:	8b 10                	mov    (%eax),%edx
  80049b:	3b 50 04             	cmp    0x4(%eax),%edx
  80049e:	73 0a                	jae    8004aa <sprintputch+0x1b>
  8004a0:	8d 4a 01             	lea    0x1(%edx),%ecx
  8004a3:	89 08                	mov    %ecx,(%eax)
  8004a5:	8b 45 08             	mov    0x8(%ebp),%eax
  8004a8:	88 02                	mov    %al,(%edx)
  8004aa:	5d                   	pop    %ebp
  8004ab:	c3                   	ret

008004ac <printfmt>:
  8004ac:	55                   	push   %ebp
  8004ad:	89 e5                	mov    %esp,%ebp
  8004af:	83 ec 08             	sub    $0x8,%esp
  8004b2:	8d 45 14             	lea    0x14(%ebp),%eax
  8004b5:	50                   	push   %eax
  8004b6:	ff 75 10             	push   0x10(%ebp)
  8004b9:	ff 75 0c             	push   0xc(%ebp)
  8004bc:	ff 75 08             	push   0x8(%ebp)
  8004bf:	e8 05 00 00 00       	call   8004c9 <vprintfmt>
  8004c4:	83 c4 10             	add    $0x10,%esp
  8004c7:	c9                   	leave
  8004c8:	c3                   	ret

008004c9 <vprintfmt>:
  8004c9:	55                   	push   %ebp
  8004ca:	89 e5                	mov    %esp,%ebp
  8004cc:	57                   	push   %edi
  8004cd:	56                   	push   %esi
  8004ce:	53                   	push   %ebx
  8004cf:	83 ec 2c             	sub    $0x2c,%esp
  8004d2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8004d5:	8b 75 0c             	mov    0xc(%ebp),%esi
  8004d8:	8b 7d 10             	mov    0x10(%ebp),%edi
  8004db:	eb 0a                	jmp    8004e7 <vprintfmt+0x1e>
  8004dd:	83 ec 08             	sub    $0x8,%esp
  8004e0:	56                   	push   %esi
  8004e1:	50                   	push   %eax
  8004e2:	ff d3                	call   *%ebx
  8004e4:	83 c4 10             	add    $0x10,%esp
  8004e7:	83 c7 01             	add    $0x1,%edi
  8004ea:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  8004ee:	83 f8 25             	cmp    $0x25,%eax
  8004f1:	74 0c                	je     8004ff <vprintfmt+0x36>
  8004f3:	85 c0                	test   %eax,%eax
  8004f5:	75 e6                	jne    8004dd <vprintfmt+0x14>
  8004f7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8004fa:	5b                   	pop    %ebx
  8004fb:	5e                   	pop    %esi
  8004fc:	5f                   	pop    %edi
  8004fd:	5d                   	pop    %ebp
  8004fe:	c3                   	ret
  8004ff:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  800503:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  80050a:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800511:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  800518:	b9 00 00 00 00       	mov    $0x0,%ecx
  80051d:	8d 47 01             	lea    0x1(%edi),%eax
  800520:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800523:	0f b6 17             	movzbl (%edi),%edx
  800526:	8d 42 dd             	lea    -0x23(%edx),%eax
  800529:	3c 55                	cmp    $0x55,%al
  80052b:	0f 87 c3 02 00 00    	ja     8007f4 <vprintfmt+0x32b>
  800531:	0f b6 c0             	movzbl %al,%eax
  800534:	ff 24 85 80 0f 80 00 	jmp    *0x800f80(,%eax,4)
  80053b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80053e:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  800542:	eb d9                	jmp    80051d <vprintfmt+0x54>
  800544:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800547:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  80054b:	eb d0                	jmp    80051d <vprintfmt+0x54>
  80054d:	0f b6 d2             	movzbl %dl,%edx
  800550:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800553:	b8 00 00 00 00       	mov    $0x0,%eax
  800558:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  80055b:	8d 04 80             	lea    (%eax,%eax,4),%eax
  80055e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  800562:	0f be 17             	movsbl (%edi),%edx
  800565:	8d 4a d0             	lea    -0x30(%edx),%ecx
  800568:	83 f9 09             	cmp    $0x9,%ecx
  80056b:	77 52                	ja     8005bf <vprintfmt+0xf6>
  80056d:	83 c7 01             	add    $0x1,%edi
  800570:	eb e9                	jmp    80055b <vprintfmt+0x92>
  800572:	8b 45 14             	mov    0x14(%ebp),%eax
  800575:	8d 50 04             	lea    0x4(%eax),%edx
  800578:	89 55 14             	mov    %edx,0x14(%ebp)
  80057b:	8b 00                	mov    (%eax),%eax
  80057d:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800580:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800583:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800587:	79 94                	jns    80051d <vprintfmt+0x54>
  800589:	8b 45 d0             	mov    -0x30(%ebp),%eax
  80058c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80058f:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800596:	eb 85                	jmp    80051d <vprintfmt+0x54>
  800598:	8b 55 e0             	mov    -0x20(%ebp),%edx
  80059b:	85 d2                	test   %edx,%edx
  80059d:	b8 00 00 00 00       	mov    $0x0,%eax
  8005a2:	0f 49 c2             	cmovns %edx,%eax
  8005a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8005a8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005ab:	e9 6d ff ff ff       	jmp    80051d <vprintfmt+0x54>
  8005b0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005b3:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  8005ba:	e9 5e ff ff ff       	jmp    80051d <vprintfmt+0x54>
  8005bf:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  8005c2:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8005c5:	eb bc                	jmp    800583 <vprintfmt+0xba>
  8005c7:	83 c1 01             	add    $0x1,%ecx
  8005ca:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005cd:	e9 4b ff ff ff       	jmp    80051d <vprintfmt+0x54>
  8005d2:	8b 45 14             	mov    0x14(%ebp),%eax
  8005d5:	8d 50 04             	lea    0x4(%eax),%edx
  8005d8:	89 55 14             	mov    %edx,0x14(%ebp)
  8005db:	83 ec 08             	sub    $0x8,%esp
  8005de:	56                   	push   %esi
  8005df:	ff 30                	push   (%eax)
  8005e1:	ff d3                	call   *%ebx
  8005e3:	83 c4 10             	add    $0x10,%esp
  8005e6:	e9 a0 01 00 00       	jmp    80078b <vprintfmt+0x2c2>
  8005eb:	8b 45 14             	mov    0x14(%ebp),%eax
  8005ee:	8d 50 04             	lea    0x4(%eax),%edx
  8005f1:	89 55 14             	mov    %edx,0x14(%ebp)
  8005f4:	8b 10                	mov    (%eax),%edx
  8005f6:	89 d0                	mov    %edx,%eax
  8005f8:	f7 d8                	neg    %eax
  8005fa:	0f 48 c2             	cmovs  %edx,%eax
  8005fd:	83 f8 08             	cmp    $0x8,%eax
  800600:	7f 20                	jg     800622 <vprintfmt+0x159>
  800602:	8b 14 85 e0 10 80 00 	mov    0x8010e0(,%eax,4),%edx
  800609:	85 d2                	test   %edx,%edx
  80060b:	74 15                	je     800622 <vprintfmt+0x159>
  80060d:	52                   	push   %edx
  80060e:	68 b8 0e 80 00       	push   $0x800eb8
  800613:	56                   	push   %esi
  800614:	53                   	push   %ebx
  800615:	e8 92 fe ff ff       	call   8004ac <printfmt>
  80061a:	83 c4 10             	add    $0x10,%esp
  80061d:	e9 69 01 00 00       	jmp    80078b <vprintfmt+0x2c2>
  800622:	50                   	push   %eax
  800623:	68 af 0e 80 00       	push   $0x800eaf
  800628:	56                   	push   %esi
  800629:	53                   	push   %ebx
  80062a:	e8 7d fe ff ff       	call   8004ac <printfmt>
  80062f:	83 c4 10             	add    $0x10,%esp
  800632:	e9 54 01 00 00       	jmp    80078b <vprintfmt+0x2c2>
  800637:	8b 45 14             	mov    0x14(%ebp),%eax
  80063a:	8d 50 04             	lea    0x4(%eax),%edx
  80063d:	89 55 14             	mov    %edx,0x14(%ebp)
  800640:	8b 08                	mov    (%eax),%ecx
  800642:	85 c9                	test   %ecx,%ecx
  800644:	b8 a8 0e 80 00       	mov    $0x800ea8,%eax
  800649:	0f 45 c1             	cmovne %ecx,%eax
  80064c:	89 45 cc             	mov    %eax,-0x34(%ebp)
  80064f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800653:	7e 06                	jle    80065b <vprintfmt+0x192>
  800655:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  800659:	75 0b                	jne    800666 <vprintfmt+0x19d>
  80065b:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  80065e:	8b 7d d0             	mov    -0x30(%ebp),%edi
  800661:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800664:	eb 5c                	jmp    8006c2 <vprintfmt+0x1f9>
  800666:	83 ec 08             	sub    $0x8,%esp
  800669:	ff 75 d0             	push   -0x30(%ebp)
  80066c:	ff 75 cc             	push   -0x34(%ebp)
  80066f:	e8 20 02 00 00       	call   800894 <strnlen>
  800674:	89 c2                	mov    %eax,%edx
  800676:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800679:	29 d0                	sub    %edx,%eax
  80067b:	83 c4 10             	add    $0x10,%esp
  80067e:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  800682:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800685:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800688:	89 c3                	mov    %eax,%ebx
  80068a:	eb 0e                	jmp    80069a <vprintfmt+0x1d1>
  80068c:	83 ec 08             	sub    $0x8,%esp
  80068f:	56                   	push   %esi
  800690:	57                   	push   %edi
  800691:	ff 55 08             	call   *0x8(%ebp)
  800694:	83 eb 01             	sub    $0x1,%ebx
  800697:	83 c4 10             	add    $0x10,%esp
  80069a:	85 db                	test   %ebx,%ebx
  80069c:	7f ee                	jg     80068c <vprintfmt+0x1c3>
  80069e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8006a1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8006a4:	85 c0                	test   %eax,%eax
  8006a6:	ba 00 00 00 00       	mov    $0x0,%edx
  8006ab:	0f 49 d0             	cmovns %eax,%edx
  8006ae:	29 d0                	sub    %edx,%eax
  8006b0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8006b3:	eb a6                	jmp    80065b <vprintfmt+0x192>
  8006b5:	83 ec 08             	sub    $0x8,%esp
  8006b8:	56                   	push   %esi
  8006b9:	52                   	push   %edx
  8006ba:	ff 55 08             	call   *0x8(%ebp)
  8006bd:	83 c4 10             	add    $0x10,%esp
  8006c0:	89 d9                	mov    %ebx,%ecx
  8006c2:	8d 59 01             	lea    0x1(%ecx),%ebx
  8006c5:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  8006c9:	0f be d0             	movsbl %al,%edx
  8006cc:	85 d2                	test   %edx,%edx
  8006ce:	74 28                	je     8006f8 <vprintfmt+0x22f>
  8006d0:	85 ff                	test   %edi,%edi
  8006d2:	78 05                	js     8006d9 <vprintfmt+0x210>
  8006d4:	83 ef 01             	sub    $0x1,%edi
  8006d7:	78 2e                	js     800707 <vprintfmt+0x23e>
  8006d9:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  8006dd:	74 d6                	je     8006b5 <vprintfmt+0x1ec>
  8006df:	0f be c0             	movsbl %al,%eax
  8006e2:	83 e8 20             	sub    $0x20,%eax
  8006e5:	83 f8 5e             	cmp    $0x5e,%eax
  8006e8:	76 cb                	jbe    8006b5 <vprintfmt+0x1ec>
  8006ea:	83 ec 08             	sub    $0x8,%esp
  8006ed:	56                   	push   %esi
  8006ee:	6a 3f                	push   $0x3f
  8006f0:	ff 55 08             	call   *0x8(%ebp)
  8006f3:	83 c4 10             	add    $0x10,%esp
  8006f6:	eb c8                	jmp    8006c0 <vprintfmt+0x1f7>
  8006f8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8006fb:	8b 7d cc             	mov    -0x34(%ebp),%edi
  8006fe:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800701:	01 c7                	add    %eax,%edi
  800703:	29 cf                	sub    %ecx,%edi
  800705:	eb 13                	jmp    80071a <vprintfmt+0x251>
  800707:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80070a:	eb ef                	jmp    8006fb <vprintfmt+0x232>
  80070c:	83 ec 08             	sub    $0x8,%esp
  80070f:	56                   	push   %esi
  800710:	6a 20                	push   $0x20
  800712:	ff d3                	call   *%ebx
  800714:	83 ef 01             	sub    $0x1,%edi
  800717:	83 c4 10             	add    $0x10,%esp
  80071a:	85 ff                	test   %edi,%edi
  80071c:	7f ee                	jg     80070c <vprintfmt+0x243>
  80071e:	eb 6b                	jmp    80078b <vprintfmt+0x2c2>
  800720:	89 ca                	mov    %ecx,%edx
  800722:	8d 45 14             	lea    0x14(%ebp),%eax
  800725:	e8 39 fd ff ff       	call   800463 <getint>
  80072a:	89 45 d8             	mov    %eax,-0x28(%ebp)
  80072d:	89 55 dc             	mov    %edx,-0x24(%ebp)
  800730:	85 d2                	test   %edx,%edx
  800732:	78 0b                	js     80073f <vprintfmt+0x276>
  800734:	89 d1                	mov    %edx,%ecx
  800736:	89 c2                	mov    %eax,%edx
  800738:	bf 0a 00 00 00       	mov    $0xa,%edi
  80073d:	eb 32                	jmp    800771 <vprintfmt+0x2a8>
  80073f:	83 ec 08             	sub    $0x8,%esp
  800742:	56                   	push   %esi
  800743:	6a 2d                	push   $0x2d
  800745:	ff d3                	call   *%ebx
  800747:	8b 55 d8             	mov    -0x28(%ebp),%edx
  80074a:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  80074d:	f7 da                	neg    %edx
  80074f:	83 d1 00             	adc    $0x0,%ecx
  800752:	f7 d9                	neg    %ecx
  800754:	83 c4 10             	add    $0x10,%esp
  800757:	bf 0a 00 00 00       	mov    $0xa,%edi
  80075c:	eb 13                	jmp    800771 <vprintfmt+0x2a8>
  80075e:	89 ca                	mov    %ecx,%edx
  800760:	8d 45 14             	lea    0x14(%ebp),%eax
  800763:	e8 c7 fc ff ff       	call   80042f <getuint>
  800768:	89 d1                	mov    %edx,%ecx
  80076a:	89 c2                	mov    %eax,%edx
  80076c:	bf 0a 00 00 00       	mov    $0xa,%edi
  800771:	83 ec 0c             	sub    $0xc,%esp
  800774:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  800778:	50                   	push   %eax
  800779:	ff 75 e0             	push   -0x20(%ebp)
  80077c:	57                   	push   %edi
  80077d:	51                   	push   %ecx
  80077e:	52                   	push   %edx
  80077f:	89 f2                	mov    %esi,%edx
  800781:	89 d8                	mov    %ebx,%eax
  800783:	e8 fe fb ff ff       	call   800386 <printnum>
  800788:	83 c4 20             	add    $0x20,%esp
  80078b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80078e:	e9 54 fd ff ff       	jmp    8004e7 <vprintfmt+0x1e>
  800793:	89 ca                	mov    %ecx,%edx
  800795:	8d 45 14             	lea    0x14(%ebp),%eax
  800798:	e8 92 fc ff ff       	call   80042f <getuint>
  80079d:	89 d1                	mov    %edx,%ecx
  80079f:	89 c2                	mov    %eax,%edx
  8007a1:	bf 08 00 00 00       	mov    $0x8,%edi
  8007a6:	eb c9                	jmp    800771 <vprintfmt+0x2a8>
  8007a8:	83 ec 08             	sub    $0x8,%esp
  8007ab:	56                   	push   %esi
  8007ac:	6a 30                	push   $0x30
  8007ae:	ff d3                	call   *%ebx
  8007b0:	83 c4 08             	add    $0x8,%esp
  8007b3:	56                   	push   %esi
  8007b4:	6a 78                	push   $0x78
  8007b6:	ff d3                	call   *%ebx
  8007b8:	8b 45 14             	mov    0x14(%ebp),%eax
  8007bb:	8d 50 04             	lea    0x4(%eax),%edx
  8007be:	89 55 14             	mov    %edx,0x14(%ebp)
  8007c1:	8b 10                	mov    (%eax),%edx
  8007c3:	b9 00 00 00 00       	mov    $0x0,%ecx
  8007c8:	83 c4 10             	add    $0x10,%esp
  8007cb:	bf 10 00 00 00       	mov    $0x10,%edi
  8007d0:	eb 9f                	jmp    800771 <vprintfmt+0x2a8>
  8007d2:	89 ca                	mov    %ecx,%edx
  8007d4:	8d 45 14             	lea    0x14(%ebp),%eax
  8007d7:	e8 53 fc ff ff       	call   80042f <getuint>
  8007dc:	89 d1                	mov    %edx,%ecx
  8007de:	89 c2                	mov    %eax,%edx
  8007e0:	bf 10 00 00 00       	mov    $0x10,%edi
  8007e5:	eb 8a                	jmp    800771 <vprintfmt+0x2a8>
  8007e7:	83 ec 08             	sub    $0x8,%esp
  8007ea:	56                   	push   %esi
  8007eb:	6a 25                	push   $0x25
  8007ed:	ff d3                	call   *%ebx
  8007ef:	83 c4 10             	add    $0x10,%esp
  8007f2:	eb 97                	jmp    80078b <vprintfmt+0x2c2>
  8007f4:	83 ec 08             	sub    $0x8,%esp
  8007f7:	56                   	push   %esi
  8007f8:	6a 25                	push   $0x25
  8007fa:	ff d3                	call   *%ebx
  8007fc:	83 c4 10             	add    $0x10,%esp
  8007ff:	89 f8                	mov    %edi,%eax
  800801:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  800805:	74 05                	je     80080c <vprintfmt+0x343>
  800807:	83 e8 01             	sub    $0x1,%eax
  80080a:	eb f5                	jmp    800801 <vprintfmt+0x338>
  80080c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  80080f:	e9 77 ff ff ff       	jmp    80078b <vprintfmt+0x2c2>

00800814 <vsnprintf>:
  800814:	55                   	push   %ebp
  800815:	89 e5                	mov    %esp,%ebp
  800817:	83 ec 18             	sub    $0x18,%esp
  80081a:	8b 45 08             	mov    0x8(%ebp),%eax
  80081d:	8b 55 0c             	mov    0xc(%ebp),%edx
  800820:	89 45 ec             	mov    %eax,-0x14(%ebp)
  800823:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  800827:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  80082a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  800831:	85 c0                	test   %eax,%eax
  800833:	74 26                	je     80085b <vsnprintf+0x47>
  800835:	85 d2                	test   %edx,%edx
  800837:	7e 22                	jle    80085b <vsnprintf+0x47>
  800839:	ff 75 14             	push   0x14(%ebp)
  80083c:	ff 75 10             	push   0x10(%ebp)
  80083f:	8d 45 ec             	lea    -0x14(%ebp),%eax
  800842:	50                   	push   %eax
  800843:	68 8f 04 80 00       	push   $0x80048f
  800848:	e8 7c fc ff ff       	call   8004c9 <vprintfmt>
  80084d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  800850:	c6 00 00             	movb   $0x0,(%eax)
  800853:	8b 45 f4             	mov    -0xc(%ebp),%eax
  800856:	83 c4 10             	add    $0x10,%esp
  800859:	c9                   	leave
  80085a:	c3                   	ret
  80085b:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800860:	eb f7                	jmp    800859 <vsnprintf+0x45>

00800862 <snprintf>:
  800862:	55                   	push   %ebp
  800863:	89 e5                	mov    %esp,%ebp
  800865:	83 ec 08             	sub    $0x8,%esp
  800868:	8d 45 14             	lea    0x14(%ebp),%eax
  80086b:	50                   	push   %eax
  80086c:	ff 75 10             	push   0x10(%ebp)
  80086f:	ff 75 0c             	push   0xc(%ebp)
  800872:	ff 75 08             	push   0x8(%ebp)
  800875:	e8 9a ff ff ff       	call   800814 <vsnprintf>
  80087a:	c9                   	leave
  80087b:	c3                   	ret

0080087c <strlen>:
  80087c:	55                   	push   %ebp
  80087d:	89 e5                	mov    %esp,%ebp
  80087f:	8b 55 08             	mov    0x8(%ebp),%edx
  800882:	b8 00 00 00 00       	mov    $0x0,%eax
  800887:	eb 03                	jmp    80088c <strlen+0x10>
  800889:	83 c0 01             	add    $0x1,%eax
  80088c:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  800890:	75 f7                	jne    800889 <strlen+0xd>
  800892:	5d                   	pop    %ebp
  800893:	c3                   	ret

00800894 <strnlen>:
  800894:	55                   	push   %ebp
  800895:	89 e5                	mov    %esp,%ebp
  800897:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80089a:	8b 55 0c             	mov    0xc(%ebp),%edx
  80089d:	b8 00 00 00 00       	mov    $0x0,%eax
  8008a2:	eb 03                	jmp    8008a7 <strnlen+0x13>
  8008a4:	83 c0 01             	add    $0x1,%eax
  8008a7:	39 d0                	cmp    %edx,%eax
  8008a9:	74 08                	je     8008b3 <strnlen+0x1f>
  8008ab:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  8008af:	75 f3                	jne    8008a4 <strnlen+0x10>
  8008b1:	89 c2                	mov    %eax,%edx
  8008b3:	89 d0                	mov    %edx,%eax
  8008b5:	5d                   	pop    %ebp
  8008b6:	c3                   	ret

008008b7 <strcpy>:
  8008b7:	55                   	push   %ebp
  8008b8:	89 e5                	mov    %esp,%ebp
  8008ba:	53                   	push   %ebx
  8008bb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8008be:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8008c1:	b8 00 00 00 00       	mov    $0x0,%eax
  8008c6:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  8008ca:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  8008cd:	83 c0 01             	add    $0x1,%eax
  8008d0:	84 d2                	test   %dl,%dl
  8008d2:	75 f2                	jne    8008c6 <strcpy+0xf>
  8008d4:	89 c8                	mov    %ecx,%eax
  8008d6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8008d9:	c9                   	leave
  8008da:	c3                   	ret

008008db <strcat>:
  8008db:	55                   	push   %ebp
  8008dc:	89 e5                	mov    %esp,%ebp
  8008de:	53                   	push   %ebx
  8008df:	83 ec 10             	sub    $0x10,%esp
  8008e2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8008e5:	53                   	push   %ebx
  8008e6:	e8 91 ff ff ff       	call   80087c <strlen>
  8008eb:	83 c4 08             	add    $0x8,%esp
  8008ee:	ff 75 0c             	push   0xc(%ebp)
  8008f1:	01 d8                	add    %ebx,%eax
  8008f3:	50                   	push   %eax
  8008f4:	e8 be ff ff ff       	call   8008b7 <strcpy>
  8008f9:	89 d8                	mov    %ebx,%eax
  8008fb:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8008fe:	c9                   	leave
  8008ff:	c3                   	ret

00800900 <strncpy>:
  800900:	55                   	push   %ebp
  800901:	89 e5                	mov    %esp,%ebp
  800903:	56                   	push   %esi
  800904:	53                   	push   %ebx
  800905:	8b 75 08             	mov    0x8(%ebp),%esi
  800908:	8b 55 0c             	mov    0xc(%ebp),%edx
  80090b:	89 f3                	mov    %esi,%ebx
  80090d:	03 5d 10             	add    0x10(%ebp),%ebx
  800910:	89 f0                	mov    %esi,%eax
  800912:	eb 0f                	jmp    800923 <strncpy+0x23>
  800914:	83 c0 01             	add    $0x1,%eax
  800917:	0f b6 0a             	movzbl (%edx),%ecx
  80091a:	88 48 ff             	mov    %cl,-0x1(%eax)
  80091d:	80 f9 01             	cmp    $0x1,%cl
  800920:	83 da ff             	sbb    $0xffffffff,%edx
  800923:	39 d8                	cmp    %ebx,%eax
  800925:	75 ed                	jne    800914 <strncpy+0x14>
  800927:	89 f0                	mov    %esi,%eax
  800929:	5b                   	pop    %ebx
  80092a:	5e                   	pop    %esi
  80092b:	5d                   	pop    %ebp
  80092c:	c3                   	ret

0080092d <strlcpy>:
  80092d:	55                   	push   %ebp
  80092e:	89 e5                	mov    %esp,%ebp
  800930:	56                   	push   %esi
  800931:	53                   	push   %ebx
  800932:	8b 75 08             	mov    0x8(%ebp),%esi
  800935:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800938:	8b 55 10             	mov    0x10(%ebp),%edx
  80093b:	89 f0                	mov    %esi,%eax
  80093d:	85 d2                	test   %edx,%edx
  80093f:	74 21                	je     800962 <strlcpy+0x35>
  800941:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  800945:	89 f2                	mov    %esi,%edx
  800947:	eb 09                	jmp    800952 <strlcpy+0x25>
  800949:	83 c1 01             	add    $0x1,%ecx
  80094c:	83 c2 01             	add    $0x1,%edx
  80094f:	88 5a ff             	mov    %bl,-0x1(%edx)
  800952:	39 c2                	cmp    %eax,%edx
  800954:	74 09                	je     80095f <strlcpy+0x32>
  800956:	0f b6 19             	movzbl (%ecx),%ebx
  800959:	84 db                	test   %bl,%bl
  80095b:	75 ec                	jne    800949 <strlcpy+0x1c>
  80095d:	89 d0                	mov    %edx,%eax
  80095f:	c6 00 00             	movb   $0x0,(%eax)
  800962:	29 f0                	sub    %esi,%eax
  800964:	5b                   	pop    %ebx
  800965:	5e                   	pop    %esi
  800966:	5d                   	pop    %ebp
  800967:	c3                   	ret

00800968 <strcmp>:
  800968:	55                   	push   %ebp
  800969:	89 e5                	mov    %esp,%ebp
  80096b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80096e:	8b 55 0c             	mov    0xc(%ebp),%edx
  800971:	eb 06                	jmp    800979 <strcmp+0x11>
  800973:	83 c1 01             	add    $0x1,%ecx
  800976:	83 c2 01             	add    $0x1,%edx
  800979:	0f b6 01             	movzbl (%ecx),%eax
  80097c:	84 c0                	test   %al,%al
  80097e:	74 04                	je     800984 <strcmp+0x1c>
  800980:	3a 02                	cmp    (%edx),%al
  800982:	74 ef                	je     800973 <strcmp+0xb>
  800984:	0f b6 c0             	movzbl %al,%eax
  800987:	0f b6 12             	movzbl (%edx),%edx
  80098a:	29 d0                	sub    %edx,%eax
  80098c:	5d                   	pop    %ebp
  80098d:	c3                   	ret

0080098e <strncmp>:
  80098e:	55                   	push   %ebp
  80098f:	89 e5                	mov    %esp,%ebp
  800991:	53                   	push   %ebx
  800992:	8b 45 08             	mov    0x8(%ebp),%eax
  800995:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800998:	8b 55 10             	mov    0x10(%ebp),%edx
  80099b:	eb 09                	jmp    8009a6 <strncmp+0x18>
  80099d:	83 ea 01             	sub    $0x1,%edx
  8009a0:	83 c0 01             	add    $0x1,%eax
  8009a3:	83 c1 01             	add    $0x1,%ecx
  8009a6:	85 d2                	test   %edx,%edx
  8009a8:	74 18                	je     8009c2 <strncmp+0x34>
  8009aa:	0f b6 18             	movzbl (%eax),%ebx
  8009ad:	84 db                	test   %bl,%bl
  8009af:	74 04                	je     8009b5 <strncmp+0x27>
  8009b1:	3a 19                	cmp    (%ecx),%bl
  8009b3:	74 e8                	je     80099d <strncmp+0xf>
  8009b5:	0f b6 00             	movzbl (%eax),%eax
  8009b8:	0f b6 11             	movzbl (%ecx),%edx
  8009bb:	29 d0                	sub    %edx,%eax
  8009bd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8009c0:	c9                   	leave
  8009c1:	c3                   	ret
  8009c2:	b8 00 00 00 00       	mov    $0x0,%eax
  8009c7:	eb f4                	jmp    8009bd <strncmp+0x2f>

008009c9 <strchr>:
  8009c9:	55                   	push   %ebp
  8009ca:	89 e5                	mov    %esp,%ebp
  8009cc:	8b 45 08             	mov    0x8(%ebp),%eax
  8009cf:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8009d3:	eb 03                	jmp    8009d8 <strchr+0xf>
  8009d5:	83 c0 01             	add    $0x1,%eax
  8009d8:	0f b6 10             	movzbl (%eax),%edx
  8009db:	84 d2                	test   %dl,%dl
  8009dd:	74 06                	je     8009e5 <strchr+0x1c>
  8009df:	38 ca                	cmp    %cl,%dl
  8009e1:	75 f2                	jne    8009d5 <strchr+0xc>
  8009e3:	eb 05                	jmp    8009ea <strchr+0x21>
  8009e5:	b8 00 00 00 00       	mov    $0x0,%eax
  8009ea:	5d                   	pop    %ebp
  8009eb:	c3                   	ret

008009ec <strfind>:
  8009ec:	55                   	push   %ebp
  8009ed:	89 e5                	mov    %esp,%ebp
  8009ef:	8b 45 08             	mov    0x8(%ebp),%eax
  8009f2:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8009f6:	0f b6 10             	movzbl (%eax),%edx
  8009f9:	38 ca                	cmp    %cl,%dl
  8009fb:	74 09                	je     800a06 <strfind+0x1a>
  8009fd:	84 d2                	test   %dl,%dl
  8009ff:	74 05                	je     800a06 <strfind+0x1a>
  800a01:	83 c0 01             	add    $0x1,%eax
  800a04:	eb f0                	jmp    8009f6 <strfind+0xa>
  800a06:	5d                   	pop    %ebp
  800a07:	c3                   	ret

00800a08 <memset>:
  800a08:	55                   	push   %ebp
  800a09:	89 e5                	mov    %esp,%ebp
  800a0b:	57                   	push   %edi
  800a0c:	8b 55 08             	mov    0x8(%ebp),%edx
  800a0f:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800a12:	85 c9                	test   %ecx,%ecx
  800a14:	74 24                	je     800a3a <memset+0x32>
  800a16:	89 d0                	mov    %edx,%eax
  800a18:	09 c8                	or     %ecx,%eax
  800a1a:	a8 03                	test   $0x3,%al
  800a1c:	75 14                	jne    800a32 <memset+0x2a>
  800a1e:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  800a22:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  800a28:	c1 e9 02             	shr    $0x2,%ecx
  800a2b:	89 d7                	mov    %edx,%edi
  800a2d:	fc                   	cld
  800a2e:	f3 ab                	rep stos %eax,%es:(%edi)
  800a30:	eb 08                	jmp    800a3a <memset+0x32>
  800a32:	89 d7                	mov    %edx,%edi
  800a34:	8b 45 0c             	mov    0xc(%ebp),%eax
  800a37:	fc                   	cld
  800a38:	f3 aa                	rep stos %al,%es:(%edi)
  800a3a:	89 d0                	mov    %edx,%eax
  800a3c:	8b 7d fc             	mov    -0x4(%ebp),%edi
  800a3f:	c9                   	leave
  800a40:	c3                   	ret

00800a41 <memmove>:
  800a41:	55                   	push   %ebp
  800a42:	89 e5                	mov    %esp,%ebp
  800a44:	57                   	push   %edi
  800a45:	56                   	push   %esi
  800a46:	8b 45 08             	mov    0x8(%ebp),%eax
  800a49:	8b 75 0c             	mov    0xc(%ebp),%esi
  800a4c:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800a4f:	39 c6                	cmp    %eax,%esi
  800a51:	73 32                	jae    800a85 <memmove+0x44>
  800a53:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  800a56:	39 d0                	cmp    %edx,%eax
  800a58:	73 2b                	jae    800a85 <memmove+0x44>
  800a5a:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  800a5d:	89 fe                	mov    %edi,%esi
  800a5f:	09 ce                	or     %ecx,%esi
  800a61:	09 d6                	or     %edx,%esi
  800a63:	f7 c6 03 00 00 00    	test   $0x3,%esi
  800a69:	75 0e                	jne    800a79 <memmove+0x38>
  800a6b:	83 ef 04             	sub    $0x4,%edi
  800a6e:	8d 72 fc             	lea    -0x4(%edx),%esi
  800a71:	c1 e9 02             	shr    $0x2,%ecx
  800a74:	fd                   	std
  800a75:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800a77:	eb 09                	jmp    800a82 <memmove+0x41>
  800a79:	83 ef 01             	sub    $0x1,%edi
  800a7c:	8d 72 ff             	lea    -0x1(%edx),%esi
  800a7f:	fd                   	std
  800a80:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800a82:	fc                   	cld
  800a83:	eb 1a                	jmp    800a9f <memmove+0x5e>
  800a85:	89 c2                	mov    %eax,%edx
  800a87:	09 ca                	or     %ecx,%edx
  800a89:	09 f2                	or     %esi,%edx
  800a8b:	f6 c2 03             	test   $0x3,%dl
  800a8e:	75 0a                	jne    800a9a <memmove+0x59>
  800a90:	c1 e9 02             	shr    $0x2,%ecx
  800a93:	89 c7                	mov    %eax,%edi
  800a95:	fc                   	cld
  800a96:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800a98:	eb 05                	jmp    800a9f <memmove+0x5e>
  800a9a:	89 c7                	mov    %eax,%edi
  800a9c:	fc                   	cld
  800a9d:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800a9f:	5e                   	pop    %esi
  800aa0:	5f                   	pop    %edi
  800aa1:	5d                   	pop    %ebp
  800aa2:	c3                   	ret

00800aa3 <memcpy>:
  800aa3:	55                   	push   %ebp
  800aa4:	89 e5                	mov    %esp,%ebp
  800aa6:	83 ec 0c             	sub    $0xc,%esp
  800aa9:	ff 75 10             	push   0x10(%ebp)
  800aac:	ff 75 0c             	push   0xc(%ebp)
  800aaf:	ff 75 08             	push   0x8(%ebp)
  800ab2:	e8 8a ff ff ff       	call   800a41 <memmove>
  800ab7:	c9                   	leave
  800ab8:	c3                   	ret

00800ab9 <memcmp>:
  800ab9:	55                   	push   %ebp
  800aba:	89 e5                	mov    %esp,%ebp
  800abc:	56                   	push   %esi
  800abd:	53                   	push   %ebx
  800abe:	8b 45 08             	mov    0x8(%ebp),%eax
  800ac1:	8b 55 0c             	mov    0xc(%ebp),%edx
  800ac4:	89 c6                	mov    %eax,%esi
  800ac6:	03 75 10             	add    0x10(%ebp),%esi
  800ac9:	eb 06                	jmp    800ad1 <memcmp+0x18>
  800acb:	83 c0 01             	add    $0x1,%eax
  800ace:	83 c2 01             	add    $0x1,%edx
  800ad1:	39 f0                	cmp    %esi,%eax
  800ad3:	74 14                	je     800ae9 <memcmp+0x30>
  800ad5:	0f b6 08             	movzbl (%eax),%ecx
  800ad8:	0f b6 1a             	movzbl (%edx),%ebx
  800adb:	38 d9                	cmp    %bl,%cl
  800add:	74 ec                	je     800acb <memcmp+0x12>
  800adf:	0f b6 c1             	movzbl %cl,%eax
  800ae2:	0f b6 db             	movzbl %bl,%ebx
  800ae5:	29 d8                	sub    %ebx,%eax
  800ae7:	eb 05                	jmp    800aee <memcmp+0x35>
  800ae9:	b8 00 00 00 00       	mov    $0x0,%eax
  800aee:	5b                   	pop    %ebx
  800aef:	5e                   	pop    %esi
  800af0:	5d                   	pop    %ebp
  800af1:	c3                   	ret

00800af2 <memfind>:
  800af2:	55                   	push   %ebp
  800af3:	89 e5                	mov    %esp,%ebp
  800af5:	8b 45 08             	mov    0x8(%ebp),%eax
  800af8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800afb:	89 c2                	mov    %eax,%edx
  800afd:	03 55 10             	add    0x10(%ebp),%edx
  800b00:	eb 03                	jmp    800b05 <memfind+0x13>
  800b02:	83 c0 01             	add    $0x1,%eax
  800b05:	39 d0                	cmp    %edx,%eax
  800b07:	73 04                	jae    800b0d <memfind+0x1b>
  800b09:	38 08                	cmp    %cl,(%eax)
  800b0b:	75 f5                	jne    800b02 <memfind+0x10>
  800b0d:	5d                   	pop    %ebp
  800b0e:	c3                   	ret

00800b0f <strtol>:
  800b0f:	55                   	push   %ebp
  800b10:	89 e5                	mov    %esp,%ebp
  800b12:	57                   	push   %edi
  800b13:	56                   	push   %esi
  800b14:	53                   	push   %ebx
  800b15:	8b 55 08             	mov    0x8(%ebp),%edx
  800b18:	8b 5d 10             	mov    0x10(%ebp),%ebx
  800b1b:	eb 03                	jmp    800b20 <strtol+0x11>
  800b1d:	83 c2 01             	add    $0x1,%edx
  800b20:	0f b6 02             	movzbl (%edx),%eax
  800b23:	3c 20                	cmp    $0x20,%al
  800b25:	74 f6                	je     800b1d <strtol+0xe>
  800b27:	3c 09                	cmp    $0x9,%al
  800b29:	74 f2                	je     800b1d <strtol+0xe>
  800b2b:	3c 2b                	cmp    $0x2b,%al
  800b2d:	74 2a                	je     800b59 <strtol+0x4a>
  800b2f:	bf 00 00 00 00       	mov    $0x0,%edi
  800b34:	3c 2d                	cmp    $0x2d,%al
  800b36:	74 2b                	je     800b63 <strtol+0x54>
  800b38:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  800b3e:	75 0f                	jne    800b4f <strtol+0x40>
  800b40:	80 3a 30             	cmpb   $0x30,(%edx)
  800b43:	74 28                	je     800b6d <strtol+0x5e>
  800b45:	85 db                	test   %ebx,%ebx
  800b47:	b8 0a 00 00 00       	mov    $0xa,%eax
  800b4c:	0f 44 d8             	cmove  %eax,%ebx
  800b4f:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b54:	89 5d 10             	mov    %ebx,0x10(%ebp)
  800b57:	eb 46                	jmp    800b9f <strtol+0x90>
  800b59:	83 c2 01             	add    $0x1,%edx
  800b5c:	bf 00 00 00 00       	mov    $0x0,%edi
  800b61:	eb d5                	jmp    800b38 <strtol+0x29>
  800b63:	83 c2 01             	add    $0x1,%edx
  800b66:	bf 01 00 00 00       	mov    $0x1,%edi
  800b6b:	eb cb                	jmp    800b38 <strtol+0x29>
  800b6d:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800b71:	74 0e                	je     800b81 <strtol+0x72>
  800b73:	85 db                	test   %ebx,%ebx
  800b75:	75 d8                	jne    800b4f <strtol+0x40>
  800b77:	83 c2 01             	add    $0x1,%edx
  800b7a:	bb 08 00 00 00       	mov    $0x8,%ebx
  800b7f:	eb ce                	jmp    800b4f <strtol+0x40>
  800b81:	83 c2 02             	add    $0x2,%edx
  800b84:	bb 10 00 00 00       	mov    $0x10,%ebx
  800b89:	eb c4                	jmp    800b4f <strtol+0x40>
  800b8b:	0f be c0             	movsbl %al,%eax
  800b8e:	83 e8 30             	sub    $0x30,%eax
  800b91:	3b 45 10             	cmp    0x10(%ebp),%eax
  800b94:	7d 3a                	jge    800bd0 <strtol+0xc1>
  800b96:	83 c2 01             	add    $0x1,%edx
  800b99:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  800b9d:	01 c1                	add    %eax,%ecx
  800b9f:	0f b6 02             	movzbl (%edx),%eax
  800ba2:	8d 70 d0             	lea    -0x30(%eax),%esi
  800ba5:	89 f3                	mov    %esi,%ebx
  800ba7:	80 fb 09             	cmp    $0x9,%bl
  800baa:	76 df                	jbe    800b8b <strtol+0x7c>
  800bac:	8d 70 9f             	lea    -0x61(%eax),%esi
  800baf:	89 f3                	mov    %esi,%ebx
  800bb1:	80 fb 19             	cmp    $0x19,%bl
  800bb4:	77 08                	ja     800bbe <strtol+0xaf>
  800bb6:	0f be c0             	movsbl %al,%eax
  800bb9:	83 e8 57             	sub    $0x57,%eax
  800bbc:	eb d3                	jmp    800b91 <strtol+0x82>
  800bbe:	8d 70 bf             	lea    -0x41(%eax),%esi
  800bc1:	89 f3                	mov    %esi,%ebx
  800bc3:	80 fb 19             	cmp    $0x19,%bl
  800bc6:	77 08                	ja     800bd0 <strtol+0xc1>
  800bc8:	0f be c0             	movsbl %al,%eax
  800bcb:	83 e8 37             	sub    $0x37,%eax
  800bce:	eb c1                	jmp    800b91 <strtol+0x82>
  800bd0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  800bd4:	74 05                	je     800bdb <strtol+0xcc>
  800bd6:	8b 45 0c             	mov    0xc(%ebp),%eax
  800bd9:	89 10                	mov    %edx,(%eax)
  800bdb:	89 c8                	mov    %ecx,%eax
  800bdd:	f7 d8                	neg    %eax
  800bdf:	85 ff                	test   %edi,%edi
  800be1:	0f 45 c8             	cmovne %eax,%ecx
  800be4:	89 c8                	mov    %ecx,%eax
  800be6:	5b                   	pop    %ebx
  800be7:	5e                   	pop    %esi
  800be8:	5f                   	pop    %edi
  800be9:	5d                   	pop    %ebp
  800bea:	c3                   	ret
  800beb:	66 90                	xchg   %ax,%ax
  800bed:	66 90                	xchg   %ax,%ax
  800bef:	90                   	nop

00800bf0 <__udivdi3>:
  800bf0:	f3 0f 1e fb          	endbr32
  800bf4:	55                   	push   %ebp
  800bf5:	57                   	push   %edi
  800bf6:	56                   	push   %esi
  800bf7:	53                   	push   %ebx
  800bf8:	83 ec 1c             	sub    $0x1c,%esp
  800bfb:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800bff:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  800c03:	8b 74 24 34          	mov    0x34(%esp),%esi
  800c07:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  800c0b:	85 c0                	test   %eax,%eax
  800c0d:	75 19                	jne    800c28 <__udivdi3+0x38>
  800c0f:	39 de                	cmp    %ebx,%esi
  800c11:	73 4d                	jae    800c60 <__udivdi3+0x70>
  800c13:	31 ff                	xor    %edi,%edi
  800c15:	89 e8                	mov    %ebp,%eax
  800c17:	89 f2                	mov    %esi,%edx
  800c19:	f7 f3                	div    %ebx
  800c1b:	89 fa                	mov    %edi,%edx
  800c1d:	83 c4 1c             	add    $0x1c,%esp
  800c20:	5b                   	pop    %ebx
  800c21:	5e                   	pop    %esi
  800c22:	5f                   	pop    %edi
  800c23:	5d                   	pop    %ebp
  800c24:	c3                   	ret
  800c25:	8d 76 00             	lea    0x0(%esi),%esi
  800c28:	39 c6                	cmp    %eax,%esi
  800c2a:	73 14                	jae    800c40 <__udivdi3+0x50>
  800c2c:	31 ff                	xor    %edi,%edi
  800c2e:	31 c0                	xor    %eax,%eax
  800c30:	89 fa                	mov    %edi,%edx
  800c32:	83 c4 1c             	add    $0x1c,%esp
  800c35:	5b                   	pop    %ebx
  800c36:	5e                   	pop    %esi
  800c37:	5f                   	pop    %edi
  800c38:	5d                   	pop    %ebp
  800c39:	c3                   	ret
  800c3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800c40:	0f bd f8             	bsr    %eax,%edi
  800c43:	83 f7 1f             	xor    $0x1f,%edi
  800c46:	75 48                	jne    800c90 <__udivdi3+0xa0>
  800c48:	39 f0                	cmp    %esi,%eax
  800c4a:	72 06                	jb     800c52 <__udivdi3+0x62>
  800c4c:	31 c0                	xor    %eax,%eax
  800c4e:	39 dd                	cmp    %ebx,%ebp
  800c50:	72 de                	jb     800c30 <__udivdi3+0x40>
  800c52:	b8 01 00 00 00       	mov    $0x1,%eax
  800c57:	eb d7                	jmp    800c30 <__udivdi3+0x40>
  800c59:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800c60:	89 d9                	mov    %ebx,%ecx
  800c62:	85 db                	test   %ebx,%ebx
  800c64:	75 0b                	jne    800c71 <__udivdi3+0x81>
  800c66:	b8 01 00 00 00       	mov    $0x1,%eax
  800c6b:	31 d2                	xor    %edx,%edx
  800c6d:	f7 f3                	div    %ebx
  800c6f:	89 c1                	mov    %eax,%ecx
  800c71:	31 d2                	xor    %edx,%edx
  800c73:	89 f0                	mov    %esi,%eax
  800c75:	f7 f1                	div    %ecx
  800c77:	89 c6                	mov    %eax,%esi
  800c79:	89 e8                	mov    %ebp,%eax
  800c7b:	89 f7                	mov    %esi,%edi
  800c7d:	f7 f1                	div    %ecx
  800c7f:	89 fa                	mov    %edi,%edx
  800c81:	83 c4 1c             	add    $0x1c,%esp
  800c84:	5b                   	pop    %ebx
  800c85:	5e                   	pop    %esi
  800c86:	5f                   	pop    %edi
  800c87:	5d                   	pop    %ebp
  800c88:	c3                   	ret
  800c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800c90:	89 f9                	mov    %edi,%ecx
  800c92:	ba 20 00 00 00       	mov    $0x20,%edx
  800c97:	29 fa                	sub    %edi,%edx
  800c99:	d3 e0                	shl    %cl,%eax
  800c9b:	89 44 24 08          	mov    %eax,0x8(%esp)
  800c9f:	89 d1                	mov    %edx,%ecx
  800ca1:	89 d8                	mov    %ebx,%eax
  800ca3:	d3 e8                	shr    %cl,%eax
  800ca5:	89 c1                	mov    %eax,%ecx
  800ca7:	8b 44 24 08          	mov    0x8(%esp),%eax
  800cab:	09 c1                	or     %eax,%ecx
  800cad:	89 f0                	mov    %esi,%eax
  800caf:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800cb3:	89 f9                	mov    %edi,%ecx
  800cb5:	d3 e3                	shl    %cl,%ebx
  800cb7:	89 d1                	mov    %edx,%ecx
  800cb9:	d3 e8                	shr    %cl,%eax
  800cbb:	89 f9                	mov    %edi,%ecx
  800cbd:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  800cc1:	89 eb                	mov    %ebp,%ebx
  800cc3:	d3 e6                	shl    %cl,%esi
  800cc5:	89 d1                	mov    %edx,%ecx
  800cc7:	d3 eb                	shr    %cl,%ebx
  800cc9:	09 f3                	or     %esi,%ebx
  800ccb:	89 c6                	mov    %eax,%esi
  800ccd:	89 f2                	mov    %esi,%edx
  800ccf:	89 d8                	mov    %ebx,%eax
  800cd1:	f7 74 24 08          	divl   0x8(%esp)
  800cd5:	89 d6                	mov    %edx,%esi
  800cd7:	89 c3                	mov    %eax,%ebx
  800cd9:	f7 64 24 0c          	mull   0xc(%esp)
  800cdd:	39 d6                	cmp    %edx,%esi
  800cdf:	72 1f                	jb     800d00 <__udivdi3+0x110>
  800ce1:	89 f9                	mov    %edi,%ecx
  800ce3:	d3 e5                	shl    %cl,%ebp
  800ce5:	39 c5                	cmp    %eax,%ebp
  800ce7:	73 04                	jae    800ced <__udivdi3+0xfd>
  800ce9:	39 d6                	cmp    %edx,%esi
  800ceb:	74 13                	je     800d00 <__udivdi3+0x110>
  800ced:	89 d8                	mov    %ebx,%eax
  800cef:	31 ff                	xor    %edi,%edi
  800cf1:	e9 3a ff ff ff       	jmp    800c30 <__udivdi3+0x40>
  800cf6:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800cfd:	00 
  800cfe:	66 90                	xchg   %ax,%ax
  800d00:	8d 43 ff             	lea    -0x1(%ebx),%eax
  800d03:	31 ff                	xor    %edi,%edi
  800d05:	e9 26 ff ff ff       	jmp    800c30 <__udivdi3+0x40>
  800d0a:	66 90                	xchg   %ax,%ax
  800d0c:	66 90                	xchg   %ax,%ax
  800d0e:	66 90                	xchg   %ax,%ax

00800d10 <__umoddi3>:
  800d10:	f3 0f 1e fb          	endbr32
  800d14:	55                   	push   %ebp
  800d15:	57                   	push   %edi
  800d16:	56                   	push   %esi
  800d17:	53                   	push   %ebx
  800d18:	83 ec 1c             	sub    $0x1c,%esp
  800d1b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  800d1f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800d23:	8b 74 24 30          	mov    0x30(%esp),%esi
  800d27:	8b 7c 24 38          	mov    0x38(%esp),%edi
  800d2b:	89 da                	mov    %ebx,%edx
  800d2d:	85 c0                	test   %eax,%eax
  800d2f:	75 17                	jne    800d48 <__umoddi3+0x38>
  800d31:	39 fb                	cmp    %edi,%ebx
  800d33:	73 53                	jae    800d88 <__umoddi3+0x78>
  800d35:	89 f0                	mov    %esi,%eax
  800d37:	f7 f7                	div    %edi
  800d39:	89 d0                	mov    %edx,%eax
  800d3b:	31 d2                	xor    %edx,%edx
  800d3d:	83 c4 1c             	add    $0x1c,%esp
  800d40:	5b                   	pop    %ebx
  800d41:	5e                   	pop    %esi
  800d42:	5f                   	pop    %edi
  800d43:	5d                   	pop    %ebp
  800d44:	c3                   	ret
  800d45:	8d 76 00             	lea    0x0(%esi),%esi
  800d48:	89 f1                	mov    %esi,%ecx
  800d4a:	39 c3                	cmp    %eax,%ebx
  800d4c:	73 12                	jae    800d60 <__umoddi3+0x50>
  800d4e:	89 f0                	mov    %esi,%eax
  800d50:	83 c4 1c             	add    $0x1c,%esp
  800d53:	5b                   	pop    %ebx
  800d54:	5e                   	pop    %esi
  800d55:	5f                   	pop    %edi
  800d56:	5d                   	pop    %ebp
  800d57:	c3                   	ret
  800d58:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800d5f:	00 
  800d60:	0f bd e8             	bsr    %eax,%ebp
  800d63:	83 f5 1f             	xor    $0x1f,%ebp
  800d66:	75 48                	jne    800db0 <__umoddi3+0xa0>
  800d68:	39 d8                	cmp    %ebx,%eax
  800d6a:	0f 82 d0 00 00 00    	jb     800e40 <__umoddi3+0x130>
  800d70:	39 fe                	cmp    %edi,%esi
  800d72:	0f 83 c8 00 00 00    	jae    800e40 <__umoddi3+0x130>
  800d78:	89 c8                	mov    %ecx,%eax
  800d7a:	83 c4 1c             	add    $0x1c,%esp
  800d7d:	5b                   	pop    %ebx
  800d7e:	5e                   	pop    %esi
  800d7f:	5f                   	pop    %edi
  800d80:	5d                   	pop    %ebp
  800d81:	c3                   	ret
  800d82:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800d88:	89 f9                	mov    %edi,%ecx
  800d8a:	85 ff                	test   %edi,%edi
  800d8c:	75 0b                	jne    800d99 <__umoddi3+0x89>
  800d8e:	b8 01 00 00 00       	mov    $0x1,%eax
  800d93:	31 d2                	xor    %edx,%edx
  800d95:	f7 f7                	div    %edi
  800d97:	89 c1                	mov    %eax,%ecx
  800d99:	89 d8                	mov    %ebx,%eax
  800d9b:	31 d2                	xor    %edx,%edx
  800d9d:	f7 f1                	div    %ecx
  800d9f:	89 f0                	mov    %esi,%eax
  800da1:	f7 f1                	div    %ecx
  800da3:	89 d0                	mov    %edx,%eax
  800da5:	31 d2                	xor    %edx,%edx
  800da7:	eb 94                	jmp    800d3d <__umoddi3+0x2d>
  800da9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800db0:	89 e9                	mov    %ebp,%ecx
  800db2:	ba 20 00 00 00       	mov    $0x20,%edx
  800db7:	29 ea                	sub    %ebp,%edx
  800db9:	d3 e0                	shl    %cl,%eax
  800dbb:	89 44 24 08          	mov    %eax,0x8(%esp)
  800dbf:	89 d1                	mov    %edx,%ecx
  800dc1:	89 f8                	mov    %edi,%eax
  800dc3:	d3 e8                	shr    %cl,%eax
  800dc5:	89 54 24 04          	mov    %edx,0x4(%esp)
  800dc9:	8b 54 24 04          	mov    0x4(%esp),%edx
  800dcd:	89 c1                	mov    %eax,%ecx
  800dcf:	8b 44 24 08          	mov    0x8(%esp),%eax
  800dd3:	09 c1                	or     %eax,%ecx
  800dd5:	89 d8                	mov    %ebx,%eax
  800dd7:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800ddb:	89 e9                	mov    %ebp,%ecx
  800ddd:	d3 e7                	shl    %cl,%edi
  800ddf:	89 d1                	mov    %edx,%ecx
  800de1:	d3 e8                	shr    %cl,%eax
  800de3:	89 e9                	mov    %ebp,%ecx
  800de5:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  800de9:	d3 e3                	shl    %cl,%ebx
  800deb:	89 c7                	mov    %eax,%edi
  800ded:	89 d1                	mov    %edx,%ecx
  800def:	89 f0                	mov    %esi,%eax
  800df1:	d3 e8                	shr    %cl,%eax
  800df3:	89 fa                	mov    %edi,%edx
  800df5:	89 e9                	mov    %ebp,%ecx
  800df7:	09 d8                	or     %ebx,%eax
  800df9:	d3 e6                	shl    %cl,%esi
  800dfb:	f7 74 24 08          	divl   0x8(%esp)
  800dff:	89 d3                	mov    %edx,%ebx
  800e01:	f7 64 24 0c          	mull   0xc(%esp)
  800e05:	89 c7                	mov    %eax,%edi
  800e07:	89 d1                	mov    %edx,%ecx
  800e09:	39 d3                	cmp    %edx,%ebx
  800e0b:	72 06                	jb     800e13 <__umoddi3+0x103>
  800e0d:	75 10                	jne    800e1f <__umoddi3+0x10f>
  800e0f:	39 c6                	cmp    %eax,%esi
  800e11:	73 0c                	jae    800e1f <__umoddi3+0x10f>
  800e13:	2b 44 24 0c          	sub    0xc(%esp),%eax
  800e17:	1b 54 24 08          	sbb    0x8(%esp),%edx
  800e1b:	89 d1                	mov    %edx,%ecx
  800e1d:	89 c7                	mov    %eax,%edi
  800e1f:	89 f2                	mov    %esi,%edx
  800e21:	29 fa                	sub    %edi,%edx
  800e23:	19 cb                	sbb    %ecx,%ebx
  800e25:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  800e2a:	89 d8                	mov    %ebx,%eax
  800e2c:	d3 e0                	shl    %cl,%eax
  800e2e:	89 e9                	mov    %ebp,%ecx
  800e30:	d3 ea                	shr    %cl,%edx
  800e32:	d3 eb                	shr    %cl,%ebx
  800e34:	09 d0                	or     %edx,%eax
  800e36:	89 da                	mov    %ebx,%edx
  800e38:	83 c4 1c             	add    $0x1c,%esp
  800e3b:	5b                   	pop    %ebx
  800e3c:	5e                   	pop    %esi
  800e3d:	5f                   	pop    %edi
  800e3e:	5d                   	pop    %ebp
  800e3f:	c3                   	ret
  800e40:	89 da                	mov    %ebx,%edx
  800e42:	89 f1                	mov    %esi,%ecx
  800e44:	29 f9                	sub    %edi,%ecx
  800e46:	19 c2                	sbb    %eax,%edx
  800e48:	89 c8                	mov    %ecx,%eax
  800e4a:	e9 2b ff ff ff       	jmp    800d7a <__umoddi3+0x6a>
