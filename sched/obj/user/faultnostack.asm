
obj/user/faultnostack:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 23 00 00 00       	call   800054 <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <umain>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	83 ec 10             	sub    $0x10,%esp
  800039:	68 ad 02 80 00       	push   $0x8002ad
  80003e:	6a 00                	push   $0x0
  800040:	e8 fe 01 00 00       	call   800243 <sys_env_set_pgfault_upcall>
  800045:	c7 05 00 00 00 00 00 	movl   $0x0,0x0
  80004c:	00 00 00 
  80004f:	83 c4 10             	add    $0x10,%esp
  800052:	c9                   	leave
  800053:	c3                   	ret

00800054 <libmain>:
  800054:	55                   	push   %ebp
  800055:	89 e5                	mov    %esp,%ebp
  800057:	56                   	push   %esi
  800058:	53                   	push   %ebx
  800059:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80005c:	8b 75 0c             	mov    0xc(%ebp),%esi
  80005f:	e8 04 01 00 00       	call   800168 <sys_getenvid>
  800064:	85 c0                	test   %eax,%eax
  800066:	78 15                	js     80007d <libmain+0x29>
  800068:	25 ff 03 00 00       	and    $0x3ff,%eax
  80006d:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800073:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800078:	a3 04 20 80 00       	mov    %eax,0x802004
  80007d:	85 db                	test   %ebx,%ebx
  80007f:	7e 07                	jle    800088 <libmain+0x34>
  800081:	8b 06                	mov    (%esi),%eax
  800083:	a3 00 20 80 00       	mov    %eax,0x802000
  800088:	83 ec 08             	sub    $0x8,%esp
  80008b:	56                   	push   %esi
  80008c:	53                   	push   %ebx
  80008d:	e8 a1 ff ff ff       	call   800033 <umain>
  800092:	e8 0a 00 00 00       	call   8000a1 <exit>
  800097:	83 c4 10             	add    $0x10,%esp
  80009a:	8d 65 f8             	lea    -0x8(%ebp),%esp
  80009d:	5b                   	pop    %ebx
  80009e:	5e                   	pop    %esi
  80009f:	5d                   	pop    %ebp
  8000a0:	c3                   	ret

008000a1 <exit>:
  8000a1:	55                   	push   %ebp
  8000a2:	89 e5                	mov    %esp,%ebp
  8000a4:	83 ec 14             	sub    $0x14,%esp
  8000a7:	6a 00                	push   $0x0
  8000a9:	e8 98 00 00 00       	call   800146 <sys_env_destroy>
  8000ae:	83 c4 10             	add    $0x10,%esp
  8000b1:	c9                   	leave
  8000b2:	c3                   	ret

008000b3 <syscall>:
  8000b3:	55                   	push   %ebp
  8000b4:	89 e5                	mov    %esp,%ebp
  8000b6:	57                   	push   %edi
  8000b7:	56                   	push   %esi
  8000b8:	53                   	push   %ebx
  8000b9:	83 ec 1c             	sub    $0x1c,%esp
  8000bc:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8000bf:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  8000c2:	89 ca                	mov    %ecx,%edx
  8000c4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8000c7:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8000ca:	8b 7d 10             	mov    0x10(%ebp),%edi
  8000cd:	8b 75 14             	mov    0x14(%ebp),%esi
  8000d0:	cd 30                	int    $0x30
  8000d2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  8000d6:	74 04                	je     8000dc <syscall+0x29>
  8000d8:	85 c0                	test   %eax,%eax
  8000da:	7f 08                	jg     8000e4 <syscall+0x31>
  8000dc:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8000df:	5b                   	pop    %ebx
  8000e0:	5e                   	pop    %esi
  8000e1:	5f                   	pop    %edi
  8000e2:	5d                   	pop    %ebp
  8000e3:	c3                   	ret
  8000e4:	83 ec 0c             	sub    $0xc,%esp
  8000e7:	50                   	push   %eax
  8000e8:	ff 75 e0             	push   -0x20(%ebp)
  8000eb:	68 ea 0e 80 00       	push   $0x800eea
  8000f0:	6a 1e                	push   $0x1e
  8000f2:	68 07 0f 80 00       	push   $0x800f07
  8000f7:	e8 d6 01 00 00       	call   8002d2 <_panic>

008000fc <sys_cputs>:
  8000fc:	55                   	push   %ebp
  8000fd:	89 e5                	mov    %esp,%ebp
  8000ff:	83 ec 08             	sub    $0x8,%esp
  800102:	6a 00                	push   $0x0
  800104:	6a 00                	push   $0x0
  800106:	6a 00                	push   $0x0
  800108:	ff 75 0c             	push   0xc(%ebp)
  80010b:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80010e:	ba 00 00 00 00       	mov    $0x0,%edx
  800113:	b8 00 00 00 00       	mov    $0x0,%eax
  800118:	e8 96 ff ff ff       	call   8000b3 <syscall>
  80011d:	83 c4 10             	add    $0x10,%esp
  800120:	c9                   	leave
  800121:	c3                   	ret

00800122 <sys_cgetc>:
  800122:	55                   	push   %ebp
  800123:	89 e5                	mov    %esp,%ebp
  800125:	83 ec 08             	sub    $0x8,%esp
  800128:	6a 00                	push   $0x0
  80012a:	6a 00                	push   $0x0
  80012c:	6a 00                	push   $0x0
  80012e:	6a 00                	push   $0x0
  800130:	b9 00 00 00 00       	mov    $0x0,%ecx
  800135:	ba 00 00 00 00       	mov    $0x0,%edx
  80013a:	b8 01 00 00 00       	mov    $0x1,%eax
  80013f:	e8 6f ff ff ff       	call   8000b3 <syscall>
  800144:	c9                   	leave
  800145:	c3                   	ret

00800146 <sys_env_destroy>:
  800146:	55                   	push   %ebp
  800147:	89 e5                	mov    %esp,%ebp
  800149:	83 ec 08             	sub    $0x8,%esp
  80014c:	6a 00                	push   $0x0
  80014e:	6a 00                	push   $0x0
  800150:	6a 00                	push   $0x0
  800152:	6a 00                	push   $0x0
  800154:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800157:	ba 01 00 00 00       	mov    $0x1,%edx
  80015c:	b8 03 00 00 00       	mov    $0x3,%eax
  800161:	e8 4d ff ff ff       	call   8000b3 <syscall>
  800166:	c9                   	leave
  800167:	c3                   	ret

00800168 <sys_getenvid>:
  800168:	55                   	push   %ebp
  800169:	89 e5                	mov    %esp,%ebp
  80016b:	83 ec 08             	sub    $0x8,%esp
  80016e:	6a 00                	push   $0x0
  800170:	6a 00                	push   $0x0
  800172:	6a 00                	push   $0x0
  800174:	6a 00                	push   $0x0
  800176:	b9 00 00 00 00       	mov    $0x0,%ecx
  80017b:	ba 00 00 00 00       	mov    $0x0,%edx
  800180:	b8 02 00 00 00       	mov    $0x2,%eax
  800185:	e8 29 ff ff ff       	call   8000b3 <syscall>
  80018a:	c9                   	leave
  80018b:	c3                   	ret

0080018c <sys_yield>:
  80018c:	55                   	push   %ebp
  80018d:	89 e5                	mov    %esp,%ebp
  80018f:	83 ec 08             	sub    $0x8,%esp
  800192:	6a 00                	push   $0x0
  800194:	6a 00                	push   $0x0
  800196:	6a 00                	push   $0x0
  800198:	6a 00                	push   $0x0
  80019a:	b9 00 00 00 00       	mov    $0x0,%ecx
  80019f:	ba 00 00 00 00       	mov    $0x0,%edx
  8001a4:	b8 0a 00 00 00       	mov    $0xa,%eax
  8001a9:	e8 05 ff ff ff       	call   8000b3 <syscall>
  8001ae:	83 c4 10             	add    $0x10,%esp
  8001b1:	c9                   	leave
  8001b2:	c3                   	ret

008001b3 <sys_page_alloc>:
  8001b3:	55                   	push   %ebp
  8001b4:	89 e5                	mov    %esp,%ebp
  8001b6:	83 ec 08             	sub    $0x8,%esp
  8001b9:	6a 00                	push   $0x0
  8001bb:	6a 00                	push   $0x0
  8001bd:	ff 75 10             	push   0x10(%ebp)
  8001c0:	ff 75 0c             	push   0xc(%ebp)
  8001c3:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001c6:	ba 01 00 00 00       	mov    $0x1,%edx
  8001cb:	b8 04 00 00 00       	mov    $0x4,%eax
  8001d0:	e8 de fe ff ff       	call   8000b3 <syscall>
  8001d5:	c9                   	leave
  8001d6:	c3                   	ret

008001d7 <sys_page_map>:
  8001d7:	55                   	push   %ebp
  8001d8:	89 e5                	mov    %esp,%ebp
  8001da:	83 ec 08             	sub    $0x8,%esp
  8001dd:	ff 75 18             	push   0x18(%ebp)
  8001e0:	ff 75 14             	push   0x14(%ebp)
  8001e3:	ff 75 10             	push   0x10(%ebp)
  8001e6:	ff 75 0c             	push   0xc(%ebp)
  8001e9:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8001ec:	ba 01 00 00 00       	mov    $0x1,%edx
  8001f1:	b8 05 00 00 00       	mov    $0x5,%eax
  8001f6:	e8 b8 fe ff ff       	call   8000b3 <syscall>
  8001fb:	c9                   	leave
  8001fc:	c3                   	ret

008001fd <sys_page_unmap>:
  8001fd:	55                   	push   %ebp
  8001fe:	89 e5                	mov    %esp,%ebp
  800200:	83 ec 08             	sub    $0x8,%esp
  800203:	6a 00                	push   $0x0
  800205:	6a 00                	push   $0x0
  800207:	6a 00                	push   $0x0
  800209:	ff 75 0c             	push   0xc(%ebp)
  80020c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80020f:	ba 01 00 00 00       	mov    $0x1,%edx
  800214:	b8 06 00 00 00       	mov    $0x6,%eax
  800219:	e8 95 fe ff ff       	call   8000b3 <syscall>
  80021e:	c9                   	leave
  80021f:	c3                   	ret

00800220 <sys_env_set_status>:
  800220:	55                   	push   %ebp
  800221:	89 e5                	mov    %esp,%ebp
  800223:	83 ec 08             	sub    $0x8,%esp
  800226:	6a 00                	push   $0x0
  800228:	6a 00                	push   $0x0
  80022a:	6a 00                	push   $0x0
  80022c:	ff 75 0c             	push   0xc(%ebp)
  80022f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800232:	ba 01 00 00 00       	mov    $0x1,%edx
  800237:	b8 08 00 00 00       	mov    $0x8,%eax
  80023c:	e8 72 fe ff ff       	call   8000b3 <syscall>
  800241:	c9                   	leave
  800242:	c3                   	ret

