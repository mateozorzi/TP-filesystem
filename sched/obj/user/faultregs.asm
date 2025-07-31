
obj/user/faultregs:     formato del fichero elf32-i386


Desensamblado de la sección .text:

00800020 <_start>:
  800020:	81 fc 00 e0 bf ee    	cmp    $0xeebfe000,%esp
  800026:	75 04                	jne    80002c <args_exist>
  800028:	6a 00                	push   $0x0
  80002a:	6a 00                	push   $0x0

0080002c <args_exist>:
  80002c:	e8 b0 05 00 00       	call   8005e1 <libmain>
  800031:	eb fe                	jmp    800031 <args_exist+0x5>

00800033 <check_regs>:
  800033:	55                   	push   %ebp
  800034:	89 e5                	mov    %esp,%ebp
  800036:	57                   	push   %edi
  800037:	56                   	push   %esi
  800038:	53                   	push   %ebx
  800039:	83 ec 0c             	sub    $0xc,%esp
  80003c:	89 c6                	mov    %eax,%esi
  80003e:	89 cb                	mov    %ecx,%ebx
  800040:	ff 75 08             	push   0x8(%ebp)
  800043:	52                   	push   %edx
  800044:	68 91 14 80 00       	push   $0x801491
  800049:	68 60 14 80 00       	push   $0x801460
  80004e:	e8 c8 06 00 00       	call   80071b <cprintf>
  800053:	ff 33                	push   (%ebx)
  800055:	ff 36                	push   (%esi)
  800057:	68 70 14 80 00       	push   $0x801470
  80005c:	68 74 14 80 00       	push   $0x801474
  800061:	e8 b5 06 00 00       	call   80071b <cprintf>
  800066:	83 c4 20             	add    $0x20,%esp
  800069:	8b 03                	mov    (%ebx),%eax
  80006b:	39 06                	cmp    %eax,(%esi)
  80006d:	0f 84 2e 02 00 00    	je     8002a1 <check_regs+0x26e>
  800073:	83 ec 0c             	sub    $0xc,%esp
  800076:	68 88 14 80 00       	push   $0x801488
  80007b:	e8 9b 06 00 00       	call   80071b <cprintf>
  800080:	83 c4 10             	add    $0x10,%esp
  800083:	bf 01 00 00 00       	mov    $0x1,%edi
  800088:	ff 73 04             	push   0x4(%ebx)
  80008b:	ff 76 04             	push   0x4(%esi)
  80008e:	68 92 14 80 00       	push   $0x801492
  800093:	68 74 14 80 00       	push   $0x801474
  800098:	e8 7e 06 00 00       	call   80071b <cprintf>
  80009d:	83 c4 10             	add    $0x10,%esp
  8000a0:	8b 43 04             	mov    0x4(%ebx),%eax
  8000a3:	39 46 04             	cmp    %eax,0x4(%esi)
  8000a6:	0f 84 0f 02 00 00    	je     8002bb <check_regs+0x288>
  8000ac:	83 ec 0c             	sub    $0xc,%esp
  8000af:	68 88 14 80 00       	push   $0x801488
  8000b4:	e8 62 06 00 00       	call   80071b <cprintf>
  8000b9:	83 c4 10             	add    $0x10,%esp
  8000bc:	bf 01 00 00 00       	mov    $0x1,%edi
  8000c1:	ff 73 08             	push   0x8(%ebx)
  8000c4:	ff 76 08             	push   0x8(%esi)
  8000c7:	68 96 14 80 00       	push   $0x801496
  8000cc:	68 74 14 80 00       	push   $0x801474
  8000d1:	e8 45 06 00 00       	call   80071b <cprintf>
  8000d6:	83 c4 10             	add    $0x10,%esp
  8000d9:	8b 43 08             	mov    0x8(%ebx),%eax
  8000dc:	39 46 08             	cmp    %eax,0x8(%esi)
  8000df:	0f 84 eb 01 00 00    	je     8002d0 <check_regs+0x29d>
  8000e5:	83 ec 0c             	sub    $0xc,%esp
  8000e8:	68 88 14 80 00       	push   $0x801488
  8000ed:	e8 29 06 00 00       	call   80071b <cprintf>
  8000f2:	83 c4 10             	add    $0x10,%esp
  8000f5:	bf 01 00 00 00       	mov    $0x1,%edi
  8000fa:	ff 73 10             	push   0x10(%ebx)
  8000fd:	ff 76 10             	push   0x10(%esi)
  800100:	68 9a 14 80 00       	push   $0x80149a
  800105:	68 74 14 80 00       	push   $0x801474
  80010a:	e8 0c 06 00 00       	call   80071b <cprintf>
  80010f:	83 c4 10             	add    $0x10,%esp
  800112:	8b 43 10             	mov    0x10(%ebx),%eax
  800115:	39 46 10             	cmp    %eax,0x10(%esi)
  800118:	0f 84 c7 01 00 00    	je     8002e5 <check_regs+0x2b2>
  80011e:	83 ec 0c             	sub    $0xc,%esp
  800121:	68 88 14 80 00       	push   $0x801488
  800126:	e8 f0 05 00 00       	call   80071b <cprintf>
  80012b:	83 c4 10             	add    $0x10,%esp
  80012e:	bf 01 00 00 00       	mov    $0x1,%edi
  800133:	ff 73 14             	push   0x14(%ebx)
  800136:	ff 76 14             	push   0x14(%esi)
  800139:	68 9e 14 80 00       	push   $0x80149e
  80013e:	68 74 14 80 00       	push   $0x801474
  800143:	e8 d3 05 00 00       	call   80071b <cprintf>
  800148:	83 c4 10             	add    $0x10,%esp
  80014b:	8b 43 14             	mov    0x14(%ebx),%eax
  80014e:	39 46 14             	cmp    %eax,0x14(%esi)
  800151:	0f 84 a3 01 00 00    	je     8002fa <check_regs+0x2c7>
  800157:	83 ec 0c             	sub    $0xc,%esp
  80015a:	68 88 14 80 00       	push   $0x801488
  80015f:	e8 b7 05 00 00       	call   80071b <cprintf>
  800164:	83 c4 10             	add    $0x10,%esp
  800167:	bf 01 00 00 00       	mov    $0x1,%edi
  80016c:	ff 73 18             	push   0x18(%ebx)
  80016f:	ff 76 18             	push   0x18(%esi)
  800172:	68 a2 14 80 00       	push   $0x8014a2
  800177:	68 74 14 80 00       	push   $0x801474
  80017c:	e8 9a 05 00 00       	call   80071b <cprintf>
  800181:	83 c4 10             	add    $0x10,%esp
  800184:	8b 43 18             	mov    0x18(%ebx),%eax
  800187:	39 46 18             	cmp    %eax,0x18(%esi)
  80018a:	0f 84 7f 01 00 00    	je     80030f <check_regs+0x2dc>
  800190:	83 ec 0c             	sub    $0xc,%esp
  800193:	68 88 14 80 00       	push   $0x801488
  800198:	e8 7e 05 00 00       	call   80071b <cprintf>
  80019d:	83 c4 10             	add    $0x10,%esp
  8001a0:	bf 01 00 00 00       	mov    $0x1,%edi
  8001a5:	ff 73 1c             	push   0x1c(%ebx)
  8001a8:	ff 76 1c             	push   0x1c(%esi)
  8001ab:	68 a6 14 80 00       	push   $0x8014a6
  8001b0:	68 74 14 80 00       	push   $0x801474
  8001b5:	e8 61 05 00 00       	call   80071b <cprintf>
  8001ba:	83 c4 10             	add    $0x10,%esp
  8001bd:	8b 43 1c             	mov    0x1c(%ebx),%eax
  8001c0:	39 46 1c             	cmp    %eax,0x1c(%esi)
  8001c3:	0f 84 5b 01 00 00    	je     800324 <check_regs+0x2f1>
  8001c9:	83 ec 0c             	sub    $0xc,%esp
  8001cc:	68 88 14 80 00       	push   $0x801488
  8001d1:	e8 45 05 00 00       	call   80071b <cprintf>
  8001d6:	83 c4 10             	add    $0x10,%esp
  8001d9:	bf 01 00 00 00       	mov    $0x1,%edi
  8001de:	ff 73 20             	push   0x20(%ebx)
  8001e1:	ff 76 20             	push   0x20(%esi)
  8001e4:	68 aa 14 80 00       	push   $0x8014aa
  8001e9:	68 74 14 80 00       	push   $0x801474
  8001ee:	e8 28 05 00 00       	call   80071b <cprintf>
  8001f3:	83 c4 10             	add    $0x10,%esp
  8001f6:	8b 43 20             	mov    0x20(%ebx),%eax
  8001f9:	39 46 20             	cmp    %eax,0x20(%esi)
  8001fc:	0f 84 37 01 00 00    	je     800339 <check_regs+0x306>
  800202:	83 ec 0c             	sub    $0xc,%esp
  800205:	68 88 14 80 00       	push   $0x801488
  80020a:	e8 0c 05 00 00       	call   80071b <cprintf>
  80020f:	83 c4 10             	add    $0x10,%esp
  800212:	bf 01 00 00 00       	mov    $0x1,%edi
  800217:	ff 73 24             	push   0x24(%ebx)
  80021a:	ff 76 24             	push   0x24(%esi)
  80021d:	68 ae 14 80 00       	push   $0x8014ae
  800222:	68 74 14 80 00       	push   $0x801474
  800227:	e8 ef 04 00 00       	call   80071b <cprintf>
  80022c:	83 c4 10             	add    $0x10,%esp
  80022f:	8b 43 24             	mov    0x24(%ebx),%eax
  800232:	39 46 24             	cmp    %eax,0x24(%esi)
  800235:	0f 84 13 01 00 00    	je     80034e <check_regs+0x31b>
  80023b:	83 ec 0c             	sub    $0xc,%esp
  80023e:	68 88 14 80 00       	push   $0x801488
  800243:	e8 d3 04 00 00       	call   80071b <cprintf>
  800248:	ff 73 28             	push   0x28(%ebx)
  80024b:	ff 76 28             	push   0x28(%esi)
  80024e:	68 b5 14 80 00       	push   $0x8014b5
  800253:	68 74 14 80 00       	push   $0x801474
  800258:	e8 be 04 00 00       	call   80071b <cprintf>
  80025d:	83 c4 20             	add    $0x20,%esp
  800260:	8b 43 28             	mov    0x28(%ebx),%eax
  800263:	39 46 28             	cmp    %eax,0x28(%esi)
  800266:	0f 84 53 01 00 00    	je     8003bf <check_regs+0x38c>
  80026c:	83 ec 0c             	sub    $0xc,%esp
  80026f:	68 88 14 80 00       	push   $0x801488
  800274:	e8 a2 04 00 00       	call   80071b <cprintf>
  800279:	83 c4 08             	add    $0x8,%esp
  80027c:	ff 75 0c             	push   0xc(%ebp)
  80027f:	68 b9 14 80 00       	push   $0x8014b9
  800284:	e8 92 04 00 00       	call   80071b <cprintf>
  800289:	83 c4 10             	add    $0x10,%esp
  80028c:	83 ec 0c             	sub    $0xc,%esp
  80028f:	68 88 14 80 00       	push   $0x801488
  800294:	e8 82 04 00 00       	call   80071b <cprintf>
  800299:	83 c4 10             	add    $0x10,%esp
  80029c:	e9 16 01 00 00       	jmp    8003b7 <check_regs+0x384>
  8002a1:	83 ec 0c             	sub    $0xc,%esp
  8002a4:	68 84 14 80 00       	push   $0x801484
  8002a9:	e8 6d 04 00 00       	call   80071b <cprintf>
  8002ae:	83 c4 10             	add    $0x10,%esp
  8002b1:	bf 00 00 00 00       	mov    $0x0,%edi
  8002b6:	e9 cd fd ff ff       	jmp    800088 <check_regs+0x55>
  8002bb:	83 ec 0c             	sub    $0xc,%esp
  8002be:	68 84 14 80 00       	push   $0x801484
  8002c3:	e8 53 04 00 00       	call   80071b <cprintf>
  8002c8:	83 c4 10             	add    $0x10,%esp
  8002cb:	e9 f1 fd ff ff       	jmp    8000c1 <check_regs+0x8e>
  8002d0:	83 ec 0c             	sub    $0xc,%esp
  8002d3:	68 84 14 80 00       	push   $0x801484
  8002d8:	e8 3e 04 00 00       	call   80071b <cprintf>
  8002dd:	83 c4 10             	add    $0x10,%esp
  8002e0:	e9 15 fe ff ff       	jmp    8000fa <check_regs+0xc7>
  8002e5:	83 ec 0c             	sub    $0xc,%esp
  8002e8:	68 84 14 80 00       	push   $0x801484
  8002ed:	e8 29 04 00 00       	call   80071b <cprintf>
  8002f2:	83 c4 10             	add    $0x10,%esp
  8002f5:	e9 39 fe ff ff       	jmp    800133 <check_regs+0x100>
  8002fa:	83 ec 0c             	sub    $0xc,%esp
  8002fd:	68 84 14 80 00       	push   $0x801484
  800302:	e8 14 04 00 00       	call   80071b <cprintf>
  800307:	83 c4 10             	add    $0x10,%esp
  80030a:	e9 5d fe ff ff       	jmp    80016c <check_regs+0x139>
  80030f:	83 ec 0c             	sub    $0xc,%esp
  800312:	68 84 14 80 00       	push   $0x801484
  800317:	e8 ff 03 00 00       	call   80071b <cprintf>
  80031c:	83 c4 10             	add    $0x10,%esp
  80031f:	e9 81 fe ff ff       	jmp    8001a5 <check_regs+0x172>
  800324:	83 ec 0c             	sub    $0xc,%esp
  800327:	68 84 14 80 00       	push   $0x801484
  80032c:	e8 ea 03 00 00       	call   80071b <cprintf>
  800331:	83 c4 10             	add    $0x10,%esp
  800334:	e9 a5 fe ff ff       	jmp    8001de <check_regs+0x1ab>
  800339:	83 ec 0c             	sub    $0xc,%esp
  80033c:	68 84 14 80 00       	push   $0x801484
  800341:	e8 d5 03 00 00       	call   80071b <cprintf>
  800346:	83 c4 10             	add    $0x10,%esp
  800349:	e9 c9 fe ff ff       	jmp    800217 <check_regs+0x1e4>
  80034e:	83 ec 0c             	sub    $0xc,%esp
  800351:	68 84 14 80 00       	push   $0x801484
  800356:	e8 c0 03 00 00       	call   80071b <cprintf>
  80035b:	ff 73 28             	push   0x28(%ebx)
  80035e:	ff 76 28             	push   0x28(%esi)
  800361:	68 b5 14 80 00       	push   $0x8014b5
  800366:	68 74 14 80 00       	push   $0x801474
  80036b:	e8 ab 03 00 00       	call   80071b <cprintf>
  800370:	83 c4 20             	add    $0x20,%esp
  800373:	8b 43 28             	mov    0x28(%ebx),%eax
  800376:	39 46 28             	cmp    %eax,0x28(%esi)
  800379:	0f 85 ed fe ff ff    	jne    80026c <check_regs+0x239>
  80037f:	83 ec 0c             	sub    $0xc,%esp
  800382:	68 84 14 80 00       	push   $0x801484
  800387:	e8 8f 03 00 00       	call   80071b <cprintf>
  80038c:	83 c4 08             	add    $0x8,%esp
  80038f:	ff 75 0c             	push   0xc(%ebp)
  800392:	68 b9 14 80 00       	push   $0x8014b9
  800397:	e8 7f 03 00 00       	call   80071b <cprintf>
  80039c:	83 c4 10             	add    $0x10,%esp
  80039f:	85 ff                	test   %edi,%edi
  8003a1:	0f 85 e5 fe ff ff    	jne    80028c <check_regs+0x259>
  8003a7:	83 ec 0c             	sub    $0xc,%esp
  8003aa:	68 84 14 80 00       	push   $0x801484
  8003af:	e8 67 03 00 00       	call   80071b <cprintf>
  8003b4:	83 c4 10             	add    $0x10,%esp
  8003b7:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8003ba:	5b                   	pop    %ebx
  8003bb:	5e                   	pop    %esi
  8003bc:	5f                   	pop    %edi
  8003bd:	5d                   	pop    %ebp
  8003be:	c3                   	ret
  8003bf:	83 ec 0c             	sub    $0xc,%esp
  8003c2:	68 84 14 80 00       	push   $0x801484
  8003c7:	e8 4f 03 00 00       	call   80071b <cprintf>
  8003cc:	83 c4 08             	add    $0x8,%esp
  8003cf:	ff 75 0c             	push   0xc(%ebp)
  8003d2:	68 b9 14 80 00       	push   $0x8014b9
  8003d7:	e8 3f 03 00 00       	call   80071b <cprintf>
  8003dc:	83 c4 10             	add    $0x10,%esp
  8003df:	e9 a8 fe ff ff       	jmp    80028c <check_regs+0x259>

