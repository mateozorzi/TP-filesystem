
obj/user/evilhello:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 19 00 00 00       	call   80004a <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <umain>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	83 ec 10             	sub    $0x10,%esp
  800039:	6a 64                	push   $0x64
  80003b:	68 0c 00 10 f0       	push   $0xf010000c
  800040:	e8 ad 00 00 00       	call   8000f2 <sys_cputs>
  800045:	83 c4 10             	add    $0x10,%esp
  800048:	c9                   	leave
  800049:	c3                   	ret

0080004a <libmain>:
  80004a:	55                   	push   %ebp
  80004b:	89 e5                	mov    %esp,%ebp
  80004d:	56                   	push   %esi
  80004e:	53                   	push   %ebx
  80004f:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800052:	8b 75 0c             	mov    0xc(%ebp),%esi
  800055:	e8 04 01 00 00       	call   80015e <sys_getenvid>
  80005a:	85 c0                	test   %eax,%eax
  80005c:	78 15                	js     800073 <libmain+0x29>
  80005e:	25 ff 03 00 00       	and    $0x3ff,%eax
  800063:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800069:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  80006e:	a3 04 20 80 00       	mov    %eax,0x802004
  800073:	85 db                	test   %ebx,%ebx
  800075:	7e 07                	jle    80007e <libmain+0x34>
  800077:	8b 06                	mov    (%esi),%eax
  800079:	a3 00 20 80 00       	mov    %eax,0x802000
  80007e:	83 ec 08             	sub    $0x8,%esp
  800081:	56                   	push   %esi
  800082:	53                   	push   %ebx
  800083:	e8 ab ff ff ff       	call   800033 <umain>
  800088:	e8 0a 00 00 00       	call   800097 <exit>
  80008d:	83 c4 10             	add    $0x10,%esp
  800090:	8d 65 f8             	lea    -0x8(%ebp),%esp
  800093:	5b                   	pop    %ebx
  800094:	5e                   	pop    %esi
  800095:	5d                   	pop    %ebp
  800096:	c3                   	ret

00800097 <exit>:
  800097:	55                   	push   %ebp
  800098:	89 e5                	mov    %esp,%ebp
  80009a:	83 ec 14             	sub    $0x14,%esp
  80009d:	6a 00                	push   $0x0
  80009f:	e8 98 00 00 00       	call   80013c <sys_env_destroy>
  8000a4:	83 c4 10             	add    $0x10,%esp
  8000a7:	c9                   	leave
  8000a8:	c3                   	ret

008000a9 <syscall>:
  8000a9:	55                   	push   %ebp
  8000aa:	89 e5                	mov    %esp,%ebp
  8000ac:	57                   	push   %edi
  8000ad:	56                   	push   %esi
  8000ae:	53                   	push   %ebx
  8000af:	83 ec 1c             	sub    $0x1c,%esp
  8000b2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8000b5:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  8000b8:	89 ca                	mov    %ecx,%edx
  8000ba:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8000bd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8000c0:	8b 7d 10             	mov    0x10(%ebp),%edi
  8000c3:	8b 75 14             	mov    0x14(%ebp),%esi
  8000c6:	cd 30                	int    $0x30
  8000c8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  8000cc:	74 04                	je     8000d2 <syscall+0x29>
  8000ce:	85 c0                	test   %eax,%eax
  8000d0:	7f 08                	jg     8000da <syscall+0x31>
  8000d2:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8000d5:	5b                   	pop    %ebx
  8000d6:	5e                   	pop    %esi
  8000d7:	5f                   	pop    %edi
  8000d8:	5d                   	pop    %ebp
  8000d9:	c3                   	ret
  8000da:	83 ec 0c             	sub    $0xc,%esp
  8000dd:	50                   	push   %eax
  8000de:	ff 75 e0             	push   -0x20(%ebp)
  8000e1:	68 6a 0e 80 00       	push   $0x800e6a
  8000e6:	6a 1e                	push   $0x1e
  8000e8:	68 87 0e 80 00       	push   $0x800e87
  8000ed:	e8 b1 01 00 00       	call   8002a3 <_panic>

008000f2 <sys_cputs>:
  8000f2:	55                   	push   %ebp
  8000f3:	89 e5                	mov    %esp,%ebp
  8000f5:	83 ec 08             	sub    $0x8,%esp
  8000f8:	6a 00                	push   $0x0
  8000fa:	6a 00                	push   $0x0
  8000fc:	6a 00                	push   $0x0
  8000fe:	ff 75 0c             	push   0xc(%ebp)
  800101:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800104:	ba 00 00 00 00       	mov    $0x0,%edx
  800109:	b8 00 00 00 00       	mov    $0x0,%eax
  80010e:	e8 96 ff ff ff       	call   8000a9 <syscall>
  800113:	83 c4 10             	add    $0x10,%esp
  800116:	c9                   	leave
  800117:	c3                   	ret

00800118 <sys_cgetc>:
  800118:	55                   	push   %ebp
  800119:	89 e5                	mov    %esp,%ebp
  80011b:	83 ec 08             	sub    $0x8,%esp
  80011e:	6a 00                	push   $0x0
  800120:	6a 00                	push   $0x0
  800122:	6a 00                	push   $0x0
  800124:	6a 00                	push   $0x0
  800126:	b9 00 00 00 00       	mov    $0x0,%ecx
  80012b:	ba 00 00 00 00       	mov    $0x0,%edx
  800130:	b8 01 00 00 00       	mov    $0x1,%eax
  800135:	e8 6f ff ff ff       	call   8000a9 <syscall>
  80013a:	c9                   	leave
  80013b:	c3                   	ret

0080013c <sys_env_destroy>:
  80013c:	55                   	push   %ebp
  80013d:	89 e5                	mov    %esp,%ebp
  80013f:	83 ec 08             	sub    $0x8,%esp
  800142:	6a 00                	push   $0x0
  800144:	6a 00                	push   $0x0
  800146:	6a 00                	push   $0x0
  800148:	6a 00                	push   $0x0
  80014a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80014d:	ba 01 00 00 00       	mov    $0x1,%edx
  800152:	b8 03 00 00 00       	mov    $0x3,%eax
  800157:	e8 4d ff ff ff       	call   8000a9 <syscall>
  80015c:	c9                   	leave
  80015d:	c3                   	ret

0080015e <sys_getenvid>:
  80015e:	55                   	push   %ebp
  80015f:	89 e5                	mov    %esp,%ebp
  800161:	83 ec 08             	sub    $0x8,%esp
  800164:	6a 00                	push   $0x0
  800166:	6a 00                	push   $0x0
  800168:	6a 00                	push   $0x0
  80016a:	6a 00                	push   $0x0
  80016c:	b9 00 00 00 00       	mov    $0x0,%ecx
  800171:	ba 00 00 00 00       	mov    $0x0,%edx
  800176:	b8 02 00 00 00       	mov    $0x2,%eax
  80017b:	e8 29 ff ff ff       	call   8000a9 <syscall>
  800180:	c9                   	leave
  800181:	c3                   	ret

00800182 <sys_yield>:
  800182:	55                   	push   %ebp
  800183:	89 e5                	mov    %esp,%ebp
  800185:	83 ec 08             	sub    $0x8,%esp
  800188:	6a 00                	push   $0x0
  80018a:	6a 00                	push   $0x0
  80018c:	6a 00                	push   $0x0
  80018e:	6a 00                	push   $0x0
  800190:	b9 00 00 00 00       	mov    $0x0,%ecx
  800195:	ba 00 00 00 00       	mov    $0x0,%edx
  80019a:	b8 0a 00 00 00       	mov    $0xa,%eax
  80019f:	e8 05 ff ff ff       	call   8000a9 <syscall>
  8001a4:	83 c4 10             	add    $0x10,%esp
  8001a7:	c9                   	leave
  8001a8:	c3                   	ret

008001a9 <sys_page_alloc>:
  8001a9:	55                   	push   %ebp
  8001aa:	89 e5                	mov    %esp,%ebp
  8001ac:	83 ec 08             	sub    $0x8,%esp
  8001af:	6a 00                	push   $0x0
  8001b1:	6a 00                	push   $0x0
  8001b3:	ff 75 10             	push   0x10(%ebp)
  8001b6:	ff 75 0c             	push   0xc(%ebp)
  8001b9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001bc:	ba 01 00 00 00       	mov    $0x1,%edx
  8001c1:	b8 04 00 00 00       	mov    $0x4,%eax
  8001c6:	e8 de fe ff ff       	call   8000a9 <syscall>
  8001cb:	c9                   	leave
  8001cc:	c3                   	ret