00800243 <sys_env_set_pgfault_upcall>:
  800243:	55                   	push   %ebp
  800244:	89 e5                	mov    %esp,%ebp
  800246:	83 ec 08             	sub    $0x8,%esp
  800249:	6a 00                	push   $0x0
  80024b:	6a 00                	push   $0x0
  80024d:	6a 00                	push   $0x0
  80024f:	ff 75 0c             	push   0xc(%ebp)
  800252:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800255:	ba 01 00 00 00       	mov    $0x1,%edx
  80025a:	b8 09 00 00 00       	mov    $0x9,%eax
  80025f:	e8 4f fe ff ff       	call   8000b3 <syscall>
  800264:	c9                   	leave
  800265:	c3                   	ret

00800266 <sys_ipc_try_send>:
  800266:	55                   	push   %ebp
  800267:	89 e5                	mov    %esp,%ebp
  800269:	83 ec 08             	sub    $0x8,%esp
  80026c:	6a 00                	push   $0x0
  80026e:	ff 75 14             	push   0x14(%ebp)
  800271:	ff 75 10             	push   0x10(%ebp)
  800274:	ff 75 0c             	push   0xc(%ebp)
  800277:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80027a:	ba 00 00 00 00       	mov    $0x0,%edx
  80027f:	b8 0c 00 00 00       	mov    $0xc,%eax
  800284:	e8 2a fe ff ff       	call   8000b3 <syscall>
  800289:	c9                   	leave
  80028a:	c3                   	ret

0080028b <sys_ipc_recv>:
  80028b:	55                   	push   %ebp
  80028c:	89 e5                	mov    %esp,%ebp
  80028e:	83 ec 08             	sub    $0x8,%esp
  800291:	6a 00                	push   $0x0
  800293:	6a 00                	push   $0x0
  800295:	6a 00                	push   $0x0
  800297:	6a 00                	push   $0x0
  800299:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80029c:	ba 01 00 00 00       	mov    $0x1,%edx
  8002a1:	b8 0d 00 00 00       	mov    $0xd,%eax
  8002a6:	e8 08 fe ff ff       	call   8000b3 <syscall>
  8002ab:	c9                   	leave
  8002ac:	c3                   	ret

008002ad <_pgfault_upcall>:
  8002ad:	54                   	push   %esp
  8002ae:	a1 08 20 80 00       	mov    0x802008,%eax
  8002b3:	ff d0                	call   *%eax
  8002b5:	83 c4 04             	add    $0x4,%esp
  8002b8:	8b 44 24 28          	mov    0x28(%esp),%eax
  8002bc:	8b 5c 24 30          	mov    0x30(%esp),%ebx
  8002c0:	83 eb 04             	sub    $0x4,%ebx
  8002c3:	89 03                	mov    %eax,(%ebx)
  8002c5:	89 5c 24 30          	mov    %ebx,0x30(%esp)
  8002c9:	58                   	pop    %eax
  8002ca:	58                   	pop    %eax
  8002cb:	61                   	popa
  8002cc:	83 c4 04             	add    $0x4,%esp
  8002cf:	9d                   	popf
  8002d0:	5c                   	pop    %esp
  8002d1:	c3                   	ret

008002d2 <_panic>:
  8002d2:	55                   	push   %ebp
  8002d3:	89 e5                	mov    %esp,%ebp
  8002d5:	56                   	push   %esi
  8002d6:	53                   	push   %ebx
  8002d7:	8d 5d 14             	lea    0x14(%ebp),%ebx
  8002da:	8b 35 00 20 80 00    	mov    0x802000,%esi
  8002e0:	e8 83 fe ff ff       	call   800168 <sys_getenvid>
  8002e5:	83 ec 0c             	sub    $0xc,%esp
  8002e8:	ff 75 0c             	push   0xc(%ebp)
  8002eb:	ff 75 08             	push   0x8(%ebp)
  8002ee:	56                   	push   %esi
  8002ef:	50                   	push   %eax
  8002f0:	68 d0 0f 80 00       	push   $0x800fd0
  8002f5:	e8 b3 00 00 00       	call   8003ad <cprintf>
  8002fa:	83 c4 18             	add    $0x18,%esp
  8002fd:	53                   	push   %ebx
  8002fe:	ff 75 10             	push   0x10(%ebp)
  800301:	e8 56 00 00 00       	call   80035c <vcprintf>
  800306:	c7 04 24 15 0f 80 00 	movl   $0x800f15,(%esp)
  80030d:	e8 9b 00 00 00       	call   8003ad <cprintf>
  800312:	83 c4 10             	add    $0x10,%esp
  800315:	cc                   	int3
  800316:	eb fd                	jmp    800315 <_panic+0x43>

00800318 <putch>:
  800318:	55                   	push   %ebp
  800319:	89 e5                	mov    %esp,%ebp
  80031b:	53                   	push   %ebx
  80031c:	83 ec 04             	sub    $0x4,%esp
  80031f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800322:	8b 13                	mov    (%ebx),%edx
  800324:	8d 42 01             	lea    0x1(%edx),%eax
  800327:	89 03                	mov    %eax,(%ebx)
  800329:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80032c:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  800330:	3d ff 00 00 00       	cmp    $0xff,%eax
  800335:	74 09                	je     800340 <putch+0x28>
  800337:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  80033b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  80033e:	c9                   	leave
  80033f:	c3                   	ret
  800340:	83 ec 08             	sub    $0x8,%esp
  800343:	68 ff 00 00 00       	push   $0xff
  800348:	8d 43 08             	lea    0x8(%ebx),%eax
  80034b:	50                   	push   %eax
  80034c:	e8 ab fd ff ff       	call   8000fc <sys_cputs>
  800351:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  800357:	83 c4 10             	add    $0x10,%esp
  80035a:	eb db                	jmp    800337 <putch+0x1f>

0080035c <vcprintf>:
  80035c:	55                   	push   %ebp
  80035d:	89 e5                	mov    %esp,%ebp
  80035f:	81 ec 18 01 00 00    	sub    $0x118,%esp
  800365:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  80036c:	00 00 00 
  80036f:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  800376:	00 00 00 
  800379:	ff 75 0c             	push   0xc(%ebp)
  80037c:	ff 75 08             	push   0x8(%ebp)
  80037f:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  800385:	50                   	push   %eax
  800386:	68 18 03 80 00       	push   $0x800318
  80038b:	e8 74 01 00 00       	call   800504 <vprintfmt>
  800390:	83 c4 08             	add    $0x8,%esp
  800393:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  800399:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  80039f:	50                   	push   %eax
  8003a0:	e8 57 fd ff ff       	call   8000fc <sys_cputs>
  8003a5:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  8003ab:	c9                   	leave
  8003ac:	c3                   	ret

008003ad <cprintf>:
  8003ad:	55                   	push   %ebp
  8003ae:	89 e5                	mov    %esp,%ebp
  8003b0:	83 ec 10             	sub    $0x10,%esp
  8003b3:	8d 45 0c             	lea    0xc(%ebp),%eax
  8003b6:	50                   	push   %eax
  8003b7:	ff 75 08             	push   0x8(%ebp)
  8003ba:	e8 9d ff ff ff       	call   80035c <vcprintf>
  8003bf:	c9                   	leave
  8003c0:	c3                   	ret

008003c1 <printnum>:
  8003c1:	55                   	push   %ebp
  8003c2:	89 e5                	mov    %esp,%ebp
  8003c4:	57                   	push   %edi
  8003c5:	56                   	push   %esi
  8003c6:	53                   	push   %ebx
  8003c7:	83 ec 1c             	sub    $0x1c,%esp
  8003ca:	89 c7                	mov    %eax,%edi
  8003cc:	89 d6                	mov    %edx,%esi
  8003ce:	8b 45 08             	mov    0x8(%ebp),%eax
  8003d1:	8b 55 0c             	mov    0xc(%ebp),%edx
  8003d4:	89 d1                	mov    %edx,%ecx
  8003d6:	89 c2                	mov    %eax,%edx
  8003d8:	89 45 d8             	mov    %eax,-0x28(%ebp)
  8003db:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  8003de:	8b 45 10             	mov    0x10(%ebp),%eax
  8003e1:	8b 5d 14             	mov    0x14(%ebp),%ebx
  8003e4:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8003e7:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  8003ee:	39 c2                	cmp    %eax,%edx
  8003f0:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  8003f3:	72 3e                	jb     800433 <printnum+0x72>
  8003f5:	83 ec 0c             	sub    $0xc,%esp
  8003f8:	ff 75 18             	push   0x18(%ebp)
  8003fb:	83 eb 01             	sub    $0x1,%ebx
  8003fe:	53                   	push   %ebx
  8003ff:	50                   	push   %eax
  800400:	83 ec 08             	sub    $0x8,%esp
  800403:	ff 75 e4             	push   -0x1c(%ebp)
  800406:	ff 75 e0             	push   -0x20(%ebp)
  800409:	ff 75 dc             	push   -0x24(%ebp)
  80040c:	ff 75 d8             	push   -0x28(%ebp)
  80040f:	e8 5c 08 00 00       	call   800c70 <__udivdi3>
  800414:	83 c4 18             	add    $0x18,%esp
  800417:	52                   	push   %edx
  800418:	50                   	push   %eax
  800419:	89 f2                	mov    %esi,%edx
  80041b:	89 f8                	mov    %edi,%eax
  80041d:	e8 9f ff ff ff       	call   8003c1 <printnum>
  800422:	83 c4 20             	add    $0x20,%esp
  800425:	eb 13                	jmp    80043a <printnum+0x79>
  800427:	83 ec 08             	sub    $0x8,%esp
  80042a:	56                   	push   %esi
  80042b:	ff 75 18             	push   0x18(%ebp)
  80042e:	ff d7                	call   *%edi
  800430:	83 c4 10             	add    $0x10,%esp
  800433:	83 eb 01             	sub    $0x1,%ebx
  800436:	85 db                	test   %ebx,%ebx
  800438:	7f ed                	jg     800427 <printnum+0x66>
  80043a:	83 ec 08             	sub    $0x8,%esp
  80043d:	56                   	push   %esi
  80043e:	83 ec 04             	sub    $0x4,%esp
  800441:	ff 75 e4             	push   -0x1c(%ebp)
  800444:	ff 75 e0             	push   -0x20(%ebp)
  800447:	ff 75 dc             	push   -0x24(%ebp)
  80044a:	ff 75 d8             	push   -0x28(%ebp)
  80044d:	e8 3e 09 00 00       	call   800d90 <__umoddi3>
  800452:	83 c4 14             	add    $0x14,%esp
  800455:	0f be 80 17 0f 80 00 	movsbl 0x800f17(%eax),%eax
  80045c:	50                   	push   %eax
  80045d:	ff d7                	call   *%edi
  80045f:	83 c4 10             	add    $0x10,%esp
  800462:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800465:	5b                   	pop    %ebx
  800466:	5e                   	pop    %esi
  800467:	5f                   	pop    %edi
  800468:	5d                   	pop    %ebp
  800469:	c3                   	ret

