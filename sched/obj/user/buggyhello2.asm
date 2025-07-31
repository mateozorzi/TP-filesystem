
obj/user/buggyhello2:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 1d 00 00 00       	call   80004e <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <umain>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	83 ec 10             	sub    $0x10,%esp
  800039:	68 00 00 10 00       	push   $0x100000
  80003e:	ff 35 00 20 80 00    	push   0x802000
  800044:	e8 ad 00 00 00       	call   8000f6 <sys_cputs>
  800049:	83 c4 10             	add    $0x10,%esp
  80004c:	c9                   	leave
  80004d:	c3                   	ret

0080004e <libmain>:
  80004e:	55                   	push   %ebp
  80004f:	89 e5                	mov    %esp,%ebp
  800051:	56                   	push   %esi
  800052:	53                   	push   %ebx
  800053:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800056:	8b 75 0c             	mov    0xc(%ebp),%esi
  800059:	e8 04 01 00 00       	call   800162 <sys_getenvid>
  80005e:	85 c0                	test   %eax,%eax
  800060:	78 15                	js     800077 <libmain+0x29>
  800062:	25 ff 03 00 00       	and    $0x3ff,%eax
  800067:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  80006d:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800072:	a3 08 20 80 00       	mov    %eax,0x802008
  800077:	85 db                	test   %ebx,%ebx
  800079:	7e 07                	jle    800082 <libmain+0x34>
  80007b:	8b 06                	mov    (%esi),%eax
  80007d:	a3 04 20 80 00       	mov    %eax,0x802004
  800082:	83 ec 08             	sub    $0x8,%esp
  800085:	56                   	push   %esi
  800086:	53                   	push   %ebx
  800087:	e8 a7 ff ff ff       	call   800033 <umain>
  80008c:	e8 0a 00 00 00       	call   80009b <exit>
  800091:	83 c4 10             	add    $0x10,%esp
  800094:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800097:	5b                   	pop    %ebx
  800098:	5e                   	pop    %esi
  800099:	5d                   	pop    %ebp
  80009a:	c3                   	ret

0080009b <exit>:
  80009b:	55                   	push   %ebp
  80009c:	89 e5                	mov    %esp,%ebp
  80009e:	83 ec 14             	sub    $0x14,%esp
  8000a1:	6a 00                	push   $0x0
  8000a3:	e8 98 00 00 00       	call   800140 <sys_env_destroy>
  8000a8:	83 c4 10             	add    $0x10,%esp
  8000ab:	c9                   	leave
  8000ac:	c3                   	ret

008000ad <syscall>:
  8000ad:	55                   	push   %ebp
  8000ae:	89 e5                	mov    %esp,%ebp
  8000b0:	57                   	push   %edi
  8000b1:	56                   	push   %esi
  8000b2:	53                   	push   %ebx
  8000b3:	83 ec 1c             	sub    $0x1c,%esp
  8000b6:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8000b9:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  8000bc:	89 ca                	mov    %ecx,%edx
  8000be:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8000c1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8000c4:	8b 7d 10             	mov    0x10(%ebp),%edi
  8000c7:	8b 75 14             	mov    0x14(%ebp),%esi
  8000ca:	cd 30                	int    $0x30
  8000cc:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  8000d0:	74 04                	je     8000d6 <syscall+0x29>
  8000d2:	85 c0                	test   %eax,%eax
  8000d4:	7f 08                	jg     8000de <syscall+0x31>
  8000d6:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8000d9:	5b                   	pop    %ebx
  8000da:	5e                   	pop    %esi
  8000db:	5f                   	pop    %edi
  8000dc:	5d                   	pop    %ebp
  8000dd:	c3                   	ret
  8000de:	83 ec 0c             	sub    $0xc,%esp
  8000e1:	50                   	push   %eax
  8000e2:	ff 75 e0             	push   -0x20(%ebp)
  8000e5:	68 78 0e 80 00       	push   $0x800e78
  8000ea:	6a 1e                	push   $0x1e
  8000ec:	68 95 0e 80 00       	push   $0x800e95
  8000f1:	e8 b1 01 00 00       	call   8002a7 <_panic>

008000f6 <sys_cputs>:
  8000f6:	55                   	push   %ebp
  8000f7:	89 e5                	mov    %esp,%ebp
  8000f9:	83 ec 08             	sub    $0x8,%esp
  8000fc:	6a 00                	push   $0x0
  8000fe:	6a 00                	push   $0x0
  800100:	6a 00                	push   $0x0
  800102:	ff 75 0c             	push   0xc(%ebp)
  800105:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800108:	ba 00 00 00 00       	mov    $0x0,%edx
  80010d:	b8 00 00 00 00       	mov    $0x0,%eax
  800112:	e8 96 ff ff ff       	call   8000ad <syscall>
  800117:	83 c4 10             	add    $0x10,%esp
  80011a:	c9                   	leave
  80011b:	c3                   	ret

0080011c <sys_cgetc>:
  80011c:	55                   	push   %ebp
  80011d:	89 e5                	mov    %esp,%ebp
  80011f:	83 ec 08             	sub    $0x8,%esp
  800122:	6a 00                	push   $0x0
  800124:	6a 00                	push   $0x0
  800126:	6a 00                	push   $0x0
  800128:	6a 00                	push   $0x0
  80012a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80012f:	ba 00 00 00 00       	mov    $0x0,%edx
  800134:	b8 01 00 00 00       	mov    $0x1,%eax
  800139:	e8 6f ff ff ff       	call   8000ad <syscall>
  80013e:	c9                   	leave
  80013f:	c3                   	ret

00800140 <sys_env_destroy>:
  800140:	55                   	push   %ebp
  800141:	89 e5                	mov    %esp,%ebp
  800143:	83 ec 08             	sub    $0x8,%esp
  800146:	6a 00                	push   $0x0
  800148:	6a 00                	push   $0x0
  80014a:	6a 00                	push   $0x0
  80014c:	6a 00                	push   $0x0
  80014e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800151:	ba 01 00 00 00       	mov    $0x1,%edx
  800156:	b8 03 00 00 00       	mov    $0x3,%eax
  80015b:	e8 4d ff ff ff       	call   8000ad <syscall>
  800160:	c9                   	leave
  800161:	c3                   	ret

00800162 <sys_getenvid>:
  800162:	55                   	push   %ebp
  800163:	89 e5                	mov    %esp,%ebp
  800165:	83 ec 08             	sub    $0x8,%esp
  800168:	6a 00                	push   $0x0
  80016a:	6a 00                	push   $0x0
  80016c:	6a 00                	push   $0x0
  80016e:	6a 00                	push   $0x0
  800170:	b9 00 00 00 00       	mov    $0x0,%ecx
  800175:	ba 00 00 00 00       	mov    $0x0,%edx
  80017a:	b8 02 00 00 00       	mov    $0x2,%eax
  80017f:	e8 29 ff ff ff       	call   8000ad <syscall>
  800184:	c9                   	leave
  800185:	c3                   	ret

00800186 <sys_yield>:
  800186:	55                   	push   %ebp
  800187:	89 e5                	mov    %esp,%ebp
  800189:	83 ec 08             	sub    $0x8,%esp
  80018c:	6a 00                	push   $0x0
  80018e:	6a 00                	push   $0x0
  800190:	6a 00                	push   $0x0
  800192:	6a 00                	push   $0x0
  800194:	b9 00 00 00 00       	mov    $0x0,%ecx
  800199:	ba 00 00 00 00       	mov    $0x0,%edx
  80019e:	b8 0a 00 00 00       	mov    $0xa,%eax
  8001a3:	e8 05 ff ff ff       	call   8000ad <syscall>
  8001a8:	83 c4 10             	add    $0x10,%esp
  8001ab:	c9                   	leave
  8001ac:	c3                   	ret

008001ad <sys_page_alloc>:
  8001ad:	55                   	push   %ebp
  8001ae:	89 e5                	mov    %esp,%ebp
  8001b0:	83 ec 08             	sub    $0x8,%esp
  8001b3:	6a 00                	push   $0x0
  8001b5:	6a 00                	push   $0x0
  8001b7:	ff 75 10             	push   0x10(%ebp)
  8001ba:	ff 75 0c             	push   0xc(%ebp)
  8001bd:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001c0:	ba 01 00 00 00       	mov    $0x1,%edx
  8001c5:	b8 04 00 00 00       	mov    $0x4,%eax
  8001ca:	e8 de fe ff ff       	call   8000ad <syscall>
  8001cf:	c9                   	leave
  8001d0:	c3                   	ret

008001d1 <sys_page_map>:
  8001d1:	55                   	push   %ebp
  8001d2:	89 e5                	mov    %esp,%ebp
  8001d4:	83 ec 08             	sub    $0x8,%esp
  8001d7:	ff 75 18             	push   0x18(%ebp)
  8001da:	ff 75 14             	push   0x14(%ebp)
  8001dd:	ff 75 10             	push   0x10(%ebp)
  8001e0:	ff 75 0c             	push   0xc(%ebp)
  8001e3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001e6:	ba 01 00 00 00       	mov    $0x1,%edx
  8001eb:	b8 05 00 00 00       	mov    $0x5,%eax
  8001f0:	e8 b8 fe ff ff       	call   8000ad <syscall>
  8001f5:	c9                   	leave
  8001f6:	c3                   	ret

008001f7 <sys_page_unmap>:
  8001f7:	55                   	push   %ebp
  8001f8:	89 e5                	mov    %esp,%ebp
  8001fa:	83 ec 08             	sub    $0x8,%esp
  8001fd:	6a 00                	push   $0x0
  8001ff:	6a 00                	push   $0x0
  800201:	6a 00                	push   $0x0
  800203:	ff 75 0c             	push   0xc(%ebp)
  800206:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800209:	ba 01 00 00 00       	mov    $0x1,%edx
  80020e:	b8 06 00 00 00       	mov    $0x6,%eax
  800213:	e8 95 fe ff ff       	call   8000ad <syscall>
  800218:	c9                   	leave
  800219:	c3                   	ret

