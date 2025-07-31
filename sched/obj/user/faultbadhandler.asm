
obj/user/faultbadhandler:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 34 00 00 00       	call   800065 <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <umain>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	83 ec 0c             	sub    $0xc,%esp
  800039:	6a 07                	push   $0x7
  80003b:	68 00 f0 bf ee       	push   $0xeebff000
  800040:	6a 00                	push   $0x0
  800042:	e8 7d 01 00 00       	call   8001c4 <sys_page_alloc>
  800047:	83 c4 08             	add    $0x8,%esp
  80004a:	68 ef be ad de       	push   $0xdeadbeef
  80004f:	6a 00                	push   $0x0
  800051:	e8 fe 01 00 00       	call   800254 <sys_env_set_pgfault_upcall>
  800056:	c7 05 00 00 00 00 00 	movl   $0x0,0x0
  80005d:	00 00 00 
  800060:	83 c4 10             	add    $0x10,%esp
  800063:	c9                   	leave
  800064:	c3                   	ret

00800065 <libmain>:
  800065:	55                   	push   %ebp
  800066:	89 e5                	mov    %esp,%ebp
  800068:	56                   	push   %esi
  800069:	53                   	push   %ebx
  80006a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80006d:	8b 75 0c             	mov    0xc(%ebp),%esi
  800070:	e8 04 01 00 00       	call   800179 <sys_getenvid>
  800075:	85 c0                	test   %eax,%eax
  800077:	78 15                	js     80008e <libmain+0x29>
  800079:	25 ff 03 00 00       	and    $0x3ff,%eax
  80007e:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800084:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800089:	a3 04 20 80 00       	mov    %eax,0x802004
  80008e:	85 db                	test   %ebx,%ebx
  800090:	7e 07                	jle    800099 <libmain+0x34>
  800092:	8b 06                	mov    (%esi),%eax
  800094:	a3 00 20 80 00       	mov    %eax,0x802000
  800099:	83 ec 08             	sub    $0x8,%esp
  80009c:	56                   	push   %esi
  80009d:	53                   	push   %ebx
  80009e:	e8 90 ff ff ff       	call   800033 <umain>
  8000a3:	e8 0a 00 00 00       	call   8000b2 <exit>
  8000a8:	83 c4 10             	add    $0x10,%esp
  8000ab:	8d 65 f8             	lea    -0x8(%ebp),%esp
  8000ae:	5b                   	pop    %ebx
  8000af:	5e                   	pop    %esi
  8000b0:	5d                   	pop    %ebp
  8000b1:	c3                   	ret

008000b2 <exit>:
  8000b2:	55                   	push   %ebp
  8000b3:	89 e5                	mov    %esp,%ebp
  8000b5:	83 ec 14             	sub    $0x14,%esp
  8000b8:	6a 00                	push   $0x0
  8000ba:	e8 98 00 00 00       	call   800157 <sys_env_destroy>
  8000bf:	83 c4 10             	add    $0x10,%esp
  8000c2:	c9                   	leave
  8000c3:	c3                   	ret

008000c4 <syscall>:
  8000c4:	55                   	push   %ebp
  8000c5:	89 e5                	mov    %esp,%ebp
  8000c7:	57                   	push   %edi
  8000c8:	56                   	push   %esi
  8000c9:	53                   	push   %ebx
  8000ca:	83 ec 1c             	sub    $0x1c,%esp
  8000cd:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8000d0:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  8000d3:	89 ca                	mov    %ecx,%edx
  8000d5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8000d8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8000db:	8b 7d 10             	mov    0x10(%ebp),%edi
  8000de:	8b 75 14             	mov    0x14(%ebp),%esi
  8000e1:	cd 30                	int    $0x30
  8000e3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  8000e7:	74 04                	je     8000ed <syscall+0x29>
  8000e9:	85 c0                	test   %eax,%eax
  8000eb:	7f 08                	jg     8000f5 <syscall+0x31>
  8000ed:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8000f0:	5b                   	pop    %ebx
  8000f1:	5e                   	pop    %esi
  8000f2:	5f                   	pop    %edi
  8000f3:	5d                   	pop    %ebp
  8000f4:	c3                   	ret
  8000f5:	83 ec 0c             	sub    $0xc,%esp
  8000f8:	50                   	push   %eax
  8000f9:	ff 75 e0             	push   -0x20(%ebp)
  8000fc:	68 8a 0e 80 00       	push   $0x800e8a
  800101:	6a 1e                	push   $0x1e
  800103:	68 a7 0e 80 00       	push   $0x800ea7
  800108:	e8 b1 01 00 00       	call   8002be <_panic>

0080010d <sys_cputs>:
  80010d:	55                   	push   %ebp
  80010e:	89 e5                	mov    %esp,%ebp
  800110:	83 ec 08             	sub    $0x8,%esp
  800113:	6a 00                	push   $0x0
  800115:	6a 00                	push   $0x0
  800117:	6a 00                	push   $0x0
  800119:	ff 75 0c             	push   0xc(%ebp)
  80011c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80011f:	ba 00 00 00 00       	mov    $0x0,%edx
  800124:	b8 00 00 00 00       	mov    $0x0,%eax
  800129:	e8 96 ff ff ff       	call   8000c4 <syscall>
  80012e:	83 c4 10             	add    $0x10,%esp
  800131:	c9                   	leave
  800132:	c3                   	ret

00800133 <sys_cgetc>:
  800133:	55                   	push   %ebp
  800134:	89 e5                	mov    %esp,%ebp
  800136:	83 ec 08             	sub    $0x8,%esp
  800139:	6a 00                	push   $0x0
  80013b:	6a 00                	push   $0x0
  80013d:	6a 00                	push   $0x0
  80013f:	6a 00                	push   $0x0
  800141:	b9 00 00 00 00       	mov    $0x0,%ecx
  800146:	ba 00 00 00 00       	mov    $0x0,%edx
  80014b:	b8 01 00 00 00       	mov    $0x1,%eax
  800150:	e8 6f ff ff ff       	call   8000c4 <syscall>
  800155:	c9                   	leave
  800156:	c3                   	ret

00800157 <sys_env_destroy>:
  800157:	55                   	push   %ebp
  800158:	89 e5                	mov    %esp,%ebp
  80015a:	83 ec 08             	sub    $0x8,%esp
  80015d:	6a 00                	push   $0x0
  80015f:	6a 00                	push   $0x0
  800161:	6a 00                	push   $0x0
  800163:	6a 00                	push   $0x0
  800165:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800168:	ba 01 00 00 00       	mov    $0x1,%edx
  80016d:	b8 03 00 00 00       	mov    $0x3,%eax
  800172:	e8 4d ff ff ff       	call   8000c4 <syscall>
  800177:	c9                   	leave
  800178:	c3                   	ret

00800179 <sys_getenvid>:
  800179:	55                   	push   %ebp
  80017a:	89 e5                	mov    %esp,%ebp
  80017c:	83 ec 08             	sub    $0x8,%esp
  80017f:	6a 00                	push   $0x0
  800181:	6a 00                	push   $0x0
  800183:	6a 00                	push   $0x0
  800185:	6a 00                	push   $0x0
  800187:	b9 00 00 00 00       	mov    $0x0,%ecx
  80018c:	ba 00 00 00 00       	mov    $0x0,%edx
  800191:	b8 02 00 00 00       	mov    $0x2,%eax
  800196:	e8 29 ff ff ff       	call   8000c4 <syscall>
  80019b:	c9                   	leave
  80019c:	c3                   	ret

0080019d <sys_yield>:
  80019d:	55                   	push   %ebp
  80019e:	89 e5                	mov    %esp,%ebp
  8001a0:	83 ec 08             	sub    $0x8,%esp
  8001a3:	6a 00                	push   $0x0
  8001a5:	6a 00                	push   $0x0
  8001a7:	6a 00                	push   $0x0
  8001a9:	6a 00                	push   $0x0
  8001ab:	b9 00 00 00 00       	mov    $0x0,%ecx
  8001b0:	ba 00 00 00 00       	mov    $0x0,%edx
  8001b5:	b8 0a 00 00 00       	mov    $0xa,%eax
  8001ba:	e8 05 ff ff ff       	call   8000c4 <syscall>
  8001bf:	83 c4 10             	add    $0x10,%esp
  8001c2:	c9                   	leave
  8001c3:	c3                   	ret

008001c4 <sys_page_alloc>:
  8001c4:	55                   	push   %ebp
  8001c5:	89 e5                	mov    %esp,%ebp
  8001c7:	83 ec 08             	sub    $0x8,%esp
  8001ca:	6a 00                	push   $0x0
  8001cc:	6a 00                	push   $0x0
  8001ce:	ff 75 10             	push   0x10(%ebp)
  8001d1:	ff 75 0c             	push   0xc(%ebp)
  8001d4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001d7:	ba 01 00 00 00       	mov    $0x1,%edx
  8001dc:	b8 04 00 00 00       	mov    $0x4,%eax
  8001e1:	e8 de fe ff ff       	call   8000c4 <syscall>
  8001e6:	c9                   	leave
  8001e7:	c3                   	ret

008001e8 <sys_page_map>:
  8001e8:	55                   	push   %ebp
  8001e9:	89 e5                	mov    %esp,%ebp
  8001eb:	83 ec 08             	sub    $0x8,%esp
  8001ee:	ff 75 18             	push   0x18(%ebp)
  8001f1:	ff 75 14             	push   0x14(%ebp)
  8001f4:	ff 75 10             	push   0x10(%ebp)
  8001f7:	ff 75 0c             	push   0xc(%ebp)
  8001fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001fd:	ba 01 00 00 00       	mov    $0x1,%edx
  800202:	b8 05 00 00 00       	mov    $0x5,%eax
  800207:	e8 b8 fe ff ff       	call   8000c4 <syscall>
  80020c:	c9                   	leave
  80020d:	c3                   	ret

0080020e <sys_page_unmap>:
  80020e:	55                   	push   %ebp
  80020f:	89 e5                	mov    %esp,%ebp
  800211:	83 ec 08             	sub    $0x8,%esp
  800214:	6a 00                	push   $0x0
  800216:	6a 00                	push   $0x0
  800218:	6a 00                	push   $0x0
  80021a:	ff 75 0c             	push   0xc(%ebp)
  80021d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800220:	ba 01 00 00 00       	mov    $0x1,%edx
  800225:	b8 06 00 00 00       	mov    $0x6,%eax
  80022a:	e8 95 fe ff ff       	call   8000c4 <syscall>
  80022f:	c9                   	leave
  800230:	c3                   	ret