008001cd <sys_page_map>:
  8001cd:	55                   	push   %ebp
  8001ce:	89 e5                	mov    %esp,%ebp
  8001d0:	83 ec 08             	sub    $0x8,%esp
  8001d3:	ff 75 18             	push   0x18(%ebp)
  8001d6:	ff 75 14             	push   0x14(%ebp)
  8001d9:	ff 75 10             	push   0x10(%ebp)
  8001dc:	ff 75 0c             	push   0xc(%ebp)
  8001df:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001e2:	ba 01 00 00 00       	mov    $0x1,%edx
  8001e7:	b8 05 00 00 00       	mov    $0x5,%eax
  8001ec:	e8 b8 fe ff ff       	call   8000a9 <syscall>
  8001f1:	c9                   	leave
  8001f2:	c3                   	ret

008001f3 <sys_page_unmap>:
  8001f3:	55                   	push   %ebp
  8001f4:	89 e5                	mov    %esp,%ebp
  8001f6:	83 ec 08             	sub    $0x8,%esp
  8001f9:	6a 00                	push   $0x0
  8001fb:	6a 00                	push   $0x0
  8001fd:	6a 00                	push   $0x0
  8001ff:	ff 75 0c             	push   0xc(%ebp)
  800202:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800205:	ba 01 00 00 00       	mov    $0x1,%edx
  80020a:	b8 06 00 00 00       	mov    $0x6,%eax
  80020f:	e8 95 fe ff ff       	call   8000a9 <syscall>
  800214:	c9                   	leave
  800215:	c3                   	ret

00800216 <sys_env_set_status>:
  800216:	55                   	push   %ebp
  800217:	89 e5                	mov    %esp,%ebp
  800219:	83 ec 08             	sub    $0x8,%esp
  80021c:	6a 00                	push   $0x0
  80021e:	6a 00                	push   $0x0
  800220:	6a 00                	push   $0x0
  800222:	ff 75 0c             	push   0xc(%ebp)
  800225:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800228:	ba 01 00 00 00       	mov    $0x1,%edx
  80022d:	b8 08 00 00 00       	mov    $0x8,%eax
  800232:	e8 72 fe ff ff       	call   8000a9 <syscall>
  800237:	c9                   	leave
  800238:	c3                   	ret

00800239 <sys_env_set_pgfault_upcall>:
  800239:	55                   	push   %ebp
  80023a:	89 e5                	mov    %esp,%ebp
  80023c:	83 ec 08             	sub    $0x8,%esp
  80023f:	6a 00                	push   $0x0
  800241:	6a 00                	push   $0x0
  800243:	6a 00                	push   $0x0
  800245:	ff 75 0c             	push   0xc(%ebp)
  800248:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80024b:	ba 01 00 00 00       	mov    $0x1,%edx
  800250:	b8 09 00 00 00       	mov    $0x9,%eax
  800255:	e8 4f fe ff ff       	call   8000a9 <syscall>
  80025a:	c9                   	leave
  80025b:	c3                   	ret

0080025c <sys_ipc_try_send>:
  80025c:	55                   	push   %ebp
  80025d:	89 e5                	mov    %esp,%ebp
  80025f:	83 ec 08             	sub    $0x8,%esp
  800262:	6a 00                	push   $0x0
  800264:	ff 75 14             	push   0x14(%ebp)
  800267:	ff 75 10             	push   0x10(%ebp)
  80026a:	ff 75 0c             	push   0xc(%ebp)
  80026d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800270:	ba 00 00 00 00       	mov    $0x0,%edx
  800275:	b8 0c 00 00 00       	mov    $0xc,%eax
  80027a:	e8 2a fe ff ff       	call   8000a9 <syscall>
  80027f:	c9                   	leave
  800280:	c3                   	ret

00800281 <sys_ipc_recv>:
  800281:	55                   	push   %ebp
  800282:	89 e5                	mov    %esp,%ebp
  800284:	83 ec 08             	sub    $0x8,%esp
  800287:	6a 00                	push   $0x0
  800289:	6a 00                	push   $0x0
  80028b:	6a 00                	push   $0x0
  80028d:	6a 00                	push   $0x0
  80028f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800292:	ba 01 00 00 00       	mov    $0x1,%edx
  800297:	b8 0d 00 00 00       	mov    $0xd,%eax
  80029c:	e8 08 fe ff ff       	call   8000a9 <syscall>
  8002a1:	c9                   	leave
  8002a2:	c3                   	ret

008002a3 <_panic>:
  8002a3:	55                   	push   %ebp
  8002a4:	89 e5                	mov    %esp,%ebp
  8002a6:	56                   	push   %esi
  8002a7:	53                   	push   %ebx
  8002a8:	8d 5d 14             	lea    0x14(%ebp),%ebx
  8002ab:	8b 35 00 20 80 00    	mov    0x802000,%esi
  8002b1:	e8 a8 fe ff ff       	call   80015e <sys_getenvid>
  8002b6:	83 ec 0c             	sub    $0xc,%esp
  8002b9:	ff 75 0c             	push   0xc(%ebp)
  8002bc:	ff 75 08             	push   0x8(%ebp)
  8002bf:	56                   	push   %esi
  8002c0:	50                   	push   %eax
  8002c1:	68 50 0f 80 00       	push   $0x800f50
  8002c6:	e8 b3 00 00 00       	call   80037e <cprintf>
  8002cb:	83 c4 18             	add    $0x18,%esp
  8002ce:	53                   	push   %ebx
  8002cf:	ff 75 10             	push   0x10(%ebp)
  8002d2:	e8 56 00 00 00       	call   80032d <vcprintf>
  8002d7:	c7 04 24 95 0e 80 00 	movl   $0x800e95,(%esp)
  8002de:	e8 9b 00 00 00       	call   80037e <cprintf>
  8002e3:	83 c4 10             	add    $0x10,%esp
  8002e6:	cc                   	int3
  8002e7:	eb fd                	jmp    8002e6 <_panic+0x43>

008002e9 <putch>:
  8002e9:	55                   	push   %ebp
  8002ea:	89 e5                	mov    %esp,%ebp
  8002ec:	53                   	push   %ebx
  8002ed:	83 ec 04             	sub    $0x4,%esp
  8002f0:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8002f3:	8b 13                	mov    (%ebx),%edx
  8002f5:	8d 42 01             	lea    0x1(%edx),%eax
  8002f8:	89 03                	mov    %eax,(%ebx)
  8002fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8002fd:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  800301:	3d ff 00 00 00       	cmp    $0xff,%eax
  800306:	74 09                	je     800311 <putch+0x28>
  800308:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  80030c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  80030f:	c9                   	leave
  800310:	c3                   	ret
  800311:	83 ec 08             	sub    $0x8,%esp
  800314:	68 ff 00 00 00       	push   $0xff
  800319:	8d 43 08             	lea    0x8(%ebx),%eax
  80031c:	50                   	push   %eax
  80031d:	e8 d0 fd ff ff       	call   8000f2 <sys_cputs>
  800322:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  800328:	83 c4 10             	add    $0x10,%esp
  80032b:	eb db                	jmp    800308 <putch+0x1f>

0080032d <vcprintf>:
  80032d:	55                   	push   %ebp
  80032e:	89 e5                	mov    %esp,%ebp
  800330:	81 ec 18 01 00 00    	sub    $0x118,%esp
  800336:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  80033d:	00 00 00 
  800340:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  800347:	00 00 00 
  80034a:	ff 75 0c             	push   0xc(%ebp)
  80034d:	ff 75 08             	push   0x8(%ebp)
  800350:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  800356:	50                   	push   %eax
  800357:	68 e9 02 80 00       	push   $0x8002e9
  80035c:	e8 74 01 00 00       	call   8004d5 <vprintfmt>
  800361:	83 c4 08             	add    $0x8,%esp
  800364:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  80036a:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  800370:	50                   	push   %eax
  800371:	e8 7c fd ff ff       	call   8000f2 <sys_cputs>
  800376:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  80037c:	c9                   	leave
  80037d:	c3                   	ret