0080046a <getuint>:
  80046a:	83 fa 01             	cmp    $0x1,%edx
  80046d:	7f 13                	jg     800482 <getuint+0x18>
  80046f:	85 d2                	test   %edx,%edx
  800471:	74 1c                	je     80048f <getuint+0x25>
  800473:	8b 10                	mov    (%eax),%edx
  800475:	8d 4a 04             	lea    0x4(%edx),%ecx
  800478:	89 08                	mov    %ecx,(%eax)
  80047a:	8b 02                	mov    (%edx),%eax
  80047c:	ba 00 00 00 00       	mov    $0x0,%edx
  800481:	c3                   	ret
  800482:	8b 10                	mov    (%eax),%edx
  800484:	8d 4a 08             	lea    0x8(%edx),%ecx
  800487:	89 08                	mov    %ecx,(%eax)
  800489:	8b 02                	mov    (%edx),%eax
  80048b:	8b 52 04             	mov    0x4(%edx),%edx
  80048e:	c3                   	ret
  80048f:	8b 10                	mov    (%eax),%edx
  800491:	8d 4a 04             	lea    0x4(%edx),%ecx
  800494:	89 08                	mov    %ecx,(%eax)
  800496:	8b 02                	mov    (%edx),%eax
  800498:	ba 00 00 00 00       	mov    $0x0,%edx
  80049d:	c3                   	ret

0080049e <getint>:
  80049e:	83 fa 01             	cmp    $0x1,%edx
  8004a1:	7f 0f                	jg     8004b2 <getint+0x14>
  8004a3:	85 d2                	test   %edx,%edx
  8004a5:	74 18                	je     8004bf <getint+0x21>
  8004a7:	8b 10                	mov    (%eax),%edx
  8004a9:	8d 4a 04             	lea    0x4(%edx),%ecx
  8004ac:	89 08                	mov    %ecx,(%eax)
  8004ae:	8b 02                	mov    (%edx),%eax
  8004b0:	99                   	cltd
  8004b1:	c3                   	ret
  8004b2:	8b 10                	mov    (%eax),%edx
  8004b4:	8d 4a 08             	lea    0x8(%edx),%ecx
  8004b7:	89 08                	mov    %ecx,(%eax)
  8004b9:	8b 02                	mov    (%edx),%eax
  8004bb:	8b 52 04             	mov    0x4(%edx),%edx
  8004be:	c3                   	ret
  8004bf:	8b 10                	mov    (%eax),%edx
  8004c1:	8d 4a 04             	lea    0x4(%edx),%ecx
  8004c4:	89 08                	mov    %ecx,(%eax)
  8004c6:	8b 02                	mov    (%edx),%eax
  8004c8:	99                   	cltd
  8004c9:	c3                   	ret

008004ca <sprintputch>:
  8004ca:	55                   	push   %ebp
  8004cb:	89 e5                	mov    %esp,%ebp
  8004cd:	8b 45 0c             	mov    0xc(%ebp),%eax
  8004d0:	83 40 08 01          	addl   $0x1,0x8(%eax)
  8004d4:	8b 10                	mov    (%eax),%edx
  8004d6:	3b 50 04             	cmp    0x4(%eax),%edx
  8004d9:	73 0a                	jae    8004e5 <sprintputch+0x1b>
  8004db:	8d 4a 01             	lea    0x1(%edx),%ecx
  8004de:	89 08                	mov    %ecx,(%eax)
  8004e0:	8b 45 08             	mov    0x8(%ebp),%eax
  8004e3:	88 02                	mov    %al,(%edx)
  8004e5:	5d                   	pop    %ebp
  8004e6:	c3                   	ret

008004e7 <printfmt>:
  8004e7:	55                   	push   %ebp
  8004e8:	89 e5                	mov    %esp,%ebp
  8004ea:	83 ec 08             	sub    $0x8,%esp
  8004ed:	8d 45 14             	lea    0x14(%ebp),%eax
  8004f0:	50                   	push   %eax
  8004f1:	ff 75 10             	push   0x10(%ebp)
  8004f4:	ff 75 0c             	push   0xc(%ebp)
  8004f7:	ff 75 08             	push   0x8(%ebp)
  8004fa:	e8 05 00 00 00       	call   800504 <vprintfmt>
  8004ff:	83 c4 10             	add    $0x10,%esp
  800502:	c9                   	leave
  800503:	c3                   	ret