00800231 <sys_env_set_status>:
  800231:	55                   	push   %ebp
  800232:	89 e5                	mov    %esp,%ebp
  800234:	83 ec 08             	sub    $0x8,%esp
  800237:	6a 00                	push   $0x0
  800239:	6a 00                	push   $0x0
  80023b:	6a 00                	push   $0x0
  80023d:	ff 75 0c             	push   0xc(%ebp)
  800240:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800243:	ba 01 00 00 00       	mov    $0x1,%edx
  800248:	b8 08 00 00 00       	mov    $0x8,%eax
  80024d:	e8 72 fe ff ff       	call   8000c4 <syscall>
  800252:	c9                   	leave
  800253:	c3                   	ret

00800254 <sys_env_set_pgfault_upcall>:
  800254:	55                   	push   %ebp
  800255:	89 e5                	mov    %esp,%ebp
  800257:	83 ec 08             	sub    $0x8,%esp
  80025a:	6a 00                	push   $0x0
  80025c:	6a 00                	push   $0x0
  80025e:	6a 00                	push   $0x0
  800260:	ff 75 0c             	push   0xc(%ebp)
  800263:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800266:	ba 01 00 00 00       	mov    $0x1,%edx
  80026b:	b8 09 00 00 00       	mov    $0x9,%eax
  800270:	e8 4f fe ff ff       	call   8000c4 <syscall>
  800275:	c9                   	leave
  800276:	c3                   	ret

00800277 <sys_ipc_try_send>:
  800277:	55                   	push   %ebp
  800278:	89 e5                	mov    %esp,%ebp
  80027a:	83 ec 08             	sub    $0x8,%esp
  80027d:	6a 00                	push   $0x0
  80027f:	ff 75 14             	push   0x14(%ebp)
  800282:	ff 75 10             	push   0x10(%ebp)
  800285:	ff 75 0c             	push   0xc(%ebp)
  800288:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80028b:	ba 00 00 00 00       	mov    $0x0,%edx
  800290:	b8 0c 00 00 00       	mov    $0xc,%eax
  800295:	e8 2a fe ff ff       	call   8000c4 <syscall>
  80029a:	c9                   	leave
  80029b:	c3                   	ret

0080029c <sys_ipc_recv>:
  80029c:	55                   	push   %ebp
  80029d:	89 e5                	mov    %esp,%ebp
  80029f:	83 ec 08             	sub    $0x8,%esp
  8002a2:	6a 00                	push   $0x0
  8002a4:	6a 00                	push   $0x0
  8002a6:	6a 00                	push   $0x0
  8002a8:	6a 00                	push   $0x0
  8002aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8002ad:	ba 01 00 00 00       	mov    $0x1,%edx
  8002b2:	b8 0d 00 00 00       	mov    $0xd,%eax
  8002b7:	e8 08 fe ff ff       	call   8000c4 <syscall>
  8002bc:	c9                   	leave
  8002bd:	c3                   	ret

008002be <_panic>:
  8002be:	55                   	push   %ebp
  8002bf:	89 e5                	mov    %esp,%ebp
  8002c1:	56                   	push   %esi
  8002c2:	53                   	push   %ebx
  8002c3:	8d 5d 14             	lea    0x14(%ebp),%ebx
  8002c6:	8b 35 00 20 80 00    	mov    0x802000,%esi
  8002cc:	e8 a8 fe ff ff       	call   800179 <sys_getenvid>
  8002d1:	83 ec 0c             	sub    $0xc,%esp
  8002d4:	ff 75 0c             	push   0xc(%ebp)
  8002d7:	ff 75 08             	push   0x8(%ebp)
  8002da:	56                   	push   %esi
  8002db:	50                   	push   %eax
  8002dc:	68 70 0f 80 00       	push   $0x800f70
  8002e1:	e8 b3 00 00 00       	call   800399 <cprintf>
  8002e6:	83 c4 18             	add    $0x18,%esp
  8002e9:	53                   	push   %ebx
  8002ea:	ff 75 10             	push   0x10(%ebp)
  8002ed:	e8 56 00 00 00       	call   800348 <vcprintf>
  8002f2:	c7 04 24 b5 0e 80 00 	movl   $0x800eb5,(%esp)
  8002f9:	e8 9b 00 00 00       	call   800399 <cprintf>
  8002fe:	83 c4 10             	add    $0x10,%esp
  800301:	cc                   	int3
  800302:	eb fd                	jmp    800301 <_panic+0x43>

00800304 <putch>:
  800304:	55                   	push   %ebp
  800305:	89 e5                	mov    %esp,%ebp
  800307:	53                   	push   %ebx
  800308:	83 ec 04             	sub    $0x4,%esp
  80030b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  80030e:	8b 13                	mov    (%ebx),%edx
  800310:	8d 42 01             	lea    0x1(%edx),%eax
  800313:	89 03                	mov    %eax,(%ebx)
  800315:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800318:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  80031c:	3d ff 00 00 00       	cmp    $0xff,%eax
  800321:	74 09                	je     80032c <putch+0x28>
  800323:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  800327:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  80032a:	c9                   	leave
  80032b:	c3                   	ret
  80032c:	83 ec 08             	sub    $0x8,%esp
  80032f:	68 ff 00 00 00       	push   $0xff
  800334:	8d 43 08             	lea    0x8(%ebx),%eax
  800337:	50                   	push   %eax
  800338:	e8 d0 fd ff ff       	call   80010d <sys_cputs>
  80033d:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  800343:	83 c4 10             	add    $0x10,%esp
  800346:	eb db                	jmp    800323 <putch+0x1f>

00800348 <vcprintf>:
  800348:	55                   	push   %ebp
  800349:	89 e5                	mov    %esp,%ebp
  80034b:	81 ec 18 01 00 00    	sub    $0x118,%esp
  800351:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  800358:	00 00 00 
  80035b:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  800362:	00 00 00 
  800365:	ff 75 0c             	push   0xc(%ebp)
  800368:	ff 75 08             	push   0x8(%ebp)
  80036b:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  800371:	50                   	push   %eax
  800372:	68 04 03 80 00       	push   $0x800304
  800377:	e8 74 01 00 00       	call   8004f0 <vprintfmt>
  80037c:	83 c4 08             	add    $0x8,%esp
  80037f:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  800385:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  80038b:	50                   	push   %eax
  80038c:	e8 7c fd ff ff       	call   80010d <sys_cputs>
  800391:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  800397:	c9                   	leave
  800398:	c3                   	ret

00800399 <cprintf>:
  800399:	55                   	push   %ebp
  80039a:	89 e5                	mov    %esp,%ebp
  80039c:	83 ec 10             	sub    $0x10,%esp
  80039f:	8d 45 0c             	lea    0xc(%ebp),%eax
  8003a2:	50                   	push   %eax
  8003a3:	ff 75 08             	push   0x8(%ebp)
  8003a6:	e8 9d ff ff ff       	call   800348 <vcprintf>
  8003ab:	c9                   	leave
  8003ac:	c3                   	ret

008003ad <printnum>:
  8003ad:	55                   	push   %ebp
  8003ae:	89 e5                	mov    %esp,%ebp
  8003b0:	57                   	push   %edi
  8003b1:	56                   	push   %esi
  8003b2:	53                   	push   %ebx
  8003b3:	83 ec 1c             	sub    $0x1c,%esp
  8003b6:	89 c7                	mov    %eax,%edi
  8003b8:	89 d6                	mov    %edx,%esi
  8003ba:	8b 45 08             	mov    0x8(%ebp),%eax
  8003bd:	8b 55 0c             	mov    0xc(%ebp),%edx
  8003c0:	89 d1                	mov    %edx,%ecx
  8003c2:	89 c2                	mov    %eax,%edx
  8003c4:	89 45 d8             	mov    %eax,-0x28(%ebp)
  8003c7:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  8003ca:	8b 45 10             	mov    0x10(%ebp),%eax
  8003cd:	8b 5d 14             	mov    0x14(%ebp),%ebx
  8003d0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8003d3:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  8003da:	39 c2                	cmp    %eax,%edx
  8003dc:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  8003df:	72 3e                	jb     80041f <printnum+0x72>
  8003e1:	83 ec 0c             	sub    $0xc,%esp
  8003e4:	ff 75 18             	push   0x18(%ebp)
  8003e7:	83 eb 01             	sub    $0x1,%ebx
  8003ea:	53                   	push   %ebx
  8003eb:	50                   	push   %eax
  8003ec:	83 ec 08             	sub    $0x8,%esp
  8003ef:	ff 75 e4             	push   -0x1c(%ebp)
  8003f2:	ff 75 e0             	push   -0x20(%ebp)
  8003f5:	ff 75 dc             	push   -0x24(%ebp)
  8003f8:	ff 75 d8             	push   -0x28(%ebp)
  8003fb:	e8 20 08 00 00       	call   800c20 <__udivdi3>
  800400:	83 c4 18             	add    $0x18,%esp
  800403:	52                   	push   %edx
  800404:	50                   	push   %eax
  800405:	89 f2                	mov    %esi,%edx
  800407:	89 f8                	mov    %edi,%eax
  800409:	e8 9f ff ff ff       	call   8003ad <printnum>
  80040e:	83 c4 20             	add    $0x20,%esp
  800411:	eb 13                	jmp    800426 <printnum+0x79>
  800413:	83 ec 08             	sub    $0x8,%esp
  800416:	56                   	push   %esi
  800417:	ff 75 18             	push   0x18(%ebp)
  80041a:	ff d7                	call   *%edi
  80041c:	83 c4 10             	add    $0x10,%esp
  80041f:	83 eb 01             	sub    $0x1,%ebx
  800422:	85 db                	test   %ebx,%ebx
  800424:	7f ed                	jg     800413 <printnum+0x66>
  800426:	83 ec 08             	sub    $0x8,%esp
  800429:	56                   	push   %esi
  80042a:	83 ec 04             	sub    $0x4,%esp
  80042d:	ff 75 e4             	push   -0x1c(%ebp)
  800430:	ff 75 e0             	push   -0x20(%ebp)
  800433:	ff 75 dc             	push   -0x24(%ebp)
  800436:	ff 75 d8             	push   -0x28(%ebp)
  800439:	e8 02 09 00 00       	call   800d40 <__umoddi3>
  80043e:	83 c4 14             	add    $0x14,%esp
  800441:	0f be 80 b7 0e 80 00 	movsbl 0x800eb7(%eax),%eax
  800448:	50                   	push   %eax
  800449:	ff d7                	call   *%edi
  80044b:	83 c4 10             	add    $0x10,%esp
  80044e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800451:	5b                   	pop    %ebx
  800452:	5e                   	pop    %esi
  800453:	5f                   	pop    %edi
  800454:	5d                   	pop    %ebp
  800455:	c3                   	ret