0080037e <cprintf>:
  80037e:	55                   	push   %ebp
  80037f:	89 e5                	mov    %esp,%ebp
  800381:	83 ec 10             	sub    $0x10,%esp
  800384:	8d 45 0c             	lea    0xc(%ebp),%eax
  800387:	50                   	push   %eax
  800388:	ff 75 08             	push   0x8(%ebp)
  80038b:	e8 9d ff ff ff       	call   80032d <vcprintf>
  800390:	c9                   	leave
  800391:	c3                   	ret

00800392 <printnum>:
  800392:	55                   	push   %ebp
  800393:	89 e5                	mov    %esp,%ebp
  800395:	57                   	push   %edi
  800396:	56                   	push   %esi
  800397:	53                   	push   %ebx
  800398:	83 ec 1c             	sub    $0x1c,%esp
  80039b:	89 c7                	mov    %eax,%edi
  80039d:	89 d6                	mov    %edx,%esi
  80039f:	8b 45 08             	mov    0x8(%ebp),%eax
  8003a2:	8b 55 0c             	mov    0xc(%ebp),%edx
  8003a5:	89 d1                	mov    %edx,%ecx
  8003a7:	89 c2                	mov    %eax,%edx
  8003a9:	89 45 d8             	mov    %eax,-0x28(%ebp)
  8003ac:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  8003af:	8b 45 10             	mov    0x10(%ebp),%eax
  8003b2:	8b 5d 14             	mov    0x14(%ebp),%ebx
  8003b5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8003b8:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  8003bf:	39 c2                	cmp    %eax,%edx
  8003c1:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  8003c4:	72 3e                	jb     800404 <printnum+0x72>
  8003c6:	83 ec 0c             	sub    $0xc,%esp
  8003c9:	ff 75 18             	push   0x18(%ebp)
  8003cc:	83 eb 01             	sub    $0x1,%ebx
  8003cf:	53                   	push   %ebx
  8003d0:	50                   	push   %eax
  8003d1:	83 ec 08             	sub    $0x8,%esp
  8003d4:	ff 75 e4             	push   -0x1c(%ebp)
  8003d7:	ff 75 e0             	push   -0x20(%ebp)
  8003da:	ff 75 dc             	push   -0x24(%ebp)
  8003dd:	ff 75 d8             	push   -0x28(%ebp)
  8003e0:	e8 1b 08 00 00       	call   800c00 <__udivdi3>
  8003e5:	83 c4 18             	add    $0x18,%esp
  8003e8:	52                   	push   %edx
  8003e9:	50                   	push   %eax
  8003ea:	89 f2                	mov    %esi,%edx
  8003ec:	89 f8                	mov    %edi,%eax
  8003ee:	e8 9f ff ff ff       	call   800392 <printnum>
  8003f3:	83 c4 20             	add    $0x20,%esp
  8003f6:	eb 13                	jmp    80040b <printnum+0x79>
  8003f8:	83 ec 08             	sub    $0x8,%esp
  8003fb:	56                   	push   %esi
  8003fc:	ff 75 18             	push   0x18(%ebp)
  8003ff:	ff d7                	call   *%edi
  800401:	83 c4 10             	add    $0x10,%esp
  800404:	83 eb 01             	sub    $0x1,%ebx
  800407:	85 db                	test   %ebx,%ebx
  800409:	7f ed                	jg     8003f8 <printnum+0x66>
  80040b:	83 ec 08             	sub    $0x8,%esp
  80040e:	56                   	push   %esi
  80040f:	83 ec 04             	sub    $0x4,%esp
  800412:	ff 75 e4             	push   -0x1c(%ebp)
  800415:	ff 75 e0             	push   -0x20(%ebp)
  800418:	ff 75 dc             	push   -0x24(%ebp)
  80041b:	ff 75 d8             	push   -0x28(%ebp)
  80041e:	e8 fd 08 00 00       	call   800d20 <__umoddi3>
  800423:	83 c4 14             	add    $0x14,%esp
  800426:	0f be 80 97 0e 80 00 	movsbl 0x800e97(%eax),%eax
  80042d:	50                   	push   %eax
  80042e:	ff d7                	call   *%edi
  800430:	83 c4 10             	add    $0x10,%esp
  800433:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800436:	5b                   	pop    %ebx
  800437:	5e                   	pop    %esi
  800438:	5f                   	pop    %edi
  800439:	5d                   	pop    %ebp
  80043a:	c3                   	ret

0080043b <getuint>:
  80043b:	83 fa 01             	cmp    $0x1,%edx
  80043e:	7f 13                	jg     800453 <getuint+0x18>
  800440:	85 d2                	test   %edx,%edx
  800442:	74 1c                	je     800460 <getuint+0x25>
  800444:	8b 10                	mov    (%eax),%edx
  800446:	8d 4a 04             	lea    0x4(%edx),%ecx
  800449:	89 08                	mov    %ecx,(%eax)
  80044b:	8b 02                	mov    (%edx),%eax
  80044d:	ba 00 00 00 00       	mov    $0x0,%edx
  800452:	c3                   	ret
  800453:	8b 10                	mov    (%eax),%edx
  800455:	8d 4a 08             	lea    0x8(%edx),%ecx
  800458:	89 08                	mov    %ecx,(%eax)
  80045a:	8b 02                	mov    (%edx),%eax
  80045c:	8b 52 04             	mov    0x4(%edx),%edx
  80045f:	c3                   	ret
  800460:	8b 10                	mov    (%eax),%edx
  800462:	8d 4a 04             	lea    0x4(%edx),%ecx
  800465:	89 08                	mov    %ecx,(%eax)
  800467:	8b 02                	mov    (%edx),%eax
  800469:	ba 00 00 00 00       	mov    $0x0,%edx
  80046e:	c3                   	ret

0080046f <getint>:
  80046f:	83 fa 01             	cmp    $0x1,%edx
  800472:	7f 0f                	jg     800483 <getint+0x14>
  800474:	85 d2                	test   %edx,%edx
  800476:	74 18                	je     800490 <getint+0x21>
  800478:	8b 10                	mov    (%eax),%edx
  80047a:	8d 4a 04             	lea    0x4(%edx),%ecx
  80047d:	89 08                	mov    %ecx,(%eax)
  80047f:	8b 02                	mov    (%edx),%eax
  800481:	99                   	cltd
  800482:	c3                   	ret
  800483:	8b 10                	mov    (%eax),%edx
  800485:	8d 4a 08             	lea    0x8(%edx),%ecx
  800488:	89 08                	mov    %ecx,(%eax)
  80048a:	8b 02                	mov    (%edx),%eax
  80048c:	8b 52 04             	mov    0x4(%edx),%edx
  80048f:	c3                   	ret
  800490:	8b 10                	mov    (%eax),%edx
  800492:	8d 4a 04             	lea    0x4(%edx),%ecx
  800495:	89 08                	mov    %ecx,(%eax)
  800497:	8b 02                	mov    (%edx),%eax
  800499:	99                   	cltd
  80049a:	c3                   	ret

0080049b <sprintputch>:
  80049b:	55                   	push   %ebp
  80049c:	89 e5                	mov    %esp,%ebp
  80049e:	8b 45 0c             	mov    0xc(%ebp),%eax
  8004a1:	83 40 08 01          	addl   $0x1,0x8(%eax)
  8004a5:	8b 10                	mov    (%eax),%edx
  8004a7:	3b 50 04             	cmp    0x4(%eax),%edx
  8004aa:	73 0a                	jae    8004b6 <sprintputch+0x1b>
  8004ac:	8d 4a 01             	lea    0x1(%edx),%ecx
  8004af:	89 08                	mov    %ecx,(%eax)
  8004b1:	8b 45 08             	mov    0x8(%ebp),%eax
  8004b4:	88 02                	mov    %al,(%edx)
  8004b6:	5d                   	pop    %ebp
  8004b7:	c3                   	ret

008004b8 <printfmt>:
  8004b8:	55                   	push   %ebp
  8004b9:	89 e5                	mov    %esp,%ebp
  8004bb:	83 ec 08             	sub    $0x8,%esp
  8004be:	8d 45 14             	lea    0x14(%ebp),%eax
  8004c1:	50                   	push   %eax
  8004c2:	ff 75 10             	push   0x10(%ebp)
  8004c5:	ff 75 0c             	push   0xc(%ebp)
  8004c8:	ff 75 08             	push   0x8(%ebp)
  8004cb:	e8 05 00 00 00       	call   8004d5 <vprintfmt>
  8004d0:	83 c4 10             	add    $0x10,%esp
  8004d3:	c9                   	leave
  8004d4:	c3                   	ret