0080021a <sys_env_set_status>:
  80021a:	55                   	push   %ebp
  80021b:	89 e5                	mov    %esp,%ebp
  80021d:	83 ec 08             	sub    $0x8,%esp
  800220:	6a 00                	push   $0x0
  800222:	6a 00                	push   $0x0
  800224:	6a 00                	push   $0x0
  800226:	ff 75 0c             	push   0xc(%ebp)
  800229:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80022c:	ba 01 00 00 00       	mov    $0x1,%edx
  800231:	b8 08 00 00 00       	mov    $0x8,%eax
  800236:	e8 72 fe ff ff       	call   8000ad <syscall>
  80023b:	c9                   	leave
  80023c:	c3                   	ret

0080023d <sys_env_set_pgfault_upcall>:
  80023d:	55                   	push   %ebp
  80023e:	89 e5                	mov    %esp,%ebp
  800240:	83 ec 08             	sub    $0x8,%esp
  800243:	6a 00                	push   $0x0
  800245:	6a 00                	push   $0x0
  800247:	6a 00                	push   $0x0
  800249:	ff 75 0c             	push   0xc(%ebp)
  80024c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80024f:	ba 01 00 00 00       	mov    $0x1,%edx
  800254:	b8 09 00 00 00       	mov    $0x9,%eax
  800259:	e8 4f fe ff ff       	call   8000ad <syscall>
  80025e:	c9                   	leave
  80025f:	c3                   	ret

00800260 <sys_ipc_try_send>:
  800260:	55                   	push   %ebp
  800261:	89 e5                	mov    %esp,%ebp
  800263:	83 ec 08             	sub    $0x8,%esp
  800266:	6a 00                	push   $0x0
  800268:	ff 75 14             	push   0x14(%ebp)
  80026b:	ff 75 10             	push   0x10(%ebp)
  80026e:	ff 75 0c             	push   0xc(%ebp)
  800271:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800274:	ba 00 00 00 00       	mov    $0x0,%edx
  800279:	b8 0c 00 00 00       	mov    $0xc,%eax
  80027e:	e8 2a fe ff ff       	call   8000ad <syscall>
  800283:	c9                   	leave
  800284:	c3                   	ret

00800285 <sys_ipc_recv>:
  800285:	55                   	push   %ebp
  800286:	89 e5                	mov    %esp,%ebp
  800288:	83 ec 08             	sub    $0x8,%esp
  80028b:	6a 00                	push   $0x0
  80028d:	6a 00                	push   $0x0
  80028f:	6a 00                	push   $0x0
  800291:	6a 00                	push   $0x0
  800293:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800296:	ba 01 00 00 00       	mov    $0x1,%edx
  80029b:	b8 0d 00 00 00       	mov    $0xd,%eax
  8002a0:	e8 08 fe ff ff       	call   8000ad <syscall>
  8002a5:	c9                   	leave
  8002a6:	c3                   	ret

008002a7 <_panic>:
  8002a7:	55                   	push   %ebp
  8002a8:	89 e5                	mov    %esp,%ebp
  8002aa:	56                   	push   %esi
  8002ab:	53                   	push   %ebx
  8002ac:	8d 5d 14             	lea    0x14(%ebp),%ebx
  8002af:	8b 35 04 20 80 00    	mov    0x802004,%esi
  8002b5:	e8 a8 fe ff ff       	call   800162 <sys_getenvid>
  8002ba:	83 ec 0c             	sub    $0xc,%esp
  8002bd:	ff 75 0c             	push   0xc(%ebp)
  8002c0:	ff 75 08             	push   0x8(%ebp)
  8002c3:	56                   	push   %esi
  8002c4:	50                   	push   %eax
  8002c5:	68 5c 0f 80 00       	push   $0x800f5c
  8002ca:	e8 b3 00 00 00       	call   800382 <cprintf>
  8002cf:	83 c4 18             	add    $0x18,%esp
  8002d2:	53                   	push   %ebx
  8002d3:	ff 75 10             	push   0x10(%ebp)
  8002d6:	e8 56 00 00 00       	call   800331 <vcprintf>
  8002db:	c7 04 24 6c 0e 80 00 	movl   $0x800e6c,(%esp)
  8002e2:	e8 9b 00 00 00       	call   800382 <cprintf>
  8002e7:	83 c4 10             	add    $0x10,%esp
  8002ea:	cc                   	int3
  8002eb:	eb fd                	jmp    8002ea <_panic+0x43>

008002ed <putch>:
  8002ed:	55                   	push   %ebp
  8002ee:	89 e5                	mov    %esp,%ebp
  8002f0:	53                   	push   %ebx
  8002f1:	83 ec 04             	sub    $0x4,%esp
  8002f4:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8002f7:	8b 13                	mov    (%ebx),%edx
  8002f9:	8d 42 01             	lea    0x1(%edx),%eax
  8002fc:	89 03                	mov    %eax,(%ebx)
  8002fe:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800301:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  800305:	3d ff 00 00 00       	cmp    $0xff,%eax
  80030a:	74 09                	je     800315 <putch+0x28>
  80030c:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  800310:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800313:	c9                   	leave
  800314:	c3                   	ret
  800315:	83 ec 08             	sub    $0x8,%esp
  800318:	68 ff 00 00 00       	push   $0xff
  80031d:	8d 43 08             	lea    0x8(%ebx),%eax
  800320:	50                   	push   %eax
  800321:	e8 d0 fd ff ff       	call   8000f6 <sys_cputs>
  800326:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  80032c:	83 c4 10             	add    $0x10,%esp
  80032f:	eb db                	jmp    80030c <putch+0x1f>

00800331 <vcprintf>:
  800331:	55                   	push   %ebp
  800332:	89 e5                	mov    %esp,%ebp
  800334:	81 ec 18 01 00 00    	sub    $0x118,%esp
  80033a:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  800341:	00 00 00 
  800344:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  80034b:	00 00 00 
  80034e:	ff 75 0c             	push   0xc(%ebp)
  800351:	ff 75 08             	push   0x8(%ebp)
  800354:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  80035a:	50                   	push   %eax
  80035b:	68 ed 02 80 00       	push   $0x8002ed
  800360:	e8 74 01 00 00       	call   8004d9 <vprintfmt>
  800365:	83 c4 08             	add    $0x8,%esp
  800368:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  80036e:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  800374:	50                   	push   %eax
  800375:	e8 7c fd ff ff       	call   8000f6 <sys_cputs>
  80037a:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  800380:	c9                   	leave
  800381:	c3                   	ret

00800382 <cprintf>:
  800382:	55                   	push   %ebp
  800383:	89 e5                	mov    %esp,%ebp
  800385:	83 ec 10             	sub    $0x10,%esp
  800388:	8d 45 0c             	lea    0xc(%ebp),%eax
  80038b:	50                   	push   %eax
  80038c:	ff 75 08             	push   0x8(%ebp)
  80038f:	e8 9d ff ff ff       	call   800331 <vcprintf>
  800394:	c9                   	leave
  800395:	c3                   	ret

00800396 <printnum>:
  800396:	55                   	push   %ebp
  800397:	89 e5                	mov    %esp,%ebp
  800399:	57                   	push   %edi
  80039a:	56                   	push   %esi
  80039b:	53                   	push   %ebx
  80039c:	83 ec 1c             	sub    $0x1c,%esp
  80039f:	89 c7                	mov    %eax,%edi
  8003a1:	89 d6                	mov    %edx,%esi
  8003a3:	8b 45 08             	mov    0x8(%ebp),%eax
  8003a6:	8b 55 0c             	mov    0xc(%ebp),%edx
  8003a9:	89 d1                	mov    %edx,%ecx
  8003ab:	89 c2                	mov    %eax,%edx
  8003ad:	89 45 d8             	mov    %eax,-0x28(%ebp)
  8003b0:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  8003b3:	8b 45 10             	mov    0x10(%ebp),%eax
  8003b6:	8b 5d 14             	mov    0x14(%ebp),%ebx
  8003b9:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8003bc:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  8003c3:	39 c2                	cmp    %eax,%edx
  8003c5:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  8003c8:	72 3e                	jb     800408 <printnum+0x72>
  8003ca:	83 ec 0c             	sub    $0xc,%esp
  8003cd:	ff 75 18             	push   0x18(%ebp)
  8003d0:	83 eb 01             	sub    $0x1,%ebx
  8003d3:	53                   	push   %ebx
  8003d4:	50                   	push   %eax
  8003d5:	83 ec 08             	sub    $0x8,%esp
  8003d8:	ff 75 e4             	push   -0x1c(%ebp)
  8003db:	ff 75 e0             	push   -0x20(%ebp)
  8003de:	ff 75 dc             	push   -0x24(%ebp)
  8003e1:	ff 75 d8             	push   -0x28(%ebp)
  8003e4:	e8 17 08 00 00       	call   800c00 <__udivdi3>
  8003e9:	83 c4 18             	add    $0x18,%esp
  8003ec:	52                   	push   %edx
  8003ed:	50                   	push   %eax
  8003ee:	89 f2                	mov    %esi,%edx
  8003f0:	89 f8                	mov    %edi,%eax
  8003f2:	e8 9f ff ff ff       	call   800396 <printnum>
  8003f7:	83 c4 20             	add    $0x20,%esp
  8003fa:	eb 13                	jmp    80040f <printnum+0x79>
  8003fc:	83 ec 08             	sub    $0x8,%esp
  8003ff:	56                   	push   %esi
  800400:	ff 75 18             	push   0x18(%ebp)
  800403:	ff d7                	call   *%edi
  800405:	83 c4 10             	add    $0x10,%esp
  800408:	83 eb 01             	sub    $0x1,%ebx
  80040b:	85 db                	test   %ebx,%ebx
  80040d:	7f ed                	jg     8003fc <printnum+0x66>
  80040f:	83 ec 08             	sub    $0x8,%esp
  800412:	56                   	push   %esi
  800413:	83 ec 04             	sub    $0x4,%esp
  800416:	ff 75 e4             	push   -0x1c(%ebp)
  800419:	ff 75 e0             	push   -0x20(%ebp)
  80041c:	ff 75 dc             	push   -0x24(%ebp)
  80041f:	ff 75 d8             	push   -0x28(%ebp)
  800422:	e8 f9 08 00 00       	call   800d20 <__umoddi3>
  800427:	83 c4 14             	add    $0x14,%esp
  80042a:	0f be 80 a3 0e 80 00 	movsbl 0x800ea3(%eax),%eax
  800431:	50                   	push   %eax
  800432:	ff d7                	call   *%edi
  800434:	83 c4 10             	add    $0x10,%esp
  800437:	8d 65 f4             	lea    -0xc(%ebp),%esp
  80043a:	5b                   	pop    %ebx
  80043b:	5e                   	pop    %esi
  80043c:	5f                   	pop    %edi
  80043d:	5d                   	pop    %ebp
  80043e:	c3                   	ret