008003e4 <pgfault>:
  8003e4:	55                   	push   %ebp
  8003e5:	89 e5                	mov    %esp,%ebp
  8003e7:	83 ec 08             	sub    $0x8,%esp
  8003ea:	8b 45 08             	mov    0x8(%ebp),%eax
  8003ed:	8b 10                	mov    (%eax),%edx
  8003ef:	81 fa 00 00 40 00    	cmp    $0x400000,%edx
  8003f5:	0f 85 a3 00 00 00    	jne    80049e <pgfault+0xba>
  8003fb:	8b 50 08             	mov    0x8(%eax),%edx
  8003fe:	89 15 60 20 80 00    	mov    %edx,0x802060
  800404:	8b 50 0c             	mov    0xc(%eax),%edx
  800407:	89 15 64 20 80 00    	mov    %edx,0x802064
  80040d:	8b 50 10             	mov    0x10(%eax),%edx
  800410:	89 15 68 20 80 00    	mov    %edx,0x802068
  800416:	8b 50 14             	mov    0x14(%eax),%edx
  800419:	89 15 6c 20 80 00    	mov    %edx,0x80206c
  80041f:	8b 50 18             	mov    0x18(%eax),%edx
  800422:	89 15 70 20 80 00    	mov    %edx,0x802070
  800428:	8b 50 1c             	mov    0x1c(%eax),%edx
  80042b:	89 15 74 20 80 00    	mov    %edx,0x802074
  800431:	8b 50 20             	mov    0x20(%eax),%edx
  800434:	89 15 78 20 80 00    	mov    %edx,0x802078
  80043a:	8b 50 24             	mov    0x24(%eax),%edx
  80043d:	89 15 7c 20 80 00    	mov    %edx,0x80207c
  800443:	8b 50 28             	mov    0x28(%eax),%edx
  800446:	89 15 80 20 80 00    	mov    %edx,0x802080
  80044c:	8b 50 2c             	mov    0x2c(%eax),%edx
  80044f:	81 e2 ff ff fe ff    	and    $0xfffeffff,%edx
  800455:	89 15 84 20 80 00    	mov    %edx,0x802084
  80045b:	8b 40 30             	mov    0x30(%eax),%eax
  80045e:	a3 88 20 80 00       	mov    %eax,0x802088
  800463:	83 ec 08             	sub    $0x8,%esp
  800466:	68 df 14 80 00       	push   $0x8014df
  80046b:	68 ed 14 80 00       	push   $0x8014ed
  800470:	b9 60 20 80 00       	mov    $0x802060,%ecx
  800475:	ba d8 14 80 00       	mov    $0x8014d8,%edx
  80047a:	b8 a0 20 80 00       	mov    $0x8020a0,%eax
  80047f:	e8 af fb ff ff       	call   800033 <check_regs>
  800484:	83 c4 0c             	add    $0xc,%esp
  800487:	6a 07                	push   $0x7
  800489:	68 00 00 40 00       	push   $0x400000
  80048e:	6a 00                	push   $0x0
  800490:	e8 ff 0b 00 00       	call   801094 <sys_page_alloc>
  800495:	83 c4 10             	add    $0x10,%esp
  800498:	85 c0                	test   %eax,%eax
  80049a:	78 1a                	js     8004b6 <pgfault+0xd2>
  80049c:	c9                   	leave
  80049d:	c3                   	ret
  80049e:	83 ec 0c             	sub    $0xc,%esp
  8004a1:	ff 70 28             	push   0x28(%eax)
  8004a4:	52                   	push   %edx
  8004a5:	68 0c 16 80 00       	push   $0x80160c
  8004aa:	6a 52                	push   $0x52
  8004ac:	68 c7 14 80 00       	push   $0x8014c7
  8004b1:	e8 8a 01 00 00       	call   800640 <_panic>
  8004b6:	50                   	push   %eax
  8004b7:	68 f4 14 80 00       	push   $0x8014f4
  8004bc:	6a 5f                	push   $0x5f
  8004be:	68 c7 14 80 00       	push   $0x8014c7
  8004c3:	e8 78 01 00 00       	call   800640 <_panic>

008004c8 <umain>:
  8004c8:	55                   	push   %ebp
  8004c9:	89 e5                	mov    %esp,%ebp
  8004cb:	83 ec 14             	sub    $0x14,%esp
  8004ce:	68 e4 03 80 00       	push   $0x8003e4
  8004d3:	e8 b6 0c 00 00       	call   80118e <set_pgfault_handler>
  8004d8:	50                   	push   %eax
  8004d9:	9c                   	pushf
  8004da:	58                   	pop    %eax
  8004db:	0d d5 08 00 00       	or     $0x8d5,%eax
  8004e0:	50                   	push   %eax
  8004e1:	9d                   	popf
  8004e2:	a3 c4 20 80 00       	mov    %eax,0x8020c4
  8004e7:	8d 05 22 05 80 00    	lea    0x800522,%eax
  8004ed:	a3 c0 20 80 00       	mov    %eax,0x8020c0
  8004f2:	58                   	pop    %eax
  8004f3:	89 3d a0 20 80 00    	mov    %edi,0x8020a0
  8004f9:	89 35 a4 20 80 00    	mov    %esi,0x8020a4
  8004ff:	89 2d a8 20 80 00    	mov    %ebp,0x8020a8
  800505:	89 1d b0 20 80 00    	mov    %ebx,0x8020b0
  80050b:	89 15 b4 20 80 00    	mov    %edx,0x8020b4
  800511:	89 0d b8 20 80 00    	mov    %ecx,0x8020b8
  800517:	a3 bc 20 80 00       	mov    %eax,0x8020bc
  80051c:	89 25 c8 20 80 00    	mov    %esp,0x8020c8
  800522:	c7 05 00 00 40 00 2a 	movl   $0x2a,0x400000
  800529:	00 00 00 
  80052c:	89 3d 20 20 80 00    	mov    %edi,0x802020
  800532:	89 35 24 20 80 00    	mov    %esi,0x802024
  800538:	89 2d 28 20 80 00    	mov    %ebp,0x802028
  80053e:	89 1d 30 20 80 00    	mov    %ebx,0x802030
  800544:	89 15 34 20 80 00    	mov    %edx,0x802034
  80054a:	89 0d 38 20 80 00    	mov    %ecx,0x802038
  800550:	a3 3c 20 80 00       	mov    %eax,0x80203c
  800555:	89 25 48 20 80 00    	mov    %esp,0x802048
  80055b:	8b 3d a0 20 80 00    	mov    0x8020a0,%edi
  800561:	8b 35 a4 20 80 00    	mov    0x8020a4,%esi
  800567:	8b 2d a8 20 80 00    	mov    0x8020a8,%ebp
  80056d:	8b 1d b0 20 80 00    	mov    0x8020b0,%ebx
  800573:	8b 15 b4 20 80 00    	mov    0x8020b4,%edx
  800579:	8b 0d b8 20 80 00    	mov    0x8020b8,%ecx
  80057f:	a1 bc 20 80 00       	mov    0x8020bc,%eax
  800584:	8b 25 c8 20 80 00    	mov    0x8020c8,%esp
  80058a:	50                   	push   %eax
  80058b:	9c                   	pushf
  80058c:	58                   	pop    %eax
  80058d:	a3 44 20 80 00       	mov    %eax,0x802044
  800592:	58                   	pop    %eax
  800593:	83 c4 10             	add    $0x10,%esp
  800596:	83 3d 00 00 40 00 2a 	cmpl   $0x2a,0x400000
  80059d:	75 30                	jne    8005cf <umain+0x107>
  80059f:	a1 c0 20 80 00       	mov    0x8020c0,%eax
  8005a4:	a3 40 20 80 00       	mov    %eax,0x802040
  8005a9:	83 ec 08             	sub    $0x8,%esp
  8005ac:	68 07 15 80 00       	push   $0x801507
  8005b1:	68 18 15 80 00       	push   $0x801518
  8005b6:	b9 20 20 80 00       	mov    $0x802020,%ecx
  8005bb:	ba d8 14 80 00       	mov    $0x8014d8,%edx
  8005c0:	b8 a0 20 80 00       	mov    $0x8020a0,%eax
  8005c5:	e8 69 fa ff ff       	call   800033 <check_regs>
  8005ca:	83 c4 10             	add    $0x10,%esp
  8005cd:	c9                   	leave
  8005ce:	c3                   	ret
  8005cf:	83 ec 0c             	sub    $0xc,%esp
  8005d2:	68 40 16 80 00       	push   $0x801640
  8005d7:	e8 3f 01 00 00       	call   80071b <cprintf>
  8005dc:	83 c4 10             	add    $0x10,%esp
  8005df:	eb be                	jmp    80059f <umain+0xd7>

008005e1 <libmain>:
  8005e1:	55                   	push   %ebp
  8005e2:	89 e5                	mov    %esp,%ebp
  8005e4:	56                   	push   %esi
  8005e5:	53                   	push   %ebx
  8005e6:	8b 5d 08             	mov    0x8(%ebp),%ebx
  8005e9:	8b 75 0c             	mov    0xc(%ebp),%esi
  8005ec:	e8 58 0a 00 00       	call   801049 <sys_getenvid>
  8005f1:	85 c0                	test   %eax,%eax
  8005f3:	78 15                	js     80060a <libmain+0x29>
  8005f5:	25 ff 03 00 00       	and    $0x3ff,%eax
  8005fa:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
  800600:	05 00 00 c0 ee       	add    $0xeec00000,%eax
  800605:	a3 cc 20 80 00       	mov    %eax,0x8020cc
  80060a:	85 db                	test   %ebx,%ebx
  80060c:	7e 07                	jle    800615 <libmain+0x34>
  80060e:	8b 06                	mov    (%esi),%eax
  800610:	a3 00 20 80 00       	mov    %eax,0x802000
  800615:	83 ec 08             	sub    $0x8,%esp
  800618:	56                   	push   %esi
  800619:	53                   	push   %ebx
  80061a:	e8 a9 fe ff ff       	call   8004c8 <umain>
  80061f:	e8 0a 00 00 00       	call   80062e <exit>
  800624:	83 c4 10             	add    $0x10,%esp
  800627:	8d 65 f8             	lea    -0x8(%ebp),%esp
  80062a:	5b                   	pop    %ebx
  80062b:	5e                   	pop    %esi
  80062c:	5d                   	pop    %ebp
  80062d:	c3                   	ret

0080062e <exit>:
  80062e:	55                   	push   %ebp
  80062f:	89 e5                	mov    %esp,%ebp
  800631:	83 ec 14             	sub    $0x14,%esp
  800634:	6a 00                	push   $0x0
  800636:	e8 ec 09 00 00       	call   801027 <sys_env_destroy>
  80063b:	83 c4 10             	add    $0x10,%esp
  80063e:	c9                   	leave
  80063f:	c3                   	ret