00800504 <vprintfmt>:
  800504:	55                   	push   %ebp
  800505:	89 e5                	mov    %esp,%ebp
  800507:	57                   	push   %edi
  800508:	56                   	push   %esi
  800509:	53                   	push   %ebx
  80050a:	83 ec 2c             	sub    $0x2c,%esp
  80050d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800510:	8b 75 0c             	mov    0xc(%ebp),%esi
  800513:	8b 7d 10             	mov    0x10(%ebp),%edi
  800516:	eb 0a                	jmp    800522 <vprintfmt+0x1e>
  800518:	83 ec 08             	sub    $0x8,%esp
  80051b:	56                   	push   %esi
  80051c:	50                   	push   %eax
  80051d:	ff d3                	call   *%ebx
  80051f:	83 c4 10             	add    $0x10,%esp
  800522:	83 c7 01             	add    $0x1,%edi
  800525:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  800529:	83 f8 25             	cmp    $0x25,%eax
  80052c:	74 0c                	je     80053a <vprintfmt+0x36>
  80052e:	85 c0                	test   %eax,%eax
  800530:	75 e6                	jne    800518 <vprintfmt+0x14>
  800532:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800535:	5b                   	pop    %ebx
  800536:	5e                   	pop    %esi
  800537:	5f                   	pop    %edi
  800538:	5d                   	pop    %ebp
  800539:	c3                   	ret
  80053a:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  80053e:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  800545:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  80054c:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  800553:	b9 00 00 00 00       	mov    $0x0,%ecx
  800558:	8d 47 01             	lea    0x1(%edi),%eax
  80055b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  80055e:	0f b6 17             	movzbl (%edi),%edx
  800561:	8d 42 dd             	lea    -0x23(%edx),%eax
  800564:	3c 55                	cmp    $0x55,%al
  800566:	0f 87 c3 02 00 00    	ja     80082f <vprintfmt+0x32b>
  80056c:	0f b6 c0             	movzbl %al,%eax
  80056f:	ff 24 85 00 10 80 00 	jmp    *0x801000(,%eax,4)
  800576:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800579:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  80057d:	eb d9                	jmp    800558 <vprintfmt+0x54>
  80057f:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800582:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  800586:	eb d0                	jmp    800558 <vprintfmt+0x54>
  800588:	0f b6 d2             	movzbl %dl,%edx
  80058b:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80058e:	b8 00 00 00 00       	mov    $0x0,%eax
  800593:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  800596:	8d 04 80             	lea    (%eax,%eax,4),%eax
  800599:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  80059d:	0f be 17             	movsbl (%edi),%edx
  8005a0:	8d 4a d0             	lea    -0x30(%edx),%ecx
  8005a3:	83 f9 09             	cmp    $0x9,%ecx
  8005a6:	77 52                	ja     8005fa <vprintfmt+0xf6>
  8005a8:	83 c7 01             	add    $0x1,%edi
  8005ab:	eb e9                	jmp    800596 <vprintfmt+0x92>
  8005ad:	8b 45 14             	mov    0x14(%ebp),%eax
  8005b0:	8d 50 04             	lea    0x4(%eax),%edx
  8005b3:	89 55 14             	mov    %edx,0x14(%ebp)
  8005b6:	8b 00                	mov    (%eax),%eax
  8005b8:	89 45 d0             	mov    %eax,-0x30(%ebp)
  8005bb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005be:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  8005c2:	79 94                	jns    800558 <vprintfmt+0x54>
  8005c4:	8b 45 d0             	mov    -0x30(%ebp),%eax
  8005c7:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8005ca:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  8005d1:	eb 85                	jmp    800558 <vprintfmt+0x54>
  8005d3:	8b 55 e0             	mov    -0x20(%ebp),%edx
  8005d6:	85 d2                	test   %edx,%edx
  8005d8:	b8 00 00 00 00       	mov    $0x0,%eax
  8005dd:	0f 49 c2             	cmovns %edx,%eax
  8005e0:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8005e3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005e6:	e9 6d ff ff ff       	jmp    800558 <vprintfmt+0x54>
  8005eb:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8005ee:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  8005f5:	e9 5e ff ff ff       	jmp    800558 <vprintfmt+0x54>
  8005fa:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  8005fd:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800600:	eb bc                	jmp    8005be <vprintfmt+0xba>
  800602:	83 c1 01             	add    $0x1,%ecx
  800605:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800608:	e9 4b ff ff ff       	jmp    800558 <vprintfmt+0x54>
  80060d:	8b 45 14             	mov    0x14(%ebp),%eax
  800610:	8d 50 04             	lea    0x4(%eax),%edx
  800613:	89 55 14             	mov    %edx,0x14(%ebp)
  800616:	83 ec 08             	sub    $0x8,%esp
  800619:	56                   	push   %esi
  80061a:	ff 30                	push   (%eax)
  80061c:	ff d3                	call   *%ebx
  80061e:	83 c4 10             	add    $0x10,%esp
  800621:	e9 a0 01 00 00       	jmp    8007c6 <vprintfmt+0x2c2>
  800626:	8b 45 14             	mov    0x14(%ebp),%eax
  800629:	8d 50 04             	lea    0x4(%eax),%edx
  80062c:	89 55 14             	mov    %edx,0x14(%ebp)
  80062f:	8b 10                	mov    (%eax),%edx
  800631:	89 d0                	mov    %edx,%eax
  800633:	f7 d8                	neg    %eax
  800635:	0f 48 c2             	cmovs  %edx,%eax
  800638:	83 f8 08             	cmp    $0x8,%eax
  80063b:	7f 20                	jg     80065d <vprintfmt+0x159>
  80063d:	8b 14 85 60 11 80 00 	mov    0x801160(,%eax,4),%edx
  800644:	85 d2                	test   %edx,%edx
  800646:	74 15                	je     80065d <vprintfmt+0x159>
  800648:	52                   	push   %edx
  800649:	68 38 0f 80 00       	push   $0x800f38
  80064e:	56                   	push   %esi
  80064f:	53                   	push   %ebx
  800650:	e8 92 fe ff ff       	call   8004e7 <printfmt>
  800655:	83 c4 10             	add    $0x10,%esp
  800658:	e9 69 01 00 00       	jmp    8007c6 <vprintfmt+0x2c2>
  80065d:	50                   	push   %eax
  80065e:	68 2f 0f 80 00       	push   $0x800f2f
  800663:	56                   	push   %esi
  800664:	53                   	push   %ebx
  800665:	e8 7d fe ff ff       	call   8004e7 <printfmt>
  80066a:	83 c4 10             	add    $0x10,%esp
  80066d:	e9 54 01 00 00       	jmp    8007c6 <vprintfmt+0x2c2>
  800672:	8b 45 14             	mov    0x14(%ebp),%eax
  800675:	8d 50 04             	lea    0x4(%eax),%edx
  800678:	89 55 14             	mov    %edx,0x14(%ebp)
  80067b:	8b 08                	mov    (%eax),%ecx
  80067d:	85 c9                	test   %ecx,%ecx
  80067f:	b8 28 0f 80 00       	mov    $0x800f28,%eax
  800684:	0f 45 c1             	cmovne %ecx,%eax
  800687:	89 45 cc             	mov    %eax,-0x34(%ebp)
  80068a:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  80068e:	7e 06                	jle    800696 <vprintfmt+0x192>
  800690:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  800694:	75 0b                	jne    8006a1 <vprintfmt+0x19d>
  800696:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  800699:	8b 7d d0             	mov    -0x30(%ebp),%edi
  80069c:	89 5d 08             	mov    %ebx,0x8(%ebp)
  80069f:	eb 5c                	jmp    8006fd <vprintfmt+0x1f9>
  8006a1:	83 ec 08             	sub    $0x8,%esp
  8006a4:	ff 75 d0             	push   -0x30(%ebp)
  8006a7:	ff 75 cc             	push   -0x34(%ebp)
  8006aa:	e8 20 02 00 00       	call   8008cf <strnlen>
  8006af:	89 c2                	mov    %eax,%edx
  8006b1:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8006b4:	29 d0                	sub    %edx,%eax
  8006b6:	83 c4 10             	add    $0x10,%esp
  8006b9:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  8006bd:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8006c0:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8006c3:	89 c3                	mov    %eax,%ebx
  8006c5:	eb 0e                	jmp    8006d5 <vprintfmt+0x1d1>
  8006c7:	83 ec 08             	sub    $0x8,%esp
  8006ca:	56                   	push   %esi
  8006cb:	57                   	push   %edi
  8006cc:	ff 55 08             	call   *0x8(%ebp)
  8006cf:	83 eb 01             	sub    $0x1,%ebx
  8006d2:	83 c4 10             	add    $0x10,%esp
  8006d5:	85 db                	test   %ebx,%ebx
  8006d7:	7f ee                	jg     8006c7 <vprintfmt+0x1c3>
  8006d9:	8b 45 e0             	mov    -0x20(%ebp),%eax
  8006dc:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8006df:	85 c0                	test   %eax,%eax
  8006e1:	ba 00 00 00 00       	mov    $0x0,%edx
  8006e6:	0f 49 d0             	cmovns %eax,%edx
  8006e9:	29 d0                	sub    %edx,%eax
  8006eb:	89 45 e0             	mov    %eax,-0x20(%ebp)
  8006ee:	eb a6                	jmp    800696 <vprintfmt+0x192>
  8006f0:	83 ec 08             	sub    $0x8,%esp
  8006f3:	56                   	push   %esi
  8006f4:	52                   	push   %edx
  8006f5:	ff 55 08             	call   *0x8(%ebp)
  8006f8:	83 c4 10             	add    $0x10,%esp
  8006fb:	89 d9                	mov    %ebx,%ecx
  8006fd:	8d 59 01             	lea    0x1(%ecx),%ebx
  800700:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  800704:	0f be d0             	movsbl %al,%edx
  800707:	85 d2                	test   %edx,%edx
  800709:	74 28                	je     800733 <vprintfmt+0x22f>
  80070b:	85 ff                	test   %edi,%edi
  80070d:	78 05                	js     800714 <vprintfmt+0x210>
  80070f:	83 ef 01             	sub    $0x1,%edi
  800712:	78 2e                	js     800742 <vprintfmt+0x23e>
  800714:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  800718:	74 d6                	je     8006f0 <vprintfmt+0x1ec>
  80071a:	0f be c0             	movsbl %al,%eax
  80071d:	83 e8 20             	sub    $0x20,%eax
  800720:	83 f8 5e             	cmp    $0x5e,%eax
  800723:	76 cb                	jbe    8006f0 <vprintfmt+0x1ec>
  800725:	83 ec 08             	sub    $0x8,%esp
  800728:	56                   	push   %esi
  800729:	6a 3f                	push   $0x3f
  80072b:	ff 55 08             	call   *0x8(%ebp)
  80072e:	83 c4 10             	add    $0x10,%esp
  800731:	eb c8                	jmp    8006fb <vprintfmt+0x1f7>
  800733:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800736:	8b 7d cc             	mov    -0x34(%ebp),%edi
  800739:	8b 45 e0             	mov    -0x20(%ebp),%eax
  80073c:	01 c7                	add    %eax,%edi
  80073e:	29 cf                	sub    %ecx,%edi
  800740:	eb 13                	jmp    800755 <vprintfmt+0x251>
  800742:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800745:	eb ef                	jmp    800736 <vprintfmt+0x232>
  800747:	83 ec 08             	sub    $0x8,%esp
  80074a:	56                   	push   %esi
  80074b:	6a 20                	push   $0x20
  80074d:	ff d3                	call   *%ebx
  80074f:	83 ef 01             	sub    $0x1,%edi
  800752:	83 c4 10             	add    $0x10,%esp
  800755:	85 ff                	test   %edi,%edi
  800757:	7f ee                	jg     800747 <vprintfmt+0x243>
  800759:	eb 6b                	jmp    8007c6 <vprintfmt+0x2c2>
  80075b:	89 ca                	mov    %ecx,%edx
  80075d:	8d 45 14             	lea    0x14(%ebp),%eax
  800760:	e8 39 fd ff ff       	call   80049e <getint>
  800765:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800768:	89 55 dc             	mov    %edx,-0x24(%ebp)
  80076b:	85 d2                	test   %edx,%edx
  80076d:	78 0b                	js     80077a <vprintfmt+0x276>
  80076f:	89 d1                	mov    %edx,%ecx
  800771:	89 c2                	mov    %eax,%edx
  800773:	bf 0a 00 00 00       	mov    $0xa,%edi
  800778:	eb 32                	jmp    8007ac <vprintfmt+0x2a8>
  80077a:	83 ec 08             	sub    $0x8,%esp
  80077d:	56                   	push   %esi
  80077e:	6a 2d                	push   $0x2d
  800780:	ff d3                	call   *%ebx
  800782:	8b 55 d8             	mov    -0x28(%ebp),%edx
  800785:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  800788:	f7 da                	neg    %edx
  80078a:	83 d1 00             	adc    $0x0,%ecx
  80078d:	f7 d9                	neg    %ecx
  80078f:	83 c4 10             	add    $0x10,%esp
  800792:	bf 0a 00 00 00       	mov    $0xa,%edi
  800797:	eb 13                	jmp    8007ac <vprintfmt+0x2a8>
  800799:	89 ca                	mov    %ecx,%edx
  80079b:	8d 45 14             	lea    0x14(%ebp),%eax
  80079e:	e8 c7 fc ff ff       	call   80046a <getuint>
  8007a3:	89 d1                	mov    %edx,%ecx
  8007a5:	89 c2                	mov    %eax,%edx
  8007a7:	bf 0a 00 00 00       	mov    $0xa,%edi
  8007ac:	83 ec 0c             	sub    $0xc,%esp
  8007af:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  8007b3:	50                   	push   %eax
  8007b4:	ff 75 e0             	push   -0x20(%ebp)
  8007b7:	57                   	push   %edi
  8007b8:	51                   	push   %ecx
  8007b9:	52                   	push   %edx
  8007ba:	89 f2                	mov    %esi,%edx
  8007bc:	89 d8                	mov    %ebx,%eax
  8007be:	e8 fe fb ff ff       	call   8003c1 <printnum>
  8007c3:	83 c4 20             	add    $0x20,%esp
  8007c6:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8007c9:	e9 54 fd ff ff       	jmp    800522 <vprintfmt+0x1e>
  8007ce:	89 ca                	mov    %ecx,%edx
  8007d0:	8d 45 14             	lea    0x14(%ebp),%eax
  8007d3:	e8 92 fc ff ff       	call   80046a <getuint>
  8007d8:	89 d1                	mov    %edx,%ecx
  8007da:	89 c2                	mov    %eax,%edx
  8007dc:	bf 08 00 00 00       	mov    $0x8,%edi
  8007e1:	eb c9                	jmp    8007ac <vprintfmt+0x2a8>
  8007e3:	83 ec 08             	sub    $0x8,%esp
  8007e6:	56                   	push   %esi
  8007e7:	6a 30                	push   $0x30
  8007e9:	ff d3                	call   *%ebx
  8007eb:	83 c4 08             	add    $0x8,%esp
  8007ee:	56                   	push   %esi
  8007ef:	6a 78                	push   $0x78
  8007f1:	ff d3                	call   *%ebx
  8007f3:	8b 45 14             	mov    0x14(%ebp),%eax
  8007f6:	8d 50 04             	lea    0x4(%eax),%edx
  8007f9:	89 55 14             	mov    %edx,0x14(%ebp)
  8007fc:	8b 10                	mov    (%eax),%edx
  8007fe:	b9 00 00 00 00       	mov    $0x0,%ecx
  800803:	83 c4 10             	add    $0x10,%esp
  800806:	bf 10 00 00 00       	mov    $0x10,%edi
  80080b:	eb 9f                	jmp    8007ac <vprintfmt+0x2a8>
  80080d:	89 ca                	mov    %ecx,%edx
  80080f:	8d 45 14             	lea    0x14(%ebp),%eax
  800812:	e8 53 fc ff ff       	call   80046a <getuint>
  800817:	89 d1                	mov    %edx,%ecx
  800819:	89 c2                	mov    %eax,%edx
  80081b:	bf 10 00 00 00       	mov    $0x10,%edi
  800820:	eb 8a                	jmp    8007ac <vprintfmt+0x2a8>
  800822:	83 ec 08             	sub    $0x8,%esp
  800825:	56                   	push   %esi
  800826:	6a 25                	push   $0x25
  800828:	ff d3                	call   *%ebx
  80082a:	83 c4 10             	add    $0x10,%esp
  80082d:	eb 97                	jmp    8007c6 <vprintfmt+0x2c2>
  80082f:	83 ec 08             	sub    $0x8,%esp
  800832:	56                   	push   %esi
  800833:	6a 25                	push   $0x25
  800835:	ff d3                	call   *%ebx
  800837:	83 c4 10             	add    $0x10,%esp
  80083a:	89 f8                	mov    %edi,%eax
  80083c:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  800840:	74 05                	je     800847 <vprintfmt+0x343>
  800842:	83 e8 01             	sub    $0x1,%eax
  800845:	eb f5                	jmp    80083c <vprintfmt+0x338>
  800847:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  80084a:	e9 77 ff ff ff       	jmp    8007c6 <vprintfmt+0x2c2>