0080043f <getuint>:
  80043f:	83 fa 01             	cmp    $0x1,%edx
  800442:	7f 13                	jg     800457 <getuint+0x18>
  800444:	85 d2                	test   %edx,%edx
  800446:	74 1c                	je     800464 <getuint+0x25>
  800448:	8b 10                	mov    (%eax),%edx
  80044a:	8d 4a 04             	lea    0x4(%edx),%ecx
  80044d:	89 08                	mov    %ecx,(%eax)
  80044f:	8b 02                	mov    (%edx),%eax
  800451:	ba 00 00 00 00       	mov    $0x0,%edx
  800456:	c3                   	ret
  800457:	8b 10                	mov    (%eax),%edx
  800459:	8d 4a 08             	lea    0x8(%edx),%ecx
  80045c:	89 08                	mov    %ecx,(%eax)
  80045e:	8b 02                	mov    (%edx),%eax
  800460:	8b 52 04             	mov    0x4(%edx),%edx
  800463:	c3                   	ret
  800464:	8b 10                	mov    (%eax),%edx
  800466:	8d 4a 04             	lea    0x4(%edx),%ecx
  800469:	89 08                	mov    %ecx,(%eax)
  80046b:	8b 02                	mov    (%edx),%eax
  80046d:	ba 00 00 00 00       	mov    $0x0,%edx
  800472:	c3                   	ret

00800473 <getint>:
  800473:	83 fa 01             	cmp    $0x1,%edx
  800476:	7f 0f                	jg     800487 <getint+0x14>
  800478:	85 d2                	test   %edx,%edx
  80047a:	74 18                	je     800494 <getint+0x21>
  80047c:	8b 10                	mov    (%eax),%edx
  80047e:	8d 4a 04             	lea    0x4(%edx),%ecx
  800481:	89 08                	mov    %ecx,(%eax)
  800483:	8b 02                	mov    (%edx),%eax
  800485:	99                   	cltd
  800486:	c3                   	ret
  800487:	8b 10                	mov    (%eax),%edx
  800489:	8d 4a 08             	lea    0x8(%edx),%ecx
  80048c:	89 08                	mov    %ecx,(%eax)
  80048e:	8b 02                	mov    (%edx),%eax
  800490:	8b 52 04             	mov    0x4(%edx),%edx
  800493:	c3                   	ret
  800494:	8b 10                	mov    (%eax),%edx
  800496:	8d 4a 04             	lea    0x4(%edx),%ecx
  800499:	89 08                	mov    %ecx,(%eax)
  80049b:	8b 02                	mov    (%edx),%eax
  80049d:	99                   	cltd
  80049e:	c3                   	ret

0080049f <sprintputch>:
  80049f:	55                   	push   %ebp
  8004a0:	89 e5                	mov    %esp,%ebp
  8004a2:	8b 45 0c             	mov    0xc(%ebp),%eax
  8004a5:	83 40 08 01          	addl   $0x1,0x8(%eax)
  8004a9:	8b 10                	mov    (%eax),%edx
  8004ab:	3b 50 04             	cmp    0x4(%eax),%edx
  8004ae:	73 0a                	jae    8004ba <sprintputch+0x1b>
  8004b0:	8d 4a 01             	lea    0x1(%edx),%ecx
  8004b3:	89 08                	mov    %ecx,(%eax)
  8004b5:	8b 45 08             	mov    0x8(%ebp),%eax
  8004b8:	88 02                	mov    %al,(%edx)
  8004ba:	5d                   	pop    %ebp
  8004bb:	c3                   	ret

008004bc <printfmt>:
  8004bc:	55                   	push   %ebp
  8004bd:	89 e5                	mov    %esp,%ebp
  8004bf:	83 ec 08             	sub    $0x8,%esp
  8004c2:	8d 45 14             	lea    0x14(%ebp),%eax
  8004c5:	50                   	push   %eax
  8004c6:	ff 75 10             	push   0x10(%ebp)
  8004c9:	ff 75 0c             	push   0xc(%ebp)
  8004cc:	ff 75 08             	push   0x8(%ebp)
  8004cf:	e8 05 00 00 00       	call   8004d9 <vprintfmt>
  8004d4:	83 c4 10             	add    $0x10,%esp
  8004d7:	c9                   	leave
  8004d8:	c3                   	ret