00800456 <getuint>:
  800456:	83 fa 01             	cmp    $0x1,%edx
  800459:	7f 13                	jg     80046e <getuint+0x18>
  80045b:	85 d2                	test   %edx,%edx
  80045d:	74 1c                	je     80047b <getuint+0x25>
  80045f:	8b 10                	mov    (%eax),%edx
  800461:	8d 4a 04             	lea    0x4(%edx),%ecx
  800464:	89 08                	mov    %ecx,(%eax)
  800466:	8b 02                	mov    (%edx),%eax
  800468:	ba 00 00 00 00       	mov    $0x0,%edx
  80046d:	c3                   	ret
  80046e:	8b 10                	mov    (%eax),%edx
  800470:	8d 4a 08             	lea    0x8(%edx),%ecx
  800473:	89 08                	mov    %ecx,(%eax)
  800475:	8b 02                	mov    (%edx),%eax
  800477:	8b 52 04             	mov    0x4(%edx),%edx
  80047a:	c3                   	ret
  80047b:	8b 10                	mov    (%eax),%edx
  80047d:	8d 4a 04             	lea    0x4(%edx),%ecx
  800480:	89 08                	mov    %ecx,(%eax)
  800482:	8b 02                	mov    (%edx),%eax
  800484:	ba 00 00 00 00       	mov    $0x0,%edx
  800489:	c3                   	ret

0080048a <getint>:
  80048a:	83 fa 01             	cmp    $0x1,%edx
  80048d:	7f 0f                	jg     80049e <getint+0x14>
  80048f:	85 d2                	test   %edx,%edx
  800491:	74 18                	je     8004ab <getint+0x21>
  800493:	8b 10                	mov    (%eax),%edx
  800495:	8d 4a 04             	lea    0x4(%edx),%ecx
  800498:	89 08                	mov    %ecx,(%eax)
  80049a:	8b 02                	mov    (%edx),%eax
  80049c:	99                   	cltd
  80049d:	c3                   	ret
  80049e:	8b 10                	mov    (%eax),%edx
  8004a0:	8d 4a 08             	lea    0x8(%edx),%ecx
  8004a3:	89 08                	mov    %ecx,(%eax)
  8004a5:	8b 02                	mov    (%edx),%eax
  8004a7:	8b 52 04             	mov    0x4(%edx),%edx
  8004aa:	c3                   	ret
  8004ab:	8b 10                	mov    (%eax),%edx
  8004ad:	8d 4a 04             	lea    0x4(%edx),%ecx
  8004b0:	89 08                	mov    %ecx,(%eax)
  8004b2:	8b 02                	mov    (%edx),%eax
  8004b4:	99                   	cltd
  8004b5:	c3                   	ret

008004b6 <sprintputch>:
  8004b6:	55                   	push   %ebp
  8004b7:	89 e5                	mov    %esp,%ebp
  8004b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  8004bc:	83 40 08 01          	addl   $0x1,0x8(%eax)
  8004c0:	8b 10                	mov    (%eax),%edx
  8004c2:	3b 50 04             	cmp    0x4(%eax),%edx
  8004c5:	73 0a                	jae    8004d1 <sprintputch+0x1b>
  8004c7:	8d 4a 01             	lea    0x1(%edx),%ecx
  8004ca:	89 08                	mov    %ecx,(%eax)
  8004cc:	8b 45 08             	mov    0x8(%ebp),%eax
  8004cf:	88 02                	mov    %al,(%edx)
  8004d1:	5d                   	pop    %ebp
  8004d2:	c3                   	ret

008004d3 <printfmt>:
  8004d3:	55                   	push   %ebp
  8004d4:	89 e5                	mov    %esp,%ebp
  8004d6:	83 ec 08             	sub    $0x8,%esp
  8004d9:	8d 45 14             	lea    0x14(%ebp),%eax
  8004dc:	50                   	push   %eax
  8004dd:	ff 75 10             	push   0x10(%ebp)
  8004e0:	ff 75 0c             	push   0xc(%ebp)
  8004e3:	ff 75 08             	push   0x8(%ebp)
  8004e6:	e8 05 00 00 00       	call   8004f0 <vprintfmt>
  8004eb:	83 c4 10             	add    $0x10,%esp
  8004ee:	c9                   	leave
  8004ef:	c3                   	ret