00800640 <_panic>:
  800640:	55                   	push   %ebp
  800641:	89 e5                	mov    %esp,%ebp
  800643:	56                   	push   %esi
  800644:	53                   	push   %ebx
  800645:	8d 5d 14             	lea    0x14(%ebp),%ebx
  800648:	8b 35 00 20 80 00    	mov    0x802000,%esi
  80064e:	e8 f6 09 00 00       	call   801049 <sys_getenvid>
  800653:	83 ec 0c             	sub    $0xc,%esp
  800656:	ff 75 0c             	push   0xc(%ebp)
  800659:	ff 75 08             	push   0x8(%ebp)
  80065c:	56                   	push   %esi
  80065d:	50                   	push   %eax
  80065e:	68 60 16 80 00       	push   $0x801660
  800663:	e8 b3 00 00 00       	call   80071b <cprintf>
  800668:	83 c4 18             	add    $0x18,%esp
  80066b:	53                   	push   %ebx
  80066c:	ff 75 10             	push   0x10(%ebp)
  80066f:	e8 56 00 00 00       	call   8006ca <vcprintf>
  800674:	c7 04 24 90 14 80 00 	movl   $0x801490,(%esp)
  80067b:	e8 9b 00 00 00       	call   80071b <cprintf>
  800680:	83 c4 10             	add    $0x10,%esp
  800683:	cc                   	int3
  800684:	eb fd                	jmp    800683 <_panic+0x43>

00800686 <putch>:
  800686:	55                   	push   %ebp
  800687:	89 e5                	mov    %esp,%ebp
  800689:	53                   	push   %ebx
  80068a:	83 ec 04             	sub    $0x4,%esp
  80068d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800690:	8b 13                	mov    (%ebx),%edx
  800692:	8d 42 01             	lea    0x1(%edx),%eax
  800695:	89 03                	mov    %eax,(%ebx)
  800697:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80069a:	88 4c 13 08          	mov    %cl,0x8(%ebx,%edx,1)
  80069e:	3d ff 00 00 00       	cmp    $0xff,%eax
  8006a3:	74 09                	je     8006ae <putch+0x28>
  8006a5:	83 43 04 01          	addl   $0x1,0x4(%ebx)
  8006a9:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  8006ac:	c9                   	leave
  8006ad:	c3                   	ret
  8006ae:	83 ec 08             	sub    $0x8,%esp
  8006b1:	68 ff 00 00 00       	push   $0xff
  8006b6:	8d 43 08             	lea    0x8(%ebx),%eax
  8006b9:	50                   	push   %eax
  8006ba:	e8 1e 09 00 00       	call   800fdd <sys_cputs>
  8006bf:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
  8006c5:	83 c4 10             	add    $0x10,%esp
  8006c8:	eb db                	jmp    8006a5 <putch+0x1f>

008006ca <vcprintf>:
  8006ca:	55                   	push   %ebp
  8006cb:	89 e5                	mov    %esp,%ebp
  8006cd:	81 ec 18 01 00 00    	sub    $0x118,%esp
  8006d3:	c7 85 f0 fe ff ff 00 	movl   $0x0,-0x110(%ebp)
  8006da:	00 00 00 
  8006dd:	c7 85 f4 fe ff ff 00 	movl   $0x0,-0x10c(%ebp)
  8006e4:	00 00 00 
  8006e7:	ff 75 0c             	push   0xc(%ebp)
  8006ea:	ff 75 08             	push   0x8(%ebp)
  8006ed:	8d 85 f0 fe ff ff    	lea    -0x110(%ebp),%eax
  8006f3:	50                   	push   %eax
  8006f4:	68 86 06 80 00       	push   $0x800686
  8006f9:	e8 74 01 00 00       	call   800872 <vprintfmt>
  8006fe:	83 c4 08             	add    $0x8,%esp
  800701:	ff b5 f0 fe ff ff    	push   -0x110(%ebp)
  800707:	8d 85 f8 fe ff ff    	lea    -0x108(%ebp),%eax
  80070d:	50                   	push   %eax
  80070e:	e8 ca 08 00 00       	call   800fdd <sys_cputs>
  800713:	8b 85 f4 fe ff ff    	mov    -0x10c(%ebp),%eax
  800719:	c9                   	leave
  80071a:	c3                   	ret

0080071b <cprintf>:
  80071b:	55                   	push   %ebp
  80071c:	89 e5                	mov    %esp,%ebp
  80071e:	83 ec 10             	sub    $0x10,%esp
  800721:	8d 45 0c             	lea    0xc(%ebp),%eax
  800724:	50                   	push   %eax
  800725:	ff 75 08             	push   0x8(%ebp)
  800728:	e8 9d ff ff ff       	call   8006ca <vcprintf>
  80072d:	c9                   	leave
  80072e:	c3                   	ret

0080072f <printnum>:
  80072f:	55                   	push   %ebp
  800730:	89 e5                	mov    %esp,%ebp
  800732:	57                   	push   %edi
  800733:	56                   	push   %esi
  800734:	53                   	push   %ebx
  800735:	83 ec 1c             	sub    $0x1c,%esp
  800738:	89 c7                	mov    %eax,%edi
  80073a:	89 d6                	mov    %edx,%esi
  80073c:	8b 45 08             	mov    0x8(%ebp),%eax
  80073f:	8b 55 0c             	mov    0xc(%ebp),%edx
  800742:	89 d1                	mov    %edx,%ecx
  800744:	89 c2                	mov    %eax,%edx
  800746:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800749:	89 4d dc             	mov    %ecx,-0x24(%ebp)
  80074c:	8b 45 10             	mov    0x10(%ebp),%eax
  80074f:	8b 5d 14             	mov    0x14(%ebp),%ebx
  800752:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800755:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  80075c:	39 c2                	cmp    %eax,%edx
  80075e:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
  800761:	72 3e                	jb     8007a1 <printnum+0x72>
  800763:	83 ec 0c             	sub    $0xc,%esp
  800766:	ff 75 18             	push   0x18(%ebp)
  800769:	83 eb 01             	sub    $0x1,%ebx
  80076c:	53                   	push   %ebx
  80076d:	50                   	push   %eax
  80076e:	83 ec 08             	sub    $0x8,%esp
  800771:	ff 75 e4             	push   -0x1c(%ebp)
  800774:	ff 75 e0             	push   -0x20(%ebp)
  800777:	ff 75 dc             	push   -0x24(%ebp)
  80077a:	ff 75 d8             	push   -0x28(%ebp)
  80077d:	e8 7e 0a 00 00       	call   801200 <__udivdi3>
  800782:	83 c4 18             	add    $0x18,%esp
  800785:	52                   	push   %edx
  800786:	50                   	push   %eax
  800787:	89 f2                	mov    %esi,%edx
  800789:	89 f8                	mov    %edi,%eax
  80078b:	e8 9f ff ff ff       	call   80072f <printnum>
  800790:	83 c4 20             	add    $0x20,%esp
  800793:	eb 13                	jmp    8007a8 <printnum+0x79>
  800795:	83 ec 08             	sub    $0x8,%esp
  800798:	56                   	push   %esi
  800799:	ff 75 18             	push   0x18(%ebp)
  80079c:	ff d7                	call   *%edi
  80079e:	83 c4 10             	add    $0x10,%esp
  8007a1:	83 eb 01             	sub    $0x1,%ebx
  8007a4:	85 db                	test   %ebx,%ebx
  8007a6:	7f ed                	jg     800795 <printnum+0x66>
  8007a8:	83 ec 08             	sub    $0x8,%esp
  8007ab:	56                   	push   %esi
  8007ac:	83 ec 04             	sub    $0x4,%esp
  8007af:	ff 75 e4             	push   -0x1c(%ebp)
  8007b2:	ff 75 e0             	push   -0x20(%ebp)
  8007b5:	ff 75 dc             	push   -0x24(%ebp)
  8007b8:	ff 75 d8             	push   -0x28(%ebp)
  8007bb:	e8 60 0b 00 00       	call   801320 <__umoddi3>
  8007c0:	83 c4 14             	add    $0x14,%esp
  8007c3:	0f be 80 28 15 80 00 	movsbl 0x801528(%eax),%eax
  8007ca:	50                   	push   %eax
  8007cb:	ff d7                	call   *%edi
  8007cd:	83 c4 10             	add    $0x10,%esp
  8007d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8007d3:	5b                   	pop    %ebx
  8007d4:	5e                   	pop    %esi
  8007d5:	5f                   	pop    %edi
  8007d6:	5d                   	pop    %ebp
  8007d7:	c3                   	ret

008007d8 <getuint>:
  8007d8:	83 fa 01             	cmp    $0x1,%edx
  8007db:	7f 13                	jg     8007f0 <getuint+0x18>
  8007dd:	85 d2                	test   %edx,%edx
  8007df:	74 1c                	je     8007fd <getuint+0x25>
  8007e1:	8b 10                	mov    (%eax),%edx
  8007e3:	8d 4a 04             	lea    0x4(%edx),%ecx
  8007e6:	89 08                	mov    %ecx,(%eax)
  8007e8:	8b 02                	mov    (%edx),%eax
  8007ea:	ba 00 00 00 00       	mov    $0x0,%edx
  8007ef:	c3                   	ret
  8007f0:	8b 10                	mov    (%eax),%edx
  8007f2:	8d 4a 08             	lea    0x8(%edx),%ecx
  8007f5:	89 08                	mov    %ecx,(%eax)
  8007f7:	8b 02                	mov    (%edx),%eax
  8007f9:	8b 52 04             	mov    0x4(%edx),%edx
  8007fc:	c3                   	ret
  8007fd:	8b 10                	mov    (%eax),%edx
  8007ff:	8d 4a 04             	lea    0x4(%edx),%ecx
  800802:	89 08                	mov    %ecx,(%eax)
  800804:	8b 02                	mov    (%edx),%eax
  800806:	ba 00 00 00 00       	mov    $0x0,%edx
  80080b:	c3                   	ret

0080080c <getint>:
  80080c:	83 fa 01             	cmp    $0x1,%edx
  80080f:	7f 0f                	jg     800820 <getint+0x14>
  800811:	85 d2                	test   %edx,%edx
  800813:	74 18                	je     80082d <getint+0x21>
  800815:	8b 10                	mov    (%eax),%edx
  800817:	8d 4a 04             	lea    0x4(%edx),%ecx
  80081a:	89 08                	mov    %ecx,(%eax)
  80081c:	8b 02                	mov    (%edx),%eax
  80081e:	99                   	cltd
  80081f:	c3                   	ret
  800820:	8b 10                	mov    (%eax),%edx
  800822:	8d 4a 08             	lea    0x8(%edx),%ecx
  800825:	89 08                	mov    %ecx,(%eax)
  800827:	8b 02                	mov    (%edx),%eax
  800829:	8b 52 04             	mov    0x4(%edx),%edx
  80082c:	c3                   	ret
  80082d:	8b 10                	mov    (%eax),%edx
  80082f:	8d 4a 04             	lea    0x4(%edx),%ecx
  800832:	89 08                	mov    %ecx,(%eax)
  800834:	8b 02                	mov    (%edx),%eax
  800836:	99                   	cltd
  800837:	c3                   	ret

00800838 <sprintputch>:
  800838:	55                   	push   %ebp
  800839:	89 e5                	mov    %esp,%ebp
  80083b:	8b 45 0c             	mov    0xc(%ebp),%eax
  80083e:	83 40 08 01          	addl   $0x1,0x8(%eax)
  800842:	8b 10                	mov    (%eax),%edx
  800844:	3b 50 04             	cmp    0x4(%eax),%edx
  800847:	73 0a                	jae    800853 <sprintputch+0x1b>
  800849:	8d 4a 01             	lea    0x1(%edx),%ecx
  80084c:	89 08                	mov    %ecx,(%eax)
  80084e:	8b 45 08             	mov    0x8(%ebp),%eax
  800851:	88 02                	mov    %al,(%edx)
  800853:	5d                   	pop    %ebp
  800854:	c3                   	ret

00800855 <printfmt>:
  800855:	55                   	push   %ebp
  800856:	89 e5                	mov    %esp,%ebp
  800858:	83 ec 08             	sub    $0x8,%esp
  80085b:	8d 45 14             	lea    0x14(%ebp),%eax
  80085e:	50                   	push   %eax
  80085f:	ff 75 10             	push   0x10(%ebp)
  800862:	ff 75 0c             	push   0xc(%ebp)
  800865:	ff 75 08             	push   0x8(%ebp)
  800868:	e8 05 00 00 00       	call   800872 <vprintfmt>
  80086d:	83 c4 10             	add    $0x10,%esp
  800870:	c9                   	leave
  800871:	c3                   	ret