008004d9 <vprintfmt>:
  8004d9:	55                   	push   %ebp
  8004da:	89 e5                	mov    %esp,%ebp
  8004dc:	57                   	push   %edi
  8004dd:	56                   	push   %esi
  8004de:	53                   	push   %ebx
  8004df:	83 ec 2c             	sub    $0x2c,%esp
  8004e2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8004e5:	8b 75 0c             	mov    0xc(%ebp),%esi
  8004e8:	8b 7d 10             	mov    0x10(%ebp),%edi
  8004eb:	eb 0a                	jmp    8004f7 <vprintfmt+0x1e>
  8004ed:	83 ec 08             	sub    $0x8,%esp
  8004f0:	56                   	push   %esi
  8004f1:	50                   	push   %eax
  8004f2:	ff d3                	call   *%ebx
  8004f4:	83 c4 10             	add    $0x10,%esp
  8004f7:	83 c7 01             	add    $0x1,%edi
  8004fa:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  8004fe:	83 f8 25             	cmp    $0x25,%eax
  800501:	74 0c                	je     80050f <vprintfmt+0x36>
  800503:	85 c0                	test   %eax,%eax
  800505:	75 e6                	jne    8004ed <vprintfmt+0x14>
  800507:	8d 65 f4             	lea    -0xc(%ebp),%esp
  80050a:	5b                   	pop    %ebx
  80050b:	5e                   	pop    %esi
  80050c:	5f                   	pop    %edi
  80050d:	5d                   	pop    %ebp
  80050e:	c3                   	ret
  80050f:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  800513:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  80051a:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  800521:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  800528:	b9 00 00 00 00       	mov    $0x0,%ecx
  80052d:	8d 47 01             	lea    0x1(%edi),%eax
  800530:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800533:	0f b6 17             	movzbl (%edi),%edx
  800536:	8d 42 dd             	lea    -0x23(%edx),%eax
  800539:	3c 55                	cmp    $0x55,%al
  80053b:	0f 87 c3 02 00 00    	ja     800804 <vprintfmt+0x32b>
  800541:	0f b6 c0             	movzbl %al,%eax
  800544:	ff 24 85 80 0f 80 00 	jmp    *0x800f80(,%eax,4)
  80054b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80054e:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  800552:	eb d9                	jmp    80052d <vprintfmt+0x54>
  800554:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800557:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  80055b:	eb d0                	jmp    80052d <vprintfmt+0x54>
  80055d:	0f b6 d2             	movzbl %dl,%edx
  800560:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800563:	b8 00 00 00 00       	mov    $0x0,%eax
  800568:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  80056b:	8d 04 80             	lea    (%eax,%eax,4),%eax
  80056e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  800572:	0f be 17             	movsbl (%edi),%edx
  800575:	8d 4a d0             	lea    -0x30(%edx),%ecx
  800578:	83 f9 09             	cmp    $0x9,%ecx
  80057b:	77 52                	ja     8005cf <vprintfmt+0xf6>
  80057d:	83 c7 01             	add    $0x1,%edi
  800580:	eb e9                	jmp    80056b <vprintfmt+0x92>
  800582:	8b 45 14             	mov    0x14(%ebp),%eax
  800585:	8d 50 04             	lea    0x4(%eax),%edx
  800588:	89 55 14             	mov    %edx,0x14(%ebp)
  80058b:	8b 00                	mov    (%eax),%eax
  80058d:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800590:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800593:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800597:	79 94                	jns    80052d <vprintfmt+0x54>
  800599:	8b 45 d0             	mov    -0x30(%ebp),%eax
  80059c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80059f:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  8005a6:	eb 85                	jmp    80052d <vprintfmt+0x54>
  8005a8:	8b 55 e0             	mov    -0x20(%ebp),%edx
  8005ab:	85 d2                	test   %edx,%edx
  8005ad:	b8 00 00 00 00       	mov    $0x0,%eax
  8005b2:	0f 49 c2             	cmovns %edx,%eax
  8005b5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8005b8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005bb:	e9 6d ff ff ff       	jmp    80052d <vprintfmt+0x54>
  8005c0:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005c3:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  8005ca:	e9 5e ff ff ff       	jmp    80052d <vprintfmt+0x54>
  8005cf:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  8005d2:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8005d5:	eb bc                	jmp    800593 <vprintfmt+0xba>
  8005d7:	83 c1 01             	add    $0x1,%ecx
  8005da:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005dd:	e9 4b ff ff ff       	jmp    80052d <vprintfmt+0x54>
  8005e2:	8b 45 14             	mov    0x14(%ebp),%eax
  8005e5:	8d 50 04             	lea    0x4(%eax),%edx
  8005e8:	89 55 14             	mov    %edx,0x14(%ebp)
  8005eb:	83 ec 08             	sub    $0x8,%esp
  8005ee:	56                   	push   %esi
  8005ef:	ff 30                	push   (%eax)
  8005f1:	ff d3                	call   *%ebx
  8005f3:	83 c4 10             	add    $0x10,%esp
  8005f6:	e9 a0 01 00 00       	jmp    80079b <vprintfmt+0x2c2>
  8005fb:	8b 45 14             	mov    0x14(%ebp),%eax
  8005fe:	8d 50 04             	lea    0x4(%eax),%edx
  800601:	89 55 14             	mov    %edx,0x14(%ebp)
  800604:	8b 10                	mov    (%eax),%edx
  800606:	89 d0                	mov    %edx,%eax
  800608:	f7 d8                	neg    %eax
  80060a:	0f 48 c2             	cmovs  %edx,%eax
  80060d:	83 f8 08             	cmp    $0x8,%eax
  800610:	7f 20                	jg     800632 <vprintfmt+0x159>
  800612:	8b 14 85 e0 10 80 00 	mov    0x8010e0(,%eax,4),%edx
  800619:	85 d2                	test   %edx,%edx
  80061b:	74 15                	je     800632 <vprintfmt+0x159>
  80061d:	52                   	push   %edx
  80061e:	68 c4 0e 80 00       	push   $0x800ec4
  800623:	56                   	push   %esi
  800624:	53                   	push   %ebx
  800625:	e8 92 fe ff ff       	call   8004bc <printfmt>
  80062a:	83 c4 10             	add    $0x10,%esp
  80062d:	e9 69 01 00 00       	jmp    80079b <vprintfmt+0x2c2>
  800632:	50                   	push   %eax
  800633:	68 bb 0e 80 00       	push   $0x800ebb
  800638:	56                   	push   %esi
  800639:	53                   	push   %ebx
  80063a:	e8 7d fe ff ff       	call   8004bc <printfmt>
  80063f:	83 c4 10             	add    $0x10,%esp
  800642:	e9 54 01 00 00       	jmp    80079b <vprintfmt+0x2c2>
  800647:	8b 45 14             	mov    0x14(%ebp),%eax
  80064a:	8d 50 04             	lea    0x4(%eax),%edx
  80064d:	89 55 14             	mov    %edx,0x14(%ebp)
  800650:	8b 08                	mov    (%eax),%ecx
  800652:	85 c9                	test   %ecx,%ecx
  800654:	b8 b4 0e 80 00       	mov    $0x800eb4,%eax
  800659:	0f 45 c1             	cmovne %ecx,%eax
  80065c:	89 45 cc             	mov    %eax,-0x34(%ebp)
  80065f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800663:	7e 06                	jle    80066b <vprintfmt+0x192>
  800665:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  800669:	75 0b                	jne    800676 <vprintfmt+0x19d>
  80066b:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  80066e:	8b 7d d0             	mov    -0x30(%ebp),%edi
  800671:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800674:	eb 5c                	jmp    8006d2 <vprintfmt+0x1f9>
  800676:	83 ec 08             	sub    $0x8,%esp
  800679:	ff 75 d0             	push   -0x30(%ebp)
  80067c:	ff 75 cc             	push   -0x34(%ebp)
  80067f:	e8 20 02 00 00       	call   8008a4 <strnlen>
  800684:	89 c2                	mov    %eax,%edx
  800686:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800689:	29 d0                	sub    %edx,%eax
  80068b:	83 c4 10             	add    $0x10,%esp
  80068e:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  800692:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800695:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800698:	89 c3                	mov    %eax,%ebx
  80069a:	eb 0e                	jmp    8006aa <vprintfmt+0x1d1>
  80069c:	83 ec 08             	sub    $0x8,%esp
  80069f:	56                   	push   %esi
  8006a0:	57                   	push   %edi
  8006a1:	ff 55 08             	call   *0x8(%ebp)
  8006a4:	83 eb 01             	sub    $0x1,%ebx
  8006a7:	83 c4 10             	add    $0x10,%esp
  8006aa:	85 db                	test   %ebx,%ebx
  8006ac:	7f ee                	jg     80069c <vprintfmt+0x1c3>
  8006ae:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8006b1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8006b4:	85 c0                	test   %eax,%eax
  8006b6:	ba 00 00 00 00       	mov    $0x0,%edx
  8006bb:	0f 49 d0             	cmovns %eax,%edx
  8006be:	29 d0                	sub    %edx,%eax
  8006c0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8006c3:	eb a6                	jmp    80066b <vprintfmt+0x192>
  8006c5:	83 ec 08             	sub    $0x8,%esp
  8006c8:	56                   	push   %esi
  8006c9:	52                   	push   %edx
  8006ca:	ff 55 08             	call   *0x8(%ebp)
  8006cd:	83 c4 10             	add    $0x10,%esp
  8006d0:	89 d9                	mov    %ebx,%ecx
  8006d2:	8d 59 01             	lea    0x1(%ecx),%ebx
  8006d5:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  8006d9:	0f be d0             	movsbl %al,%edx
  8006dc:	85 d2                	test   %edx,%edx
  8006de:	74 28                	je     800708 <vprintfmt+0x22f>
  8006e0:	85 ff                	test   %edi,%edi
  8006e2:	78 05                	js     8006e9 <vprintfmt+0x210>
  8006e4:	83 ef 01             	sub    $0x1,%edi
  8006e7:	78 2e                	js     800717 <vprintfmt+0x23e>
  8006e9:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  8006ed:	74 d6                	je     8006c5 <vprintfmt+0x1ec>
  8006ef:	0f be c0             	movsbl %al,%eax
  8006f2:	83 e8 20             	sub    $0x20,%eax
  8006f5:	83 f8 5e             	cmp    $0x5e,%eax
  8006f8:	76 cb                	jbe    8006c5 <vprintfmt+0x1ec>
  8006fa:	83 ec 08             	sub    $0x8,%esp
  8006fd:	56                   	push   %esi
  8006fe:	6a 3f                	push   $0x3f
  800700:	ff 55 08             	call   *0x8(%ebp)
  800703:	83 c4 10             	add    $0x10,%esp
  800706:	eb c8                	jmp    8006d0 <vprintfmt+0x1f7>
  800708:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80070b:	8b 7d cc             	mov    -0x34(%ebp),%edi
  80070e:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800711:	01 c7                	add    %eax,%edi
  800713:	29 cf                	sub    %ecx,%edi
  800715:	eb 13                	jmp    80072a <vprintfmt+0x251>
  800717:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80071a:	eb ef                	jmp    80070b <vprintfmt+0x232>
  80071c:	83 ec 08             	sub    $0x8,%esp
  80071f:	56                   	push   %esi
  800720:	6a 20                	push   $0x20
  800722:	ff d3                	call   *%ebx
  800724:	83 ef 01             	sub    $0x1,%edi
  800727:	83 c4 10             	add    $0x10,%esp
  80072a:	85 ff                	test   %edi,%edi
  80072c:	7f ee                	jg     80071c <vprintfmt+0x243>
  80072e:	eb 6b                	jmp    80079b <vprintfmt+0x2c2>
  800730:	89 ca                	mov    %ecx,%edx
  800732:	8d 45 14             	lea    0x14(%ebp),%eax
  800735:	e8 39 fd ff ff       	call   800473 <getint>
  80073a:	89 45 d8             	mov    %eax,-0x28(%ebp)
  80073d:	89 55 dc             	mov    %edx,-0x24(%ebp)
  800740:	85 d2                	test   %edx,%edx
  800742:	78 0b                	js     80074f <vprintfmt+0x276>
  800744:	89 d1                	mov    %edx,%ecx
  800746:	89 c2                	mov    %eax,%edx
  800748:	bf 0a 00 00 00       	mov    $0xa,%edi
  80074d:	eb 32                	jmp    800781 <vprintfmt+0x2a8>
  80074f:	83 ec 08             	sub    $0x8,%esp
  800752:	56                   	push   %esi
  800753:	6a 2d                	push   $0x2d
  800755:	ff d3                	call   *%ebx
  800757:	8b 55 d8             	mov    -0x28(%ebp),%edx
  80075a:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  80075d:	f7 da                	neg    %edx
  80075f:	83 d1 00             	adc    $0x0,%ecx
  800762:	f7 d9                	neg    %ecx
  800764:	83 c4 10             	add    $0x10,%esp
  800767:	bf 0a 00 00 00       	mov    $0xa,%edi
  80076c:	eb 13                	jmp    800781 <vprintfmt+0x2a8>
  80076e:	89 ca                	mov    %ecx,%edx
  800770:	8d 45 14             	lea    0x14(%ebp),%eax
  800773:	e8 c7 fc ff ff       	call   80043f <getuint>
  800778:	89 d1                	mov    %edx,%ecx
  80077a:	89 c2                	mov    %eax,%edx
  80077c:	bf 0a 00 00 00       	mov    $0xa,%edi
  800781:	83 ec 0c             	sub    $0xc,%esp
  800784:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  800788:	50                   	push   %eax
  800789:	ff 75 e0             	push   -0x20(%ebp)
  80078c:	57                   	push   %edi
  80078d:	51                   	push   %ecx
  80078e:	52                   	push   %edx
  80078f:	89 f2                	mov    %esi,%edx
  800791:	89 d8                	mov    %ebx,%eax
  800793:	e8 fe fb ff ff       	call   800396 <printnum>
  800798:	83 c4 20             	add    $0x20,%esp
  80079b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80079e:	e9 54 fd ff ff       	jmp    8004f7 <vprintfmt+0x1e>
  8007a3:	89 ca                	mov    %ecx,%edx
  8007a5:	8d 45 14             	lea    0x14(%ebp),%eax
  8007a8:	e8 92 fc ff ff       	call   80043f <getuint>
  8007ad:	89 d1                	mov    %edx,%ecx
  8007af:	89 c2                	mov    %eax,%edx
  8007b1:	bf 08 00 00 00       	mov    $0x8,%edi
  8007b6:	eb c9                	jmp    800781 <vprintfmt+0x2a8>
  8007b8:	83 ec 08             	sub    $0x8,%esp
  8007bb:	56                   	push   %esi
  8007bc:	6a 30                	push   $0x30
  8007be:	ff d3                	call   *%ebx
  8007c0:	83 c4 08             	add    $0x8,%esp
  8007c3:	56                   	push   %esi
  8007c4:	6a 78                	push   $0x78
  8007c6:	ff d3                	call   *%ebx
  8007c8:	8b 45 14             	mov    0x14(%ebp),%eax
  8007cb:	8d 50 04             	lea    0x4(%eax),%edx
  8007ce:	89 55 14             	mov    %edx,0x14(%ebp)
  8007d1:	8b 10                	mov    (%eax),%edx
  8007d3:	b9 00 00 00 00       	mov    $0x0,%ecx
  8007d8:	83 c4 10             	add    $0x10,%esp
  8007db:	bf 10 00 00 00       	mov    $0x10,%edi
  8007e0:	eb 9f                	jmp    800781 <vprintfmt+0x2a8>
  8007e2:	89 ca                	mov    %ecx,%edx
  8007e4:	8d 45 14             	lea    0x14(%ebp),%eax
  8007e7:	e8 53 fc ff ff       	call   80043f <getuint>
  8007ec:	89 d1                	mov    %edx,%ecx
  8007ee:	89 c2                	mov    %eax,%edx
  8007f0:	bf 10 00 00 00       	mov    $0x10,%edi
  8007f5:	eb 8a                	jmp    800781 <vprintfmt+0x2a8>
  8007f7:	83 ec 08             	sub    $0x8,%esp
  8007fa:	56                   	push   %esi
  8007fb:	6a 25                	push   $0x25
  8007fd:	ff d3                	call   *%ebx
  8007ff:	83 c4 10             	add    $0x10,%esp
  800802:	eb 97                	jmp    80079b <vprintfmt+0x2c2>
  800804:	83 ec 08             	sub    $0x8,%esp
  800807:	56                   	push   %esi
  800808:	6a 25                	push   $0x25
  80080a:	ff d3                	call   *%ebx
  80080c:	83 c4 10             	add    $0x10,%esp
  80080f:	89 f8                	mov    %edi,%eax
  800811:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  800815:	74 05                	je     80081c <vprintfmt+0x343>
  800817:	83 e8 01             	sub    $0x1,%eax
  80081a:	eb f5                	jmp    800811 <vprintfmt+0x338>
  80081c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  80081f:	e9 77 ff ff ff       	jmp    80079b <vprintfmt+0x2c2>