008004f0 <vprintfmt>:
  8004f0:	55                   	push   %ebp
  8004f1:	89 e5                	mov    %esp,%ebp
  8004f3:	57                   	push   %edi
  8004f4:	56                   	push   %esi
  8004f5:	53                   	push   %ebx
  8004f6:	83 ec 2c             	sub    $0x2c,%esp
  8004f9:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8004fc:	8b 75 0c             	mov    0xc(%ebp),%esi
  8004ff:	8b 7d 10             	mov    0x10(%ebp),%edi
  800502:	eb 0a                	jmp    80050e <vprintfmt+0x1e>
  800504:	83 ec 08             	sub    $0x8,%esp
  800507:	56                   	push   %esi
  800508:	50                   	push   %eax
  800509:	ff d3                	call   *%ebx
  80050b:	83 c4 10             	add    $0x10,%esp
  80050e:	83 c7 01             	add    $0x1,%edi
  800511:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  800515:	83 f8 25             	cmp    $0x25,%eax
  800518:	74 0c                	je     800526 <vprintfmt+0x36>
  80051a:	85 c0                	test   %eax,%eax
  80051c:	75 e6                	jne    800504 <vprintfmt+0x14>
  80051e:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800521:	5b                   	pop    %ebx
  800522:	5e                   	pop    %esi
  800523:	5f                   	pop    %edi
  800524:	5d                   	pop    %ebp
  800525:	c3                   	ret
  800526:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  80052a:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  800531:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800538:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  80053f:	b9 00 00 00 00       	mov    $0x0,%ecx
  800544:	8d 47 01             	lea    0x1(%edi),%eax
  800547:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  80054a:	0f b6 17             	movzbl (%edi),%edx
  80054d:	8d 42 dd             	lea    -0x23(%edx),%eax
  800550:	3c 55                	cmp    $0x55,%al
  800552:	0f 87 c3 02 00 00    	ja     80081b <vprintfmt+0x32b>
  800558:	0f b6 c0             	movzbl %al,%eax
  80055b:	ff 24 85 a0 0f 80 00 	jmp    *0x800fa0(,%eax,4)
  800562:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800565:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  800569:	eb d9                	jmp    800544 <vprintfmt+0x54>
  80056b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80056e:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  800572:	eb d0                	jmp    800544 <vprintfmt+0x54>
  800574:	0f b6 d2             	movzbl %dl,%edx
  800577:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80057a:	b8 00 00 00 00       	mov    $0x0,%eax
  80057f:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  800582:	8d 04 80             	lea    (%eax,%eax,4),%eax
  800585:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  800589:	0f be 17             	movsbl (%edi),%edx
  80058c:	8d 4a d0             	lea    -0x30(%edx),%ecx
  80058f:	83 f9 09             	cmp    $0x9,%ecx
  800592:	77 52                	ja     8005e6 <vprintfmt+0xf6>
  800594:	83 c7 01             	add    $0x1,%edi
  800597:	eb e9                	jmp    800582 <vprintfmt+0x92>
  800599:	8b 45 14             	mov    0x14(%ebp),%eax
  80059c:	8d 50 04             	lea    0x4(%eax),%edx
  80059f:	89 55 14             	mov    %edx,0x14(%ebp)
  8005a2:	8b 00                	mov    (%eax),%eax
  8005a4:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8005a7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005aa:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  8005ae:	79 94                	jns    800544 <vprintfmt+0x54>
  8005b0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  8005b3:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8005b6:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  8005bd:	eb 85                	jmp    800544 <vprintfmt+0x54>
  8005bf:	8b 55 e0             	mov    -0x20(%ebp),%edx
  8005c2:	85 d2                	test   %edx,%edx
  8005c4:	b8 00 00 00 00       	mov    $0x0,%eax
  8005c9:	0f 49 c2             	cmovns %edx,%eax
  8005cc:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8005cf:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005d2:	e9 6d ff ff ff       	jmp    800544 <vprintfmt+0x54>
  8005d7:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005da:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  8005e1:	e9 5e ff ff ff       	jmp    800544 <vprintfmt+0x54>
  8005e6:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  8005e9:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8005ec:	eb bc                	jmp    8005aa <vprintfmt+0xba>
  8005ee:	83 c1 01             	add    $0x1,%ecx
  8005f1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005f4:	e9 4b ff ff ff       	jmp    800544 <vprintfmt+0x54>
  8005f9:	8b 45 14             	mov    0x14(%ebp),%eax
  8005fc:	8d 50 04             	lea    0x4(%eax),%edx
  8005ff:	89 55 14             	mov    %edx,0x14(%ebp)
  800602:	83 ec 08             	sub    $0x8,%esp
  800605:	56                   	push   %esi
  800606:	ff 30                	push   (%eax)
  800608:	ff d3                	call   *%ebx
  80060a:	83 c4 10             	add    $0x10,%esp
  80060d:	e9 a0 01 00 00       	jmp    8007b2 <vprintfmt+0x2c2>
  800612:	8b 45 14             	mov    0x14(%ebp),%eax
  800615:	8d 50 04             	lea    0x4(%eax),%edx
  800618:	89 55 14             	mov    %edx,0x14(%ebp)
  80061b:	8b 10                	mov    (%eax),%edx
  80061d:	89 d0                	mov    %edx,%eax
  80061f:	f7 d8                	neg    %eax
  800621:	0f 48 c2             	cmovs  %edx,%eax
  800624:	83 f8 08             	cmp    $0x8,%eax
  800627:	7f 20                	jg     800649 <vprintfmt+0x159>
  800629:	8b 14 85 00 11 80 00 	mov    0x801100(,%eax,4),%edx
  800630:	85 d2                	test   %edx,%edx
  800632:	74 15                	je     800649 <vprintfmt+0x159>
  800634:	52                   	push   %edx
  800635:	68 d8 0e 80 00       	push   $0x800ed8
  80063a:	56                   	push   %esi
  80063b:	53                   	push   %ebx
  80063c:	e8 92 fe ff ff       	call   8004d3 <printfmt>
  800641:	83 c4 10             	add    $0x10,%esp
  800644:	e9 69 01 00 00       	jmp    8007b2 <vprintfmt+0x2c2>
  800649:	50                   	push   %eax
  80064a:	68 cf 0e 80 00       	push   $0x800ecf
  80064f:	56                   	push   %esi
  800650:	53                   	push   %ebx
  800651:	e8 7d fe ff ff       	call   8004d3 <printfmt>
  800656:	83 c4 10             	add    $0x10,%esp
  800659:	e9 54 01 00 00       	jmp    8007b2 <vprintfmt+0x2c2>
  80065e:	8b 45 14             	mov    0x14(%ebp),%eax
  800661:	8d 50 04             	lea    0x4(%eax),%edx
  800664:	89 55 14             	mov    %edx,0x14(%ebp)
  800667:	8b 08                	mov    (%eax),%ecx
  800669:	85 c9                	test   %ecx,%ecx
  80066b:	b8 c8 0e 80 00       	mov    $0x800ec8,%eax
  800670:	0f 45 c1             	cmovne %ecx,%eax
  800673:	89 45 cc             	mov    %eax,-0x34(%ebp)
  800676:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  80067a:	7e 06                	jle    800682 <vprintfmt+0x192>
  80067c:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  800680:	75 0b                	jne    80068d <vprintfmt+0x19d>
  800682:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  800685:	8b 7d d0             	mov    -0x30(%ebp),%edi
  800688:	89 5d 08             	mov    %ebx,0x8(%ebp)
  80068b:	eb 5c                	jmp    8006e9 <vprintfmt+0x1f9>
  80068d:	83 ec 08             	sub    $0x8,%esp
  800690:	ff 75 d0             	push   -0x30(%ebp)
  800693:	ff 75 cc             	push   -0x34(%ebp)
  800696:	e8 20 02 00 00       	call   8008bb <strnlen>
  80069b:	89 c2                	mov    %eax,%edx
  80069d:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8006a0:	29 d0                	sub    %edx,%eax
  8006a2:	83 c4 10             	add    $0x10,%esp
  8006a5:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  8006a9:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8006ac:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8006af:	89 c3                	mov    %eax,%ebx
  8006b1:	eb 0e                	jmp    8006c1 <vprintfmt+0x1d1>
  8006b3:	83 ec 08             	sub    $0x8,%esp
  8006b6:	56                   	push   %esi
  8006b7:	57                   	push   %edi
  8006b8:	ff 55 08             	call   *0x8(%ebp)
  8006bb:	83 eb 01             	sub    $0x1,%ebx
  8006be:	83 c4 10             	add    $0x10,%esp
  8006c1:	85 db                	test   %ebx,%ebx
  8006c3:	7f ee                	jg     8006b3 <vprintfmt+0x1c3>
  8006c5:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8006c8:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8006cb:	85 c0                	test   %eax,%eax
  8006cd:	ba 00 00 00 00       	mov    $0x0,%edx
  8006d2:	0f 49 d0             	cmovns %eax,%edx
  8006d5:	29 d0                	sub    %edx,%eax
  8006d7:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8006da:	eb a6                	jmp    800682 <vprintfmt+0x192>
  8006dc:	83 ec 08             	sub    $0x8,%esp
  8006df:	56                   	push   %esi
  8006e0:	52                   	push   %edx
  8006e1:	ff 55 08             	call   *0x8(%ebp)
  8006e4:	83 c4 10             	add    $0x10,%esp
  8006e7:	89 d9                	mov    %ebx,%ecx
  8006e9:	8d 59 01             	lea    0x1(%ecx),%ebx
  8006ec:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  8006f0:	0f be d0             	movsbl %al,%edx
  8006f3:	85 d2                	test   %edx,%edx
  8006f5:	74 28                	je     80071f <vprintfmt+0x22f>
  8006f7:	85 ff                	test   %edi,%edi
  8006f9:	78 05                	js     800700 <vprintfmt+0x210>
  8006fb:	83 ef 01             	sub    $0x1,%edi
  8006fe:	78 2e                	js     80072e <vprintfmt+0x23e>
  800700:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  800704:	74 d6                	je     8006dc <vprintfmt+0x1ec>
  800706:	0f be c0             	movsbl %al,%eax
  800709:	83 e8 20             	sub    $0x20,%eax
  80070c:	83 f8 5e             	cmp    $0x5e,%eax
  80070f:	76 cb                	jbe    8006dc <vprintfmt+0x1ec>
  800711:	83 ec 08             	sub    $0x8,%esp
  800714:	56                   	push   %esi
  800715:	6a 3f                	push   $0x3f
  800717:	ff 55 08             	call   *0x8(%ebp)
  80071a:	83 c4 10             	add    $0x10,%esp
  80071d:	eb c8                	jmp    8006e7 <vprintfmt+0x1f7>
  80071f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800722:	8b 7d cc             	mov    -0x34(%ebp),%edi
  800725:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800728:	01 c7                	add    %eax,%edi
  80072a:	29 cf                	sub    %ecx,%edi
  80072c:	eb 13                	jmp    800741 <vprintfmt+0x251>
  80072e:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800731:	eb ef                	jmp    800722 <vprintfmt+0x232>
  800733:	83 ec 08             	sub    $0x8,%esp
  800736:	56                   	push   %esi
  800737:	6a 20                	push   $0x20
  800739:	ff d3                	call   *%ebx
  80073b:	83 ef 01             	sub    $0x1,%edi
  80073e:	83 c4 10             	add    $0x10,%esp
  800741:	85 ff                	test   %edi,%edi
  800743:	7f ee                	jg     800733 <vprintfmt+0x243>
  800745:	eb 6b                	jmp    8007b2 <vprintfmt+0x2c2>
  800747:	89 ca                	mov    %ecx,%edx
  800749:	8d 45 14             	lea    0x14(%ebp),%eax
  80074c:	e8 39 fd ff ff       	call   80048a <getint>
  800751:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800754:	89 55 dc             	mov    %edx,-0x24(%ebp)
  800757:	85 d2                	test   %edx,%edx
  800759:	78 0b                	js     800766 <vprintfmt+0x276>
  80075b:	89 d1                	mov    %edx,%ecx
  80075d:	89 c2                	mov    %eax,%edx
  80075f:	bf 0a 00 00 00       	mov    $0xa,%edi
  800764:	eb 32                	jmp    800798 <vprintfmt+0x2a8>
  800766:	83 ec 08             	sub    $0x8,%esp
  800769:	56                   	push   %esi
  80076a:	6a 2d                	push   $0x2d
  80076c:	ff d3                	call   *%ebx
  80076e:	8b 55 d8             	mov    -0x28(%ebp),%edx
  800771:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  800774:	f7 da                	neg    %edx
  800776:	83 d1 00             	adc    $0x0,%ecx
  800779:	f7 d9                	neg    %ecx
  80077b:	83 c4 10             	add    $0x10,%esp
  80077e:	bf 0a 00 00 00       	mov    $0xa,%edi
  800783:	eb 13                	jmp    800798 <vprintfmt+0x2a8>
  800785:	89 ca                	mov    %ecx,%edx
  800787:	8d 45 14             	lea    0x14(%ebp),%eax
  80078a:	e8 c7 fc ff ff       	call   800456 <getuint>
  80078f:	89 d1                	mov    %edx,%ecx
  800791:	89 c2                	mov    %eax,%edx
  800793:	bf 0a 00 00 00       	mov    $0xa,%edi
  800798:	83 ec 0c             	sub    $0xc,%esp
  80079b:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  80079f:	50                   	push   %eax
  8007a0:	ff 75 e0             	push   -0x20(%ebp)
  8007a3:	57                   	push   %edi
  8007a4:	51                   	push   %ecx
  8007a5:	52                   	push   %edx
  8007a6:	89 f2                	mov    %esi,%edx
  8007a8:	89 d8                	mov    %ebx,%eax
  8007aa:	e8 fe fb ff ff       	call   8003ad <printnum>
  8007af:	83 c4 20             	add    $0x20,%esp
  8007b2:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8007b5:	e9 54 fd ff ff       	jmp    80050e <vprintfmt+0x1e>
  8007ba:	89 ca                	mov    %ecx,%edx
  8007bc:	8d 45 14             	lea    0x14(%ebp),%eax
  8007bf:	e8 92 fc ff ff       	call   800456 <getuint>
  8007c4:	89 d1                	mov    %edx,%ecx
  8007c6:	89 c2                	mov    %eax,%edx
  8007c8:	bf 08 00 00 00       	mov    $0x8,%edi
  8007cd:	eb c9                	jmp    800798 <vprintfmt+0x2a8>
  8007cf:	83 ec 08             	sub    $0x8,%esp
  8007d2:	56                   	push   %esi
  8007d3:	6a 30                	push   $0x30
  8007d5:	ff d3                	call   *%ebx
  8007d7:	83 c4 08             	add    $0x8,%esp
  8007da:	56                   	push   %esi
  8007db:	6a 78                	push   $0x78
  8007dd:	ff d3                	call   *%ebx
  8007df:	8b 45 14             	mov    0x14(%ebp),%eax
  8007e2:	8d 50 04             	lea    0x4(%eax),%edx
  8007e5:	89 55 14             	mov    %edx,0x14(%ebp)
  8007e8:	8b 10                	mov    (%eax),%edx
  8007ea:	b9 00 00 00 00       	mov    $0x0,%ecx
  8007ef:	83 c4 10             	add    $0x10,%esp
  8007f2:	bf 10 00 00 00       	mov    $0x10,%edi
  8007f7:	eb 9f                	jmp    800798 <vprintfmt+0x2a8>
  8007f9:	89 ca                	mov    %ecx,%edx
  8007fb:	8d 45 14             	lea    0x14(%ebp),%eax
  8007fe:	e8 53 fc ff ff       	call   800456 <getuint>
  800803:	89 d1                	mov    %edx,%ecx
  800805:	89 c2                	mov    %eax,%edx
  800807:	bf 10 00 00 00       	mov    $0x10,%edi
  80080c:	eb 8a                	jmp    800798 <vprintfmt+0x2a8>
  80080e:	83 ec 08             	sub    $0x8,%esp
  800811:	56                   	push   %esi
  800812:	6a 25                	push   $0x25
  800814:	ff d3                	call   *%ebx
  800816:	83 c4 10             	add    $0x10,%esp
  800819:	eb 97                	jmp    8007b2 <vprintfmt+0x2c2>
  80081b:	83 ec 08             	sub    $0x8,%esp
  80081e:	56                   	push   %esi
  80081f:	6a 25                	push   $0x25
  800821:	ff d3                	call   *%ebx
  800823:	83 c4 10             	add    $0x10,%esp
  800826:	89 f8                	mov    %edi,%eax
  800828:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  80082c:	74 05                	je     800833 <vprintfmt+0x343>
  80082e:	83 e8 01             	sub    $0x1,%eax
  800831:	eb f5                	jmp    800828 <vprintfmt+0x338>
  800833:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800836:	e9 77 ff ff ff       	jmp    8007b2 <vprintfmt+0x2c2>