008004d5 <vprintfmt>:
  8004d5:	55                   	push   %ebp
  8004d6:	89 e5                	mov    %esp,%ebp
  8004d8:	57                   	push   %edi
  8004d9:	56                   	push   %esi
  8004da:	53                   	push   %ebx
  8004db:	83 ec 2c             	sub    $0x2c,%esp
  8004de:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8004e1:	8b 75 0c             	mov    0xc(%ebp),%esi
  8004e4:	8b 7d 10             	mov    0x10(%ebp),%edi
  8004e7:	eb 0a                	jmp    8004f3 <vprintfmt+0x1e>
  8004e9:	83 ec 08             	sub    $0x8,%esp
  8004ec:	56                   	push   %esi
  8004ed:	50                   	push   %eax
  8004ee:	ff d3                	call   *%ebx
  8004f0:	83 c4 10             	add    $0x10,%esp
  8004f3:	83 c7 01             	add    $0x1,%edi
  8004f6:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  8004fa:	83 f8 25             	cmp    $0x25,%eax
  8004fd:	74 0c                	je     80050b <vprintfmt+0x36>
  8004ff:	85 c0                	test   %eax,%eax
  800501:	75 e6                	jne    8004e9 <vprintfmt+0x14>
  800503:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800506:	5b                   	pop    %ebx
  800507:	5e                   	pop    %esi
  800508:	5f                   	pop    %edi
  800509:	5d                   	pop    %ebp
  80050a:	c3                   	ret
  80050b:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  80050f:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  800516:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  80051d:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  800524:	b9 00 00 00 00       	mov    $0x0,%ecx
  800529:	8d 47 01             	lea    0x1(%edi),%eax
  80052c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  80052f:	0f b6 17             	movzbl (%edi),%edx
  800532:	8d 42 dd             	lea    -0x23(%edx),%eax
  800535:	3c 55                	cmp    $0x55,%al
  800537:	0f 87 c3 02 00 00    	ja     800800 <vprintfmt+0x32b>
  80053d:	0f b6 c0             	movzbl %al,%eax
  800540:	ff 24 85 80 0f 80 00 	jmp    *0x800f80(,%eax,4)
  800547:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80054a:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  80054e:	eb d9                	jmp    800529 <vprintfmt+0x54>
  800550:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800553:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  800557:	eb d0                	jmp    800529 <vprintfmt+0x54>
  800559:	0f b6 d2             	movzbl %dl,%edx
  80055c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80055f:	b8 00 00 00 00       	mov    $0x0,%eax
  800564:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  800567:	8d 04 80             	lea    (%eax,%eax,4),%eax
  80056a:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  80056e:	0f be 17             	movsbl (%edi),%edx
  800571:	8d 4a d0             	lea    -0x30(%edx),%ecx
  800574:	83 f9 09             	cmp    $0x9,%ecx
  800577:	77 52                	ja     8005cb <vprintfmt+0xf6>
  800579:	83 c7 01             	add    $0x1,%edi
  80057c:	eb e9                	jmp    800567 <vprintfmt+0x92>
  80057e:	8b 45 14             	mov    0x14(%ebp),%eax
  800581:	8d 50 04             	lea    0x4(%eax),%edx
  800584:	89 55 14             	mov    %edx,0x14(%ebp)
  800587:	8b 00                	mov    (%eax),%eax
  800589:	89 45 d0             	mov    %eax,-0x30(%ebp)
  80058c:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80058f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800593:	79 94                	jns    800529 <vprintfmt+0x54>
  800595:	8b 45 d0             	mov    -0x30(%ebp),%eax
  800598:	89 45 e0             	mov    %eax,-0x20(%ebp)
  80059b:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  8005a2:	eb 85                	jmp    800529 <vprintfmt+0x54>
  8005a4:	8b 55 e0             	mov    -0x20(%ebp),%edx
  8005a7:	85 d2                	test   %edx,%edx
  8005a9:	b8 00 00 00 00       	mov    $0x0,%eax
  8005ae:	0f 49 c2             	cmovns %edx,%eax
  8005b1:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8005b4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005b7:	e9 6d ff ff ff       	jmp    800529 <vprintfmt+0x54>
  8005bc:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005bf:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  8005c6:	e9 5e ff ff ff       	jmp    800529 <vprintfmt+0x54>
  8005cb:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  8005ce:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8005d1:	eb bc                	jmp    80058f <vprintfmt+0xba>
  8005d3:	83 c1 01             	add    $0x1,%ecx
  8005d6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005d9:	e9 4b ff ff ff       	jmp    800529 <vprintfmt+0x54>
  8005de:	8b 45 14             	mov    0x14(%ebp),%eax
  8005e1:	8d 50 04             	lea    0x4(%eax),%edx
  8005e4:	89 55 14             	mov    %edx,0x14(%ebp)
  8005e7:	83 ec 08             	sub    $0x8,%esp
  8005ea:	56                   	push   %esi
  8005eb:	ff 30                	push   (%eax)
  8005ed:	ff d3                	call   *%ebx
  8005ef:	83 c4 10             	add    $0x10,%esp
  8005f2:	e9 a0 01 00 00       	jmp    800797 <vprintfmt+0x2c2>
  8005f7:	8b 45 14             	mov    0x14(%ebp),%eax
  8005fa:	8d 50 04             	lea    0x4(%eax),%edx
  8005fd:	89 55 14             	mov    %edx,0x14(%ebp)
  800600:	8b 10                	mov    (%eax),%edx
  800602:	89 d0                	mov    %edx,%eax
  800604:	f7 d8                	neg    %eax
  800606:	0f 48 c2             	cmovs  %edx,%eax
  800609:	83 f8 08             	cmp    $0x8,%eax
  80060c:	7f 20                	jg     80062e <vprintfmt+0x159>
  80060e:	8b 14 85 e0 10 80 00 	mov    0x8010e0(,%eax,4),%edx
  800615:	85 d2                	test   %edx,%edx
  800617:	74 15                	je     80062e <vprintfmt+0x159>
  800619:	52                   	push   %edx
  80061a:	68 b8 0e 80 00       	push   $0x800eb8
  80061f:	56                   	push   %esi
  800620:	53                   	push   %ebx
  800621:	e8 92 fe ff ff       	call   8004b8 <printfmt>
  800626:	83 c4 10             	add    $0x10,%esp
  800629:	e9 69 01 00 00       	jmp    800797 <vprintfmt+0x2c2>
  80062e:	50                   	push   %eax
  80062f:	68 af 0e 80 00       	push   $0x800eaf
  800634:	56                   	push   %esi
  800635:	53                   	push   %ebx
  800636:	e8 7d fe ff ff       	call   8004b8 <printfmt>
  80063b:	83 c4 10             	add    $0x10,%esp
  80063e:	e9 54 01 00 00       	jmp    800797 <vprintfmt+0x2c2>
  800643:	8b 45 14             	mov    0x14(%ebp),%eax
  800646:	8d 50 04             	lea    0x4(%eax),%edx
  800649:	89 55 14             	mov    %edx,0x14(%ebp)
  80064c:	8b 08                	mov    (%eax),%ecx
  80064e:	85 c9                	test   %ecx,%ecx
  800650:	b8 a8 0e 80 00       	mov    $0x800ea8,%eax
  800655:	0f 45 c1             	cmovne %ecx,%eax
  800658:	89 45 cc             	mov    %eax,-0x34(%ebp)
  80065b:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  80065f:	7e 06                	jle    800667 <vprintfmt+0x192>
  800661:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  800665:	75 0b                	jne    800672 <vprintfmt+0x19d>
  800667:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  80066a:	8b 7d d0             	mov    -0x30(%ebp),%edi
  80066d:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800670:	eb 5c                	jmp    8006ce <vprintfmt+0x1f9>
  800672:	83 ec 08             	sub    $0x8,%esp
  800675:	ff 75 d0             	push   -0x30(%ebp)
  800678:	ff 75 cc             	push   -0x34(%ebp)
  80067b:	e8 20 02 00 00       	call   8008a0 <strnlen>
  800680:	89 c2                	mov    %eax,%edx
  800682:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800685:	29 d0                	sub    %edx,%eax
  800687:	83 c4 10             	add    $0x10,%esp
  80068a:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  80068e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800691:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800694:	89 c3                	mov    %eax,%ebx
  800696:	eb 0e                	jmp    8006a6 <vprintfmt+0x1d1>
  800698:	83 ec 08             	sub    $0x8,%esp
  80069b:	56                   	push   %esi
  80069c:	57                   	push   %edi
  80069d:	ff 55 08             	call   *0x8(%ebp)
  8006a0:	83 eb 01             	sub    $0x1,%ebx
  8006a3:	83 c4 10             	add    $0x10,%esp
  8006a6:	85 db                	test   %ebx,%ebx
  8006a8:	7f ee                	jg     800698 <vprintfmt+0x1c3>
  8006aa:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8006ad:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8006b0:	85 c0                	test   %eax,%eax
  8006b2:	ba 00 00 00 00       	mov    $0x0,%edx
  8006b7:	0f 49 d0             	cmovns %eax,%edx
  8006ba:	29 d0                	sub    %edx,%eax
  8006bc:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8006bf:	eb a6                	jmp    800667 <vprintfmt+0x192>
  8006c1:	83 ec 08             	sub    $0x8,%esp
  8006c4:	56                   	push   %esi
  8006c5:	52                   	push   %edx
  8006c6:	ff 55 08             	call   *0x8(%ebp)
  8006c9:	83 c4 10             	add    $0x10,%esp
  8006cc:	89 d9                	mov    %ebx,%ecx
  8006ce:	8d 59 01             	lea    0x1(%ecx),%ebx
  8006d1:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  8006d5:	0f be d0             	movsbl %al,%edx
  8006d8:	85 d2                	test   %edx,%edx
  8006da:	74 28                	je     800704 <vprintfmt+0x22f>
  8006dc:	85 ff                	test   %edi,%edi
  8006de:	78 05                	js     8006e5 <vprintfmt+0x210>
  8006e0:	83 ef 01             	sub    $0x1,%edi
  8006e3:	78 2e                	js     800713 <vprintfmt+0x23e>
  8006e5:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  8006e9:	74 d6                	je     8006c1 <vprintfmt+0x1ec>
  8006eb:	0f be c0             	movsbl %al,%eax
  8006ee:	83 e8 20             	sub    $0x20,%eax
  8006f1:	83 f8 5e             	cmp    $0x5e,%eax
  8006f4:	76 cb                	jbe    8006c1 <vprintfmt+0x1ec>
  8006f6:	83 ec 08             	sub    $0x8,%esp
  8006f9:	56                   	push   %esi
  8006fa:	6a 3f                	push   $0x3f
  8006fc:	ff 55 08             	call   *0x8(%ebp)
  8006ff:	83 c4 10             	add    $0x10,%esp
  800702:	eb c8                	jmp    8006cc <vprintfmt+0x1f7>
  800704:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800707:	8b 7d cc             	mov    -0x34(%ebp),%edi
  80070a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  80070d:	01 c7                	add    %eax,%edi
  80070f:	29 cf                	sub    %ecx,%edi
  800711:	eb 13                	jmp    800726 <vprintfmt+0x251>
  800713:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800716:	eb ef                	jmp    800707 <vprintfmt+0x232>
  800718:	83 ec 08             	sub    $0x8,%esp
  80071b:	56                   	push   %esi
  80071c:	6a 20                	push   $0x20
  80071e:	ff d3                	call   *%ebx
  800720:	83 ef 01             	sub    $0x1,%edi
  800723:	83 c4 10             	add    $0x10,%esp
  800726:	85 ff                	test   %edi,%edi
  800728:	7f ee                	jg     800718 <vprintfmt+0x243>
  80072a:	eb 6b                	jmp    800797 <vprintfmt+0x2c2>
  80072c:	89 ca                	mov    %ecx,%edx
  80072e:	8d 45 14             	lea    0x14(%ebp),%eax
  800731:	e8 39 fd ff ff       	call   80046f <getint>
  800736:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800739:	89 55 dc             	mov    %edx,-0x24(%ebp)
  80073c:	85 d2                	test   %edx,%edx
  80073e:	78 0b                	js     80074b <vprintfmt+0x276>
  800740:	89 d1                	mov    %edx,%ecx
  800742:	89 c2                	mov    %eax,%edx
  800744:	bf 0a 00 00 00       	mov    $0xa,%edi
  800749:	eb 32                	jmp    80077d <vprintfmt+0x2a8>
  80074b:	83 ec 08             	sub    $0x8,%esp
  80074e:	56                   	push   %esi
  80074f:	6a 2d                	push   $0x2d
  800751:	ff d3                	call   *%ebx
  800753:	8b 55 d8             	mov    -0x28(%ebp),%edx
  800756:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  800759:	f7 da                	neg    %edx
  80075b:	83 d1 00             	adc    $0x0,%ecx
  80075e:	f7 d9                	neg    %ecx
  800760:	83 c4 10             	add    $0x10,%esp
  800763:	bf 0a 00 00 00       	mov    $0xa,%edi
  800768:	eb 13                	jmp    80077d <vprintfmt+0x2a8>
  80076a:	89 ca                	mov    %ecx,%edx
  80076c:	8d 45 14             	lea    0x14(%ebp),%eax
  80076f:	e8 c7 fc ff ff       	call   80043b <getuint>
  800774:	89 d1                	mov    %edx,%ecx
  800776:	89 c2                	mov    %eax,%edx
  800778:	bf 0a 00 00 00       	mov    $0xa,%edi
  80077d:	83 ec 0c             	sub    $0xc,%esp
  800780:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  800784:	50                   	push   %eax
  800785:	ff 75 e0             	push   -0x20(%ebp)
  800788:	57                   	push   %edi
  800789:	51                   	push   %ecx
  80078a:	52                   	push   %edx
  80078b:	89 f2                	mov    %esi,%edx
  80078d:	89 d8                	mov    %ebx,%eax
  80078f:	e8 fe fb ff ff       	call   800392 <printnum>
  800794:	83 c4 20             	add    $0x20,%esp
  800797:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80079a:	e9 54 fd ff ff       	jmp    8004f3 <vprintfmt+0x1e>
  80079f:	89 ca                	mov    %ecx,%edx
  8007a1:	8d 45 14             	lea    0x14(%ebp),%eax
  8007a4:	e8 92 fc ff ff       	call   80043b <getuint>
  8007a9:	89 d1                	mov    %edx,%ecx
  8007ab:	89 c2                	mov    %eax,%edx
  8007ad:	bf 08 00 00 00       	mov    $0x8,%edi
  8007b2:	eb c9                	jmp    80077d <vprintfmt+0x2a8>
  8007b4:	83 ec 08             	sub    $0x8,%esp
  8007b7:	56                   	push   %esi
  8007b8:	6a 30                	push   $0x30
  8007ba:	ff d3                	call   *%ebx
  8007bc:	83 c4 08             	add    $0x8,%esp
  8007bf:	56                   	push   %esi
  8007c0:	6a 78                	push   $0x78
  8007c2:	ff d3                	call   *%ebx
  8007c4:	8b 45 14             	mov    0x14(%ebp),%eax
  8007c7:	8d 50 04             	lea    0x4(%eax),%edx
  8007ca:	89 55 14             	mov    %edx,0x14(%ebp)
  8007cd:	8b 10                	mov    (%eax),%edx
  8007cf:	b9 00 00 00 00       	mov    $0x0,%ecx
  8007d4:	83 c4 10             	add    $0x10,%esp
  8007d7:	bf 10 00 00 00       	mov    $0x10,%edi
  8007dc:	eb 9f                	jmp    80077d <vprintfmt+0x2a8>
  8007de:	89 ca                	mov    %ecx,%edx
  8007e0:	8d 45 14             	lea    0x14(%ebp),%eax
  8007e3:	e8 53 fc ff ff       	call   80043b <getuint>
  8007e8:	89 d1                	mov    %edx,%ecx
  8007ea:	89 c2                	mov    %eax,%edx
  8007ec:	bf 10 00 00 00       	mov    $0x10,%edi
  8007f1:	eb 8a                	jmp    80077d <vprintfmt+0x2a8>
  8007f3:	83 ec 08             	sub    $0x8,%esp
  8007f6:	56                   	push   %esi
  8007f7:	6a 25                	push   $0x25
  8007f9:	ff d3                	call   *%ebx
  8007fb:	83 c4 10             	add    $0x10,%esp
  8007fe:	eb 97                	jmp    800797 <vprintfmt+0x2c2>
  800800:	83 ec 08             	sub    $0x8,%esp
  800803:	56                   	push   %esi
  800804:	6a 25                	push   $0x25
  800806:	ff d3                	call   *%ebx
  800808:	83 c4 10             	add    $0x10,%esp
  80080b:	89 f8                	mov    %edi,%eax
  80080d:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  800811:	74 05                	je     800818 <vprintfmt+0x343>
  800813:	83 e8 01             	sub    $0x1,%eax
  800816:	eb f5                	jmp    80080d <vprintfmt+0x338>
  800818:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  80081b:	e9 77 ff ff ff       	jmp    800797 <vprintfmt+0x2c2>