00800872 <vprintfmt>:
  800872:	55                   	push   %ebp
  800873:	89 e5                	mov    %esp,%ebp
  800875:	57                   	push   %edi
  800876:	56                   	push   %esi
  800877:	53                   	push   %ebx
  800878:	83 ec 2c             	sub    $0x2c,%esp
  80087b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  80087e:	8b 75 0c             	mov    0xc(%ebp),%esi
  800881:	8b 7d 10             	mov    0x10(%ebp),%edi
  800884:	eb 0a                	jmp    800890 <vprintfmt+0x1e>
  800886:	83 ec 08             	sub    $0x8,%esp
  800889:	56                   	push   %esi
  80088a:	50                   	push   %eax
  80088b:	ff d3                	call   *%ebx
  80088d:	83 c4 10             	add    $0x10,%esp
  800890:	83 c7 01             	add    $0x1,%edi
  800893:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
  800897:	83 f8 25             	cmp    $0x25,%eax
  80089a:	74 0c                	je     8008a8 <vprintfmt+0x36>
  80089c:	85 c0                	test   %eax,%eax
  80089e:	75 e6                	jne    800886 <vprintfmt+0x14>
  8008a0:	8d 65 f4             	lea    -0xc(%ebp),%esp
  8008a3:	5b                   	pop    %ebx
  8008a4:	5e                   	pop    %esi
  8008a5:	5f                   	pop    %edi
  8008a6:	5d                   	pop    %ebp
  8008a7:	c3                   	ret
  8008a8:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
  8008ac:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
  8008b3:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  8008ba:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
  8008c1:	b9 00 00 00 00       	mov    $0x0,%ecx
  8008c6:	8d 47 01             	lea    0x1(%edi),%eax
  8008c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  8008cc:	0f b6 17             	movzbl (%edi),%edx
  8008cf:	8d 42 dd             	lea    -0x23(%edx),%eax
  8008d2:	3c 55                	cmp    $0x55,%al
  8008d4:	0f 87 c3 02 00 00    	ja     800b9d <vprintfmt+0x32b>
  8008da:	0f b6 c0             	movzbl %al,%eax
  8008dd:	ff 24 85 a0 16 80 00 	jmp    *0x8016a0(,%eax,4)
  8008e4:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8008e7:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
  8008eb:	eb d9                	jmp    8008c6 <vprintfmt+0x54>
  8008ed:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8008f0:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
  8008f4:	eb d0                	jmp    8008c6 <vprintfmt+0x54>
  8008f6:	0f b6 d2             	movzbl %dl,%edx
  8008f9:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  8008fc:	b8 00 00 00 00       	mov    $0x0,%eax
  800901:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
  800904:	8d 04 80             	lea    (%eax,%eax,4),%eax
  800907:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
  80090b:	0f be 17             	movsbl (%edi),%edx
  80090e:	8d 4a d0             	lea    -0x30(%edx),%ecx
  800911:	83 f9 09             	cmp    $0x9,%ecx
  800914:	77 52                	ja     800968 <vprintfmt+0xf6>
  800916:	83 c7 01             	add    $0x1,%edi
  800919:	eb e9                	jmp    800904 <vprintfmt+0x92>
  80091b:	8b 45 14             	mov    0x14(%ebp),%eax
  80091e:	8d 50 04             	lea    0x4(%eax),%edx
  800921:	89 55 14             	mov    %edx,0x14(%ebp)
  800924:	8b 00                	mov    (%eax),%eax
  800926:	89 45 d0             	mov    %eax,-0x30(%ebp)
  800929:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80092c:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  800930:	79 94                	jns    8008c6 <vprintfmt+0x54>
  800932:	8b 45 d0             	mov    -0x30(%ebp),%eax
  800935:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800938:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
  80093f:	eb 85                	jmp    8008c6 <vprintfmt+0x54>
  800941:	8b 55 e0             	mov    -0x20(%ebp),%edx
  800944:	85 d2                	test   %edx,%edx
  800946:	b8 00 00 00 00       	mov    $0x0,%eax
  80094b:	0f 49 c2             	cmovns %edx,%eax
  80094e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800951:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800954:	e9 6d ff ff ff       	jmp    8008c6 <vprintfmt+0x54>
  800959:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  80095c:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
  800963:	e9 5e ff ff ff       	jmp    8008c6 <vprintfmt+0x54>
  800968:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
  80096b:	89 45 d0             	mov    %eax,-0x30(%ebp)
  80096e:	eb bc                	jmp    80092c <vprintfmt+0xba>
  800970:	83 c1 01             	add    $0x1,%ecx
  800973:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800976:	e9 4b ff ff ff       	jmp    8008c6 <vprintfmt+0x54>
  80097b:	8b 45 14             	mov    0x14(%ebp),%eax
  80097e:	8d 50 04             	lea    0x4(%eax),%edx
  800981:	89 55 14             	mov    %edx,0x14(%ebp)
  800984:	83 ec 08             	sub    $0x8,%esp
  800987:	56                   	push   %esi
  800988:	ff 30                	push   (%eax)
  80098a:	ff d3                	call   *%ebx
  80098c:	83 c4 10             	add    $0x10,%esp
  80098f:	e9 a0 01 00 00       	jmp    800b34 <vprintfmt+0x2c2>
  800994:	8b 45 14             	mov    0x14(%ebp),%eax
  800997:	8d 50 04             	lea    0x4(%eax),%edx
  80099a:	89 55 14             	mov    %edx,0x14(%ebp)
  80099d:	8b 10                	mov    (%eax),%edx
  80099f:	89 d0                	mov    %edx,%eax
  8009a1:	f7 d8                	neg    %eax
  8009a3:	0f 48 c2             	cmovs  %edx,%eax
  8009a6:	83 f8 08             	cmp    $0x8,%eax
  8009a9:	7f 20                	jg     8009cb <vprintfmt+0x159>
  8009ab:	8b 14 85 00 18 80 00 	mov    0x801800(,%eax,4),%edx
  8009b2:	85 d2                	test   %edx,%edx
  8009b4:	74 15                	je     8009cb <vprintfmt+0x159>
  8009b6:	52                   	push   %edx
  8009b7:	68 49 15 80 00       	push   $0x801549
  8009bc:	56                   	push   %esi
  8009bd:	53                   	push   %ebx
  8009be:	e8 92 fe ff ff       	call   800855 <printfmt>
  8009c3:	83 c4 10             	add    $0x10,%esp
  8009c6:	e9 69 01 00 00       	jmp    800b34 <vprintfmt+0x2c2>
  8009cb:	50                   	push   %eax
  8009cc:	68 40 15 80 00       	push   $0x801540
  8009d1:	56                   	push   %esi
  8009d2:	53                   	push   %ebx
  8009d3:	e8 7d fe ff ff       	call   800855 <printfmt>
  8009d8:	83 c4 10             	add    $0x10,%esp
  8009db:	e9 54 01 00 00       	jmp    800b34 <vprintfmt+0x2c2>
  8009e0:	8b 45 14             	mov    0x14(%ebp),%eax
  8009e3:	8d 50 04             	lea    0x4(%eax),%edx
  8009e6:	89 55 14             	mov    %edx,0x14(%ebp)
  8009e9:	8b 08                	mov    (%eax),%ecx
  8009eb:	85 c9                	test   %ecx,%ecx
  8009ed:	b8 39 15 80 00       	mov    $0x801539,%eax
  8009f2:	0f 45 c1             	cmovne %ecx,%eax
  8009f5:	89 45 cc             	mov    %eax,-0x34(%ebp)
  8009f8:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  8009fc:	7e 06                	jle    800a04 <vprintfmt+0x192>
  8009fe:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
  800a02:	75 0b                	jne    800a0f <vprintfmt+0x19d>
  800a04:	8b 4d cc             	mov    -0x34(%ebp),%ecx
  800a07:	8b 7d d0             	mov    -0x30(%ebp),%edi
  800a0a:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800a0d:	eb 5c                	jmp    800a6b <vprintfmt+0x1f9>
  800a0f:	83 ec 08             	sub    $0x8,%esp
  800a12:	ff 75 d0             	push   -0x30(%ebp)
  800a15:	ff 75 cc             	push   -0x34(%ebp)
  800a18:	e8 20 02 00 00       	call   800c3d <strnlen>
  800a1d:	89 c2                	mov    %eax,%edx
  800a1f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800a22:	29 d0                	sub    %edx,%eax
  800a24:	83 c4 10             	add    $0x10,%esp
  800a27:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
  800a2b:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800a2e:	89 5d 08             	mov    %ebx,0x8(%ebp)
  800a31:	89 c3                	mov    %eax,%ebx
  800a33:	eb 0e                	jmp    800a43 <vprintfmt+0x1d1>
  800a35:	83 ec 08             	sub    $0x8,%esp
  800a38:	56                   	push   %esi
  800a39:	57                   	push   %edi
  800a3a:	ff 55 08             	call   *0x8(%ebp)
  800a3d:	83 eb 01             	sub    $0x1,%ebx
  800a40:	83 c4 10             	add    $0x10,%esp
  800a43:	85 db                	test   %ebx,%ebx
  800a45:	7f ee                	jg     800a35 <vprintfmt+0x1c3>
  800a47:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800a4a:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800a4d:	85 c0                	test   %eax,%eax
  800a4f:	ba 00 00 00 00       	mov    $0x0,%edx
  800a54:	0f 49 d0             	cmovns %eax,%edx
  800a57:	29 d0                	sub    %edx,%eax
  800a59:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800a5c:	eb a6                	jmp    800a04 <vprintfmt+0x192>
  800a5e:	83 ec 08             	sub    $0x8,%esp
  800a61:	56                   	push   %esi
  800a62:	52                   	push   %edx
  800a63:	ff 55 08             	call   *0x8(%ebp)
  800a66:	83 c4 10             	add    $0x10,%esp
  800a69:	89 d9                	mov    %ebx,%ecx
  800a6b:	8d 59 01             	lea    0x1(%ecx),%ebx
  800a6e:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
  800a72:	0f be d0             	movsbl %al,%edx
  800a75:	85 d2                	test   %edx,%edx
  800a77:	74 28                	je     800aa1 <vprintfmt+0x22f>
  800a79:	85 ff                	test   %edi,%edi
  800a7b:	78 05                	js     800a82 <vprintfmt+0x210>
  800a7d:	83 ef 01             	sub    $0x1,%edi
  800a80:	78 2e                	js     800ab0 <vprintfmt+0x23e>
  800a82:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
  800a86:	74 d6                	je     800a5e <vprintfmt+0x1ec>
  800a88:	0f be c0             	movsbl %al,%eax
  800a8b:	83 e8 20             	sub    $0x20,%eax
  800a8e:	83 f8 5e             	cmp    $0x5e,%eax
  800a91:	76 cb                	jbe    800a5e <vprintfmt+0x1ec>
  800a93:	83 ec 08             	sub    $0x8,%esp
  800a96:	56                   	push   %esi
  800a97:	6a 3f                	push   $0x3f
  800a99:	ff 55 08             	call   *0x8(%ebp)
  800a9c:	83 c4 10             	add    $0x10,%esp
  800a9f:	eb c8                	jmp    800a69 <vprintfmt+0x1f7>
  800aa1:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800aa4:	8b 7d cc             	mov    -0x34(%ebp),%edi
  800aa7:	8b 45 e0             	mov    -0x20(%ebp),%eax
  800aaa:	01 c7                	add    %eax,%edi
  800aac:	29 cf                	sub    %ecx,%edi
  800aae:	eb 13                	jmp    800ac3 <vprintfmt+0x251>
  800ab0:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800ab3:	eb ef                	jmp    800aa4 <vprintfmt+0x232>
  800ab5:	83 ec 08             	sub    $0x8,%esp
  800ab8:	56                   	push   %esi
  800ab9:	6a 20                	push   $0x20
  800abb:	ff d3                	call   *%ebx
  800abd:	83 ef 01             	sub    $0x1,%edi
  800ac0:	83 c4 10             	add    $0x10,%esp
  800ac3:	85 ff                	test   %edi,%edi
  800ac5:	7f ee                	jg     800ab5 <vprintfmt+0x243>
  800ac7:	eb 6b                	jmp    800b34 <vprintfmt+0x2c2>
  800ac9:	89 ca                	mov    %ecx,%edx
  800acb:	8d 45 14             	lea    0x14(%ebp),%eax
  800ace:	e8 39 fd ff ff       	call   80080c <getint>
  800ad3:	89 45 d8             	mov    %eax,-0x28(%ebp)
  800ad6:	89 55 dc             	mov    %edx,-0x24(%ebp)
  800ad9:	85 d2                	test   %edx,%edx
  800adb:	78 0b                	js     800ae8 <vprintfmt+0x276>
  800add:	89 d1                	mov    %edx,%ecx
  800adf:	89 c2                	mov    %eax,%edx
  800ae1:	bf 0a 00 00 00       	mov    $0xa,%edi
  800ae6:	eb 32                	jmp    800b1a <vprintfmt+0x2a8>
  800ae8:	83 ec 08             	sub    $0x8,%esp
  800aeb:	56                   	push   %esi
  800aec:	6a 2d                	push   $0x2d
  800aee:	ff d3                	call   *%ebx
  800af0:	8b 55 d8             	mov    -0x28(%ebp),%edx
  800af3:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  800af6:	f7 da                	neg    %edx
  800af8:	83 d1 00             	adc    $0x0,%ecx
  800afb:	f7 d9                	neg    %ecx
  800afd:	83 c4 10             	add    $0x10,%esp
  800b00:	bf 0a 00 00 00       	mov    $0xa,%edi
  800b05:	eb 13                	jmp    800b1a <vprintfmt+0x2a8>
  800b07:	89 ca                	mov    %ecx,%edx
  800b09:	8d 45 14             	lea    0x14(%ebp),%eax
  800b0c:	e8 c7 fc ff ff       	call   8007d8 <getuint>
  800b11:	89 d1                	mov    %edx,%ecx
  800b13:	89 c2                	mov    %eax,%edx
  800b15:	bf 0a 00 00 00       	mov    $0xa,%edi
  800b1a:	83 ec 0c             	sub    $0xc,%esp
  800b1d:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
  800b21:	50                   	push   %eax
  800b22:	ff 75 e0             	push   -0x20(%ebp)
  800b25:	57                   	push   %edi
  800b26:	51                   	push   %ecx
  800b27:	52                   	push   %edx
  800b28:	89 f2                	mov    %esi,%edx
  800b2a:	89 d8                	mov    %ebx,%eax
  800b2c:	e8 fe fb ff ff       	call   80072f <printnum>
  800b31:	83 c4 20             	add    $0x20,%esp
  800b34:	8b 7d e4             	mov    -0x1c(%ebp),%edi
  800b37:	e9 54 fd ff ff       	jmp    800890 <vprintfmt+0x1e>
  800b3c:	89 ca                	mov    %ecx,%edx
  800b3e:	8d 45 14             	lea    0x14(%ebp),%eax
  800b41:	e8 92 fc ff ff       	call   8007d8 <getuint>
  800b46:	89 d1                	mov    %edx,%ecx
  800b48:	89 c2                	mov    %eax,%edx
  800b4a:	bf 08 00 00 00       	mov    $0x8,%edi
  800b4f:	eb c9                	jmp    800b1a <vprintfmt+0x2a8>
  800b51:	83 ec 08             	sub    $0x8,%esp
  800b54:	56                   	push   %esi
  800b55:	6a 30                	push   $0x30
  800b57:	ff d3                	call   *%ebx
  800b59:	83 c4 08             	add    $0x8,%esp
  800b5c:	56                   	push   %esi
  800b5d:	6a 78                	push   $0x78
  800b5f:	ff d3                	call   *%ebx
  800b61:	8b 45 14             	mov    0x14(%ebp),%eax
  800b64:	8d 50 04             	lea    0x4(%eax),%edx
  800b67:	89 55 14             	mov    %edx,0x14(%ebp)
  800b6a:	8b 10                	mov    (%eax),%edx
  800b6c:	b9 00 00 00 00       	mov    $0x0,%ecx
  800b71:	83 c4 10             	add    $0x10,%esp
  800b74:	bf 10 00 00 00       	mov    $0x10,%edi
  800b79:	eb 9f                	jmp    800b1a <vprintfmt+0x2a8>
  800b7b:	89 ca                	mov    %ecx,%edx
  800b7d:	8d 45 14             	lea    0x14(%ebp),%eax
  800b80:	e8 53 fc ff ff       	call   8007d8 <getuint>
  800b85:	89 d1                	mov    %edx,%ecx
  800b87:	89 c2                	mov    %eax,%edx
  800b89:	bf 10 00 00 00       	mov    $0x10,%edi
  800b8e:	eb 8a                	jmp    800b1a <vprintfmt+0x2a8>
  800b90:	83 ec 08             	sub    $0x8,%esp
  800b93:	56                   	push   %esi
  800b94:	6a 25                	push   $0x25
  800b96:	ff d3                	call   *%ebx
  800b98:	83 c4 10             	add    $0x10,%esp
  800b9b:	eb 97                	jmp    800b34 <vprintfmt+0x2c2>
  800b9d:	83 ec 08             	sub    $0x8,%esp
  800ba0:	56                   	push   %esi
  800ba1:	6a 25                	push   $0x25
  800ba3:	ff d3                	call   *%ebx
  800ba5:	83 c4 10             	add    $0x10,%esp
  800ba8:	89 f8                	mov    %edi,%eax
  800baa:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
  800bae:	74 05                	je     800bb5 <vprintfmt+0x343>
  800bb0:	83 e8 01             	sub    $0x1,%eax
  800bb3:	eb f5                	jmp    800baa <vprintfmt+0x338>
  800bb5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  800bb8:	e9 77 ff ff ff       	jmp    800b34 <vprintfmt+0x2c2>