0080083b <vsnprintf>:
  80083b:	55                   	push   %ebp
  80083c:	89 e5                	mov    %esp,%ebp
  80083e:	83 ec 18             	sub    $0x18,%esp
  800841:	8b 45 08             	mov    0x8(%ebp),%eax
  800844:	8b 55 0c             	mov    0xc(%ebp),%edx
  800847:	89 45 ec             	mov    %eax,-0x14(%ebp)
  80084a:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  80084e:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  800851:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  800858:	85 c0                	test   %eax,%eax
  80085a:	74 26                	je     800882 <vsnprintf+0x47>
  80085c:	85 d2                	test   %edx,%edx
  80085e:	7e 22                	jle    800882 <vsnprintf+0x47>
  800860:	ff 75 14             	push   0x14(%ebp)
  800863:	ff 75 10             	push   0x10(%ebp)
  800866:	8d 45 ec             	lea    -0x14(%ebp),%eax
  800869:	50                   	push   %eax
  80086a:	68 b6 04 80 00       	push   $0x8004b6
  80086f:	e8 7c fc ff ff       	call   8004f0 <vprintfmt>
  800874:	8b 45 ec             	mov    -0x14(%ebp),%eax
  800877:	c6 00 00             	movb   $0x0,(%eax)
  80087a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  80087d:	83 c4 10             	add    $0x10,%esp
  800880:	c9                   	leave
  800881:	c3                   	ret
  800882:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800887:	eb f7                	jmp    800880 <vsnprintf+0x45>

00800889 <snprintf>:
  800889:	55                   	push   %ebp
  80088a:	89 e5                	mov    %esp,%ebp
  80088c:	83 ec 08             	sub    $0x8,%esp
  80088f:	8d 45 14             	lea    0x14(%ebp),%eax
  800892:	50                   	push   %eax
  800893:	ff 75 10             	push   0x10(%ebp)
  800896:	ff 75 0c             	push   0xc(%ebp)
  800899:	ff 75 08             	push   0x8(%ebp)
  80089c:	e8 9a ff ff ff       	call   80083b <vsnprintf>
  8008a1:	c9                   	leave
  8008a2:	c3                   	ret

008008a3 <strlen>:
  8008a3:	55                   	push   %ebp
  8008a4:	89 e5                	mov    %esp,%ebp
  8008a6:	8b 55 08             	mov    0x8(%ebp),%edx
  8008a9:	b8 00 00 00 00       	mov    $0x0,%eax
  8008ae:	eb 03                	jmp    8008b3 <strlen+0x10>
  8008b0:	83 c0 01             	add    $0x1,%eax
  8008b3:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  8008b7:	75 f7                	jne    8008b0 <strlen+0xd>
  8008b9:	5d                   	pop    %ebp
  8008ba:	c3                   	ret

008008bb <strnlen>:
  8008bb:	55                   	push   %ebp
  8008bc:	89 e5                	mov    %esp,%ebp
  8008be:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8008c1:	8b 55 0c             	mov    0xc(%ebp),%edx
  8008c4:	b8 00 00 00 00       	mov    $0x0,%eax
  8008c9:	eb 03                	jmp    8008ce <strnlen+0x13>
  8008cb:	83 c0 01             	add    $0x1,%eax
  8008ce:	39 d0                	cmp    %edx,%eax
  8008d0:	74 08                	je     8008da <strnlen+0x1f>
  8008d2:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  8008d6:	75 f3                	jne    8008cb <strnlen+0x10>
  8008d8:	89 c2                	mov    %eax,%edx
  8008da:	89 d0                	mov    %edx,%eax
  8008dc:	5d                   	pop    %ebp
  8008dd:	c3                   	ret

008008de <strcpy>:
  8008de:	55                   	push   %ebp
  8008df:	89 e5                	mov    %esp,%ebp
  8008e1:	53                   	push   %ebx
  8008e2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8008e5:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8008e8:	b8 00 00 00 00       	mov    $0x0,%eax
  8008ed:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  8008f1:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  8008f4:	83 c0 01             	add    $0x1,%eax
  8008f7:	84 d2                	test   %dl,%dl
  8008f9:	75 f2                	jne    8008ed <strcpy+0xf>
  8008fb:	89 c8                	mov    %ecx,%eax
  8008fd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800900:	c9                   	leave
  800901:	c3                   	ret

00800902 <strcat>:
  800902:	55                   	push   %ebp
  800903:	89 e5                	mov    %esp,%ebp
  800905:	53                   	push   %ebx
  800906:	83 ec 10             	sub    $0x10,%esp
  800909:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80090c:	53                   	push   %ebx
  80090d:	e8 91 ff ff ff       	call   8008a3 <strlen>
  800912:	83 c4 08             	add    $0x8,%esp
  800915:	ff 75 0c             	push   0xc(%ebp)
  800918:	01 d8                	add    %ebx,%eax
  80091a:	50                   	push   %eax
  80091b:	e8 be ff ff ff       	call   8008de <strcpy>
  800920:	89 d8                	mov    %ebx,%eax
  800922:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800925:	c9                   	leave
  800926:	c3                   	ret

00800927 <strncpy>:
  800927:	55                   	push   %ebp
  800928:	89 e5                	mov    %esp,%ebp
  80092a:	56                   	push   %esi
  80092b:	53                   	push   %ebx
  80092c:	8b 75 08             	mov    0x8(%ebp),%esi
  80092f:	8b 55 0c             	mov    0xc(%ebp),%edx
  800932:	89 f3                	mov    %esi,%ebx
  800934:	03 5d 10             	add    0x10(%ebp),%ebx
  800937:	89 f0                	mov    %esi,%eax
  800939:	eb 0f                	jmp    80094a <strncpy+0x23>
  80093b:	83 c0 01             	add    $0x1,%eax
  80093e:	0f b6 0a             	movzbl (%edx),%ecx
  800941:	88 48 ff             	mov    %cl,-0x1(%eax)
  800944:	80 f9 01             	cmp    $0x1,%cl
  800947:	83 da ff             	sbb    $0xffffffff,%edx
  80094a:	39 d8                	cmp    %ebx,%eax
  80094c:	75 ed                	jne    80093b <strncpy+0x14>
  80094e:	89 f0                	mov    %esi,%eax
  800950:	5b                   	pop    %ebx
  800951:	5e                   	pop    %esi
  800952:	5d                   	pop    %ebp
  800953:	c3                   	ret

00800954 <strlcpy>:
  800954:	55                   	push   %ebp
  800955:	89 e5                	mov    %esp,%ebp
  800957:	56                   	push   %esi
  800958:	53                   	push   %ebx
  800959:	8b 75 08             	mov    0x8(%ebp),%esi
  80095c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  80095f:	8b 55 10             	mov    0x10(%ebp),%edx
  800962:	89 f0                	mov    %esi,%eax
  800964:	85 d2                	test   %edx,%edx
  800966:	74 21                	je     800989 <strlcpy+0x35>
  800968:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  80096c:	89 f2                	mov    %esi,%edx
  80096e:	eb 09                	jmp    800979 <strlcpy+0x25>
  800970:	83 c1 01             	add    $0x1,%ecx
  800973:	83 c2 01             	add    $0x1,%edx
  800976:	88 5a ff             	mov    %bl,-0x1(%edx)
  800979:	39 c2                	cmp    %eax,%edx
  80097b:	74 09                	je     800986 <strlcpy+0x32>
  80097d:	0f b6 19             	movzbl (%ecx),%ebx
  800980:	84 db                	test   %bl,%bl
  800982:	75 ec                	jne    800970 <strlcpy+0x1c>
  800984:	89 d0                	mov    %edx,%eax
  800986:	c6 00 00             	movb   $0x0,(%eax)
  800989:	29 f0                	sub    %esi,%eax
  80098b:	5b                   	pop    %ebx
  80098c:	5e                   	pop    %esi
  80098d:	5d                   	pop    %ebp
  80098e:	c3                   	ret

0080098f <strcmp>:
  80098f:	55                   	push   %ebp
  800990:	89 e5                	mov    %esp,%ebp
  800992:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800995:	8b 55 0c             	mov    0xc(%ebp),%edx
  800998:	eb 06                	jmp    8009a0 <strcmp+0x11>
  80099a:	83 c1 01             	add    $0x1,%ecx
  80099d:	83 c2 01             	add    $0x1,%edx
  8009a0:	0f b6 01             	movzbl (%ecx),%eax
  8009a3:	84 c0                	test   %al,%al
  8009a5:	74 04                	je     8009ab <strcmp+0x1c>
  8009a7:	3a 02                	cmp    (%edx),%al
  8009a9:	74 ef                	je     80099a <strcmp+0xb>
  8009ab:	0f b6 c0             	movzbl %al,%eax
  8009ae:	0f b6 12             	movzbl (%edx),%edx
  8009b1:	29 d0                	sub    %edx,%eax
  8009b3:	5d                   	pop    %ebp
  8009b4:	c3                   	ret