00800820 <vsnprintf>:
  800820:	55                   	push   %ebp
  800821:	89 e5                	mov    %esp,%ebp
  800823:	83 ec 18             	sub    $0x18,%esp
  800826:	8b 45 08             	mov    0x8(%ebp),%eax
  800829:	8b 55 0c             	mov    0xc(%ebp),%edx
  80082c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  80082f:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  800833:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  800836:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  80083d:	85 c0                	test   %eax,%eax
  80083f:	74 26                	je     800867 <vsnprintf+0x47>
  800841:	85 d2                	test   %edx,%edx
  800843:	7e 22                	jle    800867 <vsnprintf+0x47>
  800845:	ff 75 14             	push   0x14(%ebp)
  800848:	ff 75 10             	push   0x10(%ebp)
  80084b:	8d 45 ec             	lea    -0x14(%ebp),%eax
  80084e:	50                   	push   %eax
  80084f:	68 9b 04 80 00       	push   $0x80049b
  800854:	e8 7c fc ff ff       	call   8004d5 <vprintfmt>
  800859:	8b 45 ec             	mov    -0x14(%ebp),%eax
  80085c:	c6 00 00             	movb   $0x0,(%eax)
  80085f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  800862:	83 c4 10             	add    $0x10,%esp
  800865:	c9                   	leave
  800866:	c3                   	ret
  800867:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80086c:	eb f7                	jmp    800865 <vsnprintf+0x45>