0080084f <vsnprintf>:
  80084f:	55                   	push   %ebp
  800850:	89 e5                	mov    %esp,%ebp
  800852:	83 ec 18             	sub    $0x18,%esp
  800855:	8b 45 08             	mov    0x8(%ebp),%eax
  800858:	8b 55 0c             	mov    0xc(%ebp),%edx
  80085b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  80085e:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  800862:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  800865:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  80086c:	85 c0                	test   %eax,%eax
  80086e:	74 26                	je     800896 <vsnprintf+0x47>
  800870:	85 d2                	test   %edx,%edx
  800872:	7e 22                	jle    800896 <vsnprintf+0x47>
  800874:	ff 75 14             	push   0x14(%ebp)
  800877:	ff 75 10             	push   0x10(%ebp)
  80087a:	8d 45 ec             	lea    -0x14(%ebp),%eax
  80087d:	50                   	push   %eax
  80087e:	68 ca 04 80 00       	push   $0x8004ca
  800883:	e8 7c fc ff ff       	call   800504 <vprintfmt>
  800888:	8b 45 ec             	mov    -0x14(%ebp),%eax
  80088b:	c6 00 00             	movb   $0x0,(%eax)
  80088e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  800891:	83 c4 10             	add    $0x10,%esp
  800894:	c9                   	leave
  800895:	c3                   	ret
  800896:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  80089b:	eb f7                	jmp    800894 <vsnprintf+0x45>

0080089d <snprintf>:
  80089d:	55                   	push   %ebp
  80089e:	89 e5                	mov    %esp,%ebp
  8008a0:	83 ec 08             	sub    $0x8,%esp
  8008a3:	8d 45 14             	lea    0x14(%ebp),%eax
  8008a6:	50                   	push   %eax
  8008a7:	ff 75 10             	push   0x10(%ebp)
  8008aa:	ff 75 0c             	push   0xc(%ebp)
  8008ad:	ff 75 08             	push   0x8(%ebp)
  8008b0:	e8 9a ff ff ff       	call   80084f <vsnprintf>
  8008b5:	c9                   	leave
  8008b6:	c3                   	ret

008008b7 <strlen>:
  8008b7:	55                   	push   %ebp
  8008b8:	89 e5                	mov    %esp,%ebp
  8008ba:	8b 55 08             	mov    0x8(%ebp),%edx
  8008bd:	b8 00 00 00 00       	mov    $0x0,%eax
  8008c2:	eb 03                	jmp    8008c7 <strlen+0x10>
  8008c4:	83 c0 01             	add    $0x1,%eax
  8008c7:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  8008cb:	75 f7                	jne    8008c4 <strlen+0xd>
  8008cd:	5d                   	pop    %ebp
  8008ce:	c3                   	ret

008008cf <strnlen>:
  8008cf:	55                   	push   %ebp
  8008d0:	89 e5                	mov    %esp,%ebp
  8008d2:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8008d5:	8b 55 0c             	mov    0xc(%ebp),%edx
  8008d8:	b8 00 00 00 00       	mov    $0x0,%eax
  8008dd:	eb 03                	jmp    8008e2 <strnlen+0x13>
  8008df:	83 c0 01             	add    $0x1,%eax
  8008e2:	39 d0                	cmp    %edx,%eax
  8008e4:	74 08                	je     8008ee <strnlen+0x1f>
  8008e6:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  8008ea:	75 f3                	jne    8008df <strnlen+0x10>
  8008ec:	89 c2                	mov    %eax,%edx
  8008ee:	89 d0                	mov    %edx,%eax
  8008f0:	5d                   	pop    %ebp
  8008f1:	c3                   	ret

008008f2 <strcpy>:
  8008f2:	55                   	push   %ebp
  8008f3:	89 e5                	mov    %esp,%ebp
  8008f5:	53                   	push   %ebx
  8008f6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8008f9:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  8008fc:	b8 00 00 00 00       	mov    $0x0,%eax
  800901:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  800905:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  800908:	83 c0 01             	add    $0x1,%eax
  80090b:	84 d2                	test   %dl,%dl
  80090d:	75 f2                	jne    800901 <strcpy+0xf>
  80090f:	89 c8                	mov    %ecx,%eax
  800911:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800914:	c9                   	leave
  800915:	c3                   	ret

00800916 <strcat>:
  800916:	55                   	push   %ebp
  800917:	89 e5                	mov    %esp,%ebp
  800919:	53                   	push   %ebx
  80091a:	83 ec 10             	sub    $0x10,%esp
  80091d:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800920:	53                   	push   %ebx
  800921:	e8 91 ff ff ff       	call   8008b7 <strlen>
  800926:	83 c4 08             	add    $0x8,%esp
  800929:	ff 75 0c             	push   0xc(%ebp)
  80092c:	01 d8                	add    %ebx,%eax
  80092e:	50                   	push   %eax
  80092f:	e8 be ff ff ff       	call   8008f2 <strcpy>
  800934:	89 d8                	mov    %ebx,%eax
  800936:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800939:	c9                   	leave
  80093a:	c3                   	ret

0080093b <strncpy>:
  80093b:	55                   	push   %ebp
  80093c:	89 e5                	mov    %esp,%ebp
  80093e:	56                   	push   %esi
  80093f:	53                   	push   %ebx
  800940:	8b 75 08             	mov    0x8(%ebp),%esi
  800943:	8b 55 0c             	mov    0xc(%ebp),%edx
  800946:	89 f3                	mov    %esi,%ebx
  800948:	03 5d 10             	add    0x10(%ebp),%ebx
  80094b:	89 f0                	mov    %esi,%eax
  80094d:	eb 0f                	jmp    80095e <strncpy+0x23>
  80094f:	83 c0 01             	add    $0x1,%eax
  800952:	0f b6 0a             	movzbl (%edx),%ecx
  800955:	88 48 ff             	mov    %cl,-0x1(%eax)
  800958:	80 f9 01             	cmp    $0x1,%cl
  80095b:	83 da ff             	sbb    $0xffffffff,%edx
  80095e:	39 d8                	cmp    %ebx,%eax
  800960:	75 ed                	jne    80094f <strncpy+0x14>
  800962:	89 f0                	mov    %esi,%eax
  800964:	5b                   	pop    %ebx
  800965:	5e                   	pop    %esi
  800966:	5d                   	pop    %ebp
  800967:	c3                   	ret

00800968 <strlcpy>:
  800968:	55                   	push   %ebp
  800969:	89 e5                	mov    %esp,%ebp
  80096b:	56                   	push   %esi
  80096c:	53                   	push   %ebx
  80096d:	8b 75 08             	mov    0x8(%ebp),%esi
  800970:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800973:	8b 55 10             	mov    0x10(%ebp),%edx
  800976:	89 f0                	mov    %esi,%eax
  800978:	85 d2                	test   %edx,%edx
  80097a:	74 21                	je     80099d <strlcpy+0x35>
  80097c:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  800980:	89 f2                	mov    %esi,%edx
  800982:	eb 09                	jmp    80098d <strlcpy+0x25>
  800984:	83 c1 01             	add    $0x1,%ecx
  800987:	83 c2 01             	add    $0x1,%edx
  80098a:	88 5a ff             	mov    %bl,-0x1(%edx)
  80098d:	39 c2                	cmp    %eax,%edx
  80098f:	74 09                	je     80099a <strlcpy+0x32>
  800991:	0f b6 19             	movzbl (%ecx),%ebx
  800994:	84 db                	test   %bl,%bl
  800996:	75 ec                	jne    800984 <strlcpy+0x1c>
  800998:	89 d0                	mov    %edx,%eax
  80099a:	c6 00 00             	movb   $0x0,(%eax)
  80099d:	29 f0                	sub    %esi,%eax
  80099f:	5b                   	pop    %ebx
  8009a0:	5e                   	pop    %esi
  8009a1:	5d                   	pop    %ebp
  8009a2:	c3                   	ret

008009a3 <strcmp>:
  8009a3:	55                   	push   %ebp
  8009a4:	89 e5                	mov    %esp,%ebp
  8009a6:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8009a9:	8b 55 0c             	mov    0xc(%ebp),%edx
  8009ac:	eb 06                	jmp    8009b4 <strcmp+0x11>
  8009ae:	83 c1 01             	add    $0x1,%ecx
  8009b1:	83 c2 01             	add    $0x1,%edx
  8009b4:	0f b6 01             	movzbl (%ecx),%eax
  8009b7:	84 c0                	test   %al,%al
  8009b9:	74 04                	je     8009bf <strcmp+0x1c>
  8009bb:	3a 02                	cmp    (%edx),%al
  8009bd:	74 ef                	je     8009ae <strcmp+0xb>
  8009bf:	0f b6 c0             	movzbl %al,%eax
  8009c2:	0f b6 12             	movzbl (%edx),%edx
  8009c5:	29 d0                	sub    %edx,%eax
  8009c7:	5d                   	pop    %ebp
  8009c8:	c3                   	ret