00800bbd <vsnprintf>:
  800bbd:	55                   	push   %ebp
  800bbe:	89 e5                	mov    %esp,%ebp
  800bc0:	83 ec 18             	sub    $0x18,%esp
  800bc3:	8b 45 08             	mov    0x8(%ebp),%eax
  800bc6:	8b 55 0c             	mov    0xc(%ebp),%edx
  800bc9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  800bcc:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
  800bd0:	89 4d f0             	mov    %ecx,-0x10(%ebp)
  800bd3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  800bda:	85 c0                	test   %eax,%eax
  800bdc:	74 26                	je     800c04 <vsnprintf+0x47>
  800bde:	85 d2                	test   %edx,%edx
  800be0:	7e 22                	jle    800c04 <vsnprintf+0x47>
  800be2:	ff 75 14             	push   0x14(%ebp)
  800be5:	ff 75 10             	push   0x10(%ebp)
  800be8:	8d 45 ec             	lea    -0x14(%ebp),%eax
  800beb:	50                   	push   %eax
  800bec:	68 38 08 80 00       	push   $0x800838
  800bf1:	e8 7c fc ff ff       	call   800872 <vprintfmt>
  800bf6:	8b 45 ec             	mov    -0x14(%ebp),%eax
  800bf9:	c6 00 00             	movb   $0x0,(%eax)
  800bfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  800bff:	83 c4 10             	add    $0x10,%esp
  800c02:	c9                   	leave
  800c03:	c3                   	ret
  800c04:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  800c09:	eb f7                	jmp    800c02 <vsnprintf+0x45>

00800c0b <snprintf>:
  800c0b:	55                   	push   %ebp
  800c0c:	89 e5                	mov    %esp,%ebp
  800c0e:	83 ec 08             	sub    $0x8,%esp
  800c11:	8d 45 14             	lea    0x14(%ebp),%eax
  800c14:	50                   	push   %eax
  800c15:	ff 75 10             	push   0x10(%ebp)
  800c18:	ff 75 0c             	push   0xc(%ebp)
  800c1b:	ff 75 08             	push   0x8(%ebp)
  800c1e:	e8 9a ff ff ff       	call   800bbd <vsnprintf>
  800c23:	c9                   	leave
  800c24:	c3                   	ret

00800c25 <strlen>:
  800c25:	55                   	push   %ebp
  800c26:	89 e5                	mov    %esp,%ebp
  800c28:	8b 55 08             	mov    0x8(%ebp),%edx
  800c2b:	b8 00 00 00 00       	mov    $0x0,%eax
  800c30:	eb 03                	jmp    800c35 <strlen+0x10>
  800c32:	83 c0 01             	add    $0x1,%eax
  800c35:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  800c39:	75 f7                	jne    800c32 <strlen+0xd>
  800c3b:	5d                   	pop    %ebp
  800c3c:	c3                   	ret

00800c3d <strnlen>:
  800c3d:	55                   	push   %ebp
  800c3e:	89 e5                	mov    %esp,%ebp
  800c40:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c43:	8b 55 0c             	mov    0xc(%ebp),%edx
  800c46:	b8 00 00 00 00       	mov    $0x0,%eax
  800c4b:	eb 03                	jmp    800c50 <strnlen+0x13>
  800c4d:	83 c0 01             	add    $0x1,%eax
  800c50:	39 d0                	cmp    %edx,%eax
  800c52:	74 08                	je     800c5c <strnlen+0x1f>
  800c54:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  800c58:	75 f3                	jne    800c4d <strnlen+0x10>
  800c5a:	89 c2                	mov    %eax,%edx
  800c5c:	89 d0                	mov    %edx,%eax
  800c5e:	5d                   	pop    %ebp
  800c5f:	c3                   	ret

00800c60 <strcpy>:
  800c60:	55                   	push   %ebp
  800c61:	89 e5                	mov    %esp,%ebp
  800c63:	53                   	push   %ebx
  800c64:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800c67:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800c6a:	b8 00 00 00 00       	mov    $0x0,%eax
  800c6f:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
  800c73:	88 14 01             	mov    %dl,(%ecx,%eax,1)
  800c76:	83 c0 01             	add    $0x1,%eax
  800c79:	84 d2                	test   %dl,%dl
  800c7b:	75 f2                	jne    800c6f <strcpy+0xf>
  800c7d:	89 c8                	mov    %ecx,%eax
  800c7f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800c82:	c9                   	leave
  800c83:	c3                   	ret

00800c84 <strcat>:
  800c84:	55                   	push   %ebp
  800c85:	89 e5                	mov    %esp,%ebp
  800c87:	53                   	push   %ebx
  800c88:	83 ec 10             	sub    $0x10,%esp
  800c8b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  800c8e:	53                   	push   %ebx
  800c8f:	e8 91 ff ff ff       	call   800c25 <strlen>
  800c94:	83 c4 08             	add    $0x8,%esp
  800c97:	ff 75 0c             	push   0xc(%ebp)
  800c9a:	01 d8                	add    %ebx,%eax
  800c9c:	50                   	push   %eax
  800c9d:	e8 be ff ff ff       	call   800c60 <strcpy>
  800ca2:	89 d8                	mov    %ebx,%eax
  800ca4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800ca7:	c9                   	leave
  800ca8:	c3                   	ret

00800ca9 <strncpy>:
  800ca9:	55                   	push   %ebp
  800caa:	89 e5                	mov    %esp,%ebp
  800cac:	56                   	push   %esi
  800cad:	53                   	push   %ebx
  800cae:	8b 75 08             	mov    0x8(%ebp),%esi
  800cb1:	8b 55 0c             	mov    0xc(%ebp),%edx
  800cb4:	89 f3                	mov    %esi,%ebx
  800cb6:	03 5d 10             	add    0x10(%ebp),%ebx
  800cb9:	89 f0                	mov    %esi,%eax
  800cbb:	eb 0f                	jmp    800ccc <strncpy+0x23>
  800cbd:	83 c0 01             	add    $0x1,%eax
  800cc0:	0f b6 0a             	movzbl (%edx),%ecx
  800cc3:	88 48 ff             	mov    %cl,-0x1(%eax)
  800cc6:	80 f9 01             	cmp    $0x1,%cl
  800cc9:	83 da ff             	sbb    $0xffffffff,%edx
  800ccc:	39 d8                	cmp    %ebx,%eax
  800cce:	75 ed                	jne    800cbd <strncpy+0x14>
  800cd0:	89 f0                	mov    %esi,%eax
  800cd2:	5b                   	pop    %ebx
  800cd3:	5e                   	pop    %esi
  800cd4:	5d                   	pop    %ebp
  800cd5:	c3                   	ret

00800cd6 <strlcpy>:
  800cd6:	55                   	push   %ebp
  800cd7:	89 e5                	mov    %esp,%ebp
  800cd9:	56                   	push   %esi
  800cda:	53                   	push   %ebx
  800cdb:	8b 75 08             	mov    0x8(%ebp),%esi
  800cde:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800ce1:	8b 55 10             	mov    0x10(%ebp),%edx
  800ce4:	89 f0                	mov    %esi,%eax
  800ce6:	85 d2                	test   %edx,%edx
  800ce8:	74 21                	je     800d0b <strlcpy+0x35>
  800cea:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
  800cee:	89 f2                	mov    %esi,%edx
  800cf0:	eb 09                	jmp    800cfb <strlcpy+0x25>
  800cf2:	83 c1 01             	add    $0x1,%ecx
  800cf5:	83 c2 01             	add    $0x1,%edx
  800cf8:	88 5a ff             	mov    %bl,-0x1(%edx)
  800cfb:	39 c2                	cmp    %eax,%edx
  800cfd:	74 09                	je     800d08 <strlcpy+0x32>
  800cff:	0f b6 19             	movzbl (%ecx),%ebx
  800d02:	84 db                	test   %bl,%bl
  800d04:	75 ec                	jne    800cf2 <strlcpy+0x1c>
  800d06:	89 d0                	mov    %edx,%eax
  800d08:	c6 00 00             	movb   $0x0,(%eax)
  800d0b:	29 f0                	sub    %esi,%eax
  800d0d:	5b                   	pop    %ebx
  800d0e:	5e                   	pop    %esi
  800d0f:	5d                   	pop    %ebp
  800d10:	c3                   	ret

00800d11 <strcmp>:
  800d11:	55                   	push   %ebp
  800d12:	89 e5                	mov    %esp,%ebp
  800d14:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800d17:	8b 55 0c             	mov    0xc(%ebp),%edx
  800d1a:	eb 06                	jmp    800d22 <strcmp+0x11>
  800d1c:	83 c1 01             	add    $0x1,%ecx
  800d1f:	83 c2 01             	add    $0x1,%edx
  800d22:	0f b6 01             	movzbl (%ecx),%eax
  800d25:	84 c0                	test   %al,%al
  800d27:	74 04                	je     800d2d <strcmp+0x1c>
  800d29:	3a 02                	cmp    (%edx),%al
  800d2b:	74 ef                	je     800d1c <strcmp+0xb>
  800d2d:	0f b6 c0             	movzbl %al,%eax
  800d30:	0f b6 12             	movzbl (%edx),%edx
  800d33:	29 d0                	sub    %edx,%eax
  800d35:	5d                   	pop    %ebp
  800d36:	c3                   	ret

00800d37 <strncmp>:
  800d37:	55                   	push   %ebp
  800d38:	89 e5                	mov    %esp,%ebp
  800d3a:	53                   	push   %ebx
  800d3b:	8b 45 08             	mov    0x8(%ebp),%eax
  800d3e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800d41:	8b 55 10             	mov    0x10(%ebp),%edx
  800d44:	eb 09                	jmp    800d4f <strncmp+0x18>
  800d46:	83 ea 01             	sub    $0x1,%edx
  800d49:	83 c0 01             	add    $0x1,%eax
  800d4c:	83 c1 01             	add    $0x1,%ecx
  800d4f:	85 d2                	test   %edx,%edx
  800d51:	74 18                	je     800d6b <strncmp+0x34>
  800d53:	0f b6 18             	movzbl (%eax),%ebx
  800d56:	84 db                	test   %bl,%bl
  800d58:	74 04                	je     800d5e <strncmp+0x27>
  800d5a:	3a 19                	cmp    (%ecx),%bl
  800d5c:	74 e8                	je     800d46 <strncmp+0xf>
  800d5e:	0f b6 00             	movzbl (%eax),%eax
  800d61:	0f b6 11             	movzbl (%ecx),%edx
  800d64:	29 d0                	sub    %edx,%eax
  800d66:	8b 5d fc             	mov    -0x4(%ebp),%ebx
  800d69:	c9                   	leave
  800d6a:	c3                   	ret
  800d6b:	b8 00 00 00 00       	mov    $0x0,%eax
  800d70:	eb f4                	jmp    800d66 <strncmp+0x2f>

00800d72 <strchr>:
  800d72:	55                   	push   %ebp
  800d73:	89 e5                	mov    %esp,%ebp
  800d75:	8b 45 08             	mov    0x8(%ebp),%eax
  800d78:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  800d7c:	eb 03                	jmp    800d81 <strchr+0xf>
  800d7e:	83 c0 01             	add    $0x1,%eax
  800d81:	0f b6 10             	movzbl (%eax),%edx
  800d84:	84 d2                	test   %dl,%dl
  800d86:	74 06                	je     800d8e <strchr+0x1c>
  800d88:	38 ca                	cmp    %cl,%dl
  800d8a:	75 f2                	jne    800d7e <strchr+0xc>
  800d8c:	eb 05                	jmp    800d93 <strchr+0x21>
  800d8e:	b8 00 00 00 00       	mov    $0x0,%eax
  800d93:	5d                   	pop    %ebp
  800d94:	c3                   	ret