00800824 <vsnprintf>:
  800824:	55                   	push   %ebp
  800825:	89 e5                	mov    %esp,%ebp
  800827:	83 ec 18             	sub    $0x18,%esp
  80082a:	8b 45 08             	mov    0x8(%ebp),%eax
  80082d:	8b 55 0c             	mov    0xc(%ebp),%edx
  800830:	89 45 ec             	mov    %eax,-0x14(%ebp)
  800833:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  800837:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  80083a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  800841:	85 c0                	test   %eax,%eax
  800843:	74 26                	je     80086b <vsnprintf+0x47>
  800845:	85 d2                	test   %edx,%edx
  800847:	7e 22                	jle    80086b <vsnprintf+0x47>
  800849:	ff 75 14             	push   0x14(%ebp)
  80084c:	ff 75 10             	push   0x10(%ebp)
  80084f:	8d 45 ec             	lea    -0x14(%ebp),%eax
  800852:	50                   	push   %eax
  800853:	68 9f 04 80 00       	push   $0x80049f
  800858:	e8 7c fc ff ff       	call   8004d9 <vprintfmt>
  80085d:	8b 45 ec             	mov    -0x14(%ebp),%eax
  800860:	c6 00 00             	movb   $0x0,(%eax)
  800863:	8b 45 f4             	mov    -0xc(%ebp),%eax
  800866:	83 c4 10             	add    $0x10,%esp
  800869:	c9                   	leave
  80086a:	c3                   	ret
  80086b:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800870:	eb f7                	jmp    800869 <vsnprintf+0x45>

00800872 <snprintf>:
  800872:	55                   	push   %ebp
  800873:	89 e5                	mov    %esp,%ebp
  800875:	83 ec 08             	sub    $0x8,%esp
  800878:	8d 45 14             	lea    0x14(%ebp),%eax
  80087b:	50                   	push   %eax
  80087c:	ff 75 10             	push   0x10(%ebp)
  80087f:	ff 75 0c             	push   0xc(%ebp)
  800882:	ff 75 08             	push   0x8(%ebp)
  800885:	e8 9a ff ff ff       	call   800824 <vsnprintf>
  80088a:	c9                   	leave
  80088b:	c3                   	ret

0080088c <strlen>:
  80088c:	55                   	push   %ebp
  80088d:	89 e5                	mov    %esp,%ebp
  80088f:	8b 55 08             	mov    0x8(%ebp),%edx
  800892:	b8 00 00 00 00       	mov    $0x0,%eax
  800897:	eb 03                	jmp    80089c <strlen+0x10>
  800899:	83 c0 01             	add    $0x1,%eax
  80089c:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  8008a0:	75 f7                	jne    800899 <strlen+0xd>
  8008a2:	5d                   	pop    %ebp
  8008a3:	c3                   	ret

008008a4 <strnlen>:
  8008a4:	55                   	push   %ebp
  8008a5:	89 e5                	mov    %esp,%ebp
  8008a7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8008aa:	8b 55 0c             	mov    0xc(%ebp),%edx
  8008ad:	b8 00 00 00 00       	mov    $0x0,%eax
  8008b2:	eb 03                	jmp    8008b7 <strnlen+0x13>
  8008b4:	83 c0 01             	add    $0x1,%eax
  8008b7:	39 d0                	cmp    %edx,%eax
  8008b9:	74 08                	je     8008c3 <strnlen+0x1f>
  8008bb:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  8008bf:	75 f3                	jne    8008b4 <strnlen+0x10>
  8008c1:	89 c2                	mov    %eax,%edx
  8008c3:	89 d0                	mov    %edx,%eax
  8008c5:	5d                   	pop    %ebp
  8008c6:	c3                   	ret

008008c7 <strcpy>:
  8008c7:	55                   	push   %ebp
  8008c8:	89 e5                	mov    %esp,%ebp
  8008ca:	53                   	push   %ebx
  8008cb:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8008ce:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8008d1:	b8 00 00 00 00       	mov    $0x0,%eax
  8008d6:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  8008da:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  8008dd:	83 c0 01             	add    $0x1,%eax
  8008e0:	84 d2                	test   %dl,%dl
  8008e2:	75 f2                	jne    8008d6 <strcpy+0xf>
  8008e4:	89 c8                	mov    %ecx,%eax
  8008e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8008e9:	c9                   	leave
  8008ea:	c3                   	ret

008008eb <strcat>:
  8008eb:	55                   	push   %ebp
  8008ec:	89 e5                	mov    %esp,%ebp
  8008ee:	53                   	push   %ebx
  8008ef:	83 ec 10             	sub    $0x10,%esp
  8008f2:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8008f5:	53                   	push   %ebx
  8008f6:	e8 91 ff ff ff       	call   80088c <strlen>
  8008fb:	83 c4 08             	add    $0x8,%esp
  8008fe:	ff 75 0c             	push   0xc(%ebp)
  800901:	01 d8                	add    %ebx,%eax
  800903:	50                   	push   %eax
  800904:	e8 be ff ff ff       	call   8008c7 <strcpy>
  800909:	89 d8                	mov    %ebx,%eax
  80090b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  80090e:	c9                   	leave
  80090f:	c3                   	ret

00800910 <strncpy>:
  800910:	55                   	push   %ebp
  800911:	89 e5                	mov    %esp,%ebp
  800913:	56                   	push   %esi
  800914:	53                   	push   %ebx
  800915:	8b 75 08             	mov    0x8(%ebp),%esi
  800918:	8b 55 0c             	mov    0xc(%ebp),%edx
  80091b:	89 f3                	mov    %esi,%ebx
  80091d:	03 5d 10             	add    0x10(%ebp),%ebx
  800920:	89 f0                	mov    %esi,%eax
  800922:	eb 0f                	jmp    800933 <strncpy+0x23>
  800924:	83 c0 01             	add    $0x1,%eax
  800927:	0f b6 0a             	movzbl (%edx),%ecx
  80092a:	88 48 ff             	mov    %cl,-0x1(%eax)
  80092d:	80 f9 01             	cmp    $0x1,%cl
  800930:	83 da ff             	sbb    $0xffffffff,%edx
  800933:	39 d8                	cmp    %ebx,%eax
  800935:	75 ed                	jne    800924 <strncpy+0x14>
  800937:	89 f0                	mov    %esi,%eax
  800939:	5b                   	pop    %ebx
  80093a:	5e                   	pop    %esi
  80093b:	5d                   	pop    %ebp
  80093c:	c3                   	ret

0080093d <strlcpy>:
  80093d:	55                   	push   %ebp
  80093e:	89 e5                	mov    %esp,%ebp
  800940:	56                   	push   %esi
  800941:	53                   	push   %ebx
  800942:	8b 75 08             	mov    0x8(%ebp),%esi
  800945:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800948:	8b 55 10             	mov    0x10(%ebp),%edx
  80094b:	89 f0                	mov    %esi,%eax
  80094d:	85 d2                	test   %edx,%edx
  80094f:	74 21                	je     800972 <strlcpy+0x35>
  800951:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  800955:	89 f2                	mov    %esi,%edx
  800957:	eb 09                	jmp    800962 <strlcpy+0x25>
  800959:	83 c1 01             	add    $0x1,%ecx
  80095c:	83 c2 01             	add    $0x1,%edx
  80095f:	88 5a ff             	mov    %bl,-0x1(%edx)
  800962:	39 c2                	cmp    %eax,%edx
  800964:	74 09                	je     80096f <strlcpy+0x32>
  800966:	0f b6 19             	movzbl (%ecx),%ebx
  800969:	84 db                	test   %bl,%bl
  80096b:	75 ec                	jne    800959 <strlcpy+0x1c>
  80096d:	89 d0                	mov    %edx,%eax
  80096f:	c6 00 00             	movb   $0x0,(%eax)
  800972:	29 f0                	sub    %esi,%eax
  800974:	5b                   	pop    %ebx
  800975:	5e                   	pop    %esi
  800976:	5d                   	pop    %ebp
  800977:	c3                   	ret

00800978 <strcmp>:
  800978:	55                   	push   %ebp
  800979:	89 e5                	mov    %esp,%ebp
  80097b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80097e:	8b 55 0c             	mov    0xc(%ebp),%edx
  800981:	eb 06                	jmp    800989 <strcmp+0x11>
  800983:	83 c1 01             	add    $0x1,%ecx
  800986:	83 c2 01             	add    $0x1,%edx
  800989:	0f b6 01             	movzbl (%ecx),%eax
  80098c:	84 c0                	test   %al,%al
  80098e:	74 04                	je     800994 <strcmp+0x1c>
  800990:	3a 02                	cmp    (%edx),%al
  800992:	74 ef                	je     800983 <strcmp+0xb>
  800994:	0f b6 c0             	movzbl %al,%eax
  800997:	0f b6 12             	movzbl (%edx),%edx
  80099a:	29 d0                	sub    %edx,%eax
  80099c:	5d                   	pop    %ebp
  80099d:	c3                   	ret