008009c9 <strncmp>:
  8009c9:	55                   	push   %ebp
  8009ca:	89 e5                	mov    %esp,%ebp
  8009cc:	53                   	push   %ebx
  8009cd:	8b 45 08             	mov    0x8(%ebp),%eax
  8009d0:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  8009d3:	8b 55 10             	mov    0x10(%ebp),%edx
  8009d6:	eb 09                	jmp    8009e1 <strncmp+0x18>
  8009d8:	83 ea 01             	sub    $0x1,%edx
  8009db:	83 c0 01             	add    $0x1,%eax
  8009de:	83 c1 01             	add    $0x1,%ecx
  8009e1:	85 d2                	test   %edx,%edx
  8009e3:	74 18                	je     8009fd <strncmp+0x34>
  8009e5:	0f b6 18             	movzbl (%eax),%ebx
  8009e8:	84 db                	test   %bl,%bl
  8009ea:	74 04                	je     8009f0 <strncmp+0x27>
  8009ec:	3a 19                	cmp    (%ecx),%bl
  8009ee:	74 e8                	je     8009d8 <strncmp+0xf>
  8009f0:	0f b6 00             	movzbl (%eax),%eax
  8009f3:	0f b6 11             	movzbl (%ecx),%edx
  8009f6:	29 d0                	sub    %edx,%eax
  8009f8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8009fb:	c9                   	leave
  8009fc:	c3                   	ret
  8009fd:	b8 00 00 00 00       	mov    $0x0,%eax
  800a02:	eb f4                	jmp    8009f8 <strncmp+0x2f>

00800a04 <strchr>:
  800a04:	55                   	push   %ebp
  800a05:	89 e5                	mov    %esp,%ebp
  800a07:	8b 45 08             	mov    0x8(%ebp),%eax
  800a0a:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  800a0e:	eb 03                	jmp    800a13 <strchr+0xf>
  800a10:	83 c0 01             	add    $0x1,%eax
  800a13:	0f b6 10             	movzbl (%eax),%edx
  800a16:	84 d2                	test   %dl,%dl
  800a18:	74 06                	je     800a20 <strchr+0x1c>
  800a1a:	38 ca                	cmp    %cl,%dl
  800a1c:	75 f2                	jne    800a10 <strchr+0xc>
  800a1e:	eb 05                	jmp    800a25 <strchr+0x21>
  800a20:	b8 00 00 00 00       	mov    $0x0,%eax
  800a25:	5d                   	pop    %ebp
  800a26:	c3                   	ret

00800a27 <strfind>:
  800a27:	55                   	push   %ebp
  800a28:	89 e5                	mov    %esp,%ebp
  800a2a:	8b 45 08             	mov    0x8(%ebp),%eax
  800a2d:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  800a31:	0f b6 10             	movzbl (%eax),%edx
  800a34:	38 ca                	cmp    %cl,%dl
  800a36:	74 09                	je     800a41 <strfind+0x1a>
  800a38:	84 d2                	test   %dl,%dl
  800a3a:	74 05                	je     800a41 <strfind+0x1a>
  800a3c:	83 c0 01             	add    $0x1,%eax
  800a3f:	eb f0                	jmp    800a31 <strfind+0xa>
  800a41:	5d                   	pop    %ebp
  800a42:	c3                   	ret

00800a43 <memset>:
  800a43:	55                   	push   %ebp
  800a44:	89 e5                	mov    %esp,%ebp
  800a46:	57                   	push   %edi
  800a47:	8b 55 08             	mov    0x8(%ebp),%edx
  800a4a:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800a4d:	85 c9                	test   %ecx,%ecx
  800a4f:	74 24                	je     800a75 <memset+0x32>
  800a51:	89 d0                	mov    %edx,%eax
  800a53:	09 c8                	or     %ecx,%eax
  800a55:	a8 03                	test   $0x3,%al
  800a57:	75 14                	jne    800a6d <memset+0x2a>
  800a59:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  800a5d:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  800a63:	c1 e9 02             	shr    $0x2,%ecx
  800a66:	89 d7                	mov    %edx,%edi
  800a68:	fc                   	cld
  800a69:	f3 ab                	rep stos %eax,%es:(%edi)
  800a6b:	eb 08                	jmp    800a75 <memset+0x32>
  800a6d:	89 d7                	mov    %edx,%edi
  800a6f:	8b 45 0c             	mov    0xc(%ebp),%eax
  800a72:	fc                   	cld
  800a73:	f3 aa                	rep stos %al,%es:(%edi)
  800a75:	89 d0                	mov    %edx,%eax
  800a77:	8b 7d fc             	mov    -0x4(%ebp),%edi
  800a7a:	c9                   	leave
  800a7b:	c3                   	ret

00800a7c <memmove>:
  800a7c:	55                   	push   %ebp
  800a7d:	89 e5                	mov    %esp,%ebp
  800a7f:	57                   	push   %edi
  800a80:	56                   	push   %esi
  800a81:	8b 45 08             	mov    0x8(%ebp),%eax
  800a84:	8b 75 0c             	mov    0xc(%ebp),%esi
  800a87:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800a8a:	39 c6                	cmp    %eax,%esi
  800a8c:	73 32                	jae    800ac0 <memmove+0x44>
  800a8e:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  800a91:	39 d0                	cmp    %edx,%eax
  800a93:	73 2b                	jae    800ac0 <memmove+0x44>
  800a95:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  800a98:	89 fe                	mov    %edi,%esi
  800a9a:	09 ce                	or     %ecx,%esi
  800a9c:	09 d6                	or     %edx,%esi
  800a9e:	f7 c6 03 00 00 00    	test   $0x3,%esi
  800aa4:	75 0e                	jne    800ab4 <memmove+0x38>
  800aa6:	83 ef 04             	sub    $0x4,%edi
  800aa9:	8d 72 fc             	lea    -0x4(%edx),%esi
  800aac:	c1 e9 02             	shr    $0x2,%ecx
  800aaf:	fd                   	std
  800ab0:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800ab2:	eb 09                	jmp    800abd <memmove+0x41>
  800ab4:	83 ef 01             	sub    $0x1,%edi
  800ab7:	8d 72 ff             	lea    -0x1(%edx),%esi
  800aba:	fd                   	std
  800abb:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800abd:	fc                   	cld
  800abe:	eb 1a                	jmp    800ada <memmove+0x5e>
  800ac0:	89 c2                	mov    %eax,%edx
  800ac2:	09 ca                	or     %ecx,%edx
  800ac4:	09 f2                	or     %esi,%edx
  800ac6:	f6 c2 03             	test   $0x3,%dl
  800ac9:	75 0a                	jne    800ad5 <memmove+0x59>
  800acb:	c1 e9 02             	shr    $0x2,%ecx
  800ace:	89 c7                	mov    %eax,%edi
  800ad0:	fc                   	cld
  800ad1:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800ad3:	eb 05                	jmp    800ada <memmove+0x5e>
  800ad5:	89 c7                	mov    %eax,%edi
  800ad7:	fc                   	cld
  800ad8:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800ada:	5e                   	pop    %esi
  800adb:	5f                   	pop    %edi
  800adc:	5d                   	pop    %ebp
  800add:	c3                   	ret

00800ade <memcpy>:
  800ade:	55                   	push   %ebp
  800adf:	89 e5                	mov    %esp,%ebp
  800ae1:	83 ec 0c             	sub    $0xc,%esp
  800ae4:	ff 75 10             	push   0x10(%ebp)
  800ae7:	ff 75 0c             	push   0xc(%ebp)
  800aea:	ff 75 08             	push   0x8(%ebp)
  800aed:	e8 8a ff ff ff       	call   800a7c <memmove>
  800af2:	c9                   	leave
  800af3:	c3                   	ret

00800af4 <memcmp>:
  800af4:	55                   	push   %ebp
  800af5:	89 e5                	mov    %esp,%ebp
  800af7:	56                   	push   %esi
  800af8:	53                   	push   %ebx
  800af9:	8b 45 08             	mov    0x8(%ebp),%eax
  800afc:	8b 55 0c             	mov    0xc(%ebp),%edx
  800aff:	89 c6                	mov    %eax,%esi
  800b01:	03 75 10             	add    0x10(%ebp),%esi
  800b04:	eb 06                	jmp    800b0c <memcmp+0x18>
  800b06:	83 c0 01             	add    $0x1,%eax
  800b09:	83 c2 01             	add    $0x1,%edx
  800b0c:	39 f0                	cmp    %esi,%eax
  800b0e:	74 14                	je     800b24 <memcmp+0x30>
  800b10:	0f b6 08             	movzbl (%eax),%ecx
  800b13:	0f b6 1a             	movzbl (%edx),%ebx
  800b16:	38 d9                	cmp    %bl,%cl
  800b18:	74 ec                	je     800b06 <memcmp+0x12>
  800b1a:	0f b6 c1             	movzbl %cl,%eax
  800b1d:	0f b6 db             	movzbl %bl,%ebx
  800b20:	29 d8                	sub    %ebx,%eax
  800b22:	eb 05                	jmp    800b29 <memcmp+0x35>
  800b24:	b8 00 00 00 00       	mov    $0x0,%eax
  800b29:	5b                   	pop    %ebx
  800b2a:	5e                   	pop    %esi
  800b2b:	5d                   	pop    %ebp
  800b2c:	c3                   	ret

00800b2d <memfind>:
  800b2d:	55                   	push   %ebp
  800b2e:	89 e5                	mov    %esp,%ebp
  800b30:	8b 45 08             	mov    0x8(%ebp),%eax
  800b33:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800b36:	89 c2                	mov    %eax,%edx
  800b38:	03 55 10             	add    0x10(%ebp),%edx
  800b3b:	eb 03                	jmp    800b40 <memfind+0x13>
  800b3d:	83 c0 01             	add    $0x1,%eax
  800b40:	39 d0                	cmp    %edx,%eax
  800b42:	73 04                	jae    800b48 <memfind+0x1b>
  800b44:	38 08                	cmp    %cl,(%eax)
  800b46:	75 f5                	jne    800b3d <memfind+0x10>
  800b48:	5d                   	pop    %ebp
  800b49:	c3                   	ret