0080086e <snprintf>:
  80086e:	55                   	push   %ebp
  80086f:	89 e5                	mov    %esp,%ebp
  800871:	83 ec 08             	sub    $0x8,%esp
  800874:	8d 45 14             	lea    0x14(%ebp),%eax
  800877:	50                   	push   %eax
  800878:	ff 75 10             	push   0x10(%ebp)
  80087b:	ff 75 0c             	push   0xc(%ebp)
  80087e:	ff 75 08             	push   0x8(%ebp)
  800881:	e8 9a ff ff ff       	call   800820 <vsnprintf>
  800886:	c9                   	leave
  800887:	c3                   	ret

00800888 <strlen>:
  800888:	55                   	push   %ebp
  800889:	89 e5                	mov    %esp,%ebp
  80088b:	8b 55 08             	mov    0x8(%ebp),%edx
  80088e:	b8 00 00 00 00       	mov    $0x0,%eax
  800893:	eb 03                	jmp    800898 <strlen+0x10>
  800895:	83 c0 01             	add    $0x1,%eax
  800898:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  80089c:	75 f7                	jne    800895 <strlen+0xd>
  80089e:	5d                   	pop    %ebp
  80089f:	c3                   	ret

008008a0 <strnlen>:
  8008a0:	55                   	push   %ebp
  8008a1:	89 e5                	mov    %esp,%ebp
  8008a3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8008a6:	8b 55 0c             	mov    0xc(%ebp),%edx
  8008a9:	b8 00 00 00 00       	mov    $0x0,%eax
  8008ae:	eb 03                	jmp    8008b3 <strnlen+0x13>
  8008b0:	83 c0 01             	add    $0x1,%eax
  8008b3:	39 d0                	cmp    %edx,%eax
  8008b5:	74 08                	je     8008bf <strnlen+0x1f>
  8008b7:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  8008bb:	75 f3                	jne    8008b0 <strnlen+0x10>
  8008bd:	89 c2                	mov    %eax,%edx
  8008bf:	89 d0                	mov    %edx,%eax
  8008c1:	5d                   	pop    %ebp
  8008c2:	c3                   	ret

008008c3 <strcpy>:
  8008c3:	55                   	push   %ebp
  8008c4:	89 e5                	mov    %esp,%ebp
  8008c6:	53                   	push   %ebx
  8008c7:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8008ca:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8008cd:	b8 00 00 00 00       	mov    $0x0,%eax
  8008d2:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  8008d6:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  8008d9:	83 c0 01             	add    $0x1,%eax
  8008dc:	84 d2                	test   %dl,%dl
  8008de:	75 f2                	jne    8008d2 <strcpy+0xf>
  8008e0:	89 c8                	mov    %ecx,%eax
  8008e2:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8008e5:	c9                   	leave
  8008e6:	c3                   	ret

008008e7 <strcat>:
  8008e7:	55                   	push   %ebp
  8008e8:	89 e5                	mov    %esp,%ebp
  8008ea:	53                   	push   %ebx
  8008eb:	83 ec 10             	sub    $0x10,%esp
  8008ee:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8008f1:	53                   	push   %ebx
  8008f2:	e8 91 ff ff ff       	call   800888 <strlen>
  8008f7:	83 c4 08             	add    $0x8,%esp
  8008fa:	ff 75 0c             	push   0xc(%ebp)
  8008fd:	01 d8                	add    %ebx,%eax
  8008ff:	50                   	push   %eax
  800900:	e8 be ff ff ff       	call   8008c3 <strcpy>
  800905:	89 d8                	mov    %ebx,%eax
  800907:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  80090a:	c9                   	leave
  80090b:	c3                   	ret

0080090c <strncpy>:
  80090c:	55                   	push   %ebp
  80090d:	89 e5                	mov    %esp,%ebp
  80090f:	56                   	push   %esi
  800910:	53                   	push   %ebx
  800911:	8b 75 08             	mov    0x8(%ebp),%esi
  800914:	8b 55 0c             	mov    0xc(%ebp),%edx
  800917:	89 f3                	mov    %esi,%ebx
  800919:	03 5d 10             	add    0x10(%ebp),%ebx
  80091c:	89 f0                	mov    %esi,%eax
  80091e:	eb 0f                	jmp    80092f <strncpy+0x23>
  800920:	83 c0 01             	add    $0x1,%eax
  800923:	0f b6 0a             	movzbl (%edx),%ecx
  800926:	88 48 ff             	mov    %cl,-0x1(%eax)
  800929:	80 f9 01             	cmp    $0x1,%cl
  80092c:	83 da ff             	sbb    $0xffffffff,%edx
  80092f:	39 d8                	cmp    %ebx,%eax
  800931:	75 ed                	jne    800920 <strncpy+0x14>
  800933:	89 f0                	mov    %esi,%eax
  800935:	5b                   	pop    %ebx
  800936:	5e                   	pop    %esi
  800937:	5d                   	pop    %ebp
  800938:	c3                   	ret

00800939 <strlcpy>:
  800939:	55                   	push   %ebp
  80093a:	89 e5                	mov    %esp,%ebp
  80093c:	56                   	push   %esi
  80093d:	53                   	push   %ebx
  80093e:	8b 75 08             	mov    0x8(%ebp),%esi
  800941:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800944:	8b 55 10             	mov    0x10(%ebp),%edx
  800947:	89 f0                	mov    %esi,%eax
  800949:	85 d2                	test   %edx,%edx
  80094b:	74 21                	je     80096e <strlcpy+0x35>
  80094d:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  800951:	89 f2                	mov    %esi,%edx
  800953:	eb 09                	jmp    80095e <strlcpy+0x25>
  800955:	83 c1 01             	add    $0x1,%ecx
  800958:	83 c2 01             	add    $0x1,%edx
  80095b:	88 5a ff             	mov    %bl,-0x1(%edx)
  80095e:	39 c2                	cmp    %eax,%edx
  800960:	74 09                	je     80096b <strlcpy+0x32>
  800962:	0f b6 19             	movzbl (%ecx),%ebx
  800965:	84 db                	test   %bl,%bl
  800967:	75 ec                	jne    800955 <strlcpy+0x1c>
  800969:	89 d0                	mov    %edx,%eax
  80096b:	c6 00 00             	movb   $0x0,(%eax)
  80096e:	29 f0                	sub    %esi,%eax
  800970:	5b                   	pop    %ebx
  800971:	5e                   	pop    %esi
  800972:	5d                   	pop    %ebp
  800973:	c3                   	ret