008009b5 <strncmp>:
  8009b5:	55                   	push   %ebp
  8009b6:	89 e5                	mov    %esp,%ebp
  8009b8:	53                   	push   %ebx
  8009b9:	8b 45 08             	mov    0x8(%ebp),%eax
  8009bc:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8009bf:	8b 55 10             	mov    0x10(%ebp),%edx
  8009c2:	eb 09                	jmp    8009cd <strncmp+0x18>
  8009c4:	83 ea 01             	sub    $0x1,%edx
  8009c7:	83 c0 01             	add    $0x1,%eax
  8009ca:	83 c1 01             	add    $0x1,%ecx
  8009cd:	85 d2                	test   %edx,%edx
  8009cf:	74 18                	je     8009e9 <strncmp+0x34>
  8009d1:	0f b6 18             	movzbl (%eax),%ebx
  8009d4:	84 db                	test   %bl,%bl
  8009d6:	74 04                	je     8009dc <strncmp+0x27>
  8009d8:	3a 19                	cmp    (%ecx),%bl
  8009da:	74 e8                	je     8009c4 <strncmp+0xf>
  8009dc:	0f b6 00             	movzbl (%eax),%eax
  8009df:	0f b6 11             	movzbl (%ecx),%edx
  8009e2:	29 d0                	sub    %edx,%eax
  8009e4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8009e7:	c9                   	leave
  8009e8:	c3                   	ret
  8009e9:	b8 00 00 00 00       	mov    $0x0,%eax
  8009ee:	eb f4                	jmp    8009e4 <strncmp+0x2f>

008009f0 <strchr>:
  8009f0:	55                   	push   %ebp
  8009f1:	89 e5                	mov    %esp,%ebp
  8009f3:	8b 45 08             	mov    0x8(%ebp),%eax
  8009f6:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8009fa:	eb 03                	jmp    8009ff <strchr+0xf>
  8009fc:	83 c0 01             	add    $0x1,%eax
  8009ff:	0f b6 10             	movzbl (%eax),%edx
  800a02:	84 d2                	test   %dl,%dl
  800a04:	74 06                	je     800a0c <strchr+0x1c>
  800a06:	38 ca                	cmp    %cl,%dl
  800a08:	75 f2                	jne    8009fc <strchr+0xc>
  800a0a:	eb 05                	jmp    800a11 <strchr+0x21>
  800a0c:	b8 00 00 00 00       	mov    $0x0,%eax
  800a11:	5d                   	pop    %ebp
  800a12:	c3                   	ret

00800a13 <strfind>:
  800a13:	55                   	push   %ebp
  800a14:	89 e5                	mov    %esp,%ebp
  800a16:	8b 45 08             	mov    0x8(%ebp),%eax
  800a19:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  800a1d:	0f b6 10             	movzbl (%eax),%edx
  800a20:	38 ca                	cmp    %cl,%dl
  800a22:	74 09                	je     800a2d <strfind+0x1a>
  800a24:	84 d2                	test   %dl,%dl
  800a26:	74 05                	je     800a2d <strfind+0x1a>
  800a28:	83 c0 01             	add    $0x1,%eax
  800a2b:	eb f0                	jmp    800a1d <strfind+0xa>
  800a2d:	5d                   	pop    %ebp
  800a2e:	c3                   	ret

00800a2f <memset>:
  800a2f:	55                   	push   %ebp
  800a30:	89 e5                	mov    %esp,%ebp
  800a32:	57                   	push   %edi
  800a33:	8b 55 08             	mov    0x8(%ebp),%edx
  800a36:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800a39:	85 c9                	test   %ecx,%ecx
  800a3b:	74 24                	je     800a61 <memset+0x32>
  800a3d:	89 d0                	mov    %edx,%eax
  800a3f:	09 c8                	or     %ecx,%eax
  800a41:	a8 03                	test   $0x3,%al
  800a43:	75 14                	jne    800a59 <memset+0x2a>
  800a45:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  800a49:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  800a4f:	c1 e9 02             	shr    $0x2,%ecx
  800a52:	89 d7                	mov    %edx,%edi
  800a54:	fc                   	cld
  800a55:	f3 ab                	rep stos %eax,%es:(%edi)
  800a57:	eb 08                	jmp    800a61 <memset+0x32>
  800a59:	89 d7                	mov    %edx,%edi
  800a5b:	8b 45 0c             	mov    0xc(%ebp),%eax
  800a5e:	fc                   	cld
  800a5f:	f3 aa                	rep stos %al,%es:(%edi)
  800a61:	89 d0                	mov    %edx,%eax
  800a63:	8b 7d fc             	mov    -0x4(%ebp),%edi
  800a66:	c9                   	leave
  800a67:	c3                   	ret

00800a68 <memmove>:
  800a68:	55                   	push   %ebp
  800a69:	89 e5                	mov    %esp,%ebp
  800a6b:	57                   	push   %edi
  800a6c:	56                   	push   %esi
  800a6d:	8b 45 08             	mov    0x8(%ebp),%eax
  800a70:	8b 75 0c             	mov    0xc(%ebp),%esi
  800a73:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800a76:	39 c6                	cmp    %eax,%esi
  800a78:	73 32                	jae    800aac <memmove+0x44>
  800a7a:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  800a7d:	39 d0                	cmp    %edx,%eax
  800a7f:	73 2b                	jae    800aac <memmove+0x44>
  800a81:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  800a84:	89 fe                	mov    %edi,%esi
  800a86:	09 ce                	or     %ecx,%esi
  800a88:	09 d6                	or     %edx,%esi
  800a8a:	f7 c6 03 00 00 00    	test   $0x3,%esi
  800a90:	75 0e                	jne    800aa0 <memmove+0x38>
  800a92:	83 ef 04             	sub    $0x4,%edi
  800a95:	8d 72 fc             	lea    -0x4(%edx),%esi
  800a98:	c1 e9 02             	shr    $0x2,%ecx
  800a9b:	fd                   	std
  800a9c:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800a9e:	eb 09                	jmp    800aa9 <memmove+0x41>
  800aa0:	83 ef 01             	sub    $0x1,%edi
  800aa3:	8d 72 ff             	lea    -0x1(%edx),%esi
  800aa6:	fd                   	std
  800aa7:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800aa9:	fc                   	cld
  800aaa:	eb 1a                	jmp    800ac6 <memmove+0x5e>
  800aac:	89 c2                	mov    %eax,%edx
  800aae:	09 ca                	or     %ecx,%edx
  800ab0:	09 f2                	or     %esi,%edx
  800ab2:	f6 c2 03             	test   $0x3,%dl
  800ab5:	75 0a                	jne    800ac1 <memmove+0x59>
  800ab7:	c1 e9 02             	shr    $0x2,%ecx
  800aba:	89 c7                	mov    %eax,%edi
  800abc:	fc                   	cld
  800abd:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800abf:	eb 05                	jmp    800ac6 <memmove+0x5e>
  800ac1:	89 c7                	mov    %eax,%edi
  800ac3:	fc                   	cld
  800ac4:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800ac6:	5e                   	pop    %esi
  800ac7:	5f                   	pop    %edi
  800ac8:	5d                   	pop    %ebp
  800ac9:	c3                   	ret

00800aca <memcpy>:
  800aca:	55                   	push   %ebp
  800acb:	89 e5                	mov    %esp,%ebp
  800acd:	83 ec 0c             	sub    $0xc,%esp
  800ad0:	ff 75 10             	push   0x10(%ebp)
  800ad3:	ff 75 0c             	push   0xc(%ebp)
  800ad6:	ff 75 08             	push   0x8(%ebp)
  800ad9:	e8 8a ff ff ff       	call   800a68 <memmove>
  800ade:	c9                   	leave
  800adf:	c3                   	ret

00800ae0 <memcmp>:
  800ae0:	55                   	push   %ebp
  800ae1:	89 e5                	mov    %esp,%ebp
  800ae3:	56                   	push   %esi
  800ae4:	53                   	push   %ebx
  800ae5:	8b 45 08             	mov    0x8(%ebp),%eax
  800ae8:	8b 55 0c             	mov    0xc(%ebp),%edx
  800aeb:	89 c6                	mov    %eax,%esi
  800aed:	03 75 10             	add    0x10(%ebp),%esi
  800af0:	eb 06                	jmp    800af8 <memcmp+0x18>
  800af2:	83 c0 01             	add    $0x1,%eax
  800af5:	83 c2 01             	add    $0x1,%edx
  800af8:	39 f0                	cmp    %esi,%eax
  800afa:	74 14                	je     800b10 <memcmp+0x30>
  800afc:	0f b6 08             	movzbl (%eax),%ecx
  800aff:	0f b6 1a             	movzbl (%edx),%ebx
  800b02:	38 d9                	cmp    %bl,%cl
  800b04:	74 ec                	je     800af2 <memcmp+0x12>
  800b06:	0f b6 c1             	movzbl %cl,%eax
  800b09:	0f b6 db             	movzbl %bl,%ebx
  800b0c:	29 d8                	sub    %ebx,%eax
  800b0e:	eb 05                	jmp    800b15 <memcmp+0x35>
  800b10:	b8 00 00 00 00       	mov    $0x0,%eax
  800b15:	5b                   	pop    %ebx
  800b16:	5e                   	pop    %esi
  800b17:	5d                   	pop    %ebp
  800b18:	c3                   	ret

00800b19 <memfind>:
  800b19:	55                   	push   %ebp
  800b1a:	89 e5                	mov    %esp,%ebp
  800b1c:	8b 45 08             	mov    0x8(%ebp),%eax
  800b1f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800b22:	89 c2                	mov    %eax,%edx
  800b24:	03 55 10             	add    0x10(%ebp),%edx
  800b27:	eb 03                	jmp    800b2c <memfind+0x13>
  800b29:	83 c0 01             	add    $0x1,%eax
  800b2c:	39 d0                	cmp    %edx,%eax
  800b2e:	73 04                	jae    800b34 <memfind+0x1b>
  800b30:	38 08                	cmp    %cl,(%eax)
  800b32:	75 f5                	jne    800b29 <memfind+0x10>
  800b34:	5d                   	pop    %ebp
  800b35:	c3                   	ret