00800b4a <strtol>:
  800b4a:	55                   	push   %ebp
  800b4b:	89 e5                	mov    %esp,%ebp
  800b4d:	57                   	push   %edi
  800b4e:	56                   	push   %esi
  800b4f:	53                   	push   %ebx
  800b50:	8b 55 08             	mov    0x8(%ebp),%edx
  800b53:	8b 5d 10             	mov    0x10(%ebp),%ebx
  800b56:	eb 03                	jmp    800b5b <strtol+0x11>
  800b58:	83 c2 01             	add    $0x1,%edx
  800b5b:	0f b6 02             	movzbl (%edx),%eax
  800b5e:	3c 20                	cmp    $0x20,%al
  800b60:	74 f6                	je     800b58 <strtol+0xe>
  800b62:	3c 09                	cmp    $0x9,%al
  800b64:	74 f2                	je     800b58 <strtol+0xe>
  800b66:	3c 2b                	cmp    $0x2b,%al
  800b68:	74 2a                	je     800b94 <strtol+0x4a>
  800b6a:	bf 00 00 00 00       	mov    $0x0,%edi
  800b6f:	3c 2d                	cmp    $0x2d,%al
  800b71:	74 2b                	je     800b9e <strtol+0x54>
  800b73:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  800b79:	75 0f                	jne    800b8a <strtol+0x40>
  800b7b:	80 3a 30             	cmpb   $0x30,(%edx)
  800b7e:	74 28                	je     800ba8 <strtol+0x5e>
  800b80:	85 db                	test   %ebx,%ebx
  800b82:	b8 0a 00 00 00       	mov    $0xa,%eax
  800b87:	0f 44 d8             	cmove  %eax,%ebx
  800b8a:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b8f:	89 5d 10             	mov    %ebx,0x10(%ebp)
  800b92:	eb 46                	jmp    800bda <strtol+0x90>
  800b94:	83 c2 01             	add    $0x1,%edx
  800b97:	bf 00 00 00 00       	mov    $0x0,%edi
  800b9c:	eb d5                	jmp    800b73 <strtol+0x29>
  800b9e:	83 c2 01             	add    $0x1,%edx
  800ba1:	bf 01 00 00 00       	mov    $0x1,%edi
  800ba6:	eb cb                	jmp    800b73 <strtol+0x29>
  800ba8:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800bac:	74 0e                	je     800bbc <strtol+0x72>
  800bae:	85 db                	test   %ebx,%ebx
  800bb0:	75 d8                	jne    800b8a <strtol+0x40>
  800bb2:	83 c2 01             	add    $0x1,%edx
  800bb5:	bb 08 00 00 00       	mov    $0x8,%ebx
  800bba:	eb ce                	jmp    800b8a <strtol+0x40>
  800bbc:	83 c2 02             	add    $0x2,%edx
  800bbf:	bb 10 00 00 00       	mov    $0x10,%ebx
  800bc4:	eb c4                	jmp    800b8a <strtol+0x40>
  800bc6:	0f be c0             	movsbl %al,%eax
  800bc9:	83 e8 30             	sub    $0x30,%eax
  800bcc:	3b 45 10             	cmp    0x10(%ebp),%eax
  800bcf:	7d 3a                	jge    800c0b <strtol+0xc1>
  800bd1:	83 c2 01             	add    $0x1,%edx
  800bd4:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  800bd8:	01 c1                	add    %eax,%ecx
  800bda:	0f b6 02             	movzbl (%edx),%eax
  800bdd:	8d 70 d0             	lea    -0x30(%eax),%esi
  800be0:	89 f3                	mov    %esi,%ebx
  800be2:	80 fb 09             	cmp    $0x9,%bl
  800be5:	76 df                	jbe    800bc6 <strtol+0x7c>
  800be7:	8d 70 9f             	lea    -0x61(%eax),%esi
  800bea:	89 f3                	mov    %esi,%ebx
  800bec:	80 fb 19             	cmp    $0x19,%bl
  800bef:	77 08                	ja     800bf9 <strtol+0xaf>
  800bf1:	0f be c0             	movsbl %al,%eax
  800bf4:	83 e8 57             	sub    $0x57,%eax
  800bf7:	eb d3                	jmp    800bcc <strtol+0x82>
  800bf9:	8d 70 bf             	lea    -0x41(%eax),%esi
  800bfc:	89 f3                	mov    %esi,%ebx
  800bfe:	80 fb 19             	cmp    $0x19,%bl
  800c01:	77 08                	ja     800c0b <strtol+0xc1>
  800c03:	0f be c0             	movsbl %al,%eax
  800c06:	83 e8 37             	sub    $0x37,%eax
  800c09:	eb c1                	jmp    800bcc <strtol+0x82>
  800c0b:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  800c0f:	74 05                	je     800c16 <strtol+0xcc>
  800c11:	8b 45 0c             	mov    0xc(%ebp),%eax
  800c14:	89 10                	mov    %edx,(%eax)
  800c16:	89 c8                	mov    %ecx,%eax
  800c18:	f7 d8                	neg    %eax
  800c1a:	85 ff                	test   %edi,%edi
  800c1c:	0f 45 c8             	cmovne %eax,%ecx
  800c1f:	89 c8                	mov    %ecx,%eax
  800c21:	5b                   	pop    %ebx
  800c22:	5e                   	pop    %esi
  800c23:	5f                   	pop    %edi
  800c24:	5d                   	pop    %ebp
  800c25:	c3                   	ret

00800c26 <set_pgfault_handler>:
  800c26:	55                   	push   %ebp
  800c27:	89 e5                	mov    %esp,%ebp
  800c29:	83 ec 08             	sub    $0x8,%esp
  800c2c:	83 3d 08 20 80 00 00 	cmpl   $0x0,0x802008
  800c33:	74 0a                	je     800c3f <set_pgfault_handler+0x19>
  800c35:	8b 45 08             	mov    0x8(%ebp),%eax
  800c38:	a3 08 20 80 00       	mov    %eax,0x802008
  800c3d:	c9                   	leave
  800c3e:	c3                   	ret
  800c3f:	83 ec 04             	sub    $0x4,%esp
  800c42:	6a 07                	push   $0x7
  800c44:	68 00 f0 bf ee       	push   $0xeebff000
  800c49:	6a 00                	push   $0x0
  800c4b:	e8 63 f5 ff ff       	call   8001b3 <sys_page_alloc>
  800c50:	83 c4 10             	add    $0x10,%esp
  800c53:	85 c0                	test   %eax,%eax
  800c55:	78 e6                	js     800c3d <set_pgfault_handler+0x17>
  800c57:	83 ec 08             	sub    $0x8,%esp
  800c5a:	68 ad 02 80 00       	push   $0x8002ad
  800c5f:	6a 00                	push   $0x0
  800c61:	e8 dd f5 ff ff       	call   800243 <sys_env_set_pgfault_upcall>
  800c66:	83 c4 10             	add    $0x10,%esp
  800c69:	85 c0                	test   %eax,%eax
  800c6b:	79 c8                	jns    800c35 <set_pgfault_handler+0xf>
  800c6d:	eb ce                	jmp    800c3d <set_pgfault_handler+0x17>
  800c6f:	90                   	nop

00800c70 <__udivdi3>:
  800c70:	f3 0f 1e fb          	endbr32
  800c74:	55                   	push   %ebp
  800c75:	57                   	push   %edi
  800c76:	56                   	push   %esi
  800c77:	53                   	push   %ebx
  800c78:	83 ec 1c             	sub    $0x1c,%esp
  800c7b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800c7f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  800c83:	8b 74 24 34          	mov    0x34(%esp),%esi
  800c87:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  800c8b:	85 c0                	test   %eax,%eax
  800c8d:	75 19                	jne    800ca8 <__udivdi3+0x38>
  800c8f:	39 de                	cmp    %ebx,%esi
  800c91:	73 4d                	jae    800ce0 <__udivdi3+0x70>
  800c93:	31 ff                	xor    %edi,%edi
  800c95:	89 e8                	mov    %ebp,%eax
  800c97:	89 f2                	mov    %esi,%edx
  800c99:	f7 f3                	div    %ebx
  800c9b:	89 fa                	mov    %edi,%edx
  800c9d:	83 c4 1c             	add    $0x1c,%esp
  800ca0:	5b                   	pop    %ebx
  800ca1:	5e                   	pop    %esi
  800ca2:	5f                   	pop    %edi
  800ca3:	5d                   	pop    %ebp
  800ca4:	c3                   	ret
  800ca5:	8d 76 00             	lea    0x0(%esi),%esi
  800ca8:	39 c6                	cmp    %eax,%esi
  800caa:	73 14                	jae    800cc0 <__udivdi3+0x50>
  800cac:	31 ff                	xor    %edi,%edi
  800cae:	31 c0                	xor    %eax,%eax
  800cb0:	89 fa                	mov    %edi,%edx
  800cb2:	83 c4 1c             	add    $0x1c,%esp
  800cb5:	5b                   	pop    %ebx
  800cb6:	5e                   	pop    %esi
  800cb7:	5f                   	pop    %edi
  800cb8:	5d                   	pop    %ebp
  800cb9:	c3                   	ret
  800cba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800cc0:	0f bd f8             	bsr    %eax,%edi
  800cc3:	83 f7 1f             	xor    $0x1f,%edi
  800cc6:	75 48                	jne    800d10 <__udivdi3+0xa0>
  800cc8:	39 f0                	cmp    %esi,%eax
  800cca:	72 06                	jb     800cd2 <__udivdi3+0x62>
  800ccc:	31 c0                	xor    %eax,%eax
  800cce:	39 dd                	cmp    %ebx,%ebp
  800cd0:	72 de                	jb     800cb0 <__udivdi3+0x40>
  800cd2:	b8 01 00 00 00       	mov    $0x1,%eax
  800cd7:	eb d7                	jmp    800cb0 <__udivdi3+0x40>
  800cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800ce0:	89 d9                	mov    %ebx,%ecx
  800ce2:	85 db                	test   %ebx,%ebx
  800ce4:	75 0b                	jne    800cf1 <__udivdi3+0x81>
  800ce6:	b8 01 00 00 00       	mov    $0x1,%eax
  800ceb:	31 d2                	xor    %edx,%edx
  800ced:	f7 f3                	div    %ebx
  800cef:	89 c1                	mov    %eax,%ecx
  800cf1:	31 d2                	xor    %edx,%edx
  800cf3:	89 f0                	mov    %esi,%eax
  800cf5:	f7 f1                	div    %ecx
  800cf7:	89 c6                	mov    %eax,%esi
  800cf9:	89 e8                	mov    %ebp,%eax
  800cfb:	89 f7                	mov    %esi,%edi
  800cfd:	f7 f1                	div    %ecx
  800cff:	89 fa                	mov    %edi,%edx
  800d01:	83 c4 1c             	add    $0x1c,%esp
  800d04:	5b                   	pop    %ebx
  800d05:	5e                   	pop    %esi
  800d06:	5f                   	pop    %edi
  800d07:	5d                   	pop    %ebp
  800d08:	c3                   	ret
  800d09:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800d10:	89 f9                	mov    %edi,%ecx
  800d12:	ba 20 00 00 00       	mov    $0x20,%edx
  800d17:	29 fa                	sub    %edi,%edx
  800d19:	d3 e0                	shl    %cl,%eax
  800d1b:	89 44 24 08          	mov    %eax,0x8(%esp)
  800d1f:	89 d1                	mov    %edx,%ecx
  800d21:	89 d8                	mov    %ebx,%eax
  800d23:	d3 e8                	shr    %cl,%eax
  800d25:	89 c1                	mov    %eax,%ecx
  800d27:	8b 44 24 08          	mov    0x8(%esp),%eax
  800d2b:	09 c1                	or     %eax,%ecx
  800d2d:	89 f0                	mov    %esi,%eax
  800d2f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800d33:	89 f9                	mov    %edi,%ecx
  800d35:	d3 e3                	shl    %cl,%ebx
  800d37:	89 d1                	mov    %edx,%ecx
  800d39:	d3 e8                	shr    %cl,%eax
  800d3b:	89 f9                	mov    %edi,%ecx
  800d3d:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  800d41:	89 eb                	mov    %ebp,%ebx
  800d43:	d3 e6                	shl    %cl,%esi
  800d45:	89 d1                	mov    %edx,%ecx
  800d47:	d3 eb                	shr    %cl,%ebx
  800d49:	09 f3                	or     %esi,%ebx
  800d4b:	89 c6                	mov    %eax,%esi
  800d4d:	89 f2                	mov    %esi,%edx
  800d4f:	89 d8                	mov    %ebx,%eax
  800d51:	f7 74 24 08          	divl   0x8(%esp)
  800d55:	89 d6                	mov    %edx,%esi
  800d57:	89 c3                	mov    %eax,%ebx
  800d59:	f7 64 24 0c          	mull   0xc(%esp)
  800d5d:	39 d6                	cmp    %edx,%esi
  800d5f:	72 1f                	jb     800d80 <__udivdi3+0x110>
  800d61:	89 f9                	mov    %edi,%ecx
  800d63:	d3 e5                	shl    %cl,%ebp
  800d65:	39 c5                	cmp    %eax,%ebp
  800d67:	73 04                	jae    800d6d <__udivdi3+0xfd>
  800d69:	39 d6                	cmp    %edx,%esi
  800d6b:	74 13                	je     800d80 <__udivdi3+0x110>
  800d6d:	89 d8                	mov    %ebx,%eax
  800d6f:	31 ff                	xor    %edi,%edi
  800d71:	e9 3a ff ff ff       	jmp    800cb0 <__udivdi3+0x40>
  800d76:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800d7d:	00 
  800d7e:	66 90                	xchg   %ax,%ax
  800d80:	8d 43 ff             	lea    -0x1(%ebx),%eax
  800d83:	31 ff                	xor    %edi,%edi
  800d85:	e9 26 ff ff ff       	jmp    800cb0 <__udivdi3+0x40>
  800d8a:	66 90                	xchg   %ax,%ax
  800d8c:	66 90                	xchg   %ax,%ax
  800d8e:	66 90                	xchg   %ax,%ax