0080099e <strncmp>:
  80099e:	55                   	push   %ebp
  80099f:	89 e5                	mov    %esp,%ebp
  8009a1:	53                   	push   %ebx
  8009a2:	8b 45 08             	mov    0x8(%ebp),%eax
  8009a5:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8009a8:	8b 55 10             	mov    0x10(%ebp),%edx
  8009ab:	eb 09                	jmp    8009b6 <strncmp+0x18>
  8009ad:	83 ea 01             	sub    $0x1,%edx
  8009b0:	83 c0 01             	add    $0x1,%eax
  8009b3:	83 c1 01             	add    $0x1,%ecx
  8009b6:	85 d2                	test   %edx,%edx
  8009b8:	74 18                	je     8009d2 <strncmp+0x34>
  8009ba:	0f b6 18             	movzbl (%eax),%ebx
  8009bd:	84 db                	test   %bl,%bl
  8009bf:	74 04                	je     8009c5 <strncmp+0x27>
  8009c1:	3a 19                	cmp    (%ecx),%bl
  8009c3:	74 e8                	je     8009ad <strncmp+0xf>
  8009c5:	0f b6 00             	movzbl (%eax),%eax
  8009c8:	0f b6 11             	movzbl (%ecx),%edx
  8009cb:	29 d0                	sub    %edx,%eax
  8009cd:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8009d0:	c9                   	leave
  8009d1:	c3                   	ret
  8009d2:	b8 00 00 00 00       	mov    $0x0,%eax
  8009d7:	eb f4                	jmp    8009cd <strncmp+0x2f>

008009d9 <strchr>:
  8009d9:	55                   	push   %ebp
  8009da:	89 e5                	mov    %esp,%ebp
  8009dc:	8b 45 08             	mov    0x8(%ebp),%eax
  8009df:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8009e3:	eb 03                	jmp    8009e8 <strchr+0xf>
  8009e5:	83 c0 01             	add    $0x1,%eax
  8009e8:	0f b6 10             	movzbl (%eax),%edx
  8009eb:	84 d2                	test   %dl,%dl
  8009ed:	74 06                	je     8009f5 <strchr+0x1c>
  8009ef:	38 ca                	cmp    %cl,%dl
  8009f1:	75 f2                	jne    8009e5 <strchr+0xc>
  8009f3:	eb 05                	jmp    8009fa <strchr+0x21>
  8009f5:	b8 00 00 00 00       	mov    $0x0,%eax
  8009fa:	5d                   	pop    %ebp
  8009fb:	c3                   	ret

008009fc <strfind>:
  8009fc:	55                   	push   %ebp
  8009fd:	89 e5                	mov    %esp,%ebp
  8009ff:	8b 45 08             	mov    0x8(%ebp),%eax
  800a02:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  800a06:	0f b6 10             	movzbl (%eax),%edx
  800a09:	38 ca                	cmp    %cl,%dl
  800a0b:	74 09                	je     800a16 <strfind+0x1a>
  800a0d:	84 d2                	test   %dl,%dl
  800a0f:	74 05                	je     800a16 <strfind+0x1a>
  800a11:	83 c0 01             	add    $0x1,%eax
  800a14:	eb f0                	jmp    800a06 <strfind+0xa>
  800a16:	5d                   	pop    %ebp
  800a17:	c3                   	ret

00800a18 <memset>:
  800a18:	55                   	push   %ebp
  800a19:	89 e5                	mov    %esp,%ebp
  800a1b:	57                   	push   %edi
  800a1c:	8b 55 08             	mov    0x8(%ebp),%edx
  800a1f:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800a22:	85 c9                	test   %ecx,%ecx
  800a24:	74 24                	je     800a4a <memset+0x32>
  800a26:	89 d0                	mov    %edx,%eax
  800a28:	09 c8                	or     %ecx,%eax
  800a2a:	a8 03                	test   $0x3,%al
  800a2c:	75 14                	jne    800a42 <memset+0x2a>
  800a2e:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  800a32:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  800a38:	c1 e9 02             	shr    $0x2,%ecx
  800a3b:	89 d7                	mov    %edx,%edi
  800a3d:	fc                   	cld
  800a3e:	f3 ab                	rep stos %eax,%es:(%edi)
  800a40:	eb 08                	jmp    800a4a <memset+0x32>
  800a42:	89 d7                	mov    %edx,%edi
  800a44:	8b 45 0c             	mov    0xc(%ebp),%eax
  800a47:	fc                   	cld
  800a48:	f3 aa                	rep stos %al,%es:(%edi)
  800a4a:	89 d0                	mov    %edx,%eax
  800a4c:	8b 7d fc             	mov    -0x4(%ebp),%edi
  800a4f:	c9                   	leave
  800a50:	c3                   	ret

00800a51 <memmove>:
  800a51:	55                   	push   %ebp
  800a52:	89 e5                	mov    %esp,%ebp
  800a54:	57                   	push   %edi
  800a55:	56                   	push   %esi
  800a56:	8b 45 08             	mov    0x8(%ebp),%eax
  800a59:	8b 75 0c             	mov    0xc(%ebp),%esi
  800a5c:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800a5f:	39 c6                	cmp    %eax,%esi
  800a61:	73 32                	jae    800a95 <memmove+0x44>
  800a63:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  800a66:	39 d0                	cmp    %edx,%eax
  800a68:	73 2b                	jae    800a95 <memmove+0x44>
  800a6a:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  800a6d:	89 fe                	mov    %edi,%esi
  800a6f:	09 ce                	or     %ecx,%esi
  800a71:	09 d6                	or     %edx,%esi
  800a73:	f7 c6 03 00 00 00    	test   $0x3,%esi
  800a79:	75 0e                	jne    800a89 <memmove+0x38>
  800a7b:	83 ef 04             	sub    $0x4,%edi
  800a7e:	8d 72 fc             	lea    -0x4(%edx),%esi
  800a81:	c1 e9 02             	shr    $0x2,%ecx
  800a84:	fd                   	std
  800a85:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800a87:	eb 09                	jmp    800a92 <memmove+0x41>
  800a89:	83 ef 01             	sub    $0x1,%edi
  800a8c:	8d 72 ff             	lea    -0x1(%edx),%esi
  800a8f:	fd                   	std
  800a90:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800a92:	fc                   	cld
  800a93:	eb 1a                	jmp    800aaf <memmove+0x5e>
  800a95:	89 c2                	mov    %eax,%edx
  800a97:	09 ca                	or     %ecx,%edx
  800a99:	09 f2                	or     %esi,%edx
  800a9b:	f6 c2 03             	test   $0x3,%dl
  800a9e:	75 0a                	jne    800aaa <memmove+0x59>
  800aa0:	c1 e9 02             	shr    $0x2,%ecx
  800aa3:	89 c7                	mov    %eax,%edi
  800aa5:	fc                   	cld
  800aa6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800aa8:	eb 05                	jmp    800aaf <memmove+0x5e>
  800aaa:	89 c7                	mov    %eax,%edi
  800aac:	fc                   	cld
  800aad:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800aaf:	5e                   	pop    %esi
  800ab0:	5f                   	pop    %edi
  800ab1:	5d                   	pop    %ebp
  800ab2:	c3                   	ret

00800ab3 <memcpy>:
  800ab3:	55                   	push   %ebp
  800ab4:	89 e5                	mov    %esp,%ebp
  800ab6:	83 ec 0c             	sub    $0xc,%esp
  800ab9:	ff 75 10             	push   0x10(%ebp)
  800abc:	ff 75 0c             	push   0xc(%ebp)
  800abf:	ff 75 08             	push   0x8(%ebp)
  800ac2:	e8 8a ff ff ff       	call   800a51 <memmove>
  800ac7:	c9                   	leave
  800ac8:	c3                   	ret

00800ac9 <memcmp>:
  800ac9:	55                   	push   %ebp
  800aca:	89 e5                	mov    %esp,%ebp
  800acc:	56                   	push   %esi
  800acd:	53                   	push   %ebx
  800ace:	8b 45 08             	mov    0x8(%ebp),%eax
  800ad1:	8b 55 0c             	mov    0xc(%ebp),%edx
  800ad4:	89 c6                	mov    %eax,%esi
  800ad6:	03 75 10             	add    0x10(%ebp),%esi
  800ad9:	eb 06                	jmp    800ae1 <memcmp+0x18>
  800adb:	83 c0 01             	add    $0x1,%eax
  800ade:	83 c2 01             	add    $0x1,%edx
  800ae1:	39 f0                	cmp    %esi,%eax
  800ae3:	74 14                	je     800af9 <memcmp+0x30>
  800ae5:	0f b6 08             	movzbl (%eax),%ecx
  800ae8:	0f b6 1a             	movzbl (%edx),%ebx
  800aeb:	38 d9                	cmp    %bl,%cl
  800aed:	74 ec                	je     800adb <memcmp+0x12>
  800aef:	0f b6 c1             	movzbl %cl,%eax
  800af2:	0f b6 db             	movzbl %bl,%ebx
  800af5:	29 d8                	sub    %ebx,%eax
  800af7:	eb 05                	jmp    800afe <memcmp+0x35>
  800af9:	b8 00 00 00 00       	mov    $0x0,%eax
  800afe:	5b                   	pop    %ebx
  800aff:	5e                   	pop    %esi
  800b00:	5d                   	pop    %ebp
  800b01:	c3                   	ret

00800b02 <memfind>:
  800b02:	55                   	push   %ebp
  800b03:	89 e5                	mov    %esp,%ebp
  800b05:	8b 45 08             	mov    0x8(%ebp),%eax
  800b08:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800b0b:	89 c2                	mov    %eax,%edx
  800b0d:	03 55 10             	add    0x10(%ebp),%edx
  800b10:	eb 03                	jmp    800b15 <memfind+0x13>
  800b12:	83 c0 01             	add    $0x1,%eax
  800b15:	39 d0                	cmp    %edx,%eax
  800b17:	73 04                	jae    800b1d <memfind+0x1b>
  800b19:	38 08                	cmp    %cl,(%eax)
  800b1b:	75 f5                	jne    800b12 <memfind+0x10>
  800b1d:	5d                   	pop    %ebp
  800b1e:	c3                   	ret