00800974 <strcmp>:
  800974:	55                   	push   %ebp
  800975:	89 e5                	mov    %esp,%ebp
  800977:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80097a:	8b 55 0c             	mov    0xc(%ebp),%edx
  80097d:	eb 06                	jmp    800985 <strcmp+0x11>
  80097f:	83 c1 01             	add    $0x1,%ecx
  800982:	83 c2 01             	add    $0x1,%edx
  800985:	0f b6 01             	movzbl (%ecx),%eax
  800988:	84 c0                	test   %al,%al
  80098a:	74 04                	je     800990 <strcmp+0x1c>
  80098c:	3a 02                	cmp    (%edx),%al
  80098e:	74 ef                	je     80097f <strcmp+0xb>
  800990:	0f b6 c0             	movzbl %al,%eax
  800993:	0f b6 12             	movzbl (%edx),%edx
  800996:	29 d0                	sub    %edx,%eax
  800998:	5d                   	pop    %ebp
  800999:	c3                   	ret

0080099a <strncmp>:
  80099a:	55                   	push   %ebp
  80099b:	89 e5                	mov    %esp,%ebp
  80099d:	53                   	push   %ebx
  80099e:	8b 45 08             	mov    0x8(%ebp),%eax
  8009a1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8009a4:	8b 55 10             	mov    0x10(%ebp),%edx
  8009a7:	eb 09                	jmp    8009b2 <strncmp+0x18>
  8009a9:	83 ea 01             	sub    $0x1,%edx
  8009ac:	83 c0 01             	add    $0x1,%eax
  8009af:	83 c1 01             	add    $0x1,%ecx
  8009b2:	85 d2                	test   %edx,%edx
  8009b4:	74 18                	je     8009ce <strncmp+0x34>
  8009b6:	0f b6 18             	movzbl (%eax),%ebx
  8009b9:	84 db                	test   %bl,%bl
  8009bb:	74 04                	je     8009c1 <strncmp+0x27>
  8009bd:	3a 19                	cmp    (%ecx),%bl
  8009bf:	74 e8                	je     8009a9 <strncmp+0xf>
  8009c1:	0f b6 00             	movzbl (%eax),%eax
  8009c4:	0f b6 11             	movzbl (%ecx),%edx
  8009c7:	29 d0                	sub    %edx,%eax
  8009c9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8009cc:	c9                   	leave
  8009cd:	c3                   	ret
  8009ce:	b8 00 00 00 00       	mov    $0x0,%eax
  8009d3:	eb f4                	jmp    8009c9 <strncmp+0x2f>

008009d5 <strchr>:
  8009d5:	55                   	push   %ebp
  8009d6:	89 e5                	mov    %esp,%ebp
  8009d8:	8b 45 08             	mov    0x8(%ebp),%eax
  8009db:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  8009df:	eb 03                	jmp    8009e4 <strchr+0xf>
  8009e1:	83 c0 01             	add    $0x1,%eax
  8009e4:	0f b6 10             	movzbl (%eax),%edx
  8009e7:	84 d2                	test   %dl,%dl
  8009e9:	74 06                	je     8009f1 <strchr+0x1c>
  8009eb:	38 ca                	cmp    %cl,%dl
  8009ed:	75 f2                	jne    8009e1 <strchr+0xc>
  8009ef:	eb 05                	jmp    8009f6 <strchr+0x21>
  8009f1:	b8 00 00 00 00       	mov    $0x0,%eax
  8009f6:	5d                   	pop    %ebp
  8009f7:	c3                   	ret

008009f8 <strfind>:
  8009f8:	55                   	push   %ebp
  8009f9:	89 e5                	mov    %esp,%ebp
  8009fb:	8b 45 08             	mov    0x8(%ebp),%eax
  8009fe:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  800a02:	0f b6 10             	movzbl (%eax),%edx
  800a05:	38 ca                	cmp    %cl,%dl
  800a07:	74 09                	je     800a12 <strfind+0x1a>
  800a09:	84 d2                	test   %dl,%dl
  800a0b:	74 05                	je     800a12 <strfind+0x1a>
  800a0d:	83 c0 01             	add    $0x1,%eax
  800a10:	eb f0                	jmp    800a02 <strfind+0xa>
  800a12:	5d                   	pop    %ebp
  800a13:	c3                   	ret

00800a14 <memset>:
  800a14:	55                   	push   %ebp
  800a15:	89 e5                	mov    %esp,%ebp
  800a17:	57                   	push   %edi
  800a18:	8b 55 08             	mov    0x8(%ebp),%edx
  800a1b:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800a1e:	85 c9                	test   %ecx,%ecx
  800a20:	74 24                	je     800a46 <memset+0x32>
  800a22:	89 d0                	mov    %edx,%eax
  800a24:	09 c8                	or     %ecx,%eax
  800a26:	a8 03                	test   $0x3,%al
  800a28:	75 14                	jne    800a3e <memset+0x2a>
  800a2a:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  800a2e:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  800a34:	c1 e9 02             	shr    $0x2,%ecx
  800a37:	89 d7                	mov    %edx,%edi
  800a39:	fc                   	cld
  800a3a:	f3 ab                	rep stos %eax,%es:(%edi)
  800a3c:	eb 08                	jmp    800a46 <memset+0x32>
  800a3e:	89 d7                	mov    %edx,%edi
  800a40:	8b 45 0c             	mov    0xc(%ebp),%eax
  800a43:	fc                   	cld
  800a44:	f3 aa                	rep stos %al,%es:(%edi)
  800a46:	89 d0                	mov    %edx,%eax
  800a48:	8b 7d fc             	mov    -0x4(%ebp),%edi
  800a4b:	c9                   	leave
  800a4c:	c3                   	ret

00800a4d <memmove>:
  800a4d:	55                   	push   %ebp
  800a4e:	89 e5                	mov    %esp,%ebp
  800a50:	57                   	push   %edi
  800a51:	56                   	push   %esi
  800a52:	8b 45 08             	mov    0x8(%ebp),%eax
  800a55:	8b 75 0c             	mov    0xc(%ebp),%esi
  800a58:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800a5b:	39 c6                	cmp    %eax,%esi
  800a5d:	73 32                	jae    800a91 <memmove+0x44>
  800a5f:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  800a62:	39 d0                	cmp    %edx,%eax
  800a64:	73 2b                	jae    800a91 <memmove+0x44>
  800a66:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  800a69:	89 fe                	mov    %edi,%esi
  800a6b:	09 ce                	or     %ecx,%esi
  800a6d:	09 d6                	or     %edx,%esi
  800a6f:	f7 c6 03 00 00 00    	test   $0x3,%esi
  800a75:	75 0e                	jne    800a85 <memmove+0x38>
  800a77:	83 ef 04             	sub    $0x4,%edi
  800a7a:	8d 72 fc             	lea    -0x4(%edx),%esi
  800a7d:	c1 e9 02             	shr    $0x2,%ecx
  800a80:	fd                   	std
  800a81:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800a83:	eb 09                	jmp    800a8e <memmove+0x41>
  800a85:	83 ef 01             	sub    $0x1,%edi
  800a88:	8d 72 ff             	lea    -0x1(%edx),%esi
  800a8b:	fd                   	std
  800a8c:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800a8e:	fc                   	cld
  800a8f:	eb 1a                	jmp    800aab <memmove+0x5e>
  800a91:	89 c2                	mov    %eax,%edx
  800a93:	09 ca                	or     %ecx,%edx
  800a95:	09 f2                	or     %esi,%edx
  800a97:	f6 c2 03             	test   $0x3,%dl
  800a9a:	75 0a                	jne    800aa6 <memmove+0x59>
  800a9c:	c1 e9 02             	shr    $0x2,%ecx
  800a9f:	89 c7                	mov    %eax,%edi
  800aa1:	fc                   	cld
  800aa2:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800aa4:	eb 05                	jmp    800aab <memmove+0x5e>
  800aa6:	89 c7                	mov    %eax,%edi
  800aa8:	fc                   	cld
  800aa9:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800aab:	5e                   	pop    %esi
  800aac:	5f                   	pop    %edi
  800aad:	5d                   	pop    %ebp
  800aae:	c3                   	ret