00800d95 <strfind>:
  800d95:	55                   	push   %ebp
  800d96:	89 e5                	mov    %esp,%ebp
  800d98:	8b 45 08             	mov    0x8(%ebp),%eax
  800d9b:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  800d9f:	0f b6 10             	movzbl (%eax),%edx
  800da2:	38 ca                	cmp    %cl,%dl
  800da4:	74 09                	je     800daf <strfind+0x1a>
  800da6:	84 d2                	test   %dl,%dl
  800da8:	74 05                	je     800daf <strfind+0x1a>
  800daa:	83 c0 01             	add    $0x1,%eax
  800dad:	eb f0                	jmp    800d9f <strfind+0xa>
  800daf:	5d                   	pop    %ebp
  800db0:	c3                   	ret

00800db1 <memset>:
  800db1:	55                   	push   %ebp
  800db2:	89 e5                	mov    %esp,%ebp
  800db4:	57                   	push   %edi
  800db5:	8b 55 08             	mov    0x8(%ebp),%edx
  800db8:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800dbb:	85 c9                	test   %ecx,%ecx
  800dbd:	74 24                	je     800de3 <memset+0x32>
  800dbf:	89 d0                	mov    %edx,%eax
  800dc1:	09 c8                	or     %ecx,%eax
  800dc3:	a8 03                	test   $0x3,%al
  800dc5:	75 14                	jne    800ddb <memset+0x2a>
  800dc7:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
  800dcb:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
  800dd1:	c1 e9 02             	shr    $0x2,%ecx
  800dd4:	89 d7                	mov    %edx,%edi
  800dd6:	fc                   	cld
  800dd7:	f3 ab                	rep stos %eax,%es:(%edi)
  800dd9:	eb 08                	jmp    800de3 <memset+0x32>
  800ddb:	89 d7                	mov    %edx,%edi
  800ddd:	8b 45 0c             	mov    0xc(%ebp),%eax
  800de0:	fc                   	cld
  800de1:	f3 aa                	rep stos %al,%es:(%edi)
  800de3:	89 d0                	mov    %edx,%eax
  800de5:	8b 7d fc             	mov    -0x4(%ebp),%edi
  800de8:	c9                   	leave
  800de9:	c3                   	ret

00800dea <memmove>:
  800dea:	55                   	push   %ebp
  800deb:	89 e5                	mov    %esp,%ebp
  800ded:	57                   	push   %edi
  800dee:	56                   	push   %esi
  800def:	8b 45 08             	mov    0x8(%ebp),%eax
  800df2:	8b 75 0c             	mov    0xc(%ebp),%esi
  800df5:	8b 4d 10             	mov    0x10(%ebp),%ecx
  800df8:	39 c6                	cmp    %eax,%esi
  800dfa:	73 32                	jae    800e2e <memmove+0x44>
  800dfc:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
  800dff:	39 d0                	cmp    %edx,%eax
  800e01:	73 2b                	jae    800e2e <memmove+0x44>
  800e03:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
  800e06:	89 fe                	mov    %edi,%esi
  800e08:	09 ce                	or     %ecx,%esi
  800e0a:	09 d6                	or     %edx,%esi
  800e0c:	f7 c6 03 00 00 00    	test   $0x3,%esi
  800e12:	75 0e                	jne    800e22 <memmove+0x38>
  800e14:	83 ef 04             	sub    $0x4,%edi
  800e17:	8d 72 fc             	lea    -0x4(%edx),%esi
  800e1a:	c1 e9 02             	shr    $0x2,%ecx
  800e1d:	fd                   	std
  800e1e:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800e20:	eb 09                	jmp    800e2b <memmove+0x41>
  800e22:	83 ef 01             	sub    $0x1,%edi
  800e25:	8d 72 ff             	lea    -0x1(%edx),%esi
  800e28:	fd                   	std
  800e29:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800e2b:	fc                   	cld
  800e2c:	eb 1a                	jmp    800e48 <memmove+0x5e>
  800e2e:	89 c2                	mov    %eax,%edx
  800e30:	09 ca                	or     %ecx,%edx
  800e32:	09 f2                	or     %esi,%edx
  800e34:	f6 c2 03             	test   $0x3,%dl
  800e37:	75 0a                	jne    800e43 <memmove+0x59>
  800e39:	c1 e9 02             	shr    $0x2,%ecx
  800e3c:	89 c7                	mov    %eax,%edi
  800e3e:	fc                   	cld
  800e3f:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  800e41:	eb 05                	jmp    800e48 <memmove+0x5e>
  800e43:	89 c7                	mov    %eax,%edi
  800e45:	fc                   	cld
  800e46:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  800e48:	5e                   	pop    %esi
  800e49:	5f                   	pop    %edi
  800e4a:	5d                   	pop    %ebp
  800e4b:	c3                   	ret

00800e4c <memcpy>:
  800e4c:	55                   	push   %ebp
  800e4d:	89 e5                	mov    %esp,%ebp
  800e4f:	83 ec 0c             	sub    $0xc,%esp
  800e52:	ff 75 10             	push   0x10(%ebp)
  800e55:	ff 75 0c             	push   0xc(%ebp)
  800e58:	ff 75 08             	push   0x8(%ebp)
  800e5b:	e8 8a ff ff ff       	call   800dea <memmove>
  800e60:	c9                   	leave
  800e61:	c3                   	ret

00800e62 <memcmp>:
  800e62:	55                   	push   %ebp
  800e63:	89 e5                	mov    %esp,%ebp
  800e65:	56                   	push   %esi
  800e66:	53                   	push   %ebx
  800e67:	8b 45 08             	mov    0x8(%ebp),%eax
  800e6a:	8b 55 0c             	mov    0xc(%ebp),%edx
  800e6d:	89 c6                	mov    %eax,%esi
  800e6f:	03 75 10             	add    0x10(%ebp),%esi
  800e72:	eb 06                	jmp    800e7a <memcmp+0x18>
  800e74:	83 c0 01             	add    $0x1,%eax
  800e77:	83 c2 01             	add    $0x1,%edx
  800e7a:	39 f0                	cmp    %esi,%eax
  800e7c:	74 14                	je     800e92 <memcmp+0x30>
  800e7e:	0f b6 08             	movzbl (%eax),%ecx
  800e81:	0f b6 1a             	movzbl (%edx),%ebx
  800e84:	38 d9                	cmp    %bl,%cl
  800e86:	74 ec                	je     800e74 <memcmp+0x12>
  800e88:	0f b6 c1             	movzbl %cl,%eax
  800e8b:	0f b6 db             	movzbl %bl,%ebx
  800e8e:	29 d8                	sub    %ebx,%eax
  800e90:	eb 05                	jmp    800e97 <memcmp+0x35>
  800e92:	b8 00 00 00 00       	mov    $0x0,%eax
  800e97:	5b                   	pop    %ebx
  800e98:	5e                   	pop    %esi
  800e99:	5d                   	pop    %ebp
  800e9a:	c3                   	ret

00800e9b <memfind>:
  800e9b:	55                   	push   %ebp
  800e9c:	89 e5                	mov    %esp,%ebp
  800e9e:	8b 45 08             	mov    0x8(%ebp),%eax
  800ea1:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  800ea4:	89 c2                	mov    %eax,%edx
  800ea6:	03 55 10             	add    0x10(%ebp),%edx
  800ea9:	eb 03                	jmp    800eae <memfind+0x13>
  800eab:	83 c0 01             	add    $0x1,%eax
  800eae:	39 d0                	cmp    %edx,%eax
  800eb0:	73 04                	jae    800eb6 <memfind+0x1b>
  800eb2:	38 08                	cmp    %cl,(%eax)
  800eb4:	75 f5                	jne    800eab <memfind+0x10>
  800eb6:	5d                   	pop    %ebp
  800eb7:	c3                   	ret

00800eb8 <strtol>:
  800eb8:	55                   	push   %ebp
  800eb9:	89 e5                	mov    %esp,%ebp
  800ebb:	57                   	push   %edi
  800ebc:	56                   	push   %esi
  800ebd:	53                   	push   %ebx
  800ebe:	8b 55 08             	mov    0x8(%ebp),%edx
  800ec1:	8b 5d 10             	mov    0x10(%ebp),%ebx
  800ec4:	eb 03                	jmp    800ec9 <strtol+0x11>
  800ec6:	83 c2 01             	add    $0x1,%edx
  800ec9:	0f b6 02             	movzbl (%edx),%eax
  800ecc:	3c 20                	cmp    $0x20,%al
  800ece:	74 f6                	je     800ec6 <strtol+0xe>
  800ed0:	3c 09                	cmp    $0x9,%al
  800ed2:	74 f2                	je     800ec6 <strtol+0xe>
  800ed4:	3c 2b                	cmp    $0x2b,%al
  800ed6:	74 2a                	je     800f02 <strtol+0x4a>
  800ed8:	bf 00 00 00 00       	mov    $0x0,%edi
  800edd:	3c 2d                	cmp    $0x2d,%al
  800edf:	74 2b                	je     800f0c <strtol+0x54>
  800ee1:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
  800ee7:	75 0f                	jne    800ef8 <strtol+0x40>
  800ee9:	80 3a 30             	cmpb   $0x30,(%edx)
  800eec:	74 28                	je     800f16 <strtol+0x5e>
  800eee:	85 db                	test   %ebx,%ebx
  800ef0:	b8 0a 00 00 00       	mov    $0xa,%eax
  800ef5:	0f 44 d8             	cmove  %eax,%ebx
  800ef8:	b9 00 00 00 00       	mov    $0x0,%ecx
  800efd:	89 5d 10             	mov    %ebx,0x10(%ebp)
  800f00:	eb 46                	jmp    800f48 <strtol+0x90>
  800f02:	83 c2 01             	add    $0x1,%edx
  800f05:	bf 00 00 00 00       	mov    $0x0,%edi
  800f0a:	eb d5                	jmp    800ee1 <strtol+0x29>
  800f0c:	83 c2 01             	add    $0x1,%edx
  800f0f:	bf 01 00 00 00       	mov    $0x1,%edi
  800f14:	eb cb                	jmp    800ee1 <strtol+0x29>
  800f16:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
  800f1a:	74 0e                	je     800f2a <strtol+0x72>
  800f1c:	85 db                	test   %ebx,%ebx
  800f1e:	75 d8                	jne    800ef8 <strtol+0x40>
  800f20:	83 c2 01             	add    $0x1,%edx
  800f23:	bb 08 00 00 00       	mov    $0x8,%ebx
  800f28:	eb ce                	jmp    800ef8 <strtol+0x40>
  800f2a:	83 c2 02             	add    $0x2,%edx
  800f2d:	bb 10 00 00 00       	mov    $0x10,%ebx
  800f32:	eb c4                	jmp    800ef8 <strtol+0x40>
  800f34:	0f be c0             	movsbl %al,%eax
  800f37:	83 e8 30             	sub    $0x30,%eax
  800f3a:	3b 45 10             	cmp    0x10(%ebp),%eax
  800f3d:	7d 3a                	jge    800f79 <strtol+0xc1>
  800f3f:	83 c2 01             	add    $0x1,%edx
  800f42:	0f af 4d 10          	imul   0x10(%ebp),%ecx
  800f46:	01 c1                	add    %eax,%ecx
  800f48:	0f b6 02             	movzbl (%edx),%eax
  800f4b:	8d 70 d0             	lea    -0x30(%eax),%esi
  800f4e:	89 f3                	mov    %esi,%ebx
  800f50:	80 fb 09             	cmp    $0x9,%bl
  800f53:	76 df                	jbe    800f34 <strtol+0x7c>
  800f55:	8d 70 9f             	lea    -0x61(%eax),%esi
  800f58:	89 f3                	mov    %esi,%ebx
  800f5a:	80 fb 19             	cmp    $0x19,%bl
  800f5d:	77 08                	ja     800f67 <strtol+0xaf>
  800f5f:	0f be c0             	movsbl %al,%eax
  800f62:	83 e8 57             	sub    $0x57,%eax
  800f65:	eb d3                	jmp    800f3a <strtol+0x82>
  800f67:	8d 70 bf             	lea    -0x41(%eax),%esi
  800f6a:	89 f3                	mov    %esi,%ebx
  800f6c:	80 fb 19             	cmp    $0x19,%bl
  800f6f:	77 08                	ja     800f79 <strtol+0xc1>
  800f71:	0f be c0             	movsbl %al,%eax
  800f74:	83 e8 37             	sub    $0x37,%eax
  800f77:	eb c1                	jmp    800f3a <strtol+0x82>
  800f79:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  800f7d:	74 05                	je     800f84 <strtol+0xcc>
  800f7f:	8b 45 0c             	mov    0xc(%ebp),%eax
  800f82:	89 10                	mov    %edx,(%eax)
  800f84:	89 c8                	mov    %ecx,%eax
  800f86:	f7 d8                	neg    %eax
  800f88:	85 ff                	test   %edi,%edi
  800f8a:	0f 45 c8             	cmovne %eax,%ecx
  800f8d:	89 c8                	mov    %ecx,%eax
  800f8f:	5b                   	pop    %ebx
  800f90:	5e                   	pop    %esi
  800f91:	5f                   	pop    %edi
  800f92:	5d                   	pop    %ebp
  800f93:	c3                   	ret