00800b1f <strtol>:
  800b1f:	55                   	push   %ebp
  800b20:	89 e5                	mov    %esp,%ebp
  800b22:	57                   	push   %edi
  800b23:	56                   	push   %esi
  800b24:	53                   	push   %ebx
  800b25:	8b 55 08             	mov    0x8(%ebp),%edx
  800b28:	8b 5d 10             	mov    0x10(%ebp),%ebx
  800b2b:	eb 03                	jmp    800b30 <strtol+0x11>
  800b2d:	83 c2 01             	add    $0x1,%edx
  800b30:	0f b6 02             	movzbl (%edx),%eax
  800b33:	3c 20                	cmp    $0x20,%al
  800b35:	74 f6                	je     800b2d <strtol+0xe>
  800b37:	3c 09                	cmp    $0x9,%al
  800b39:	74 f2                	je     800b2d <strtol+0xe>
  800b3b:	3c 2b                	cmp    $0x2b,%al
  800b3d:	74 2a                	je     800b69 <strtol+0x4a>
  800b3f:	bf 00 00 00 00       	mov    $0x0,%edi
  800b44:	3c 2d                	cmp    $0x2d,%al
  800b46:	74 2b                	je     800b73 <strtol+0x54>
  800b48:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  800b4e:	75 0f                	jne    800b5f <strtol+0x40>
  800b50:	80 3a 30             	cmpb   $0x30,(%edx)
  800b53:	74 28                	je     800b7d <strtol+0x5e>
  800b55:	85 db                	test   %ebx,%ebx
  800b57:	b8 0a 00 00 00       	mov    $0xa,%eax
  800b5c:	0f 44 d8             	cmove  %eax,%ebx
  800b5f:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b64:	89 5d 10             	mov    %ebx,0x10(%ebp)
  800b67:	eb 46                	jmp    800baf <strtol+0x90>
  800b69:	83 c2 01             	add    $0x1,%edx
  800b6c:	bf 00 00 00 00       	mov    $0x0,%edi
  800b71:	eb d5                	jmp    800b48 <strtol+0x29>
  800b73:	83 c2 01             	add    $0x1,%edx
  800b76:	bf 01 00 00 00       	mov    $0x1,%edi
  800b7b:	eb cb                	jmp    800b48 <strtol+0x29>
  800b7d:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800b81:	74 0e                	je     800b91 <strtol+0x72>
  800b83:	85 db                	test   %ebx,%ebx
  800b85:	75 d8                	jne    800b5f <strtol+0x40>
  800b87:	83 c2 01             	add    $0x1,%edx
  800b8a:	bb 08 00 00 00       	mov    $0x8,%ebx
  800b8f:	eb ce                	jmp    800b5f <strtol+0x40>
  800b91:	83 c2 02             	add    $0x2,%edx
  800b94:	bb 10 00 00 00       	mov    $0x10,%ebx
  800b99:	eb c4                	jmp    800b5f <strtol+0x40>
  800b9b:	0f be c0             	movsbl %al,%eax
  800b9e:	83 e8 30             	sub    $0x30,%eax
  800ba1:	3b 45 10             	cmp    0x10(%ebp),%eax
  800ba4:	7d 3a                	jge    800be0 <strtol+0xc1>
  800ba6:	83 c2 01             	add    $0x1,%edx
  800ba9:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  800bad:	01 c1                	add    %eax,%ecx
  800baf:	0f b6 02             	movzbl (%edx),%eax
  800bb2:	8d 70 d0             	lea    -0x30(%eax),%esi
  800bb5:	89 f3                	mov    %esi,%ebx
  800bb7:	80 fb 09             	cmp    $0x9,%bl
  800bba:	76 df                	jbe    800b9b <strtol+0x7c>
  800bbc:	8d 70 9f             	lea    -0x61(%eax),%esi
  800bbf:	89 f3                	mov    %esi,%ebx
  800bc1:	80 fb 19             	cmp    $0x19,%bl
  800bc4:	77 08                	ja     800bce <strtol+0xaf>
  800bc6:	0f be c0             	movsbl %al,%eax
  800bc9:	83 e8 57             	sub    $0x57,%eax
  800bcc:	eb d3                	jmp    800ba1 <strtol+0x82>
  800bce:	8d 70 bf             	lea    -0x41(%eax),%esi
  800bd1:	89 f3                	mov    %esi,%ebx
  800bd3:	80 fb 19             	cmp    $0x19,%bl
  800bd6:	77 08                	ja     800be0 <strtol+0xc1>
  800bd8:	0f be c0             	movsbl %al,%eax
  800bdb:	83 e8 37             	sub    $0x37,%eax
  800bde:	eb c1                	jmp    800ba1 <strtol+0x82>
  800be0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  800be4:	74 05                	je     800beb <strtol+0xcc>
  800be6:	8b 45 0c             	mov    0xc(%ebp),%eax
  800be9:	89 10                	mov    %edx,(%eax)
  800beb:	89 c8                	mov    %ecx,%eax
  800bed:	f7 d8                	neg    %eax
  800bef:	85 ff                	test   %edi,%edi
  800bf1:	0f 45 c8             	cmovne %eax,%ecx
  800bf4:	89 c8                	mov    %ecx,%eax
  800bf6:	5b                   	pop    %ebx
  800bf7:	5e                   	pop    %esi
  800bf8:	5f                   	pop    %edi
  800bf9:	5d                   	pop    %ebp
  800bfa:	c3                   	ret
  800bfb:	66 90                	xchg   %ax,%ax
  800bfd:	66 90                	xchg   %ax,%ax
  800bff:	90                   	nop

00800c00 <__udivdi3>:
  800c00:	f3 0f 1e fb          	endbr32
  800c04:	55                   	push   %ebp
  800c05:	57                   	push   %edi
  800c06:	56                   	push   %esi
  800c07:	53                   	push   %ebx
  800c08:	83 ec 1c             	sub    $0x1c,%esp
  800c0b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800c0f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  800c13:	8b 74 24 34          	mov    0x34(%esp),%esi
  800c17:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  800c1b:	85 c0                	test   %eax,%eax
  800c1d:	75 19                	jne    800c38 <__udivdi3+0x38>
  800c1f:	39 de                	cmp    %ebx,%esi
  800c21:	73 4d                	jae    800c70 <__udivdi3+0x70>
  800c23:	31 ff                	xor    %edi,%edi
  800c25:	89 e8                	mov    %ebp,%eax
  800c27:	89 f2                	mov    %esi,%edx
  800c29:	f7 f3                	div    %ebx
  800c2b:	89 fa                	mov    %edi,%edx
  800c2d:	83 c4 1c             	add    $0x1c,%esp
  800c30:	5b                   	pop    %ebx
  800c31:	5e                   	pop    %esi
  800c32:	5f                   	pop    %edi
  800c33:	5d                   	pop    %ebp
  800c34:	c3                   	ret
  800c35:	8d 76 00             	lea    0x0(%esi),%esi
  800c38:	39 c6                	cmp    %eax,%esi
  800c3a:	73 14                	jae    800c50 <__udivdi3+0x50>
  800c3c:	31 ff                	xor    %edi,%edi
  800c3e:	31 c0                	xor    %eax,%eax
  800c40:	89 fa                	mov    %edi,%edx
  800c42:	83 c4 1c             	add    $0x1c,%esp
  800c45:	5b                   	pop    %ebx
  800c46:	5e                   	pop    %esi
  800c47:	5f                   	pop    %edi
  800c48:	5d                   	pop    %ebp
  800c49:	c3                   	ret
  800c4a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800c50:	0f bd f8             	bsr    %eax,%edi
  800c53:	83 f7 1f             	xor    $0x1f,%edi
  800c56:	75 48                	jne    800ca0 <__udivdi3+0xa0>
  800c58:	39 f0                	cmp    %esi,%eax
  800c5a:	72 06                	jb     800c62 <__udivdi3+0x62>
  800c5c:	31 c0                	xor    %eax,%eax
  800c5e:	39 dd                	cmp    %ebx,%ebp
  800c60:	72 de                	jb     800c40 <__udivdi3+0x40>
  800c62:	b8 01 00 00 00       	mov    $0x1,%eax
  800c67:	eb d7                	jmp    800c40 <__udivdi3+0x40>
  800c69:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800c70:	89 d9                	mov    %ebx,%ecx
  800c72:	85 db                	test   %ebx,%ebx
  800c74:	75 0b                	jne    800c81 <__udivdi3+0x81>
  800c76:	b8 01 00 00 00       	mov    $0x1,%eax
  800c7b:	31 d2                	xor    %edx,%edx
  800c7d:	f7 f3                	div    %ebx
  800c7f:	89 c1                	mov    %eax,%ecx
  800c81:	31 d2                	xor    %edx,%edx
  800c83:	89 f0                	mov    %esi,%eax
  800c85:	f7 f1                	div    %ecx
  800c87:	89 c6                	mov    %eax,%esi
  800c89:	89 e8                	mov    %ebp,%eax
  800c8b:	89 f7                	mov    %esi,%edi
  800c8d:	f7 f1                	div    %ecx
  800c8f:	89 fa                	mov    %edi,%edx
  800c91:	83 c4 1c             	add    $0x1c,%esp
  800c94:	5b                   	pop    %ebx
  800c95:	5e                   	pop    %esi
  800c96:	5f                   	pop    %edi
  800c97:	5d                   	pop    %ebp
  800c98:	c3                   	ret
  800c99:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800ca0:	89 f9                	mov    %edi,%ecx
  800ca2:	ba 20 00 00 00       	mov    $0x20,%edx
  800ca7:	29 fa                	sub    %edi,%edx
  800ca9:	d3 e0                	shl    %cl,%eax
  800cab:	89 44 24 08          	mov    %eax,0x8(%esp)
  800caf:	89 d1                	mov    %edx,%ecx
  800cb1:	89 d8                	mov    %ebx,%eax
  800cb3:	d3 e8                	shr    %cl,%eax
  800cb5:	89 c1                	mov    %eax,%ecx
  800cb7:	8b 44 24 08          	mov    0x8(%esp),%eax
  800cbb:	09 c1                	or     %eax,%ecx
  800cbd:	89 f0                	mov    %esi,%eax
  800cbf:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800cc3:	89 f9                	mov    %edi,%ecx
  800cc5:	d3 e3                	shl    %cl,%ebx
  800cc7:	89 d1                	mov    %edx,%ecx
  800cc9:	d3 e8                	shr    %cl,%eax
  800ccb:	89 f9                	mov    %edi,%ecx
  800ccd:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  800cd1:	89 eb                	mov    %ebp,%ebx
  800cd3:	d3 e6                	shl    %cl,%esi
  800cd5:	89 d1                	mov    %edx,%ecx
  800cd7:	d3 eb                	shr    %cl,%ebx
  800cd9:	09 f3                	or     %esi,%ebx
  800cdb:	89 c6                	mov    %eax,%esi
  800cdd:	89 f2                	mov    %esi,%edx
  800cdf:	89 d8                	mov    %ebx,%eax
  800ce1:	f7 74 24 08          	divl   0x8(%esp)
  800ce5:	89 d6                	mov    %edx,%esi
  800ce7:	89 c3                	mov    %eax,%ebx
  800ce9:	f7 64 24 0c          	mull   0xc(%esp)
  800ced:	39 d6                	cmp    %edx,%esi
  800cef:	72 1f                	jb     800d10 <__udivdi3+0x110>
  800cf1:	89 f9                	mov    %edi,%ecx
  800cf3:	d3 e5                	shl    %cl,%ebp
  800cf5:	39 c5                	cmp    %eax,%ebp
  800cf7:	73 04                	jae    800cfd <__udivdi3+0xfd>
  800cf9:	39 d6                	cmp    %edx,%esi
  800cfb:	74 13                	je     800d10 <__udivdi3+0x110>
  800cfd:	89 d8                	mov    %ebx,%eax
  800cff:	31 ff                	xor    %edi,%edi
  800d01:	e9 3a ff ff ff       	jmp    800c40 <__udivdi3+0x40>
  800d06:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800d0d:	00 
  800d0e:	66 90                	xchg   %ax,%ax
  800d10:	8d 43 ff             	lea    -0x1(%ebx),%eax
  800d13:	31 ff                	xor    %edi,%edi
  800d15:	e9 26 ff ff ff       	jmp    800c40 <__udivdi3+0x40>
  800d1a:	66 90                	xchg   %ax,%ax
  800d1c:	66 90                	xchg   %ax,%ax
  800d1e:	66 90                	xchg   %ax,%ax