00800d90 <__umoddi3>:
  800d90:	f3 0f 1e fb          	endbr32
  800d94:	55                   	push   %ebp
  800d95:	57                   	push   %edi
  800d96:	56                   	push   %esi
  800d97:	53                   	push   %ebx
  800d98:	83 ec 1c             	sub    $0x1c,%esp
  800d9b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  800d9f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  800da3:	8b 74 24 30          	mov    0x30(%esp),%esi
  800da7:	8b 7c 24 38          	mov    0x38(%esp),%edi
  800dab:	89 da                	mov    %ebx,%edx
  800dad:	85 c0                	test   %eax,%eax
  800daf:	75 17                	jne    800dc8 <__umoddi3+0x38>
  800db1:	39 fb                	cmp    %edi,%ebx
  800db3:	73 53                	jae    800e08 <__umoddi3+0x78>
  800db5:	89 f0                	mov    %esi,%eax
  800db7:	f7 f7                	div    %edi
  800db9:	89 d0                	mov    %edx,%eax
  800dbb:	31 d2                	xor    %edx,%edx
  800dbd:	83 c4 1c             	add    $0x1c,%esp
  800dc0:	5b                   	pop    %ebx
  800dc1:	5e                   	pop    %esi
  800dc2:	5f                   	pop    %edi
  800dc3:	5d                   	pop    %ebp
  800dc4:	c3                   	ret
  800dc5:	8d 76 00             	lea    0x0(%esi),%esi
  800dc8:	89 f1                	mov    %esi,%ecx
  800dca:	39 c3                	cmp    %eax,%ebx
  800dcc:	73 12                	jae    800de0 <__umoddi3+0x50>
  800dce:	89 f0                	mov    %esi,%eax
  800dd0:	83 c4 1c             	add    $0x1c,%esp
  800dd3:	5b                   	pop    %ebx
  800dd4:	5e                   	pop    %esi
  800dd5:	5f                   	pop    %edi
  800dd6:	5d                   	pop    %ebp
  800dd7:	c3                   	ret
  800dd8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  800ddf:	00 
  800de0:	0f bd e8             	bsr    %eax,%ebp
  800de3:	83 f5 1f             	xor    $0x1f,%ebp
  800de6:	75 48                	jne    800e30 <__umoddi3+0xa0>
  800de8:	39 d8                	cmp    %ebx,%eax
  800dea:	0f 82 d0 00 00 00    	jb     800ec0 <__umoddi3+0x130>
  800df0:	39 fe                	cmp    %edi,%esi
  800df2:	0f 83 c8 00 00 00    	jae    800ec0 <__umoddi3+0x130>
  800df8:	89 c8                	mov    %ecx,%eax
  800dfa:	83 c4 1c             	add    $0x1c,%esp
  800dfd:	5b                   	pop    %ebx
  800dfe:	5e                   	pop    %esi
  800dff:	5f                   	pop    %edi
  800e00:	5d                   	pop    %ebp
  800e01:	c3                   	ret
  800e02:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  800e08:	89 f9                	mov    %edi,%ecx
  800e0a:	85 ff                	test   %edi,%edi
  800e0c:	75 0b                	jne    800e19 <__umoddi3+0x89>
  800e0e:	b8 01 00 00 00       	mov    $0x1,%eax
  800e13:	31 d2                	xor    %edx,%edx
  800e15:	f7 f7                	div    %edi
  800e17:	89 c1                	mov    %eax,%ecx
  800e19:	89 d8                	mov    %ebx,%eax
  800e1b:	31 d2                	xor    %edx,%edx
  800e1d:	f7 f1                	div    %ecx
  800e1f:	89 f0                	mov    %esi,%eax
  800e21:	f7 f1                	div    %ecx
  800e23:	89 d0                	mov    %edx,%eax
  800e25:	31 d2                	xor    %edx,%edx
  800e27:	eb 94                	jmp    800dbd <__umoddi3+0x2d>
  800e29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  800e30:	89 e9                	mov    %ebp,%ecx
  800e32:	ba 20 00 00 00       	mov    $0x20,%edx
  800e37:	29 ea                	sub    %ebp,%edx
  800e39:	d3 e0                	shl    %cl,%eax
  800e3b:	89 44 24 08          	mov    %eax,0x8(%esp)
  800e3f:	89 d1                	mov    %edx,%ecx
  800e41:	89 f8                	mov    %edi,%eax
  800e43:	d3 e8                	shr    %cl,%eax
  800e45:	89 54 24 04          	mov    %edx,0x4(%esp)
  800e49:	8b 54 24 04          	mov    0x4(%esp),%edx
  800e4d:	89 c1                	mov    %eax,%ecx
  800e4f:	8b 44 24 08          	mov    0x8(%esp),%eax
  800e53:	09 c1                	or     %eax,%ecx
  800e55:	89 d8                	mov    %ebx,%eax
  800e57:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  800e5b:	89 e9                	mov    %ebp,%ecx
  800e5d:	d3 e7                	shl    %cl,%edi
  800e5f:	89 d1                	mov    %edx,%ecx
  800e61:	d3 e8                	shr    %cl,%eax
  800e63:	89 e9                	mov    %ebp,%ecx
  800e65:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  800e69:	d3 e3                	shl    %cl,%ebx
  800e6b:	89 c7                	mov    %eax,%edi
  800e6d:	89 d1                	mov    %edx,%ecx
  800e6f:	89 f0                	mov    %esi,%eax
  800e71:	d3 e8                	shr    %cl,%eax
  800e73:	89 fa                	mov    %edi,%edx
  800e75:	89 e9                	mov    %ebp,%ecx
  800e77:	09 d8                	or     %ebx,%eax
  800e79:	d3 e6                	shl    %cl,%esi
  800e7b:	f7 74 24 08          	divl   0x8(%esp)
  800e7f:	89 d3                	mov    %edx,%ebx
  800e81:	f7 64 24 0c          	mull   0xc(%esp)
  800e85:	89 c7                	mov    %eax,%edi
  800e87:	89 d1                	mov    %edx,%ecx
  800e89:	39 d3                	cmp    %edx,%ebx
  800e8b:	72 06                	jb     800e93 <__umoddi3+0x103>
  800e8d:	75 10                	jne    800e9f <__umoddi3+0x10f>
  800e8f:	39 c6                	cmp    %eax,%esi
  800e91:	73 0c                	jae    800e9f <__umoddi3+0x10f>
  800e93:	2b 44 24 0c          	sub    0xc(%esp),%eax
  800e97:	1b 54 24 08          	sbb    0x8(%esp),%edx
  800e9b:	89 d1                	mov    %edx,%ecx
  800e9d:	89 c7                	mov    %eax,%edi
  800e9f:	89 f2                	mov    %esi,%edx
  800ea1:	29 fa                	sub    %edi,%edx
  800ea3:	19 cb                	sbb    %ecx,%ebx
  800ea5:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  800eaa:	89 d8                	mov    %ebx,%eax
  800eac:	d3 e0                	shl    %cl,%eax
  800eae:	89 e9                	mov    %ebp,%ecx
  800eb0:	d3 ea                	shr    %cl,%edx
  800eb2:	d3 eb                	shr    %cl,%ebx
  800eb4:	09 d0                	or     %edx,%eax
  800eb6:	89 da                	mov    %ebx,%edx
  800eb8:	83 c4 1c             	add    $0x1c,%esp
  800ebb:	5b                   	pop    %ebx
  800ebc:	5e                   	pop    %esi
  800ebd:	5f                   	pop    %edi
  800ebe:	5d                   	pop    %ebp
  800ebf:	c3                   	ret
  800ec0:	89 da                	mov    %ebx,%edx
  800ec2:	89 f1                	mov    %esi,%ecx
  800ec4:	29 f9                	sub    %edi,%ecx
  800ec6:	19 c2                	sbb    %eax,%edx
  800ec8:	89 c8                	mov    %ecx,%eax
  800eca:	e9 2b ff ff ff       	jmp    800dfa <__umoddi3+0x6a>