00800f94 <syscall>:
  800f94:	55                   	push   %ebp
  800f95:	89 e5                	mov    %esp,%ebp
  800f97:	57                   	push   %edi
  800f98:	56                   	push   %esi
  800f99:	53                   	push   %ebx
  800f9a:	83 ec 1c             	sub    $0x1c,%esp
  800f9d:	89 45 e0             	mov    %eax,-0x20(%ebp)
  800fa0:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  800fa3:	89 ca                	mov    %ecx,%edx
  800fa5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800fa8:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  800fab:	8b 7d 10             	mov    0x10(%ebp),%edi
  800fae:	8b 75 14             	mov    0x14(%ebp),%esi
  800fb1:	cd 30                	int    $0x30
  800fb3:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  800fb7:	74 04                	je     800fbd <syscall+0x29>
  800fb9:	85 c0                	test   %eax,%eax
  800fbb:	7f 08                	jg     800fc5 <syscall+0x31>
  800fbd:	8d 65 f4             	lea    -0xc(%ebp),%esp
  800fc0:	5b                   	pop    %ebx
  800fc1:	5e                   	pop    %esi
  800fc2:	5f                   	pop    %edi
  800fc3:	5d                   	pop    %ebp
  800fc4:	c3                   	ret
  800fc5:	83 ec 0c             	sub    $0xc,%esp
  800fc8:	50                   	push   %eax
  800fc9:	ff 75 e0             	push   -0x20(%ebp)
  800fcc:	68 df 15 80 00       	push   $0x8015df
  800fd1:	6a 1e                	push   $0x1e
  800fd3:	68 fc 15 80 00       	push   $0x8015fc
  800fd8:	e8 63 f6 ff ff       	call   800640 <_panic>

00800fdd <sys_cputs>:
  800fdd:	55                   	push   %ebp
  800fde:	89 e5                	mov    %esp,%ebp
  800fe0:	83 ec 08             	sub    $0x8,%esp
  800fe3:	6a 00                	push   $0x0
  800fe5:	6a 00                	push   $0x0
  800fe7:	6a 00                	push   $0x0
  800fe9:	ff 75 0c             	push   0xc(%ebp)
  800fec:	8b 4d 08             	mov    0x8(%ebp),%ecx
  800fef:	ba 00 00 00 00       	mov    $0x0,%edx
  800ff4:	b8 00 00 00 00       	mov    $0x0,%eax
  800ff9:	e8 96 ff ff ff       	call   800f94 <syscall>
  800ffe:	83 c4 10             	add    $0x10,%esp
  801001:	c9                   	leave
  801002:	c3                   	ret

00801003 <sys_cgetc>:
  801003:	55                   	push   %ebp
  801004:	89 e5                	mov    %esp,%ebp
  801006:	83 ec 08             	sub    $0x8,%esp
  801009:	6a 00                	push   $0x0
  80100b:	6a 00                	push   $0x0
  80100d:	6a 00                	push   $0x0
  80100f:	6a 00                	push   $0x0
  801011:	b9 00 00 00 00       	mov    $0x0,%ecx
  801016:	ba 00 00 00 00       	mov    $0x0,%edx
  80101b:	b8 01 00 00 00       	mov    $0x1,%eax
  801020:	e8 6f ff ff ff       	call   800f94 <syscall>
  801025:	c9                   	leave
  801026:	c3                   	ret

00801027 <sys_env_destroy>:
  801027:	55                   	push   %ebp
  801028:	89 e5                	mov    %esp,%ebp
  80102a:	83 ec 08             	sub    $0x8,%esp
  80102d:	6a 00                	push   $0x0
  80102f:	6a 00                	push   $0x0
  801031:	6a 00                	push   $0x0
  801033:	6a 00                	push   $0x0
  801035:	8b 4d 08             	mov    0x8(%ebp),%ecx
  801038:	ba 01 00 00 00       	mov    $0x1,%edx
  80103d:	b8 03 00 00 00       	mov    $0x3,%eax
  801042:	e8 4d ff ff ff       	call   800f94 <syscall>
  801047:	c9                   	leave
  801048:	c3                   	ret

00801049 <sys_getenvid>:
  801049:	55                   	push   %ebp
  80104a:	89 e5                	mov    %esp,%ebp
  80104c:	83 ec 08             	sub    $0x8,%esp
  80104f:	6a 00                	push   $0x0
  801051:	6a 00                	push   $0x0
  801053:	6a 00                	push   $0x0
  801055:	6a 00                	push   $0x0
  801057:	b9 00 00 00 00       	mov    $0x0,%ecx
  80105c:	ba 00 00 00 00       	mov    $0x0,%edx
  801061:	b8 02 00 00 00       	mov    $0x2,%eax
  801066:	e8 29 ff ff ff       	call   800f94 <syscall>
  80106b:	c9                   	leave
  80106c:	c3                   	ret

0080106d <sys_yield>:
  80106d:	55                   	push   %ebp
  80106e:	89 e5                	mov    %esp,%ebp
  801070:	83 ec 08             	sub    $0x8,%esp
  801073:	6a 00                	push   $0x0
  801075:	6a 00                	push   $0x0
  801077:	6a 00                	push   $0x0
  801079:	6a 00                	push   $0x0
  80107b:	b9 00 00 00 00       	mov    $0x0,%ecx
  801080:	ba 00 00 00 00       	mov    $0x0,%edx
  801085:	b8 0a 00 00 00       	mov    $0xa,%eax
  80108a:	e8 05 ff ff ff       	call   800f94 <syscall>
  80108f:	83 c4 10             	add    $0x10,%esp
  801092:	c9                   	leave
  801093:	c3                   	ret

00801094 <sys_page_alloc>:
  801094:	55                   	push   %ebp
  801095:	89 e5                	mov    %esp,%ebp
  801097:	83 ec 08             	sub    $0x8,%esp
  80109a:	6a 00                	push   $0x0
  80109c:	6a 00                	push   $0x0
  80109e:	ff 75 10             	push   0x10(%ebp)
  8010a1:	ff 75 0c             	push   0xc(%ebp)
  8010a4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8010a7:	ba 01 00 00 00       	mov    $0x1,%edx
  8010ac:	b8 04 00 00 00       	mov    $0x4,%eax
  8010b1:	e8 de fe ff ff       	call   800f94 <syscall>
  8010b6:	c9                   	leave
  8010b7:	c3                   	ret

008010b8 <sys_page_map>:
  8010b8:	55                   	push   %ebp
  8010b9:	89 e5                	mov    %esp,%ebp
  8010bb:	83 ec 08             	sub    $0x8,%esp
  8010be:	ff 75 18             	push   0x18(%ebp)
  8010c1:	ff 75 14             	push   0x14(%ebp)
  8010c4:	ff 75 10             	push   0x10(%ebp)
  8010c7:	ff 75 0c             	push   0xc(%ebp)
  8010ca:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8010cd:	ba 01 00 00 00       	mov    $0x1,%edx
  8010d2:	b8 05 00 00 00       	mov    $0x5,%eax
  8010d7:	e8 b8 fe ff ff       	call   800f94 <syscall>
  8010dc:	c9                   	leave
  8010dd:	c3                   	ret

008010de <sys_page_unmap>:
  8010de:	55                   	push   %ebp
  8010df:	89 e5                	mov    %esp,%ebp
  8010e1:	83 ec 08             	sub    $0x8,%esp
  8010e4:	6a 00                	push   $0x0
  8010e6:	6a 00                	push   $0x0
  8010e8:	6a 00                	push   $0x0
  8010ea:	ff 75 0c             	push   0xc(%ebp)
  8010ed:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8010f0:	ba 01 00 00 00       	mov    $0x1,%edx
  8010f5:	b8 06 00 00 00       	mov    $0x6,%eax
  8010fa:	e8 95 fe ff ff       	call   800f94 <syscall>
  8010ff:	c9                   	leave
  801100:	c3                   	ret

00801101 <sys_env_set_status>:
  801101:	55                   	push   %ebp
  801102:	89 e5                	mov    %esp,%ebp
  801104:	83 ec 08             	sub    $0x8,%esp
  801107:	6a 00                	push   $0x0
  801109:	6a 00                	push   $0x0
  80110b:	6a 00                	push   $0x0
  80110d:	ff 75 0c             	push   0xc(%ebp)
  801110:	8b 4d 08             	mov    0x8(%ebp),%ecx
  801113:	ba 01 00 00 00       	mov    $0x1,%edx
  801118:	b8 08 00 00 00       	mov    $0x8,%eax
  80111d:	e8 72 fe ff ff       	call   800f94 <syscall>
  801122:	c9                   	leave
  801123:	c3                   	ret

00801124 <sys_env_set_pgfault_upcall>:
  801124:	55                   	push   %ebp
  801125:	89 e5                	mov    %esp,%ebp
  801127:	83 ec 08             	sub    $0x8,%esp
  80112a:	6a 00                	push   $0x0
  80112c:	6a 00                	push   $0x0
  80112e:	6a 00                	push   $0x0
  801130:	ff 75 0c             	push   0xc(%ebp)
  801133:	8b 4d 08             	mov    0x8(%ebp),%ecx
  801136:	ba 01 00 00 00       	mov    $0x1,%edx
  80113b:	b8 09 00 00 00       	mov    $0x9,%eax
  801140:	e8 4f fe ff ff       	call   800f94 <syscall>
  801145:	c9                   	leave
  801146:	c3                   	ret

00801147 <sys_ipc_try_send>:
  801147:	55                   	push   %ebp
  801148:	89 e5                	mov    %esp,%ebp
  80114a:	83 ec 08             	sub    $0x8,%esp
  80114d:	6a 00                	push   $0x0
  80114f:	ff 75 14             	push   0x14(%ebp)
  801152:	ff 75 10             	push   0x10(%ebp)
  801155:	ff 75 0c             	push   0xc(%ebp)
  801158:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80115b:	ba 00 00 00 00       	mov    $0x0,%edx
  801160:	b8 0c 00 00 00       	mov    $0xc,%eax
  801165:	e8 2a fe ff ff       	call   800f94 <syscall>
  80116a:	c9                   	leave
  80116b:	c3                   	ret

0080116c <sys_ipc_recv>:
  80116c:	55                   	push   %ebp
  80116d:	89 e5                	mov    %esp,%ebp
  80116f:	83 ec 08             	sub    $0x8,%esp
  801172:	6a 00                	push   $0x0
  801174:	6a 00                	push   $0x0
  801176:	6a 00                	push   $0x0
  801178:	6a 00                	push   $0x0
  80117a:	8b 4d 08             	mov    0x8(%ebp),%ecx
  80117d:	ba 01 00 00 00       	mov    $0x1,%edx
  801182:	b8 0d 00 00 00       	mov    $0xd,%eax
  801187:	e8 08 fe ff ff       	call   800f94 <syscall>
  80118c:	c9                   	leave
  80118d:	c3                   	ret

0080118e <set_pgfault_handler>:
  80118e:	55                   	push   %ebp
  80118f:	89 e5                	mov    %esp,%ebp
  801191:	83 ec 08             	sub    $0x8,%esp
  801194:	83 3d d0 20 80 00 00 	cmpl   $0x0,0x8020d0
  80119b:	74 0a                	je     8011a7 <set_pgfault_handler+0x19>
  80119d:	8b 45 08             	mov    0x8(%ebp),%eax
  8011a0:	a3 d0 20 80 00       	mov    %eax,0x8020d0
  8011a5:	c9                   	leave
  8011a6:	c3                   	ret
  8011a7:	83 ec 04             	sub    $0x4,%esp
  8011aa:	6a 07                	push   $0x7
  8011ac:	68 00 f0 bf ee       	push   $0xeebff000
  8011b1:	6a 00                	push   $0x0
  8011b3:	e8 dc fe ff ff       	call   801094 <sys_page_alloc>
  8011b8:	83 c4 10             	add    $0x10,%esp
  8011bb:	85 c0                	test   %eax,%eax
  8011bd:	78 e6                	js     8011a5 <set_pgfault_handler+0x17>
  8011bf:	83 ec 08             	sub    $0x8,%esp
  8011c2:	68 d7 11 80 00       	push   $0x8011d7
  8011c7:	6a 00                	push   $0x0
  8011c9:	e8 56 ff ff ff       	call   801124 <sys_env_set_pgfault_upcall>
  8011ce:	83 c4 10             	add    $0x10,%esp
  8011d1:	85 c0                	test   %eax,%eax
  8011d3:	79 c8                	jns    80119d <set_pgfault_handler+0xf>
  8011d5:	eb ce                	jmp    8011a5 <set_pgfault_handler+0x17>

008011d7 <_pgfault_upcall>:
  8011d7:	54                   	push   %esp
  8011d8:	a1 d0 20 80 00       	mov    0x8020d0,%eax
  8011dd:	ff d0                	call   *%eax
  8011df:	83 c4 04             	add    $0x4,%esp
  8011e2:	8b 44 24 28          	mov    0x28(%esp),%eax
  8011e6:	8b 5c 24 30          	mov    0x30(%esp),%ebx
  8011ea:	83 eb 04             	sub    $0x4,%ebx
  8011ed:	89 03                	mov    %eax,(%ebx)
  8011ef:	89 5c 24 30          	mov    %ebx,0x30(%esp)
  8011f3:	58                   	pop    %eax
  8011f4:	58                   	pop    %eax
  8011f5:	61                   	popa
  8011f6:	83 c4 04             	add    $0x4,%esp
  8011f9:	9d                   	popf
  8011fa:	5c                   	pop    %esp
  8011fb:	c3                   	ret
  8011fc:	66 90                	xchg   %ax,%ax
  8011fe:	66 90                	xchg   %ax,%ax