00800d20 <__umoddi3>:
  800d20:	f3 0f 1e fb          	endbr32
  800d24:	55                   	push   %ebp
  800d25:	57                   	push   %edi
  800d26:	56                   	push   %esi
  800d27:	53                   	push   %ebx
  800d28:	83 ec 1c             	sub    $0x1c,%esp
  800d2b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  800d2f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800d33:	8b 74 24 30          	mov    0x30(%esp),%esi
  800d37:	8b 7c 24 38          	mov    0x38(%esp),%edi
  800d3b:	89 da                	mov    %ebx,%edx
  800d3d:	85 c0                	test   %eax,%eax
  800d3f:	75 17                	jne    800d58 <__umoddi3+0x38>
  800d41:	39 fb                	cmp    %edi,%ebx
  800d43:	73 53                	jae    800d98 <__umoddi3+0x78>
  800d45:	89 f0                	mov    %esi,%eax
  800d47:	f7 f7                	div    %edi
  800d49:	89 d0                	mov    %edx,%eax
  800d4b:	31 d2                	xor    %edx,%edx
  800d4d:	83 c4 1c             	add    $0x1c,%esp
  800d50:	5b                   	pop    %ebx
  800d51:	5e                   	pop    %esi
  800d52:	5f                   	pop    %edi
  800d53:	5d                   	pop    %ebp
  800d54:	c3                   	ret
  800d55:	8d 76 00             	lea    0x0(%esi),%esi
  800d58:	89 f1                	mov    %esi,%ecx
  800d5a:	39 c3                	cmp    %eax,%ebx
  800d5c:	73 12                	jae    800d70 <__umoddi3+0x50>
  800d5e:	89 f0                	mov    %esi,%eax
  800d60:	83 c4 1c             	add    $0x1c,%esp
  800d63:	5b                   	pop    %ebx
  800d64:	5e                   	pop    %esi
  800d65:	5f                   	pop    %edi
  800d66:	5d                   	pop    %ebp
  800d67:	c3                   	ret
  800d68:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800d6f:	00 
  800d70:	0f bd e8             	bsr    %eax,%ebp
  800d73:	83 f5 1f             	xor    $0x1f,%ebp
  800d76:	75 48                	jne    800dc0 <__umoddi3+0xa0>
  800d78:	39 d8                	cmp    %ebx,%eax
  800d7a:	0f 82 d0 00 00 00    	jb     800e50 <__umoddi3+0x130>
  800d80:	39 fe                	cmp    %edi,%esi
  800d82:	0f 83 c8 00 00 00    	jae    800e50 <__umoddi3+0x130>
  800d88:	89 c8                	mov    %ecx,%eax
  800d8a:	83 c4 1c             	add    $0x1c,%esp
  800d8d:	5b                   	pop    %ebx
  800d8e:	5e                   	pop    %esi
  800d8f:	5f                   	pop    %edi
  800d90:	5d                   	pop    %ebp
  800d91:	c3                   	ret
  800d92:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800d98:	89 f9                	mov    %edi,%ecx
  800d9a:	85 ff                	test   %edi,%edi
  800d9c:	75 0b                	jne    800da9 <__umoddi3+0x89>
  800d9e:	b8 01 00 00 00       	mov    $0x1,%eax
  800da3:	31 d2                	xor    %edx,%edx
  800da5:	f7 f7                	div    %edi
  800da7:	89 c1                	mov    %eax,%ecx
  800da9:	89 d8                	mov    %ebx,%eax
  800dab:	31 d2                	xor    %edx,%edx
  800dad:	f7 f1                	div    %ecx
  800daf:	89 f0                	mov    %esi,%eax
  800db1:	f7 f1                	div    %ecx
  800db3:	89 d0                	mov    %edx,%eax
  800db5:	31 d2                	xor    %edx,%edx
  800db7:	eb 94                	jmp    800d4d <__umoddi3+0x2d>
  800db9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800dc0:	89 e9                	mov    %ebp,%ecx
  800dc2:	ba 20 00 00 00       	mov    $0x20,%edx
  800dc7:	29 ea                	sub    %ebp,%edx
  800dc9:	d3 e0                	shl    %cl,%eax
  800dcb:	89 44 24 08          	mov    %eax,0x8(%esp)
  800dcf:	89 d1                	mov    %edx,%ecx
  800dd1:	89 f8                	mov    %edi,%eax
  800dd3:	d3 e8                	shr    %cl,%eax
  800dd5:	89 54 24 04          	mov    %edx,0x4(%esp)
  800dd9:	8b 54 24 04          	mov    0x4(%esp),%edx
  800ddd:	89 c1                	mov    %eax,%ecx
  800ddf:	8b 44 24 08          	mov    0x8(%esp),%eax
  800de3:	09 c1                	or     %eax,%ecx
  800de5:	89 d8                	mov    %ebx,%eax
  800de7:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800deb:	89 e9                	mov    %ebp,%ecx
  800ded:	d3 e7                	shl    %cl,%edi
  800def:	89 d1                	mov    %edx,%ecx
  800df1:	d3 e8                	shr    %cl,%eax
  800df3:	89 e9                	mov    %ebp,%ecx
  800df5:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  800df9:	d3 e3                	shl    %cl,%ebx
  800dfb:	89 c7                	mov    %eax,%edi
  800dfd:	89 d1                	mov    %edx,%ecx
  800dff:	89 f0                	mov    %esi,%eax
  800e01:	d3 e8                	shr    %cl,%eax
  800e03:	89 fa                	mov    %edi,%edx
  800e05:	89 e9                	mov    %ebp,%ecx
  800e07:	09 d8                	or     %ebx,%eax
  800e09:	d3 e6                	shl    %cl,%esi
  800e0b:	f7 74 24 08          	divl   0x8(%esp)
  800e0f:	89 d3                	mov    %edx,%ebx
  800e11:	f7 64 24 0c          	mull   0xc(%esp)
  800e15:	89 c7                	mov    %eax,%edi
  800e17:	89 d1                	mov    %edx,%ecx
  800e19:	39 d3                	cmp    %edx,%ebx
  800e1b:	72 06                	jb     800e23 <__umoddi3+0x103>
  800e1d:	75 10                	jne    800e2f <__umoddi3+0x10f>
  800e1f:	39 c6                	cmp    %eax,%esi
  800e21:	73 0c                	jae    800e2f <__umoddi3+0x10f>
  800e23:	2b 44 24 0c          	sub    0xc(%esp),%eax
  800e27:	1b 54 24 08          	sbb    0x8(%esp),%edx
  800e2b:	89 d1                	mov    %edx,%ecx
  800e2d:	89 c7                	mov    %eax,%edi
  800e2f:	89 f2                	mov    %esi,%edx
  800e31:	29 fa                	sub    %edi,%edx
  800e33:	19 cb                	sbb    %ecx,%ebx
  800e35:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  800e3a:	89 d8                	mov    %ebx,%eax
  800e3c:	d3 e0                	shl    %cl,%eax
  800e3e:	89 e9                	mov    %ebp,%ecx
  800e40:	d3 ea                	shr    %cl,%edx
  800e42:	d3 eb                	shr    %cl,%ebx
  800e44:	09 d0                	or     %edx,%eax
  800e46:	89 da                	mov    %ebx,%edx
  800e48:	83 c4 1c             	add    $0x1c,%esp
  800e4b:	5b                   	pop    %ebx
  800e4c:	5e                   	pop    %esi
  800e4d:	5f                   	pop    %edi
  800e4e:	5d                   	pop    %ebp
  800e4f:	c3                   	ret
  800e50:	89 da                	mov    %ebx,%edx
  800e52:	89 f1                	mov    %esi,%ecx
  800e54:	29 f9                	sub    %edi,%ecx
  800e56:	19 c2                	sbb    %eax,%edx
  800e58:	89 c8                	mov    %ecx,%eax
  800e5a:	e9 2b ff ff ff       	jmp    800d8a <__umoddi3+0x6a>