00800b36 <strtol>:
  800b36:	55                   	push   %ebp
  800b37:	89 e5                	mov    %esp,%ebp
  800b39:	57                   	push   %edi
  800b3a:	56                   	push   %esi
  800b3b:	53                   	push   %ebx
  800b3c:	8b 55 08             	mov    0x8(%ebp),%edx
  800b3f:	8b 5d 10             	mov    0x10(%ebp),%ebx
  800b42:	eb 03                	jmp    800b47 <strtol+0x11>
  800b44:	83 c2 01             	add    $0x1,%edx
  800b47:	0f b6 02             	movzbl (%edx),%eax
  800b4a:	3c 20                	cmp    $0x20,%al
  800b4c:	74 f6                	je     800b44 <strtol+0xe>
  800b4e:	3c 09                	cmp    $0x9,%al
  800b50:	74 f2                	je     800b44 <strtol+0xe>
  800b52:	3c 2b                	cmp    $0x2b,%al
  800b54:	74 2a                	je     800b80 <strtol+0x4a>
  800b56:	bf 00 00 00 00       	mov    $0x0,%edi
  800b5b:	3c 2d                	cmp    $0x2d,%al
  800b5d:	74 2b                	je     800b8a <strtol+0x54>
  800b5f:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  800b65:	75 0f                	jne    800b76 <strtol+0x40>
  800b67:	80 3a 30             	cmpb   $0x30,(%edx)
  800b6a:	74 28                	je     800b94 <strtol+0x5e>
  800b6c:	85 db                	test   %ebx,%ebx
  800b6e:	b8 0a 00 00 00       	mov    $0xa,%eax
  800b73:	0f 44 d8             	cmove  %eax,%ebx
  800b76:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b7b:	89 5d 10             	mov    %ebx,0x10(%ebp)
  800b7e:	eb 46                	jmp    800bc6 <strtol+0x90>
  800b80:	83 c2 01             	add    $0x1,%edx
  800b83:	bf 00 00 00 00       	mov    $0x0,%edi
  800b88:	eb d5                	jmp    800b5f <strtol+0x29>
  800b8a:	83 c2 01             	add    $0x1,%edx
  800b8d:	bf 01 00 00 00       	mov    $0x1,%edi
  800b92:	eb cb                	jmp    800b5f <strtol+0x29>
  800b94:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800b98:	74 0e                	je     800ba8 <strtol+0x72>
  800b9a:	85 db                	test   %ebx,%ebx
  800b9c:	75 d8                	jne    800b76 <strtol+0x40>
  800b9e:	83 c2 01             	add    $0x1,%edx
  800ba1:	bb 08 00 00 00       	mov    $0x8,%ebx
  800ba6:	eb ce                	jmp    800b76 <strtol+0x40>
  800ba8:	83 c2 02             	add    $0x2,%edx
  800bab:	bb 10 00 00 00       	mov    $0x10,%ebx
  800bb0:	eb c4                	jmp    800b76 <strtol+0x40>
  800bb2:	0f be c0             	movsbl %al,%eax
  800bb5:	83 e8 30             	sub    $0x30,%eax
  800bb8:	3b 45 10             	cmp    0x10(%ebp),%eax
  800bbb:	7d 3a                	jge    800bf7 <strtol+0xc1>
  800bbd:	83 c2 01             	add    $0x1,%edx
  800bc0:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  800bc4:	01 c1                	add    %eax,%ecx
  800bc6:	0f b6 02             	movzbl (%edx),%eax
  800bc9:	8d 70 d0             	lea    -0x30(%eax),%esi
  800bcc:	89 f3                	mov    %esi,%ebx
  800bce:	80 fb 09             	cmp    $0x9,%bl
  800bd1:	76 df                	jbe    800bb2 <strtol+0x7c>
  800bd3:	8d 70 9f             	lea    -0x61(%eax),%esi
  800bd6:	89 f3                	mov    %esi,%ebx
  800bd8:	80 fb 19             	cmp    $0x19,%bl
  800bdb:	77 08                	ja     800be5 <strtol+0xaf>
  800bdd:	0f be c0             	movsbl %al,%eax
  800be0:	83 e8 57             	sub    $0x57,%eax
  800be3:	eb d3                	jmp    800bb8 <strtol+0x82>
  800be5:	8d 70 bf             	lea    -0x41(%eax),%esi
  800be8:	89 f3                	mov    %esi,%ebx
  800bea:	80 fb 19             	cmp    $0x19,%bl
  800bed:	77 08                	ja     800bf7 <strtol+0xc1>
  800bef:	0f be c0             	movsbl %al,%eax
  800bf2:	83 e8 37             	sub    $0x37,%eax
  800bf5:	eb c1                	jmp    800bb8 <strtol+0x82>
  800bf7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  800bfb:	74 05                	je     800c02 <strtol+0xcc>
  800bfd:	8b 45 0c             	mov    0xc(%ebp),%eax
  800c00:	89 10                	mov    %edx,(%eax)
  800c02:	89 c8                	mov    %ecx,%eax
  800c04:	f7 d8                	neg    %eax
  800c06:	85 ff                	test   %edi,%edi
  800c08:	0f 45 c8             	cmovne %eax,%ecx
  800c0b:	89 c8                	mov    %ecx,%eax
  800c0d:	5b                   	pop    %ebx
  800c0e:	5e                   	pop    %esi
  800c0f:	5f                   	pop    %edi
  800c10:	5d                   	pop    %ebp
  800c11:	c3                   	ret
  800c12:	66 90                	xchg   %ax,%ax
  800c14:	66 90                	xchg   %ax,%ax
  800c16:	66 90                	xchg   %ax,%ax
  800c18:	66 90                	xchg   %ax,%ax
  800c1a:	66 90                	xchg   %ax,%ax
  800c1c:	66 90                	xchg   %ax,%ax
  800c1e:	66 90                	xchg   %ax,%ax

00800c20 <__udivdi3>:
  800c20:	f3 0f 1e fb          	endbr32
  800c24:	55                   	push   %ebp
  800c25:	57                   	push   %edi
  800c26:	56                   	push   %esi
  800c27:	53                   	push   %ebx
  800c28:	83 ec 1c             	sub    $0x1c,%esp
  800c2b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800c2f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  800c33:	8b 74 24 34          	mov    0x34(%esp),%esi
  800c37:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  800c3b:	85 c0                	test   %eax,%eax
  800c3d:	75 19                	jne    800c58 <__udivdi3+0x38>
  800c3f:	39 de                	cmp    %ebx,%esi
  800c41:	73 4d                	jae    800c90 <__udivdi3+0x70>
  800c43:	31 ff                	xor    %edi,%edi
  800c45:	89 e8                	mov    %ebp,%eax
  800c47:	89 f2                	mov    %esi,%edx
  800c49:	f7 f3                	div    %ebx
  800c4b:	89 fa                	mov    %edi,%edx
  800c4d:	83 c4 1c             	add    $0x1c,%esp
  800c50:	5b                   	pop    %ebx
  800c51:	5e                   	pop    %esi
  800c52:	5f                   	pop    %edi
  800c53:	5d                   	pop    %ebp
  800c54:	c3                   	ret
  800c55:	8d 76 00             	lea    0x0(%esi),%esi
  800c58:	39 c6                	cmp    %eax,%esi
  800c5a:	73 14                	jae    800c70 <__udivdi3+0x50>
  800c5c:	31 ff                	xor    %edi,%edi
  800c5e:	31 c0                	xor    %eax,%eax
  800c60:	89 fa                	mov    %edi,%edx
  800c62:	83 c4 1c             	add    $0x1c,%esp
  800c65:	5b                   	pop    %ebx
  800c66:	5e                   	pop    %esi
  800c67:	5f                   	pop    %edi
  800c68:	5d                   	pop    %ebp
  800c69:	c3                   	ret
  800c6a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800c70:	0f bd f8             	bsr    %eax,%edi
  800c73:	83 f7 1f             	xor    $0x1f,%edi
  800c76:	75 48                	jne    800cc0 <__udivdi3+0xa0>
  800c78:	39 f0                	cmp    %esi,%eax
  800c7a:	72 06                	jb     800c82 <__udivdi3+0x62>
  800c7c:	31 c0                	xor    %eax,%eax
  800c7e:	39 dd                	cmp    %ebx,%ebp
  800c80:	72 de                	jb     800c60 <__udivdi3+0x40>
  800c82:	b8 01 00 00 00       	mov    $0x1,%eax
  800c87:	eb d7                	jmp    800c60 <__udivdi3+0x40>
  800c89:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800c90:	89 d9                	mov    %ebx,%ecx
  800c92:	85 db                	test   %ebx,%ebx
  800c94:	75 0b                	jne    800ca1 <__udivdi3+0x81>
  800c96:	b8 01 00 00 00       	mov    $0x1,%eax
  800c9b:	31 d2                	xor    %edx,%edx
  800c9d:	f7 f3                	div    %ebx
  800c9f:	89 c1                	mov    %eax,%ecx
  800ca1:	31 d2                	xor    %edx,%edx
  800ca3:	89 f0                	mov    %esi,%eax
  800ca5:	f7 f1                	div    %ecx
  800ca7:	89 c6                	mov    %eax,%esi
  800ca9:	89 e8                	mov    %ebp,%eax
  800cab:	89 f7                	mov    %esi,%edi
  800cad:	f7 f1                	div    %ecx
  800caf:	89 fa                	mov    %edi,%edx
  800cb1:	83 c4 1c             	add    $0x1c,%esp
  800cb4:	5b                   	pop    %ebx
  800cb5:	5e                   	pop    %esi
  800cb6:	5f                   	pop    %edi
  800cb7:	5d                   	pop    %ebp
  800cb8:	c3                   	ret
  800cb9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800cc0:	89 f9                	mov    %edi,%ecx
  800cc2:	ba 20 00 00 00       	mov    $0x20,%edx
  800cc7:	29 fa                	sub    %edi,%edx
  800cc9:	d3 e0                	shl    %cl,%eax
  800ccb:	89 44 24 08          	mov    %eax,0x8(%esp)
  800ccf:	89 d1                	mov    %edx,%ecx
  800cd1:	89 d8                	mov    %ebx,%eax
  800cd3:	d3 e8                	shr    %cl,%eax
  800cd5:	89 c1                	mov    %eax,%ecx
  800cd7:	8b 44 24 08          	mov    0x8(%esp),%eax
  800cdb:	09 c1                	or     %eax,%ecx
  800cdd:	89 f0                	mov    %esi,%eax
  800cdf:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800ce3:	89 f9                	mov    %edi,%ecx
  800ce5:	d3 e3                	shl    %cl,%ebx
  800ce7:	89 d1                	mov    %edx,%ecx
  800ce9:	d3 e8                	shr    %cl,%eax
  800ceb:	89 f9                	mov    %edi,%ecx
  800ced:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  800cf1:	89 eb                	mov    %ebp,%ebx
  800cf3:	d3 e6                	shl    %cl,%esi
  800cf5:	89 d1                	mov    %edx,%ecx
  800cf7:	d3 eb                	shr    %cl,%ebx
  800cf9:	09 f3                	or     %esi,%ebx
  800cfb:	89 c6                	mov    %eax,%esi
  800cfd:	89 f2                	mov    %esi,%edx
  800cff:	89 d8                	mov    %ebx,%eax
  800d01:	f7 74 24 08          	divl   0x8(%esp)
  800d05:	89 d6                	mov    %edx,%esi
  800d07:	89 c3                	mov    %eax,%ebx
  800d09:	f7 64 24 0c          	mull   0xc(%esp)
  800d0d:	39 d6                	cmp    %edx,%esi
  800d0f:	72 1f                	jb     800d30 <__udivdi3+0x110>
  800d11:	89 f9                	mov    %edi,%ecx
  800d13:	d3 e5                	shl    %cl,%ebp
  800d15:	39 c5                	cmp    %eax,%ebp
  800d17:	73 04                	jae    800d1d <__udivdi3+0xfd>
  800d19:	39 d6                	cmp    %edx,%esi
  800d1b:	74 13                	je     800d30 <__udivdi3+0x110>
  800d1d:	89 d8                	mov    %ebx,%eax
  800d1f:	31 ff                	xor    %edi,%edi
  800d21:	e9 3a ff ff ff       	jmp    800c60 <__udivdi3+0x40>
  800d26:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800d2d:	00 
  800d2e:	66 90                	xchg   %ax,%ax
  800d30:	8d 43 ff             	lea    -0x1(%ebx),%eax
  800d33:	31 ff                	xor    %edi,%edi
  800d35:	e9 26 ff ff ff       	jmp    800c60 <__udivdi3+0x40>
  800d3a:	66 90                	xchg   %ax,%ax
  800d3c:	66 90                	xchg   %ax,%ax
  800d3e:	66 90                	xchg   %ax,%ax