00801200 <__udivdi3>:
  801200:	f3 0f 1e fb          	endbr32
  801204:	55                   	push   %ebp
  801205:	57                   	push   %edi
  801206:	56                   	push   %esi
  801207:	53                   	push   %ebx
  801208:	83 ec 1c             	sub    $0x1c,%esp
  80120b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  80120f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
  801213:	8b 74 24 34          	mov    0x34(%esp),%esi
  801217:	8b 5c 24 38          	mov    0x38(%esp),%ebx
  80121b:	85 c0                	test   %eax,%eax
  80121d:	75 19                	jne    801238 <__udivdi3+0x38>
  80121f:	39 de                	cmp    %ebx,%esi
  801221:	73 4d                	jae    801270 <__udivdi3+0x70>
  801223:	31 ff                	xor    %edi,%edi
  801225:	89 e8                	mov    %ebp,%eax
  801227:	89 f2                	mov    %esi,%edx
  801229:	f7 f3                	div    %ebx
  80122b:	89 fa                	mov    %edi,%edx
  80122d:	83 c4 1c             	add    $0x1c,%esp
  801230:	5b                   	pop    %ebx
  801231:	5e                   	pop    %esi
  801232:	5f                   	pop    %edi
  801233:	5d                   	pop    %ebp
  801234:	c3                   	ret
  801235:	8d 76 00             	lea    0x0(%esi),%esi
  801238:	39 c6                	cmp    %eax,%esi
  80123a:	73 14                	jae    801250 <__udivdi3+0x50>
  80123c:	31 ff                	xor    %edi,%edi
  80123e:	31 c0                	xor    %eax,%eax
  801240:	89 fa                	mov    %edi,%edx
  801242:	83 c4 1c             	add    $0x1c,%esp
  801245:	5b                   	pop    %ebx
  801246:	5e                   	pop    %esi
  801247:	5f                   	pop    %edi
  801248:	5d                   	pop    %ebp
  801249:	c3                   	ret
  80124a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  801250:	0f bd f8             	bsr    %eax,%edi
  801253:	83 f7 1f             	xor    $0x1f,%edi
  801256:	75 48                	jne    8012a0 <__udivdi3+0xa0>
  801258:	39 f0                	cmp    %esi,%eax
  80125a:	72 06                	jb     801262 <__udivdi3+0x62>
  80125c:	31 c0                	xor    %eax,%eax
  80125e:	39 dd                	cmp    %ebx,%ebp
  801260:	72 de                	jb     801240 <__udivdi3+0x40>
  801262:	b8 01 00 00 00       	mov    $0x1,%eax
  801267:	eb d7                	jmp    801240 <__udivdi3+0x40>
  801269:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  801270:	89 d9                	mov    %ebx,%ecx
  801272:	85 db                	test   %ebx,%ebx
  801274:	75 0b                	jne    801281 <__udivdi3+0x81>
  801276:	b8 01 00 00 00       	mov    $0x1,%eax
  80127b:	31 d2                	xor    %edx,%edx
  80127d:	f7 f3                	div    %ebx
  80127f:	89 c1                	mov    %eax,%ecx
  801281:	31 d2                	xor    %edx,%edx
  801283:	89 f0                	mov    %esi,%eax
  801285:	f7 f1                	div    %ecx
  801287:	89 c6                	mov    %eax,%esi
  801289:	89 e8                	mov    %ebp,%eax
  80128b:	89 f7                	mov    %esi,%edi
  80128d:	f7 f1                	div    %ecx
  80128f:	89 fa                	mov    %edi,%edx
  801291:	83 c4 1c             	add    $0x1c,%esp
  801294:	5b                   	pop    %ebx
  801295:	5e                   	pop    %esi
  801296:	5f                   	pop    %edi
  801297:	5d                   	pop    %ebp
  801298:	c3                   	ret
  801299:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8012a0:	89 f9                	mov    %edi,%ecx
  8012a2:	ba 20 00 00 00       	mov    $0x20,%edx
  8012a7:	29 fa                	sub    %edi,%edx
  8012a9:	d3 e0                	shl    %cl,%eax
  8012ab:	89 44 24 08          	mov    %eax,0x8(%esp)
  8012af:	89 d1                	mov    %edx,%ecx
  8012b1:	89 d8                	mov    %ebx,%eax
  8012b3:	d3 e8                	shr    %cl,%eax
  8012b5:	89 c1                	mov    %eax,%ecx
  8012b7:	8b 44 24 08          	mov    0x8(%esp),%eax
  8012bb:	09 c1                	or     %eax,%ecx
  8012bd:	89 f0                	mov    %esi,%eax
  8012bf:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  8012c3:	89 f9                	mov    %edi,%ecx
  8012c5:	d3 e3                	shl    %cl,%ebx
  8012c7:	89 d1                	mov    %edx,%ecx
  8012c9:	d3 e8                	shr    %cl,%eax
  8012cb:	89 f9                	mov    %edi,%ecx
  8012cd:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  8012d1:	89 eb                	mov    %ebp,%ebx
  8012d3:	d3 e6                	shl    %cl,%esi
  8012d5:	89 d1                	mov    %edx,%ecx
  8012d7:	d3 eb                	shr    %cl,%ebx
  8012d9:	09 f3                	or     %esi,%ebx
  8012db:	89 c6                	mov    %eax,%esi
  8012dd:	89 f2                	mov    %esi,%edx
  8012df:	89 d8                	mov    %ebx,%eax
  8012e1:	f7 74 24 08          	divl   0x8(%esp)
  8012e5:	89 d6                	mov    %edx,%esi
  8012e7:	89 c3                	mov    %eax,%ebx
  8012e9:	f7 64 24 0c          	mull   0xc(%esp)
  8012ed:	39 d6                	cmp    %edx,%esi
  8012ef:	72 1f                	jb     801310 <__udivdi3+0x110>
  8012f1:	89 f9                	mov    %edi,%ecx
  8012f3:	d3 e5                	shl    %cl,%ebp
  8012f5:	39 c5                	cmp    %eax,%ebp
  8012f7:	73 04                	jae    8012fd <__udivdi3+0xfd>
  8012f9:	39 d6                	cmp    %edx,%esi
  8012fb:	74 13                	je     801310 <__udivdi3+0x110>
  8012fd:	89 d8                	mov    %ebx,%eax
  8012ff:	31 ff                	xor    %edi,%edi
  801301:	e9 3a ff ff ff       	jmp    801240 <__udivdi3+0x40>
  801306:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  80130d:	00 
  80130e:	66 90                	xchg   %ax,%ax
  801310:	8d 43 ff             	lea    -0x1(%ebx),%eax
  801313:	31 ff                	xor    %edi,%edi
  801315:	e9 26 ff ff ff       	jmp    801240 <__udivdi3+0x40>
  80131a:	66 90                	xchg   %ax,%ax
  80131c:	66 90                	xchg   %ax,%ax
  80131e:	66 90                	xchg   %ax,%ax

00801320 <__umoddi3>:
  801320:	f3 0f 1e fb          	endbr32
  801324:	55                   	push   %ebp
  801325:	57                   	push   %edi
  801326:	56                   	push   %esi
  801327:	53                   	push   %ebx
  801328:	83 ec 1c             	sub    $0x1c,%esp
  80132b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
  80132f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
  801333:	8b 74 24 30          	mov    0x30(%esp),%esi
  801337:	8b 7c 24 38          	mov    0x38(%esp),%edi
  80133b:	89 da                	mov    %ebx,%edx
  80133d:	85 c0                	test   %eax,%eax
  80133f:	75 17                	jne    801358 <__umoddi3+0x38>
  801341:	39 fb                	cmp    %edi,%ebx
  801343:	73 53                	jae    801398 <__umoddi3+0x78>
  801345:	89 f0                	mov    %esi,%eax
  801347:	f7 f7                	div    %edi
  801349:	89 d0                	mov    %edx,%eax
  80134b:	31 d2                	xor    %edx,%edx
  80134d:	83 c4 1c             	add    $0x1c,%esp
  801350:	5b                   	pop    %ebx
  801351:	5e                   	pop    %esi
  801352:	5f                   	pop    %edi
  801353:	5d                   	pop    %ebp
  801354:	c3                   	ret
  801355:	8d 76 00             	lea    0x0(%esi),%esi
  801358:	89 f1                	mov    %esi,%ecx
  80135a:	39 c3                	cmp    %eax,%ebx
  80135c:	73 12                	jae    801370 <__umoddi3+0x50>
  80135e:	89 f0                	mov    %esi,%eax
  801360:	83 c4 1c             	add    $0x1c,%esp
  801363:	5b                   	pop    %ebx
  801364:	5e                   	pop    %esi
  801365:	5f                   	pop    %edi
  801366:	5d                   	pop    %ebp
  801367:	c3                   	ret
  801368:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
  80136f:	00 
  801370:	0f bd e8             	bsr    %eax,%ebp
  801373:	83 f5 1f             	xor    $0x1f,%ebp
  801376:	75 48                	jne    8013c0 <__umoddi3+0xa0>
  801378:	39 d8                	cmp    %ebx,%eax
  80137a:	0f 82 d0 00 00 00    	jb     801450 <__umoddi3+0x130>
  801380:	39 fe                	cmp    %edi,%esi
  801382:	0f 83 c8 00 00 00    	jae    801450 <__umoddi3+0x130>
  801388:	89 c8                	mov    %ecx,%eax
  80138a:	83 c4 1c             	add    $0x1c,%esp
  80138d:	5b                   	pop    %ebx
  80138e:	5e                   	pop    %esi
  80138f:	5f                   	pop    %edi
  801390:	5d                   	pop    %ebp
  801391:	c3                   	ret
  801392:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  801398:	89 f9                	mov    %edi,%ecx
  80139a:	85 ff                	test   %edi,%edi
  80139c:	75 0b                	jne    8013a9 <__umoddi3+0x89>
  80139e:	b8 01 00 00 00       	mov    $0x1,%eax
  8013a3:	31 d2                	xor    %edx,%edx
  8013a5:	f7 f7                	div    %edi
  8013a7:	89 c1                	mov    %eax,%ecx
  8013a9:	89 d8                	mov    %ebx,%eax
  8013ab:	31 d2                	xor    %edx,%edx
  8013ad:	f7 f1                	div    %ecx
  8013af:	89 f0                	mov    %esi,%eax
  8013b1:	f7 f1                	div    %ecx
  8013b3:	89 d0                	mov    %edx,%eax
  8013b5:	31 d2                	xor    %edx,%edx
  8013b7:	eb 94                	jmp    80134d <__umoddi3+0x2d>
  8013b9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  8013c0:	89 e9                	mov    %ebp,%ecx
  8013c2:	ba 20 00 00 00       	mov    $0x20,%edx
  8013c7:	29 ea                	sub    %ebp,%edx
  8013c9:	d3 e0                	shl    %cl,%eax
  8013cb:	89 44 24 08          	mov    %eax,0x8(%esp)
  8013cf:	89 d1                	mov    %edx,%ecx
  8013d1:	89 f8                	mov    %edi,%eax
  8013d3:	d3 e8                	shr    %cl,%eax
  8013d5:	89 54 24 04          	mov    %edx,0x4(%esp)
  8013d9:	8b 54 24 04          	mov    0x4(%esp),%edx
  8013dd:	89 c1                	mov    %eax,%ecx
  8013df:	8b 44 24 08          	mov    0x8(%esp),%eax
  8013e3:	09 c1                	or     %eax,%ecx
  8013e5:	89 d8                	mov    %ebx,%eax
  8013e7:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  8013eb:	89 e9                	mov    %ebp,%ecx
  8013ed:	d3 e7                	shl    %cl,%edi
  8013ef:	89 d1                	mov    %edx,%ecx
  8013f1:	d3 e8                	shr    %cl,%eax
  8013f3:	89 e9                	mov    %ebp,%ecx
  8013f5:	89 7c 24 0c          	mov    %edi,0xc(%esp)
  8013f9:	d3 e3                	shl    %cl,%ebx
  8013fb:	89 c7                	mov    %eax,%edi
  8013fd:	89 d1                	mov    %edx,%ecx
  8013ff:	89 f0                	mov    %esi,%eax
  801401:	d3 e8                	shr    %cl,%eax
  801403:	89 fa                	mov    %edi,%edx
  801405:	89 e9                	mov    %ebp,%ecx
  801407:	09 d8                	or     %ebx,%eax
  801409:	d3 e6                	shl    %cl,%esi
  80140b:	f7 74 24 08          	divl   0x8(%esp)
  80140f:	89 d3                	mov    %edx,%ebx
  801411:	f7 64 24 0c          	mull   0xc(%esp)
  801415:	89 c7                	mov    %eax,%edi
  801417:	89 d1                	mov    %edx,%ecx
  801419:	39 d3                	cmp    %edx,%ebx
  80141b:	72 06                	jb     801423 <__umoddi3+0x103>
  80141d:	75 10                	jne    80142f <__umoddi3+0x10f>
  80141f:	39 c6                	cmp    %eax,%esi
  801421:	73 0c                	jae    80142f <__umoddi3+0x10f>
  801423:	2b 44 24 0c          	sub    0xc(%esp),%eax
  801427:	1b 54 24 08          	sbb    0x8(%esp),%edx
  80142b:	89 d1                	mov    %edx,%ecx
  80142d:	89 c7                	mov    %eax,%edi
  80142f:	89 f2                	mov    %esi,%edx
  801431:	29 fa                	sub    %edi,%edx
  801433:	19 cb                	sbb    %ecx,%ebx
  801435:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
  80143a:	89 d8                	mov    %ebx,%eax
  80143c:	d3 e0                	shl    %cl,%eax
  80143e:	89 e9                	mov    %ebp,%ecx
  801440:	d3 ea                	shr    %cl,%edx
  801442:	d3 eb                	shr    %cl,%ebx
  801444:	09 d0                	or     %edx,%eax
  801446:	89 da                	mov    %ebx,%edx
  801448:	83 c4 1c             	add    $0x1c,%esp
  80144b:	5b                   	pop    %ebx
  80144c:	5e                   	pop    %esi
  80144d:	5f                   	pop    %edi
  80144e:	5d                   	pop    %ebp
  80144f:	c3                   	ret
  801450:	89 da                	mov    %ebx,%edx
  801452:	89 f1                	mov    %esi,%ecx
  801454:	29 f9                	sub    %edi,%ecx
  801456:	19 c2                	sbb    %eax,%edx
  801458:	89 c8                	mov    %ecx,%eax
  80145a:	e9 2b ff ff ff       	jmp    80138a <__umoddi3+0x6a>