00800aaf <memcpy>:
  800aaf:	55                   	push   %ebp
  800ab0:	89 e5                	mov    %esp,%ebp
  800ab2:	83 ec 0c             	sub    $0xc,%esp
  800ab5:	ff 75 10             	push   0x10(%ebp)
  800ab8:	ff 75 0c             	push   0xc(%ebp)
  800abb:	ff 75 08             	push   0x8(%ebp)
  800abe:	e8 8a ff ff ff       	call   800a4d <memmove>
  800ac3:	c9                   	leave
  800ac4:	c3                   	ret

00800ac5 <memcmp>:
  800ac5:	55                   	push   %ebp
  800ac6:	89 e5                	mov    %esp,%ebp
  800ac8:	56                   	push   %esi
  800ac9:	53                   	push   %ebx
  800aca:	8b 45 08             	mov    0x8(%ebp),%eax
  800acd:	8b 55 0c             	mov    0xc(%ebp),%edx
  800ad0:	89 c6                	mov    %eax,%esi
  800ad2:	03 75 10             	add    0x10(%ebp),%esi
  800ad5:	eb 06                	jmp    800add <memcmp+0x18>
  800ad7:	83 c0 01             	add    $0x1,%eax
  800ada:	83 c2 01             	add    $0x1,%edx
  800add:	39 f0                	cmp    %esi,%eax
  800adf:	74 14                	je     800af5 <memcmp+0x30>
  800ae1:	0f b6 08             	movzbl (%eax),%ecx
  800ae4:	0f b6 1a             	movzbl (%edx),%ebx
  800ae7:	38 d9                	cmp    %bl,%cl
  800ae9:	74 ec                	je     800ad7 <memcmp+0x12>
  800aeb:	0f b6 c1             	movzbl %cl,%eax
  800aee:	0f b6 db             	movzbl %bl,%ebx
  800af1:	29 d8                	sub    %ebx,%eax
  800af3:	eb 05                	jmp    800afa <memcmp+0x35>
  800af5:	b8 00 00 00 00       	mov    $0x0,%eax
  800afa:	5b                   	pop    %ebx
  800afb:	5e                   	pop    %esi
  800afc:	5d                   	pop    %ebp
  800afd:	c3                   	ret

00800afe <memfind>:
  800afe:	55                   	push   %ebp
  800aff:	89 e5                	mov    %esp,%ebp
  800b01:	8b 45 08             	mov    0x8(%ebp),%eax
  800b04:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800b07:	89 c2                	mov    %eax,%edx
  800b09:	03 55 10             	add    0x10(%ebp),%edx
  800b0c:	eb 03                	jmp    800b11 <memfind+0x13>
  800b0e:	83 c0 01             	add    $0x1,%eax
  800b11:	39 d0                	cmp    %edx,%eax
  800b13:	73 04                	jae    800b19 <memfind+0x1b>
  800b15:	38 08                	cmp    %cl,(%eax)
  800b17:	75 f5                	jne    800b0e <memfind+0x10>
  800b19:	5d                   	pop    %ebp
  800b1a:	c3                   	ret

00800b1b <strtol>:
  800b1b:	55                   	push   %ebp
  800b1c:	89 e5                	mov    %esp,%ebp
  800b1e:	57                   	push   %edi
  800b1f:	56                   	push   %esi
  800b20:	53                   	push   %ebx
  800b21:	8b 55 08             	mov    0x8(%ebp),%edx
  800b24:	8b 5d 10             	mov    0x10(%ebp),%ebx
  800b27:	eb 03                	jmp    800b2c <strtol+0x11>
  800b29:	83 c2 01             	add    $0x1,%edx
  800b2c:	0f b6 02             	movzbl (%edx),%eax
  800b2f:	3c 20                	cmp    $0x20,%al
  800b31:	74 f6                	je     800b29 <strtol+0xe>
  800b33:	3c 09                	cmp    $0x9,%al
  800b35:	74 f2                	je     800b29 <strtol+0xe>
  800b37:	3c 2b                	cmp    $0x2b,%al
  800b39:	74 2a                	je     800b65 <strtol+0x4a>
  800b3b:	bf 00 00 00 00       	mov    $0x0,%edi
  800b40:	3c 2d                	cmp    $0x2d,%al
  800b42:	74 2b                	je     800b6f <strtol+0x54>
  800b44:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  800b4a:	75 0f                	jne    800b5b <strtol+0x40>
  800b4c:	80 3a 30             	cmpb   $0x30,(%edx)
  800b4f:	74 28                	je     800b79 <strtol+0x5e>
  800b51:	85 db                	test   %ebx,%ebx
  800b53:	b8 0a 00 00 00       	mov    $0xa,%eax
  800b58:	0f 44 d8             	cmove  %eax,%ebx
  800b5b:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b60:	89 5d 10             	mov    %ebx,0x10(%ebp)
  800b63:	eb 46                	jmp    800bab <strtol+0x90>
  800b65:	83 c2 01             	add    $0x1,%edx
  800b68:	bf 00 00 00 00       	mov    $0x0,%edi
  800b6d:	eb d5                	jmp    800b44 <strtol+0x29>
  800b6f:	83 c2 01             	add    $0x1,%edx
  800b72:	bf 01 00 00 00       	mov    $0x1,%edi
  800b77:	eb cb                	jmp    800b44 <strtol+0x29>
  800b79:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800b7d:	74 0e                	je     800b8d <strtol+0x72>
  800b7f:	85 db                	test   %ebx,%ebx
  800b81:	75 d8                	jne    800b5b <strtol+0x40>
  800b83:	83 c2 01             	add    $0x1,%edx
  800b86:	bb 08 00 00 00       	mov    $0x8,%ebx
  800b8b:	eb ce                	jmp    800b5b <strtol+0x40>
  800b8d:	83 c2 02             	add    $0x2,%edx
  800b90:	bb 10 00 00 00       	mov    $0x10,%ebx
  800b95:	eb c4                	jmp    800b5b <strtol+0x40>
  800b97:	0f be c0             	movsbl %al,%eax
  800b9a:	83 e8 30             	sub    $0x30,%eax
  800b9d:	3b 45 10             	cmp    0x10(%ebp),%eax
  800ba0:	7d 3a                	jge    800bdc <strtol+0xc1>
  800ba2:	83 c2 01             	add    $0x1,%edx
  800ba5:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  800ba9:	01 c1                	add    %eax,%ecx
  800bab:	0f b6 02             	movzbl (%edx),%eax
  800bae:	8d 70 d0             	lea    -0x30(%eax),%esi
  800bb1:	89 f3                	mov    %esi,%ebx
  800bb3:	80 fb 09             	cmp    $0x9,%bl
  800bb6:	76 df                	jbe    800b97 <strtol+0x7c>
  800bb8:	8d 70 9f             	lea    -0x61(%eax),%esi
  800bbb:	89 f3                	mov    %esi,%ebx
  800bbd:	80 fb 19             	cmp    $0x19,%bl
  800bc0:	77 08                	ja     800bca <strtol+0xaf>
  800bc2:	0f be c0             	movsbl %al,%eax
  800bc5:	83 e8 57             	sub    $0x57,%eax
  800bc8:	eb d3                	jmp    800b9d <strtol+0x82>
  800bca:	8d 70 bf             	lea    -0x41(%eax),%esi
  800bcd:	89 f3                	mov    %esi,%ebx
  800bcf:	80 fb 19             	cmp    $0x19,%bl
  800bd2:	77 08                	ja     800bdc <strtol+0xc1>
  800bd4:	0f be c0             	movsbl %al,%eax
  800bd7:	83 e8 37             	sub    $0x37,%eax
  800bda:	eb c1                	jmp    800b9d <strtol+0x82>
  800bdc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  800be0:	74 05                	je     800be7 <strtol+0xcc>
  800be2:	8b 45 0c             	mov    0xc(%ebp),%eax
  800be5:	89 10                	mov    %edx,(%eax)
  800be7:	89 c8                	mov    %ecx,%eax
  800be9:	f7 d8                	neg    %eax
  800beb:	85 ff                	test   %edi,%edi
  800bed:	0f 45 c8             	cmovne %eax,%ecx
  800bf0:	89 c8                	mov    %ecx,%eax
  800bf2:	5b                   	pop    %ebx
  800bf3:	5e                   	pop    %esi
  800bf4:	5f                   	pop    %edi
  800bf5:	5d                   	pop    %ebp
  800bf6:	c3                   	ret
  800bf7:	66 90                	xchg   %ax,%ax
  800bf9:	66 90                	xchg   %ax,%ax
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