00800d40 <__umoddi3>:
  800d40:	f3 0f 1e fb          	endbr32
  800d44:	55                   	push   %ebp
  800d45:	57                   	push   %edi
  800d46:	56                   	push   %esi
  800d47:	53                   	push   %ebx
  800d48:	83 ec 1c             	sub    $0x1c,%esp
  800d4b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  800d4f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800d53:	8b 74 24 30          	mov    0x30(%esp),%esi
  800d57:	8b 7c 24 38          	mov    0x38(%esp),%edi
  800d5b:	89 da                	mov    %ebx,%edx
  800d5d:	85 c0                	test   %eax,%eax
  800d5f:	75 17                	jne    800d78 <__umoddi3+0x38>
  800d61:	39 fb                	cmp    %edi,%ebx
  800d63:	73 53                	jae    800db8 <__umoddi3+0x78>
  800d65:	89 f0                	mov    %esi,%eax
  800d67:	f7 f7                	div    %edi
  800d69:	89 d0                	mov    %edx,%eax
  800d6b:	31 d2                	xor    %edx,%edx
  800d6d:	83 c4 1c             	add    $0x1c,%esp
  800d70:	5b                   	pop    %ebx
  800d71:	5e                   	pop    %esi
  800d72:	5f                   	pop    %edi
  800d73:	5d                   	pop    %ebp
  800d74:	c3                   	ret
  800d75:	8d 76 00             	lea    0x0(%esi),%esi
  800d78:	89 f1                	mov    %esi,%ecx
  800d7a:	39 c3                	cmp    %eax,%ebx
  800d7c:	73 12                	jae    800d90 <__umoddi3+0x50>
  800d7e:	89 f0                	mov    %esi,%eax
  800d80:	83 c4 1c             	add    $0x1c,%esp
  800d83:	5b                   	pop    %ebx
  800d84:	5e                   	pop    %esi
  800d85:	5f                   	pop    %edi
  800d86:	5d                   	pop    %ebp
  800d87:	c3                   	ret
  800d88:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800d8f:	00 
  800d90:	0f bd e8             	bsr    %eax,%ebp
  800d93:	83 f5 1f             	xor    $0x1f,%ebp
  800d96:	75 48                	jne    800de0 <__umoddi3+0xa0>
  800d98:	39 d8                	cmp    %ebx,%eax
  800d9a:	0f 82 d0 00 00 00    	jb     800e70 <__umoddi3+0x130>
  800da0:	39 fe                	cmp    %edi,%esi
  800da2:	0f 83 c8 00 00 00    	jae    800e70 <__umoddi3+0x130>
  800da8:	89 c8                	mov    %ecx,%eax
  800daa:	83 c4 1c             	add    $0x1c,%esp
  800dad:	5b                   	pop    %ebx
  800dae:	5e                   	pop    %esi
  800daf:	5f                   	pop    %edi
  800db0:	5d                   	pop    %ebp
  800db1:	c3                   	ret
  800db2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800db8:	89 f9                	mov    %edi,%ecx
  800dba:	85 ff                	test   %edi,%edi
  800dbc:	75 0b                	jne    800dc9 <__umoddi3+0x89>
  800dbe:	b8 01 00 00 00       	mov    $0x1,%eax
  800dc3:	31 d2                	xor    %edx,%edx
  800dc5:	f7 f7                	div    %edi
  800dc7:	89 c1                	mov    %eax,%ecx
  800dc9:	89 d8                	mov    %ebx,%eax
  800dcb:	31 d2                	xor    %edx,%edx
  800dcd:	f7 f1                	div    %ecx
  800dcf:	89 f0                	mov    %esi,%eax
  800dd1:	f7 f1                	div    %ecx
  800dd3:	89 d0                	mov    %edx,%eax
  800dd5:	31 d2                	xor    %edx,%edx
  800dd7:	eb 94                	jmp    800d6d <__umoddi3+0x2d>
  800dd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800de0:	89 e9                	mov    %ebp,%ecx
  800de2:	ba 20 00 00 00       	mov    $0x20,%edx
  800de7:	29 ea                	sub    %ebp,%edx
  800de9:	d3 e0                	shl    %cl,%eax
  800deb:	89 44 24 08          	mov    %eax,0x8(%esp)
  800def:	89 d1                	mov    %edx,%ecx
  800df1:	89 f8                	mov    %edi,%eax
  800df3:	d3 e8                	shr    %cl,%eax
  800df5:	89 54 24 04          	mov    %edx,0x4(%esp)
  800df9:	8b 54 24 04          	mov    0x4(%esp),%edx
  800dfd:	89 c1                	mov    %eax,%ecx
  800dff:	8b 44 24 08          	mov    0x8(%esp),%eax
  800e03:	09 c1                	or     %eax,%ecx
  800e05:	89 d8                	mov    %ebx,%eax
  800e07:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800e0b:	89 e9                	mov    %ebp,%ecx
  800e0d:	d3 e7                	shl    %cl,%edi
  800e0f:	89 d1                	mov    %edx,%ecx
  800e11:	d3 e8                	shr    %cl,%eax
  800e13:	89 e9                	mov    %ebp,%ecx
  800e15:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  800e19:	d3 e3                	shl    %cl,%ebx
  800e1b:	89 c7                	mov    %eax,%edi
  800e1d:	89 d1                	mov    %edx,%ecx
  800e1f:	89 f0                	mov    %esi,%eax
  800e21:	d3 e8                	shr    %cl,%eax
  800e23:	89 fa                	mov    %edi,%edx
  800e25:	89 e9                	mov    %ebp,%ecx
  800e27:	09 d8                	or     %ebx,%eax
  800e29:	d3 e6                	shl    %cl,%esi
  800e2b:	f7 74 24 08          	divl   0x8(%esp)
  800e2f:	89 d3                	mov    %edx,%ebx
  800e31:	f7 64 24 0c          	mull   0xc(%esp)
  800e35:	89 c7                	mov    %eax,%edi
  800e37:	89 d1                	mov    %edx,%ecx
  800e39:	39 d3                	cmp    %edx,%ebx
  800e3b:	72 06                	jb     800e43 <__umoddi3+0x103>
  800e3d:	75 10                	jne    800e4f <__umoddi3+0x10f>
  800e3f:	39 c6                	cmp    %eax,%esi
  800e41:	73 0c                	jae    800e4f <__umoddi3+0x10f>
  800e43:	2b 44 24 0c          	sub    0xc(%esp),%eax
  800e47:	1b 54 24 08          	sbb    0x8(%esp),%edx
  800e4b:	89 d1                	mov    %edx,%ecx
  800e4d:	89 c7                	mov    %eax,%edi
  800e4f:	89 f2                	mov    %esi,%edx
  800e51:	29 fa                	sub    %edi,%edx
  800e53:	19 cb                	sbb    %ecx,%ebx
  800e55:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  800e5a:	89 d8                	mov    %ebx,%eax
  800e5c:	d3 e0                	shl    %cl,%eax
  800e5e:	89 e9                	mov    %ebp,%ecx
  800e60:	d3 ea                	shr    %cl,%edx
  800e62:	d3 eb                	shr    %cl,%ebx
  800e64:	09 d0                	or     %edx,%eax
  800e66:	89 da                	mov    %ebx,%edx
  800e68:	83 c4 1c             	add    $0x1c,%esp
  800e6b:	5b                   	pop    %ebx
  800e6c:	5e                   	pop    %esi
  800e6d:	5f                   	pop    %edi
  800e6e:	5d                   	pop    %ebp
  800e6f:	c3                   	ret
  800e70:	89 da                	mov    %ebx,%edx
  800e72:	89 f1                	mov    %esi,%ecx
  800e74:	29 f9                	sub    %edi,%ecx
  800e76:	19 c2                	sbb    %eax,%edx
  800e78:	89 c8                	mov    %ecx,%eax
  800e7a:	e9 2b ff ff ff       	jmp    800daa <__umoddi3+0x6a>
