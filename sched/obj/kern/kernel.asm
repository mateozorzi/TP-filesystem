
obj/kern/kernel:     formato del fichero elf32-i386


Desensamblado de la sección .text:

f0100000 <_start+0xeffffff4>:
f0100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
f0100006:	00 00                	add    %al,(%eax)
f0100008:	fe 4f 52             	decb   0x52(%edi)
f010000b:	e4                   	.byte 0xe4

f010000c <entry>:
f010000c:	66 c7 05 72 04 00 00 	movw   $0x1234,0x472
f0100013:	34 12 
f0100015:	b8 00 10 11 00       	mov    $0x111000,%eax
f010001a:	0f 22 d8             	mov    %eax,%cr3
f010001d:	0f 20 e0             	mov    %cr4,%eax
f0100020:	83 c8 10             	or     $0x10,%eax
f0100023:	0f 22 e0             	mov    %eax,%cr4
f0100026:	0f 20 c0             	mov    %cr0,%eax
f0100029:	0d 01 00 01 80       	or     $0x80010001,%eax
f010002e:	0f 22 c0             	mov    %eax,%cr0
f0100031:	b8 38 00 10 f0       	mov    $0xf0100038,%eax
f0100036:	ff e0                	jmp    *%eax

f0100038 <relocated>:
f0100038:	bd 00 00 00 00       	mov    $0x0,%ebp
f010003d:	bc 00 10 11 f0       	mov    $0xf0111000,%esp
f0100042:	e8 82 01 00 00       	call   f01001c9 <i386_init>

f0100047 <spin>:
f0100047:	eb fe                	jmp    f0100047 <spin>

f0100049 <lcr3>:
f0100049:	0f 22 d8             	mov    %eax,%cr3
f010004c:	c3                   	ret

f010004d <xchg>:
f010004d:	89 c1                	mov    %eax,%ecx
f010004f:	89 d0                	mov    %edx,%eax
f0100051:	f0 87 01             	lock xchg %eax,(%ecx)
f0100054:	c3                   	ret

f0100055 <lock_kernel>:
f0100055:	55                   	push   %ebp
f0100056:	89 e5                	mov    %esp,%ebp
f0100058:	83 ec 14             	sub    $0x14,%esp
f010005b:	68 c0 23 11 f0       	push   $0xf01123c0
f0100060:	e8 8f 65 00 00       	call   f01065f4 <spin_lock>
f0100065:	83 c4 10             	add    $0x10,%esp
f0100068:	c9                   	leave
f0100069:	c3                   	ret

f010006a <_panic>:
f010006a:	55                   	push   %ebp
f010006b:	89 e5                	mov    %esp,%ebp
f010006d:	53                   	push   %ebx
f010006e:	83 ec 04             	sub    $0x4,%esp
f0100071:	83 3d 00 90 18 f0 00 	cmpl   $0x0,0xf0189000
f0100078:	74 0f                	je     f0100089 <_panic+0x1f>
f010007a:	83 ec 0c             	sub    $0xc,%esp
f010007d:	6a 00                	push   $0x0
f010007f:	e8 76 0a 00 00       	call   f0100afa <monitor>
f0100084:	83 c4 10             	add    $0x10,%esp
f0100087:	eb f1                	jmp    f010007a <_panic+0x10>
f0100089:	8b 45 10             	mov    0x10(%ebp),%eax
f010008c:	a3 00 90 18 f0       	mov    %eax,0xf0189000
f0100091:	fa                   	cli
f0100092:	fc                   	cld
f0100093:	8d 5d 14             	lea    0x14(%ebp),%ebx
f0100096:	e8 61 62 00 00       	call   f01062fc <cpunum>
f010009b:	ff 75 0c             	push   0xc(%ebp)
f010009e:	ff 75 08             	push   0x8(%ebp)
f01000a1:	50                   	push   %eax
f01000a2:	68 a0 69 10 f0       	push   $0xf01069a0
f01000a7:	e8 8a 37 00 00       	call   f0103836 <cprintf>
f01000ac:	83 c4 08             	add    $0x8,%esp
f01000af:	53                   	push   %ebx
f01000b0:	ff 75 10             	push   0x10(%ebp)
f01000b3:	e8 58 37 00 00       	call   f0103810 <vcprintf>
f01000b8:	c7 04 24 0a 79 10 f0 	movl   $0xf010790a,(%esp)
f01000bf:	e8 72 37 00 00       	call   f0103836 <cprintf>
f01000c4:	83 c4 10             	add    $0x10,%esp
f01000c7:	eb b1                	jmp    f010007a <_panic+0x10>

f01000c9 <_kaddr>:
f01000c9:	55                   	push   %ebp
f01000ca:	89 e5                	mov    %esp,%ebp
f01000cc:	53                   	push   %ebx
f01000cd:	83 ec 04             	sub    $0x4,%esp
f01000d0:	89 cb                	mov    %ecx,%ebx
f01000d2:	c1 eb 0c             	shr    $0xc,%ebx
f01000d5:	3b 1d 60 92 18 f0    	cmp    0xf0189260,%ebx
f01000db:	73 0b                	jae    f01000e8 <_kaddr+0x1f>
f01000dd:	8d 81 00 00 00 f0    	lea    -0x10000000(%ecx),%eax
f01000e3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f01000e6:	c9                   	leave
f01000e7:	c3                   	ret
f01000e8:	51                   	push   %ecx
f01000e9:	68 cc 69 10 f0       	push   $0xf01069cc
f01000ee:	52                   	push   %edx
f01000ef:	50                   	push   %eax
f01000f0:	e8 75 ff ff ff       	call   f010006a <_panic>

f01000f5 <_paddr>:
f01000f5:	81 f9 ff ff ff ef    	cmp    $0xefffffff,%ecx
f01000fb:	76 07                	jbe    f0100104 <_paddr+0xf>
f01000fd:	8d 81 00 00 00 10    	lea    0x10000000(%ecx),%eax
f0100103:	c3                   	ret
f0100104:	55                   	push   %ebp
f0100105:	89 e5                	mov    %esp,%ebp
f0100107:	83 ec 08             	sub    $0x8,%esp
f010010a:	51                   	push   %ecx
f010010b:	68 f0 69 10 f0       	push   $0xf01069f0
f0100110:	52                   	push   %edx
f0100111:	50                   	push   %eax
f0100112:	e8 53 ff ff ff       	call   f010006a <_panic>

f0100117 <boot_aps>:
f0100117:	55                   	push   %ebp
f0100118:	89 e5                	mov    %esp,%ebp
f010011a:	56                   	push   %esi
f010011b:	53                   	push   %ebx
f010011c:	b9 00 70 00 00       	mov    $0x7000,%ecx
f0100121:	ba 62 00 00 00       	mov    $0x62,%edx
f0100126:	b8 10 79 10 f0       	mov    $0xf0107910,%eax
f010012b:	e8 99 ff ff ff       	call   f01000c9 <_kaddr>
f0100130:	89 c6                	mov    %eax,%esi
f0100132:	83 ec 04             	sub    $0x4,%esp
f0100135:	b8 fe 5e 10 f0       	mov    $0xf0105efe,%eax
f010013a:	2d 7c 5e 10 f0       	sub    $0xf0105e7c,%eax
f010013f:	50                   	push   %eax
f0100140:	68 7c 5e 10 f0       	push   $0xf0105e7c
f0100145:	56                   	push   %esi
f0100146:	e8 85 5b 00 00       	call   f0105cd0 <memmove>
f010014b:	83 c4 10             	add    $0x10,%esp
f010014e:	bb 20 d0 1c f0       	mov    $0xf01cd020,%ebx
f0100153:	eb 03                	jmp    f0100158 <boot_aps+0x41>
f0100155:	83 c3 74             	add    $0x74,%ebx
f0100158:	6b 05 00 d0 1c f0 74 	imul   $0x74,0xf01cd000,%eax
f010015f:	05 20 d0 1c f0       	add    $0xf01cd020,%eax
f0100164:	39 c3                	cmp    %eax,%ebx
f0100166:	73 5a                	jae    f01001c2 <boot_aps+0xab>
f0100168:	e8 8f 61 00 00       	call   f01062fc <cpunum>
f010016d:	6b c0 74             	imul   $0x74,%eax,%eax
f0100170:	05 20 d0 1c f0       	add    $0xf01cd020,%eax
f0100175:	39 c3                	cmp    %eax,%ebx
f0100177:	74 dc                	je     f0100155 <boot_aps+0x3e>
f0100179:	89 d8                	mov    %ebx,%eax
f010017b:	2d 20 d0 1c f0       	sub    $0xf01cd020,%eax
f0100180:	c1 f8 02             	sar    $0x2,%eax
f0100183:	69 c0 35 c2 72 4f    	imul   $0x4f72c235,%eax,%eax
f0100189:	c1 e0 0f             	shl    $0xf,%eax
f010018c:	8d 80 00 50 19 f0    	lea    -0xfe6b000(%eax),%eax
f0100192:	a3 04 90 18 f0       	mov    %eax,0xf0189004
f0100197:	89 f1                	mov    %esi,%ecx
f0100199:	ba 6d 00 00 00       	mov    $0x6d,%edx
f010019e:	b8 10 79 10 f0       	mov    $0xf0107910,%eax
f01001a3:	e8 4d ff ff ff       	call   f01000f5 <_paddr>
f01001a8:	83 ec 08             	sub    $0x8,%esp
f01001ab:	50                   	push   %eax
f01001ac:	0f b6 03             	movzbl (%ebx),%eax
f01001af:	50                   	push   %eax
f01001b0:	e8 af 62 00 00       	call   f0106464 <lapic_startap>
f01001b5:	83 c4 10             	add    $0x10,%esp
f01001b8:	8b 43 04             	mov    0x4(%ebx),%eax
f01001bb:	83 f8 01             	cmp    $0x1,%eax
f01001be:	75 f8                	jne    f01001b8 <boot_aps+0xa1>
f01001c0:	eb 93                	jmp    f0100155 <boot_aps+0x3e>
f01001c2:	8d 65 f8             	lea    -0x8(%ebp),%esp
f01001c5:	5b                   	pop    %ebx
f01001c6:	5e                   	pop    %esi
f01001c7:	5d                   	pop    %ebp
f01001c8:	c3                   	ret

f01001c9 <i386_init>:
f01001c9:	55                   	push   %ebp
f01001ca:	89 e5                	mov    %esp,%ebp
f01001cc:	83 ec 0c             	sub    $0xc,%esp
f01001cf:	b8 c8 d3 1c f0       	mov    $0xf01cd3c8,%eax
f01001d4:	2d 00 90 18 f0       	sub    $0xf0189000,%eax
f01001d9:	50                   	push   %eax
f01001da:	6a 00                	push   $0x0
f01001dc:	68 00 90 18 f0       	push   $0xf0189000
f01001e1:	e8 b1 5a 00 00       	call   f0105c97 <memset>
f01001e6:	e8 bc 06 00 00       	call   f01008a7 <cons_init>
f01001eb:	83 c4 08             	add    $0x8,%esp
f01001ee:	68 ac 1a 00 00       	push   $0x1aac
f01001f3:	68 1c 79 10 f0       	push   $0xf010791c
f01001f8:	e8 39 36 00 00       	call   f0103836 <cprintf>
f01001fd:	e8 a8 29 00 00       	call   f0102baa <mem_init>
f0100202:	e8 83 2f 00 00       	call   f010318a <env_init>
f0100207:	e8 41 37 00 00       	call   f010394d <trap_init>
f010020c:	e8 32 5f 00 00       	call   f0106143 <mp_init>
f0100211:	e8 fc 60 00 00       	call   f0106312 <lapic_init>
f0100216:	e8 d9 34 00 00       	call   f01036f4 <pic_init>
f010021b:	e8 35 fe ff ff       	call   f0100055 <lock_kernel>
f0100220:	e8 f2 fe ff ff       	call   f0100117 <boot_aps>
f0100225:	83 c4 08             	add    $0x8,%esp
f0100228:	6a 00                	push   $0x0
f010022a:	68 50 7c 16 f0       	push   $0xf0167c50
f010022f:	e8 ed 30 00 00       	call   f0103321 <env_create>
f0100234:	e8 9d 46 00 00       	call   f01048d6 <sched_yield>

f0100239 <mp_main>:
f0100239:	55                   	push   %ebp
f010023a:	89 e5                	mov    %esp,%ebp
f010023c:	83 ec 08             	sub    $0x8,%esp
f010023f:	8b 0d 5c 92 18 f0    	mov    0xf018925c,%ecx
f0100245:	ba 79 00 00 00       	mov    $0x79,%edx
f010024a:	b8 10 79 10 f0       	mov    $0xf0107910,%eax
f010024f:	e8 a1 fe ff ff       	call   f01000f5 <_paddr>
f0100254:	e8 f0 fd ff ff       	call   f0100049 <lcr3>
f0100259:	e8 9e 60 00 00       	call   f01062fc <cpunum>
f010025e:	83 ec 08             	sub    $0x8,%esp
f0100261:	50                   	push   %eax
f0100262:	68 37 79 10 f0       	push   $0xf0107937
f0100267:	e8 ca 35 00 00       	call   f0103836 <cprintf>
f010026c:	e8 a1 60 00 00       	call   f0106312 <lapic_init>
f0100271:	e8 dd 2e 00 00       	call   f0103153 <env_init_percpu>
f0100276:	e8 29 36 00 00       	call   f01038a4 <trap_init_percpu>
f010027b:	e8 7c 60 00 00       	call   f01062fc <cpunum>
f0100280:	6b c0 74             	imul   $0x74,%eax,%eax
f0100283:	05 24 d0 1c f0       	add    $0xf01cd024,%eax
f0100288:	ba 01 00 00 00       	mov    $0x1,%edx
f010028d:	e8 bb fd ff ff       	call   f010004d <xchg>
f0100292:	e8 be fd ff ff       	call   f0100055 <lock_kernel>
f0100297:	e8 3a 46 00 00       	call   f01048d6 <sched_yield>

f010029c <_warn>:
f010029c:	55                   	push   %ebp
f010029d:	89 e5                	mov    %esp,%ebp
f010029f:	53                   	push   %ebx
f01002a0:	83 ec 08             	sub    $0x8,%esp
f01002a3:	8d 5d 14             	lea    0x14(%ebp),%ebx
f01002a6:	ff 75 0c             	push   0xc(%ebp)
f01002a9:	ff 75 08             	push   0x8(%ebp)
f01002ac:	68 4d 79 10 f0       	push   $0xf010794d
f01002b1:	e8 80 35 00 00       	call   f0103836 <cprintf>
f01002b6:	83 c4 08             	add    $0x8,%esp
f01002b9:	53                   	push   %ebx
f01002ba:	ff 75 10             	push   0x10(%ebp)
f01002bd:	e8 4e 35 00 00       	call   f0103810 <vcprintf>
f01002c2:	c7 04 24 ea 80 10 f0 	movl   $0xf01080ea,(%esp)
f01002c9:	e8 68 35 00 00       	call   f0103836 <cprintf>
f01002ce:	83 c4 10             	add    $0x10,%esp
f01002d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f01002d4:	c9                   	leave
f01002d5:	c3                   	ret

f01002d6 <inb>:
f01002d6:	89 c2                	mov    %eax,%edx
f01002d8:	ec                   	in     (%dx),%al
f01002d9:	c3                   	ret

f01002da <outb>:
f01002da:	89 c1                	mov    %eax,%ecx
f01002dc:	89 d0                	mov    %edx,%eax
f01002de:	89 ca                	mov    %ecx,%edx
f01002e0:	ee                   	out    %al,(%dx)
f01002e1:	c3                   	ret

f01002e2 <delay>:
f01002e2:	55                   	push   %ebp
f01002e3:	89 e5                	mov    %esp,%ebp
f01002e5:	83 ec 08             	sub    $0x8,%esp
f01002e8:	b8 84 00 00 00       	mov    $0x84,%eax
f01002ed:	e8 e4 ff ff ff       	call   f01002d6 <inb>
f01002f2:	b8 84 00 00 00       	mov    $0x84,%eax
f01002f7:	e8 da ff ff ff       	call   f01002d6 <inb>
f01002fc:	b8 84 00 00 00       	mov    $0x84,%eax
f0100301:	e8 d0 ff ff ff       	call   f01002d6 <inb>
f0100306:	b8 84 00 00 00       	mov    $0x84,%eax
f010030b:	e8 c6 ff ff ff       	call   f01002d6 <inb>
f0100310:	c9                   	leave
f0100311:	c3                   	ret

f0100312 <serial_proc_data>:
f0100312:	55                   	push   %ebp
f0100313:	89 e5                	mov    %esp,%ebp
f0100315:	83 ec 08             	sub    $0x8,%esp
f0100318:	b8 fd 03 00 00       	mov    $0x3fd,%eax
f010031d:	e8 b4 ff ff ff       	call   f01002d6 <inb>
f0100322:	a8 01                	test   $0x1,%al
f0100324:	74 0f                	je     f0100335 <serial_proc_data+0x23>
f0100326:	b8 f8 03 00 00       	mov    $0x3f8,%eax
f010032b:	e8 a6 ff ff ff       	call   f01002d6 <inb>
f0100330:	0f b6 c0             	movzbl %al,%eax
f0100333:	c9                   	leave
f0100334:	c3                   	ret
f0100335:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
f010033a:	eb f7                	jmp    f0100333 <serial_proc_data+0x21>

f010033c <serial_putc>:
f010033c:	55                   	push   %ebp
f010033d:	89 e5                	mov    %esp,%ebp
f010033f:	56                   	push   %esi
f0100340:	53                   	push   %ebx
f0100341:	89 c6                	mov    %eax,%esi
f0100343:	bb 00 00 00 00       	mov    $0x0,%ebx
f0100348:	b8 fd 03 00 00       	mov    $0x3fd,%eax
f010034d:	e8 84 ff ff ff       	call   f01002d6 <inb>
f0100352:	a8 20                	test   $0x20,%al
f0100354:	75 12                	jne    f0100368 <serial_putc+0x2c>
f0100356:	81 fb ff 31 00 00    	cmp    $0x31ff,%ebx
f010035c:	7f 0a                	jg     f0100368 <serial_putc+0x2c>
f010035e:	e8 7f ff ff ff       	call   f01002e2 <delay>
f0100363:	83 c3 01             	add    $0x1,%ebx
f0100366:	eb e0                	jmp    f0100348 <serial_putc+0xc>
f0100368:	89 f0                	mov    %esi,%eax
f010036a:	0f b6 d0             	movzbl %al,%edx
f010036d:	b8 f8 03 00 00       	mov    $0x3f8,%eax
f0100372:	e8 63 ff ff ff       	call   f01002da <outb>
f0100377:	5b                   	pop    %ebx
f0100378:	5e                   	pop    %esi
f0100379:	5d                   	pop    %ebp
f010037a:	c3                   	ret

f010037b <serial_init>:
f010037b:	55                   	push   %ebp
f010037c:	89 e5                	mov    %esp,%ebp
f010037e:	83 ec 08             	sub    $0x8,%esp
f0100381:	ba 00 00 00 00       	mov    $0x0,%edx
f0100386:	b8 fa 03 00 00       	mov    $0x3fa,%eax
f010038b:	e8 4a ff ff ff       	call   f01002da <outb>
f0100390:	ba 80 00 00 00       	mov    $0x80,%edx
f0100395:	b8 fb 03 00 00       	mov    $0x3fb,%eax
f010039a:	e8 3b ff ff ff       	call   f01002da <outb>
f010039f:	ba 0c 00 00 00       	mov    $0xc,%edx
f01003a4:	b8 f8 03 00 00       	mov    $0x3f8,%eax
f01003a9:	e8 2c ff ff ff       	call   f01002da <outb>
f01003ae:	ba 00 00 00 00       	mov    $0x0,%edx
f01003b3:	b8 f9 03 00 00       	mov    $0x3f9,%eax
f01003b8:	e8 1d ff ff ff       	call   f01002da <outb>
f01003bd:	ba 03 00 00 00       	mov    $0x3,%edx
f01003c2:	b8 fb 03 00 00       	mov    $0x3fb,%eax
f01003c7:	e8 0e ff ff ff       	call   f01002da <outb>
f01003cc:	ba 00 00 00 00       	mov    $0x0,%edx
f01003d1:	b8 fc 03 00 00       	mov    $0x3fc,%eax
f01003d6:	e8 ff fe ff ff       	call   f01002da <outb>
f01003db:	ba 01 00 00 00       	mov    $0x1,%edx
f01003e0:	b8 f9 03 00 00       	mov    $0x3f9,%eax
f01003e5:	e8 f0 fe ff ff       	call   f01002da <outb>
f01003ea:	b8 fd 03 00 00       	mov    $0x3fd,%eax
f01003ef:	e8 e2 fe ff ff       	call   f01002d6 <inb>
f01003f4:	3c ff                	cmp    $0xff,%al
f01003f6:	0f 95 05 54 92 18 f0 	setne  0xf0189254
f01003fd:	b8 fa 03 00 00       	mov    $0x3fa,%eax
f0100402:	e8 cf fe ff ff       	call   f01002d6 <inb>
f0100407:	b8 f8 03 00 00       	mov    $0x3f8,%eax
f010040c:	e8 c5 fe ff ff       	call   f01002d6 <inb>
f0100411:	c9                   	leave
f0100412:	c3                   	ret

f0100413 <lpt_putc>:
f0100413:	55                   	push   %ebp
f0100414:	89 e5                	mov    %esp,%ebp
f0100416:	56                   	push   %esi
f0100417:	53                   	push   %ebx
f0100418:	89 c6                	mov    %eax,%esi
f010041a:	bb 00 00 00 00       	mov    $0x0,%ebx
f010041f:	b8 79 03 00 00       	mov    $0x379,%eax
f0100424:	e8 ad fe ff ff       	call   f01002d6 <inb>
f0100429:	81 fb ff 31 00 00    	cmp    $0x31ff,%ebx
f010042f:	7f 0e                	jg     f010043f <lpt_putc+0x2c>
f0100431:	84 c0                	test   %al,%al
f0100433:	78 0a                	js     f010043f <lpt_putc+0x2c>
f0100435:	e8 a8 fe ff ff       	call   f01002e2 <delay>
f010043a:	83 c3 01             	add    $0x1,%ebx
f010043d:	eb e0                	jmp    f010041f <lpt_putc+0xc>
f010043f:	89 f0                	mov    %esi,%eax
f0100441:	0f b6 d0             	movzbl %al,%edx
f0100444:	b8 78 03 00 00       	mov    $0x378,%eax
f0100449:	e8 8c fe ff ff       	call   f01002da <outb>
f010044e:	ba 0d 00 00 00       	mov    $0xd,%edx
f0100453:	b8 7a 03 00 00       	mov    $0x37a,%eax
f0100458:	e8 7d fe ff ff       	call   f01002da <outb>
f010045d:	ba 08 00 00 00       	mov    $0x8,%edx
f0100462:	b8 7a 03 00 00       	mov    $0x37a,%eax
f0100467:	e8 6e fe ff ff       	call   f01002da <outb>
f010046c:	5b                   	pop    %ebx
f010046d:	5e                   	pop    %esi
f010046e:	5d                   	pop    %ebp
f010046f:	c3                   	ret

f0100470 <cga_init>:
f0100470:	55                   	push   %ebp
f0100471:	89 e5                	mov    %esp,%ebp
f0100473:	57                   	push   %edi
f0100474:	56                   	push   %esi
f0100475:	53                   	push   %ebx
f0100476:	83 ec 1c             	sub    $0x1c,%esp
f0100479:	0f b7 15 00 80 0b f0 	movzwl 0xf00b8000,%edx
f0100480:	66 c7 05 00 80 0b f0 	movw   $0xa55a,0xf00b8000
f0100487:	5a a5 
f0100489:	0f b7 05 00 80 0b f0 	movzwl 0xf00b8000,%eax
f0100490:	be b4 03 00 00       	mov    $0x3b4,%esi
f0100495:	c7 45 e4 00 00 0b f0 	movl   $0xf00b0000,-0x1c(%ebp)
f010049c:	66 3d 5a a5          	cmp    $0xa55a,%ax
f01004a0:	74 51                	je     f01004f3 <cga_init+0x83>
f01004a2:	89 35 50 92 18 f0    	mov    %esi,0xf0189250
f01004a8:	ba 0e 00 00 00       	mov    $0xe,%edx
f01004ad:	89 f0                	mov    %esi,%eax
f01004af:	e8 26 fe ff ff       	call   f01002da <outb>
f01004b4:	8d 7e 01             	lea    0x1(%esi),%edi
f01004b7:	89 f8                	mov    %edi,%eax
f01004b9:	e8 18 fe ff ff       	call   f01002d6 <inb>
f01004be:	0f b6 d8             	movzbl %al,%ebx
f01004c1:	c1 e3 08             	shl    $0x8,%ebx
f01004c4:	ba 0f 00 00 00       	mov    $0xf,%edx
f01004c9:	89 f0                	mov    %esi,%eax
f01004cb:	e8 0a fe ff ff       	call   f01002da <outb>
f01004d0:	89 f8                	mov    %edi,%eax
f01004d2:	e8 ff fd ff ff       	call   f01002d6 <inb>
f01004d7:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
f01004da:	89 0d 4c 92 18 f0    	mov    %ecx,0xf018924c
f01004e0:	0f b6 c0             	movzbl %al,%eax
f01004e3:	09 d8                	or     %ebx,%eax
f01004e5:	66 a3 48 92 18 f0    	mov    %ax,0xf0189248
f01004eb:	83 c4 1c             	add    $0x1c,%esp
f01004ee:	5b                   	pop    %ebx
f01004ef:	5e                   	pop    %esi
f01004f0:	5f                   	pop    %edi
f01004f1:	5d                   	pop    %ebp
f01004f2:	c3                   	ret
f01004f3:	66 89 15 00 80 0b f0 	mov    %dx,0xf00b8000
f01004fa:	be d4 03 00 00       	mov    $0x3d4,%esi
f01004ff:	c7 45 e4 00 80 0b f0 	movl   $0xf00b8000,-0x1c(%ebp)
f0100506:	eb 9a                	jmp    f01004a2 <cga_init+0x32>

f0100508 <cons_intr>:
f0100508:	55                   	push   %ebp
f0100509:	89 e5                	mov    %esp,%ebp
f010050b:	53                   	push   %ebx
f010050c:	83 ec 04             	sub    $0x4,%esp
f010050f:	89 c3                	mov    %eax,%ebx
f0100511:	eb 23                	jmp    f0100536 <cons_intr+0x2e>
f0100513:	8b 0d 44 92 18 f0    	mov    0xf0189244,%ecx
f0100519:	8d 51 01             	lea    0x1(%ecx),%edx
f010051c:	88 81 40 90 18 f0    	mov    %al,-0xfe76fc0(%ecx)
f0100522:	81 fa 00 02 00 00    	cmp    $0x200,%edx
f0100528:	b8 00 00 00 00       	mov    $0x0,%eax
f010052d:	0f 44 d0             	cmove  %eax,%edx
f0100530:	89 15 44 92 18 f0    	mov    %edx,0xf0189244
f0100536:	ff d3                	call   *%ebx
f0100538:	83 f8 ff             	cmp    $0xffffffff,%eax
f010053b:	74 06                	je     f0100543 <cons_intr+0x3b>
f010053d:	85 c0                	test   %eax,%eax
f010053f:	75 d2                	jne    f0100513 <cons_intr+0xb>
f0100541:	eb f3                	jmp    f0100536 <cons_intr+0x2e>
f0100543:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f0100546:	c9                   	leave
f0100547:	c3                   	ret

f0100548 <kbd_proc_data>:
f0100548:	55                   	push   %ebp
f0100549:	89 e5                	mov    %esp,%ebp
f010054b:	53                   	push   %ebx
f010054c:	83 ec 04             	sub    $0x4,%esp
f010054f:	b8 64 00 00 00       	mov    $0x64,%eax
f0100554:	e8 7d fd ff ff       	call   f01002d6 <inb>
f0100559:	a8 01                	test   $0x1,%al
f010055b:	0f 84 f7 00 00 00    	je     f0100658 <kbd_proc_data+0x110>
f0100561:	a8 20                	test   $0x20,%al
f0100563:	0f 85 f6 00 00 00    	jne    f010065f <kbd_proc_data+0x117>
f0100569:	b8 60 00 00 00       	mov    $0x60,%eax
f010056e:	e8 63 fd ff ff       	call   f01002d6 <inb>
f0100573:	3c e0                	cmp    $0xe0,%al
f0100575:	74 61                	je     f01005d8 <kbd_proc_data+0x90>
f0100577:	84 c0                	test   %al,%al
f0100579:	78 70                	js     f01005eb <kbd_proc_data+0xa3>
f010057b:	8b 15 20 90 18 f0    	mov    0xf0189020,%edx
f0100581:	f6 c2 40             	test   $0x40,%dl
f0100584:	74 0c                	je     f0100592 <kbd_proc_data+0x4a>
f0100586:	83 c8 80             	or     $0xffffff80,%eax
f0100589:	83 e2 bf             	and    $0xffffffbf,%edx
f010058c:	89 15 20 90 18 f0    	mov    %edx,0xf0189020
f0100592:	0f b6 c0             	movzbl %al,%eax
f0100595:	0f b6 90 c0 83 10 f0 	movzbl -0xfef7c40(%eax),%edx
f010059c:	0b 15 20 90 18 f0    	or     0xf0189020,%edx
f01005a2:	0f b6 88 c0 82 10 f0 	movzbl -0xfef7d40(%eax),%ecx
f01005a9:	31 ca                	xor    %ecx,%edx
f01005ab:	89 15 20 90 18 f0    	mov    %edx,0xf0189020
f01005b1:	89 d1                	mov    %edx,%ecx
f01005b3:	83 e1 03             	and    $0x3,%ecx
f01005b6:	8b 0c 8d a0 82 10 f0 	mov    -0xfef7d60(,%ecx,4),%ecx
f01005bd:	0f b6 04 01          	movzbl (%ecx,%eax,1),%eax
f01005c1:	0f b6 d8             	movzbl %al,%ebx
f01005c4:	f6 c2 08             	test   $0x8,%dl
f01005c7:	74 5f                	je     f0100628 <kbd_proc_data+0xe0>
f01005c9:	89 d8                	mov    %ebx,%eax
f01005cb:	8d 4b 9f             	lea    -0x61(%ebx),%ecx
f01005ce:	83 f9 19             	cmp    $0x19,%ecx
f01005d1:	77 49                	ja     f010061c <kbd_proc_data+0xd4>
f01005d3:	83 eb 20             	sub    $0x20,%ebx
f01005d6:	eb 0c                	jmp    f01005e4 <kbd_proc_data+0x9c>
f01005d8:	83 0d 20 90 18 f0 40 	orl    $0x40,0xf0189020
f01005df:	bb 00 00 00 00       	mov    $0x0,%ebx
f01005e4:	89 d8                	mov    %ebx,%eax
f01005e6:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f01005e9:	c9                   	leave
f01005ea:	c3                   	ret
f01005eb:	8b 15 20 90 18 f0    	mov    0xf0189020,%edx
f01005f1:	89 c1                	mov    %eax,%ecx
f01005f3:	83 e1 7f             	and    $0x7f,%ecx
f01005f6:	f6 c2 40             	test   $0x40,%dl
f01005f9:	0f 44 c1             	cmove  %ecx,%eax
f01005fc:	0f b6 c0             	movzbl %al,%eax
f01005ff:	0f b6 80 c0 83 10 f0 	movzbl -0xfef7c40(%eax),%eax
f0100606:	83 c8 40             	or     $0x40,%eax
f0100609:	0f b6 c0             	movzbl %al,%eax
f010060c:	f7 d0                	not    %eax
f010060e:	21 d0                	and    %edx,%eax
f0100610:	a3 20 90 18 f0       	mov    %eax,0xf0189020
f0100615:	bb 00 00 00 00       	mov    $0x0,%ebx
f010061a:	eb c8                	jmp    f01005e4 <kbd_proc_data+0x9c>
f010061c:	83 e8 41             	sub    $0x41,%eax
f010061f:	8d 4b 20             	lea    0x20(%ebx),%ecx
f0100622:	83 f8 1a             	cmp    $0x1a,%eax
f0100625:	0f 42 d9             	cmovb  %ecx,%ebx
f0100628:	f7 d2                	not    %edx
f010062a:	f6 c2 06             	test   $0x6,%dl
f010062d:	75 b5                	jne    f01005e4 <kbd_proc_data+0x9c>
f010062f:	81 fb e9 00 00 00    	cmp    $0xe9,%ebx
f0100635:	75 ad                	jne    f01005e4 <kbd_proc_data+0x9c>
f0100637:	83 ec 0c             	sub    $0xc,%esp
f010063a:	68 67 79 10 f0       	push   $0xf0107967
f010063f:	e8 f2 31 00 00       	call   f0103836 <cprintf>
f0100644:	ba 03 00 00 00       	mov    $0x3,%edx
f0100649:	b8 92 00 00 00       	mov    $0x92,%eax
f010064e:	e8 87 fc ff ff       	call   f01002da <outb>
f0100653:	83 c4 10             	add    $0x10,%esp
f0100656:	eb 8c                	jmp    f01005e4 <kbd_proc_data+0x9c>
f0100658:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
f010065d:	eb 85                	jmp    f01005e4 <kbd_proc_data+0x9c>
f010065f:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
f0100664:	e9 7b ff ff ff       	jmp    f01005e4 <kbd_proc_data+0x9c>

f0100669 <cga_putc>:
f0100669:	55                   	push   %ebp
f010066a:	89 e5                	mov    %esp,%ebp
f010066c:	57                   	push   %edi
f010066d:	56                   	push   %esi
f010066e:	53                   	push   %ebx
f010066f:	83 ec 0c             	sub    $0xc,%esp
f0100672:	89 c2                	mov    %eax,%edx
f0100674:	80 ce 07             	or     $0x7,%dh
f0100677:	3d 00 01 00 00       	cmp    $0x100,%eax
f010067c:	0f 42 c2             	cmovb  %edx,%eax
f010067f:	3c 0a                	cmp    $0xa,%al
f0100681:	0f 84 f0 00 00 00    	je     f0100777 <cga_putc+0x10e>
f0100687:	0f b6 d0             	movzbl %al,%edx
f010068a:	83 fa 0a             	cmp    $0xa,%edx
f010068d:	7f 46                	jg     f01006d5 <cga_putc+0x6c>
f010068f:	83 fa 08             	cmp    $0x8,%edx
f0100692:	0f 84 b5 00 00 00    	je     f010074d <cga_putc+0xe4>
f0100698:	83 fa 09             	cmp    $0x9,%edx
f010069b:	0f 85 e3 00 00 00    	jne    f0100784 <cga_putc+0x11b>
f01006a1:	b8 20 00 00 00       	mov    $0x20,%eax
f01006a6:	e8 46 01 00 00       	call   f01007f1 <cons_putc>
f01006ab:	b8 20 00 00 00       	mov    $0x20,%eax
f01006b0:	e8 3c 01 00 00       	call   f01007f1 <cons_putc>
f01006b5:	b8 20 00 00 00       	mov    $0x20,%eax
f01006ba:	e8 32 01 00 00       	call   f01007f1 <cons_putc>
f01006bf:	b8 20 00 00 00       	mov    $0x20,%eax
f01006c4:	e8 28 01 00 00       	call   f01007f1 <cons_putc>
f01006c9:	b8 20 00 00 00       	mov    $0x20,%eax
f01006ce:	e8 1e 01 00 00       	call   f01007f1 <cons_putc>
f01006d3:	eb 25                	jmp    f01006fa <cga_putc+0x91>
f01006d5:	83 fa 0d             	cmp    $0xd,%edx
f01006d8:	0f 85 a6 00 00 00    	jne    f0100784 <cga_putc+0x11b>
f01006de:	0f b7 05 48 92 18 f0 	movzwl 0xf0189248,%eax
f01006e5:	69 c0 cd cc 00 00    	imul   $0xcccd,%eax,%eax
f01006eb:	c1 e8 16             	shr    $0x16,%eax
f01006ee:	8d 04 80             	lea    (%eax,%eax,4),%eax
f01006f1:	c1 e0 04             	shl    $0x4,%eax
f01006f4:	66 a3 48 92 18 f0    	mov    %ax,0xf0189248
f01006fa:	66 81 3d 48 92 18 f0 	cmpw   $0x7cf,0xf0189248
f0100701:	cf 07 
f0100703:	0f 87 9e 00 00 00    	ja     f01007a7 <cga_putc+0x13e>
f0100709:	8b 3d 50 92 18 f0    	mov    0xf0189250,%edi
f010070f:	ba 0e 00 00 00       	mov    $0xe,%edx
f0100714:	89 f8                	mov    %edi,%eax
f0100716:	e8 bf fb ff ff       	call   f01002da <outb>
f010071b:	0f b7 1d 48 92 18 f0 	movzwl 0xf0189248,%ebx
f0100722:	8d 77 01             	lea    0x1(%edi),%esi
f0100725:	0f b6 d7             	movzbl %bh,%edx
f0100728:	89 f0                	mov    %esi,%eax
f010072a:	e8 ab fb ff ff       	call   f01002da <outb>
f010072f:	ba 0f 00 00 00       	mov    $0xf,%edx
f0100734:	89 f8                	mov    %edi,%eax
f0100736:	e8 9f fb ff ff       	call   f01002da <outb>
f010073b:	0f b6 d3             	movzbl %bl,%edx
f010073e:	89 f0                	mov    %esi,%eax
f0100740:	e8 95 fb ff ff       	call   f01002da <outb>
f0100745:	8d 65 f4             	lea    -0xc(%ebp),%esp
f0100748:	5b                   	pop    %ebx
f0100749:	5e                   	pop    %esi
f010074a:	5f                   	pop    %edi
f010074b:	5d                   	pop    %ebp
f010074c:	c3                   	ret
f010074d:	0f b7 15 48 92 18 f0 	movzwl 0xf0189248,%edx
f0100754:	66 85 d2             	test   %dx,%dx
f0100757:	74 b0                	je     f0100709 <cga_putc+0xa0>
f0100759:	83 ea 01             	sub    $0x1,%edx
f010075c:	66 89 15 48 92 18 f0 	mov    %dx,0xf0189248
f0100763:	0f b7 d2             	movzwl %dx,%edx
f0100766:	b0 00                	mov    $0x0,%al
f0100768:	83 c8 20             	or     $0x20,%eax
f010076b:	8b 0d 4c 92 18 f0    	mov    0xf018924c,%ecx
f0100771:	66 89 04 51          	mov    %ax,(%ecx,%edx,2)
f0100775:	eb 83                	jmp    f01006fa <cga_putc+0x91>
f0100777:	66 83 05 48 92 18 f0 	addw   $0x50,0xf0189248
f010077e:	50 
f010077f:	e9 5a ff ff ff       	jmp    f01006de <cga_putc+0x75>
f0100784:	0f b7 15 48 92 18 f0 	movzwl 0xf0189248,%edx
f010078b:	8d 4a 01             	lea    0x1(%edx),%ecx
f010078e:	66 89 0d 48 92 18 f0 	mov    %cx,0xf0189248
f0100795:	0f b7 d2             	movzwl %dx,%edx
f0100798:	8b 0d 4c 92 18 f0    	mov    0xf018924c,%ecx
f010079e:	66 89 04 51          	mov    %ax,(%ecx,%edx,2)
f01007a2:	e9 53 ff ff ff       	jmp    f01006fa <cga_putc+0x91>
f01007a7:	a1 4c 92 18 f0       	mov    0xf018924c,%eax
f01007ac:	83 ec 04             	sub    $0x4,%esp
f01007af:	68 00 0f 00 00       	push   $0xf00
f01007b4:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
f01007ba:	52                   	push   %edx
f01007bb:	50                   	push   %eax
f01007bc:	e8 0f 55 00 00       	call   f0105cd0 <memmove>
f01007c1:	8b 15 4c 92 18 f0    	mov    0xf018924c,%edx
f01007c7:	8d 82 00 0f 00 00    	lea    0xf00(%edx),%eax
f01007cd:	81 c2 a0 0f 00 00    	add    $0xfa0,%edx
f01007d3:	83 c4 10             	add    $0x10,%esp
f01007d6:	eb 08                	jmp    f01007e0 <cga_putc+0x177>
f01007d8:	66 c7 00 20 07       	movw   $0x720,(%eax)
f01007dd:	83 c0 02             	add    $0x2,%eax
f01007e0:	39 d0                	cmp    %edx,%eax
f01007e2:	75 f4                	jne    f01007d8 <cga_putc+0x16f>
f01007e4:	66 83 2d 48 92 18 f0 	subw   $0x50,0xf0189248
f01007eb:	50 
f01007ec:	e9 18 ff ff ff       	jmp    f0100709 <cga_putc+0xa0>

f01007f1 <cons_putc>:
f01007f1:	55                   	push   %ebp
f01007f2:	89 e5                	mov    %esp,%ebp
f01007f4:	53                   	push   %ebx
f01007f5:	83 ec 04             	sub    $0x4,%esp
f01007f8:	89 c3                	mov    %eax,%ebx
f01007fa:	e8 3d fb ff ff       	call   f010033c <serial_putc>
f01007ff:	89 d8                	mov    %ebx,%eax
f0100801:	e8 0d fc ff ff       	call   f0100413 <lpt_putc>
f0100806:	89 d8                	mov    %ebx,%eax
f0100808:	e8 5c fe ff ff       	call   f0100669 <cga_putc>
f010080d:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f0100810:	c9                   	leave
f0100811:	c3                   	ret

f0100812 <serial_intr>:
f0100812:	80 3d 54 92 18 f0 00 	cmpb   $0x0,0xf0189254
f0100819:	75 01                	jne    f010081c <serial_intr+0xa>
f010081b:	c3                   	ret
f010081c:	55                   	push   %ebp
f010081d:	89 e5                	mov    %esp,%ebp
f010081f:	83 ec 08             	sub    $0x8,%esp
f0100822:	b8 12 03 10 f0       	mov    $0xf0100312,%eax
f0100827:	e8 dc fc ff ff       	call   f0100508 <cons_intr>
f010082c:	c9                   	leave
f010082d:	c3                   	ret

f010082e <kbd_intr>:
f010082e:	55                   	push   %ebp
f010082f:	89 e5                	mov    %esp,%ebp
f0100831:	83 ec 08             	sub    $0x8,%esp
f0100834:	b8 48 05 10 f0       	mov    $0xf0100548,%eax
f0100839:	e8 ca fc ff ff       	call   f0100508 <cons_intr>
f010083e:	c9                   	leave
f010083f:	c3                   	ret

f0100840 <kbd_init>:
f0100840:	55                   	push   %ebp
f0100841:	89 e5                	mov    %esp,%ebp
f0100843:	83 ec 08             	sub    $0x8,%esp
f0100846:	e8 e3 ff ff ff       	call   f010082e <kbd_intr>
f010084b:	83 ec 0c             	sub    $0xc,%esp
f010084e:	0f b7 05 a8 23 11 f0 	movzwl 0xf01123a8,%eax
f0100855:	25 fd ff 00 00       	and    $0xfffd,%eax
f010085a:	50                   	push   %eax
f010085b:	e8 0b 2e 00 00       	call   f010366b <irq_setmask_8259A>
f0100860:	83 c4 10             	add    $0x10,%esp
f0100863:	c9                   	leave
f0100864:	c3                   	ret

f0100865 <cons_getc>:
f0100865:	55                   	push   %ebp
f0100866:	89 e5                	mov    %esp,%ebp
f0100868:	83 ec 08             	sub    $0x8,%esp
f010086b:	e8 a2 ff ff ff       	call   f0100812 <serial_intr>
f0100870:	e8 b9 ff ff ff       	call   f010082e <kbd_intr>
f0100875:	a1 40 92 18 f0       	mov    0xf0189240,%eax
f010087a:	ba 00 00 00 00       	mov    $0x0,%edx
f010087f:	3b 05 44 92 18 f0    	cmp    0xf0189244,%eax
f0100885:	74 1c                	je     f01008a3 <cons_getc+0x3e>
f0100887:	8d 48 01             	lea    0x1(%eax),%ecx
f010088a:	0f b6 90 40 90 18 f0 	movzbl -0xfe76fc0(%eax),%edx
f0100891:	3d ff 01 00 00       	cmp    $0x1ff,%eax
f0100896:	b8 00 00 00 00       	mov    $0x0,%eax
f010089b:	0f 45 c1             	cmovne %ecx,%eax
f010089e:	a3 40 92 18 f0       	mov    %eax,0xf0189240
f01008a3:	89 d0                	mov    %edx,%eax
f01008a5:	c9                   	leave
f01008a6:	c3                   	ret

f01008a7 <cons_init>:
f01008a7:	55                   	push   %ebp
f01008a8:	89 e5                	mov    %esp,%ebp
f01008aa:	83 ec 08             	sub    $0x8,%esp
f01008ad:	e8 be fb ff ff       	call   f0100470 <cga_init>
f01008b2:	e8 89 ff ff ff       	call   f0100840 <kbd_init>
f01008b7:	e8 bf fa ff ff       	call   f010037b <serial_init>
f01008bc:	80 3d 54 92 18 f0 00 	cmpb   $0x0,0xf0189254
f01008c3:	74 02                	je     f01008c7 <cons_init+0x20>
f01008c5:	c9                   	leave
f01008c6:	c3                   	ret
f01008c7:	83 ec 0c             	sub    $0xc,%esp
f01008ca:	68 73 79 10 f0       	push   $0xf0107973
f01008cf:	e8 62 2f 00 00       	call   f0103836 <cprintf>
f01008d4:	83 c4 10             	add    $0x10,%esp
f01008d7:	eb ec                	jmp    f01008c5 <cons_init+0x1e>

f01008d9 <cputchar>:
f01008d9:	55                   	push   %ebp
f01008da:	89 e5                	mov    %esp,%ebp
f01008dc:	83 ec 08             	sub    $0x8,%esp
f01008df:	8b 45 08             	mov    0x8(%ebp),%eax
f01008e2:	e8 0a ff ff ff       	call   f01007f1 <cons_putc>
f01008e7:	c9                   	leave
f01008e8:	c3                   	ret

f01008e9 <getchar>:
f01008e9:	55                   	push   %ebp
f01008ea:	89 e5                	mov    %esp,%ebp
f01008ec:	83 ec 08             	sub    $0x8,%esp
f01008ef:	e8 71 ff ff ff       	call   f0100865 <cons_getc>
f01008f4:	85 c0                	test   %eax,%eax
f01008f6:	74 f7                	je     f01008ef <getchar+0x6>
f01008f8:	c9                   	leave
f01008f9:	c3                   	ret

f01008fa <iscons>:
f01008fa:	b8 01 00 00 00       	mov    $0x1,%eax
f01008ff:	c3                   	ret

f0100900 <mon_help>:
f0100900:	55                   	push   %ebp
f0100901:	89 e5                	mov    %esp,%ebp
f0100903:	83 ec 0c             	sub    $0xc,%esp
f0100906:	68 90 79 10 f0       	push   $0xf0107990
f010090b:	68 ae 79 10 f0       	push   $0xf01079ae
f0100910:	68 b3 79 10 f0       	push   $0xf01079b3
f0100915:	e8 1c 2f 00 00       	call   f0103836 <cprintf>
f010091a:	83 c4 0c             	add    $0xc,%esp
f010091d:	68 14 6a 10 f0       	push   $0xf0106a14
f0100922:	68 bc 79 10 f0       	push   $0xf01079bc
f0100927:	68 b3 79 10 f0       	push   $0xf01079b3
f010092c:	e8 05 2f 00 00       	call   f0103836 <cprintf>
f0100931:	b8 00 00 00 00       	mov    $0x0,%eax
f0100936:	c9                   	leave
f0100937:	c3                   	ret

f0100938 <mon_kerninfo>:
f0100938:	55                   	push   %ebp
f0100939:	89 e5                	mov    %esp,%ebp
f010093b:	83 ec 14             	sub    $0x14,%esp
f010093e:	68 c5 79 10 f0       	push   $0xf01079c5
f0100943:	e8 ee 2e 00 00       	call   f0103836 <cprintf>
f0100948:	83 c4 08             	add    $0x8,%esp
f010094b:	68 0c 00 10 00       	push   $0x10000c
f0100950:	68 3c 6a 10 f0       	push   $0xf0106a3c
f0100955:	e8 dc 2e 00 00       	call   f0103836 <cprintf>
f010095a:	83 c4 0c             	add    $0xc,%esp
f010095d:	68 0c 00 10 00       	push   $0x10000c
f0100962:	68 0c 00 10 f0       	push   $0xf010000c
f0100967:	68 64 6a 10 f0       	push   $0xf0106a64
f010096c:	e8 c5 2e 00 00       	call   f0103836 <cprintf>
f0100971:	83 c4 0c             	add    $0xc,%esp
f0100974:	68 9f 69 10 00       	push   $0x10699f
f0100979:	68 9f 69 10 f0       	push   $0xf010699f
f010097e:	68 88 6a 10 f0       	push   $0xf0106a88
f0100983:	e8 ae 2e 00 00       	call   f0103836 <cprintf>
f0100988:	83 c4 0c             	add    $0xc,%esp
f010098b:	68 24 84 18 00       	push   $0x188424
f0100990:	68 24 84 18 f0       	push   $0xf0188424
f0100995:	68 ac 6a 10 f0       	push   $0xf0106aac
f010099a:	e8 97 2e 00 00       	call   f0103836 <cprintf>
f010099f:	83 c4 0c             	add    $0xc,%esp
f01009a2:	68 c8 d3 1c 00       	push   $0x1cd3c8
f01009a7:	68 c8 d3 1c f0       	push   $0xf01cd3c8
f01009ac:	68 d0 6a 10 f0       	push   $0xf0106ad0
f01009b1:	e8 80 2e 00 00       	call   f0103836 <cprintf>
f01009b6:	83 c4 08             	add    $0x8,%esp
f01009b9:	b8 c8 d3 1c f0       	mov    $0xf01cd3c8,%eax
f01009be:	2d 0d fc 0f f0       	sub    $0xf00ffc0d,%eax
f01009c3:	c1 f8 0a             	sar    $0xa,%eax
f01009c6:	50                   	push   %eax
f01009c7:	68 f4 6a 10 f0       	push   $0xf0106af4
f01009cc:	e8 65 2e 00 00       	call   f0103836 <cprintf>
f01009d1:	b8 00 00 00 00       	mov    $0x0,%eax
f01009d6:	c9                   	leave
f01009d7:	c3                   	ret

f01009d8 <runcmd>:
f01009d8:	55                   	push   %ebp
f01009d9:	89 e5                	mov    %esp,%ebp
f01009db:	57                   	push   %edi
f01009dc:	56                   	push   %esi
f01009dd:	53                   	push   %ebx
f01009de:	83 ec 5c             	sub    $0x5c,%esp
f01009e1:	89 c3                	mov    %eax,%ebx
f01009e3:	89 55 a4             	mov    %edx,-0x5c(%ebp)
f01009e6:	c7 45 a8 00 00 00 00 	movl   $0x0,-0x58(%ebp)
f01009ed:	be 00 00 00 00       	mov    $0x0,%esi
f01009f2:	eb 7a                	jmp    f0100a6e <runcmd+0x96>
f01009f4:	83 ec 08             	sub    $0x8,%esp
f01009f7:	0f be c0             	movsbl %al,%eax
f01009fa:	50                   	push   %eax
f01009fb:	68 de 79 10 f0       	push   $0xf01079de
f0100a00:	e8 53 52 00 00       	call   f0105c58 <strchr>
f0100a05:	83 c4 10             	add    $0x10,%esp
f0100a08:	85 c0                	test   %eax,%eax
f0100a0a:	74 0a                	je     f0100a16 <runcmd+0x3e>
f0100a0c:	c6 03 00             	movb   $0x0,(%ebx)
f0100a0f:	89 f7                	mov    %esi,%edi
f0100a11:	8d 5b 01             	lea    0x1(%ebx),%ebx
f0100a14:	eb 56                	jmp    f0100a6c <runcmd+0x94>
f0100a16:	80 3b 00             	cmpb   $0x0,(%ebx)
f0100a19:	74 5e                	je     f0100a79 <runcmd+0xa1>
f0100a1b:	83 fe 0f             	cmp    $0xf,%esi
f0100a1e:	74 09                	je     f0100a29 <runcmd+0x51>
f0100a20:	8d 7e 01             	lea    0x1(%esi),%edi
f0100a23:	89 5c b5 a8          	mov    %ebx,-0x58(%ebp,%esi,4)
f0100a27:	eb 24                	jmp    f0100a4d <runcmd+0x75>
f0100a29:	83 ec 08             	sub    $0x8,%esp
f0100a2c:	6a 10                	push   $0x10
f0100a2e:	68 e3 79 10 f0       	push   $0xf01079e3
f0100a33:	e8 fe 2d 00 00       	call   f0103836 <cprintf>
f0100a38:	83 c4 10             	add    $0x10,%esp
f0100a3b:	be 00 00 00 00       	mov    $0x0,%esi
f0100a40:	89 f0                	mov    %esi,%eax
f0100a42:	8d 65 f4             	lea    -0xc(%ebp),%esp
f0100a45:	5b                   	pop    %ebx
f0100a46:	5e                   	pop    %esi
f0100a47:	5f                   	pop    %edi
f0100a48:	5d                   	pop    %ebp
f0100a49:	c3                   	ret
f0100a4a:	83 c3 01             	add    $0x1,%ebx
f0100a4d:	0f b6 03             	movzbl (%ebx),%eax
f0100a50:	84 c0                	test   %al,%al
f0100a52:	74 18                	je     f0100a6c <runcmd+0x94>
f0100a54:	83 ec 08             	sub    $0x8,%esp
f0100a57:	0f be c0             	movsbl %al,%eax
f0100a5a:	50                   	push   %eax
f0100a5b:	68 de 79 10 f0       	push   $0xf01079de
f0100a60:	e8 f3 51 00 00       	call   f0105c58 <strchr>
f0100a65:	83 c4 10             	add    $0x10,%esp
f0100a68:	85 c0                	test   %eax,%eax
f0100a6a:	74 de                	je     f0100a4a <runcmd+0x72>
f0100a6c:	89 fe                	mov    %edi,%esi
f0100a6e:	0f b6 03             	movzbl (%ebx),%eax
f0100a71:	84 c0                	test   %al,%al
f0100a73:	0f 85 7b ff ff ff    	jne    f01009f4 <runcmd+0x1c>
f0100a79:	c7 44 b5 a8 00 00 00 	movl   $0x0,-0x58(%ebp,%esi,4)
f0100a80:	00 
f0100a81:	85 f6                	test   %esi,%esi
f0100a83:	74 bb                	je     f0100a40 <runcmd+0x68>
f0100a85:	83 ec 08             	sub    $0x8,%esp
f0100a88:	68 ae 79 10 f0       	push   $0xf01079ae
f0100a8d:	ff 75 a8             	push   -0x58(%ebp)
f0100a90:	e8 62 51 00 00       	call   f0105bf7 <strcmp>
f0100a95:	83 c4 10             	add    $0x10,%esp
f0100a98:	85 c0                	test   %eax,%eax
f0100a9a:	74 39                	je     f0100ad5 <runcmd+0xfd>
f0100a9c:	83 ec 08             	sub    $0x8,%esp
f0100a9f:	68 bc 79 10 f0       	push   $0xf01079bc
f0100aa4:	ff 75 a8             	push   -0x58(%ebp)
f0100aa7:	e8 4b 51 00 00       	call   f0105bf7 <strcmp>
f0100aac:	83 c4 10             	add    $0x10,%esp
f0100aaf:	85 c0                	test   %eax,%eax
f0100ab1:	74 1d                	je     f0100ad0 <runcmd+0xf8>
f0100ab3:	83 ec 08             	sub    $0x8,%esp
f0100ab6:	ff 75 a8             	push   -0x58(%ebp)
f0100ab9:	68 00 7a 10 f0       	push   $0xf0107a00
f0100abe:	e8 73 2d 00 00       	call   f0103836 <cprintf>
f0100ac3:	83 c4 10             	add    $0x10,%esp
f0100ac6:	be 00 00 00 00       	mov    $0x0,%esi
f0100acb:	e9 70 ff ff ff       	jmp    f0100a40 <runcmd+0x68>
f0100ad0:	b8 01 00 00 00       	mov    $0x1,%eax
f0100ad5:	83 ec 04             	sub    $0x4,%esp
f0100ad8:	8d 04 40             	lea    (%eax,%eax,2),%eax
f0100adb:	ff 75 a4             	push   -0x5c(%ebp)
f0100ade:	8d 55 a8             	lea    -0x58(%ebp),%edx
f0100ae1:	52                   	push   %edx
f0100ae2:	56                   	push   %esi
f0100ae3:	ff 14 85 c8 84 10 f0 	call   *-0xfef7b38(,%eax,4)
f0100aea:	89 c6                	mov    %eax,%esi
f0100aec:	83 c4 10             	add    $0x10,%esp
f0100aef:	e9 4c ff ff ff       	jmp    f0100a40 <runcmd+0x68>

f0100af4 <mon_backtrace>:
f0100af4:	b8 00 00 00 00       	mov    $0x0,%eax
f0100af9:	c3                   	ret

f0100afa <monitor>:
f0100afa:	55                   	push   %ebp
f0100afb:	89 e5                	mov    %esp,%ebp
f0100afd:	53                   	push   %ebx
f0100afe:	83 ec 10             	sub    $0x10,%esp
f0100b01:	8b 5d 08             	mov    0x8(%ebp),%ebx
f0100b04:	68 20 6b 10 f0       	push   $0xf0106b20
f0100b09:	e8 28 2d 00 00       	call   f0103836 <cprintf>
f0100b0e:	c7 04 24 44 6b 10 f0 	movl   $0xf0106b44,(%esp)
f0100b15:	e8 1c 2d 00 00       	call   f0103836 <cprintf>
f0100b1a:	83 c4 10             	add    $0x10,%esp
f0100b1d:	85 db                	test   %ebx,%ebx
f0100b1f:	74 0c                	je     f0100b2d <monitor+0x33>
f0100b21:	83 ec 0c             	sub    $0xc,%esp
f0100b24:	53                   	push   %ebx
f0100b25:	e8 1a 32 00 00       	call   f0103d44 <print_trapframe>
f0100b2a:	83 c4 10             	add    $0x10,%esp
f0100b2d:	83 ec 0c             	sub    $0xc,%esp
f0100b30:	68 16 7a 10 f0       	push   $0xf0107a16
f0100b35:	e8 ef 4e 00 00       	call   f0105a29 <readline>
f0100b3a:	83 c4 10             	add    $0x10,%esp
f0100b3d:	85 c0                	test   %eax,%eax
f0100b3f:	74 ec                	je     f0100b2d <monitor+0x33>
f0100b41:	89 da                	mov    %ebx,%edx
f0100b43:	e8 90 fe ff ff       	call   f01009d8 <runcmd>
f0100b48:	85 c0                	test   %eax,%eax
f0100b4a:	79 e1                	jns    f0100b2d <monitor+0x33>
f0100b4c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f0100b4f:	c9                   	leave
f0100b50:	c3                   	ret

f0100b51 <invlpg>:
f0100b51:	0f 01 38             	invlpg (%eax)
f0100b54:	c3                   	ret

f0100b55 <lcr0>:
f0100b55:	0f 22 c0             	mov    %eax,%cr0
f0100b58:	c3                   	ret

f0100b59 <rcr0>:
f0100b59:	0f 20 c0             	mov    %cr0,%eax
f0100b5c:	c3                   	ret

f0100b5d <lcr3>:
f0100b5d:	0f 22 d8             	mov    %eax,%cr3
f0100b60:	c3                   	ret

f0100b61 <page2pa>:
f0100b61:	2b 05 58 92 18 f0    	sub    0xf0189258,%eax
f0100b67:	c1 f8 03             	sar    $0x3,%eax
f0100b6a:	c1 e0 0c             	shl    $0xc,%eax
f0100b6d:	c3                   	ret

f0100b6e <nvram_read>:
f0100b6e:	55                   	push   %ebp
f0100b6f:	89 e5                	mov    %esp,%ebp
f0100b71:	56                   	push   %esi
f0100b72:	53                   	push   %ebx
f0100b73:	89 c3                	mov    %eax,%ebx
f0100b75:	83 ec 0c             	sub    $0xc,%esp
f0100b78:	50                   	push   %eax
f0100b79:	e8 9e 2a 00 00       	call   f010361c <mc146818_read>
f0100b7e:	89 c6                	mov    %eax,%esi
f0100b80:	83 c3 01             	add    $0x1,%ebx
f0100b83:	89 1c 24             	mov    %ebx,(%esp)
f0100b86:	e8 91 2a 00 00       	call   f010361c <mc146818_read>
f0100b8b:	c1 e0 08             	shl    $0x8,%eax
f0100b8e:	09 f0                	or     %esi,%eax
f0100b90:	8d 65 f8             	lea    -0x8(%ebp),%esp
f0100b93:	5b                   	pop    %ebx
f0100b94:	5e                   	pop    %esi
f0100b95:	5d                   	pop    %ebp
f0100b96:	c3                   	ret

f0100b97 <i386_detect_memory>:
f0100b97:	55                   	push   %ebp
f0100b98:	89 e5                	mov    %esp,%ebp
f0100b9a:	56                   	push   %esi
f0100b9b:	53                   	push   %ebx
f0100b9c:	b8 15 00 00 00       	mov    $0x15,%eax
f0100ba1:	e8 c8 ff ff ff       	call   f0100b6e <nvram_read>
f0100ba6:	89 c3                	mov    %eax,%ebx
f0100ba8:	b8 17 00 00 00       	mov    $0x17,%eax
f0100bad:	e8 bc ff ff ff       	call   f0100b6e <nvram_read>
f0100bb2:	89 c6                	mov    %eax,%esi
f0100bb4:	b8 34 00 00 00       	mov    $0x34,%eax
f0100bb9:	e8 b0 ff ff ff       	call   f0100b6e <nvram_read>
f0100bbe:	c1 e0 06             	shl    $0x6,%eax
f0100bc1:	74 2b                	je     f0100bee <i386_detect_memory+0x57>
f0100bc3:	05 00 40 00 00       	add    $0x4000,%eax
f0100bc8:	89 c2                	mov    %eax,%edx
f0100bca:	c1 ea 02             	shr    $0x2,%edx
f0100bcd:	89 15 60 92 18 f0    	mov    %edx,0xf0189260
f0100bd3:	89 c2                	mov    %eax,%edx
f0100bd5:	29 da                	sub    %ebx,%edx
f0100bd7:	52                   	push   %edx
f0100bd8:	53                   	push   %ebx
f0100bd9:	50                   	push   %eax
f0100bda:	68 6c 6b 10 f0       	push   $0xf0106b6c
f0100bdf:	e8 52 2c 00 00       	call   f0103836 <cprintf>
f0100be4:	83 c4 10             	add    $0x10,%esp
f0100be7:	8d 65 f8             	lea    -0x8(%ebp),%esp
f0100bea:	5b                   	pop    %ebx
f0100beb:	5e                   	pop    %esi
f0100bec:	5d                   	pop    %ebp
f0100bed:	c3                   	ret
f0100bee:	8d 86 00 04 00 00    	lea    0x400(%esi),%eax
f0100bf4:	85 f6                	test   %esi,%esi
f0100bf6:	0f 44 c3             	cmove  %ebx,%eax
f0100bf9:	eb cd                	jmp    f0100bc8 <i386_detect_memory+0x31>

f0100bfb <_kaddr>:
f0100bfb:	55                   	push   %ebp
f0100bfc:	89 e5                	mov    %esp,%ebp
f0100bfe:	53                   	push   %ebx
f0100bff:	83 ec 04             	sub    $0x4,%esp
f0100c02:	89 cb                	mov    %ecx,%ebx
f0100c04:	c1 eb 0c             	shr    $0xc,%ebx
f0100c07:	3b 1d 60 92 18 f0    	cmp    0xf0189260,%ebx
f0100c0d:	73 0b                	jae    f0100c1a <_kaddr+0x1f>
f0100c0f:	8d 81 00 00 00 f0    	lea    -0x10000000(%ecx),%eax
f0100c15:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f0100c18:	c9                   	leave
f0100c19:	c3                   	ret
f0100c1a:	51                   	push   %ecx
f0100c1b:	68 cc 69 10 f0       	push   $0xf01069cc
f0100c20:	52                   	push   %edx
f0100c21:	50                   	push   %eax
f0100c22:	e8 43 f4 ff ff       	call   f010006a <_panic>

f0100c27 <page2kva>:
f0100c27:	55                   	push   %ebp
f0100c28:	89 e5                	mov    %esp,%ebp
f0100c2a:	83 ec 08             	sub    $0x8,%esp
f0100c2d:	e8 2f ff ff ff       	call   f0100b61 <page2pa>
f0100c32:	89 c1                	mov    %eax,%ecx
f0100c34:	ba 58 00 00 00       	mov    $0x58,%edx
f0100c39:	b8 1a 7a 10 f0       	mov    $0xf0107a1a,%eax
f0100c3e:	e8 b8 ff ff ff       	call   f0100bfb <_kaddr>
f0100c43:	c9                   	leave
f0100c44:	c3                   	ret

f0100c45 <check_va2pa>:
f0100c45:	55                   	push   %ebp
f0100c46:	89 e5                	mov    %esp,%ebp
f0100c48:	53                   	push   %ebx
f0100c49:	83 ec 04             	sub    $0x4,%esp
f0100c4c:	89 d3                	mov    %edx,%ebx
f0100c4e:	c1 ea 16             	shr    $0x16,%edx
f0100c51:	8b 0c 90             	mov    (%eax,%edx,4),%ecx
f0100c54:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
f0100c59:	f6 c1 01             	test   $0x1,%cl
f0100c5c:	74 15                	je     f0100c73 <check_va2pa+0x2e>
f0100c5e:	f6 c1 80             	test   $0x80,%cl
f0100c61:	74 15                	je     f0100c78 <check_va2pa+0x33>
f0100c63:	81 e1 00 00 c0 ff    	and    $0xffc00000,%ecx
f0100c69:	81 e3 ff ff 3f 00    	and    $0x3fffff,%ebx
f0100c6f:	89 c8                	mov    %ecx,%eax
f0100c71:	09 d8                	or     %ebx,%eax
f0100c73:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f0100c76:	c9                   	leave
f0100c77:	c3                   	ret
f0100c78:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
f0100c7e:	ba 97 03 00 00       	mov    $0x397,%edx
f0100c83:	b8 28 7a 10 f0       	mov    $0xf0107a28,%eax
f0100c88:	e8 6e ff ff ff       	call   f0100bfb <_kaddr>
f0100c8d:	c1 eb 0c             	shr    $0xc,%ebx
f0100c90:	81 e3 ff 03 00 00    	and    $0x3ff,%ebx
f0100c96:	8b 14 98             	mov    (%eax,%ebx,4),%edx
f0100c99:	89 d0                	mov    %edx,%eax
f0100c9b:	25 00 f0 ff ff       	and    $0xfffff000,%eax
f0100ca0:	f6 c2 01             	test   $0x1,%dl
f0100ca3:	ba ff ff ff ff       	mov    $0xffffffff,%edx
f0100ca8:	0f 44 c2             	cmove  %edx,%eax
f0100cab:	eb c6                	jmp    f0100c73 <check_va2pa+0x2e>

f0100cad <_paddr>:
f0100cad:	81 f9 ff ff ff ef    	cmp    $0xefffffff,%ecx
f0100cb3:	76 07                	jbe    f0100cbc <_paddr+0xf>
f0100cb5:	8d 81 00 00 00 10    	lea    0x10000000(%ecx),%eax
f0100cbb:	c3                   	ret
f0100cbc:	55                   	push   %ebp
f0100cbd:	89 e5                	mov    %esp,%ebp
f0100cbf:	83 ec 08             	sub    $0x8,%esp
f0100cc2:	51                   	push   %ecx
f0100cc3:	68 f0 69 10 f0       	push   $0xf01069f0
f0100cc8:	52                   	push   %edx
f0100cc9:	50                   	push   %eax
f0100cca:	e8 9b f3 ff ff       	call   f010006a <_panic>

f0100ccf <boot_alloc>:
f0100ccf:	55                   	push   %ebp
f0100cd0:	89 e5                	mov    %esp,%ebp
f0100cd2:	53                   	push   %ebx
f0100cd3:	83 ec 04             	sub    $0x4,%esp
f0100cd6:	83 3d 64 92 18 f0 00 	cmpl   $0x0,0xf0189264
f0100cdd:	74 4b                	je     f0100d2a <boot_alloc+0x5b>
f0100cdf:	8b 1d 64 92 18 f0    	mov    0xf0189264,%ebx
f0100ce5:	8d 0c 03             	lea    (%ebx,%eax,1),%ecx
f0100ce8:	ba 6d 00 00 00       	mov    $0x6d,%edx
f0100ced:	b8 28 7a 10 f0       	mov    $0xf0107a28,%eax
f0100cf2:	e8 b6 ff ff ff       	call   f0100cad <_paddr>
f0100cf7:	89 c1                	mov    %eax,%ecx
f0100cf9:	a1 60 92 18 f0       	mov    0xf0189260,%eax
f0100cfe:	c1 e0 0c             	shl    $0xc,%eax
f0100d01:	39 c1                	cmp    %eax,%ecx
f0100d03:	73 38                	jae    f0100d3d <boot_alloc+0x6e>
f0100d05:	ba 73 00 00 00       	mov    $0x73,%edx
f0100d0a:	b8 28 7a 10 f0       	mov    $0xf0107a28,%eax
f0100d0f:	e8 e7 fe ff ff       	call   f0100bfb <_kaddr>
f0100d14:	05 ff 0f 00 00       	add    $0xfff,%eax
f0100d19:	25 00 f0 ff ff       	and    $0xfffff000,%eax
f0100d1e:	a3 64 92 18 f0       	mov    %eax,0xf0189264
f0100d23:	89 d8                	mov    %ebx,%eax
f0100d25:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f0100d28:	c9                   	leave
f0100d29:	c3                   	ret
f0100d2a:	ba c7 e3 1c f0       	mov    $0xf01ce3c7,%edx
f0100d2f:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
f0100d35:	89 15 64 92 18 f0    	mov    %edx,0xf0189264
f0100d3b:	eb a2                	jmp    f0100cdf <boot_alloc+0x10>
f0100d3d:	83 ec 04             	sub    $0x4,%esp
f0100d40:	68 a8 6b 10 f0       	push   $0xf0106ba8
f0100d45:	6a 6f                	push   $0x6f
f0100d47:	68 28 7a 10 f0       	push   $0xf0107a28
f0100d4c:	e8 19 f3 ff ff       	call   f010006a <_panic>

f0100d51 <check_kern_pgdir>:
f0100d51:	55                   	push   %ebp
f0100d52:	89 e5                	mov    %esp,%ebp
f0100d54:	57                   	push   %edi
f0100d55:	56                   	push   %esi
f0100d56:	53                   	push   %ebx
f0100d57:	83 ec 2c             	sub    $0x2c,%esp
f0100d5a:	8b 3d 5c 92 18 f0    	mov    0xf018925c,%edi
f0100d60:	a1 60 92 18 f0       	mov    0xf0189260,%eax
f0100d65:	89 45 dc             	mov    %eax,-0x24(%ebp)
f0100d68:	8d 04 c5 ff 0f 00 00 	lea    0xfff(,%eax,8),%eax
f0100d6f:	25 00 f0 ff ff       	and    $0xfffff000,%eax
f0100d74:	89 c6                	mov    %eax,%esi
f0100d76:	a1 58 92 18 f0       	mov    0xf0189258,%eax
f0100d7b:	89 45 e0             	mov    %eax,-0x20(%ebp)
f0100d7e:	bb 00 00 00 00       	mov    $0x0,%ebx
f0100d83:	89 7d e4             	mov    %edi,-0x1c(%ebp)
f0100d86:	39 f3                	cmp    %esi,%ebx
f0100d88:	73 49                	jae    f0100dd3 <check_kern_pgdir+0x82>
f0100d8a:	8d 93 00 00 00 ef    	lea    -0x11000000(%ebx),%edx
f0100d90:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f0100d93:	e8 ad fe ff ff       	call   f0100c45 <check_va2pa>
f0100d98:	89 c7                	mov    %eax,%edi
f0100d9a:	8b 4d e0             	mov    -0x20(%ebp),%ecx
f0100d9d:	ba 53 03 00 00       	mov    $0x353,%edx
f0100da2:	b8 28 7a 10 f0       	mov    $0xf0107a28,%eax
f0100da7:	e8 01 ff ff ff       	call   f0100cad <_paddr>
f0100dac:	01 d8                	add    %ebx,%eax
f0100dae:	39 c7                	cmp    %eax,%edi
f0100db0:	75 08                	jne    f0100dba <check_kern_pgdir+0x69>
f0100db2:	81 c3 00 10 00 00    	add    $0x1000,%ebx
f0100db8:	eb cc                	jmp    f0100d86 <check_kern_pgdir+0x35>
f0100dba:	68 c8 6b 10 f0       	push   $0xf0106bc8
f0100dbf:	68 34 7a 10 f0       	push   $0xf0107a34
f0100dc4:	68 53 03 00 00       	push   $0x353
f0100dc9:	68 28 7a 10 f0       	push   $0xf0107a28
f0100dce:	e8 97 f2 ff ff       	call   f010006a <_panic>
f0100dd3:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f0100dd6:	8b 35 70 92 18 f0    	mov    0xf0189270,%esi
f0100ddc:	bb 00 00 00 00       	mov    $0x0,%ebx
f0100de1:	89 75 e4             	mov    %esi,-0x1c(%ebp)
f0100de4:	8d 93 00 00 c0 ee    	lea    -0x11400000(%ebx),%edx
f0100dea:	89 f8                	mov    %edi,%eax
f0100dec:	e8 54 fe ff ff       	call   f0100c45 <check_va2pa>
f0100df1:	89 c6                	mov    %eax,%esi
f0100df3:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
f0100df6:	ba 58 03 00 00       	mov    $0x358,%edx
f0100dfb:	b8 28 7a 10 f0       	mov    $0xf0107a28,%eax
f0100e00:	e8 a8 fe ff ff       	call   f0100cad <_paddr>
f0100e05:	01 d8                	add    %ebx,%eax
f0100e07:	39 c6                	cmp    %eax,%esi
f0100e09:	75 36                	jne    f0100e41 <check_kern_pgdir+0xf0>
f0100e0b:	81 c3 00 10 00 00    	add    $0x1000,%ebx
f0100e11:	81 fb 00 10 02 00    	cmp    $0x21000,%ebx
f0100e17:	75 cb                	jne    f0100de4 <check_kern_pgdir+0x93>
f0100e19:	8b 75 dc             	mov    -0x24(%ebp),%esi
f0100e1c:	c1 e6 0c             	shl    $0xc,%esi
f0100e1f:	bb 00 00 00 00       	mov    $0x0,%ebx
f0100e24:	39 de                	cmp    %ebx,%esi
f0100e26:	74 4b                	je     f0100e73 <check_kern_pgdir+0x122>
f0100e28:	8d 93 00 00 00 f0    	lea    -0x10000000(%ebx),%edx
f0100e2e:	89 f8                	mov    %edi,%eax
f0100e30:	e8 10 fe ff ff       	call   f0100c45 <check_va2pa>
f0100e35:	39 d8                	cmp    %ebx,%eax
f0100e37:	75 21                	jne    f0100e5a <check_kern_pgdir+0x109>
f0100e39:	81 c3 00 10 00 00    	add    $0x1000,%ebx
f0100e3f:	eb e3                	jmp    f0100e24 <check_kern_pgdir+0xd3>
f0100e41:	68 fc 6b 10 f0       	push   $0xf0106bfc
f0100e46:	68 34 7a 10 f0       	push   $0xf0107a34
f0100e4b:	68 58 03 00 00       	push   $0x358
f0100e50:	68 28 7a 10 f0       	push   $0xf0107a28
f0100e55:	e8 10 f2 ff ff       	call   f010006a <_panic>
f0100e5a:	68 30 6c 10 f0       	push   $0xf0106c30
f0100e5f:	68 34 7a 10 f0       	push   $0xf0107a34
f0100e64:	68 5c 03 00 00       	push   $0x35c
f0100e69:	68 28 7a 10 f0       	push   $0xf0107a28
f0100e6e:	e8 f7 f1 ff ff       	call   f010006a <_panic>
f0100e73:	c7 45 dc 00 d0 18 f0 	movl   $0xf018d000,-0x24(%ebp)
f0100e7a:	be 00 80 ff ef       	mov    $0xefff8000,%esi
f0100e7f:	b9 00 00 ff ef       	mov    $0xefff0000,%ecx
f0100e84:	eb 3b                	jmp    f0100ec1 <check_kern_pgdir+0x170>
f0100e86:	68 58 6c 10 f0       	push   $0xf0106c58
f0100e8b:	68 34 7a 10 f0       	push   $0xf0107a34
f0100e90:	68 63 03 00 00       	push   $0x363
f0100e95:	68 28 7a 10 f0       	push   $0xf0107a28
f0100e9a:	e8 cb f1 ff ff       	call   f010006a <_panic>
f0100e9f:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
f0100ea2:	81 e9 00 00 01 00    	sub    $0x10000,%ecx
f0100ea8:	81 ee 00 00 01 00    	sub    $0x10000,%esi
f0100eae:	81 45 dc 00 80 00 00 	addl   $0x8000,-0x24(%ebp)
f0100eb5:	81 f9 00 00 f7 ef    	cmp    $0xeff70000,%ecx
f0100ebb:	0f 84 8b 00 00 00    	je     f0100f4c <check_kern_pgdir+0x1fb>
f0100ec1:	8b 45 dc             	mov    -0x24(%ebp),%eax
f0100ec4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f0100ec7:	bb 00 00 00 00       	mov    $0x0,%ebx
f0100ecc:	8d 81 00 80 00 00    	lea    0x8000(%ecx),%eax
f0100ed2:	89 45 e0             	mov    %eax,-0x20(%ebp)
f0100ed5:	89 4d d8             	mov    %ecx,-0x28(%ebp)
f0100ed8:	89 75 d4             	mov    %esi,-0x2c(%ebp)
f0100edb:	8b 45 e0             	mov    -0x20(%ebp),%eax
f0100ede:	8d 14 18             	lea    (%eax,%ebx,1),%edx
f0100ee1:	89 f8                	mov    %edi,%eax
f0100ee3:	e8 5d fd ff ff       	call   f0100c45 <check_va2pa>
f0100ee8:	89 c6                	mov    %eax,%esi
f0100eea:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
f0100eed:	ba 64 03 00 00       	mov    $0x364,%edx
f0100ef2:	b8 28 7a 10 f0       	mov    $0xf0107a28,%eax
f0100ef7:	e8 b1 fd ff ff       	call   f0100cad <_paddr>
f0100efc:	01 d8                	add    %ebx,%eax
f0100efe:	39 c6                	cmp    %eax,%esi
f0100f00:	75 84                	jne    f0100e86 <check_kern_pgdir+0x135>
f0100f02:	81 c3 00 10 00 00    	add    $0x1000,%ebx
f0100f08:	81 fb 00 80 00 00    	cmp    $0x8000,%ebx
f0100f0e:	75 cb                	jne    f0100edb <check_kern_pgdir+0x18a>
f0100f10:	8b 4d d8             	mov    -0x28(%ebp),%ecx
f0100f13:	8b 75 d4             	mov    -0x2c(%ebp),%esi
f0100f16:	89 cb                	mov    %ecx,%ebx
f0100f18:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
f0100f1b:	39 de                	cmp    %ebx,%esi
f0100f1d:	74 80                	je     f0100e9f <check_kern_pgdir+0x14e>
f0100f1f:	89 da                	mov    %ebx,%edx
f0100f21:	89 f8                	mov    %edi,%eax
f0100f23:	e8 1d fd ff ff       	call   f0100c45 <check_va2pa>
f0100f28:	81 c3 00 10 00 00    	add    $0x1000,%ebx
f0100f2e:	83 f8 ff             	cmp    $0xffffffff,%eax
f0100f31:	74 e8                	je     f0100f1b <check_kern_pgdir+0x1ca>
f0100f33:	68 a0 6c 10 f0       	push   $0xf0106ca0
f0100f38:	68 34 7a 10 f0       	push   $0xf0107a34
f0100f3d:	68 66 03 00 00       	push   $0x366
f0100f42:	68 28 7a 10 f0       	push   $0xf0107a28
f0100f47:	e8 1e f1 ff ff       	call   f010006a <_panic>
f0100f4c:	b8 00 00 00 00       	mov    $0x0,%eax
f0100f51:	eb 36                	jmp    f0100f89 <check_kern_pgdir+0x238>
f0100f53:	f6 04 87 01          	testb  $0x1,(%edi,%eax,4)
f0100f57:	75 26                	jne    f0100f7f <check_kern_pgdir+0x22e>
f0100f59:	68 49 7a 10 f0       	push   $0xf0107a49
f0100f5e:	68 34 7a 10 f0       	push   $0xf0107a34
f0100f63:	68 71 03 00 00       	push   $0x371
f0100f68:	68 28 7a 10 f0       	push   $0xf0107a28
f0100f6d:	e8 f8 f0 ff ff       	call   f010006a <_panic>
f0100f72:	8b 14 87             	mov    (%edi,%eax,4),%edx
f0100f75:	f6 c2 01             	test   $0x1,%dl
f0100f78:	74 40                	je     f0100fba <check_kern_pgdir+0x269>
f0100f7a:	f6 c2 02             	test   $0x2,%dl
f0100f7d:	74 54                	je     f0100fd3 <check_kern_pgdir+0x282>
f0100f7f:	83 c0 01             	add    $0x1,%eax
f0100f82:	3d 00 04 00 00       	cmp    $0x400,%eax
f0100f87:	74 63                	je     f0100fec <check_kern_pgdir+0x29b>
f0100f89:	8d 90 45 fc ff ff    	lea    -0x3bb(%eax),%edx
f0100f8f:	83 fa 04             	cmp    $0x4,%edx
f0100f92:	76 bf                	jbe    f0100f53 <check_kern_pgdir+0x202>
f0100f94:	3d bf 03 00 00       	cmp    $0x3bf,%eax
f0100f99:	77 d7                	ja     f0100f72 <check_kern_pgdir+0x221>
f0100f9b:	83 3c 87 00          	cmpl   $0x0,(%edi,%eax,4)
f0100f9f:	74 de                	je     f0100f7f <check_kern_pgdir+0x22e>
f0100fa1:	68 6b 7a 10 f0       	push   $0xf0107a6b
f0100fa6:	68 34 7a 10 f0       	push   $0xf0107a34
f0100fab:	68 78 03 00 00       	push   $0x378
f0100fb0:	68 28 7a 10 f0       	push   $0xf0107a28
f0100fb5:	e8 b0 f0 ff ff       	call   f010006a <_panic>
f0100fba:	68 49 7a 10 f0       	push   $0xf0107a49
f0100fbf:	68 34 7a 10 f0       	push   $0xf0107a34
f0100fc4:	68 75 03 00 00       	push   $0x375
f0100fc9:	68 28 7a 10 f0       	push   $0xf0107a28
f0100fce:	e8 97 f0 ff ff       	call   f010006a <_panic>
f0100fd3:	68 5a 7a 10 f0       	push   $0xf0107a5a
f0100fd8:	68 34 7a 10 f0       	push   $0xf0107a34
f0100fdd:	68 76 03 00 00       	push   $0x376
f0100fe2:	68 28 7a 10 f0       	push   $0xf0107a28
f0100fe7:	e8 7e f0 ff ff       	call   f010006a <_panic>
f0100fec:	83 ec 0c             	sub    $0xc,%esp
f0100fef:	68 c4 6c 10 f0       	push   $0xf0106cc4
f0100ff4:	e8 3d 28 00 00       	call   f0103836 <cprintf>
f0100ff9:	83 c4 10             	add    $0x10,%esp
f0100ffc:	8d 65 f4             	lea    -0xc(%ebp),%esp
f0100fff:	5b                   	pop    %ebx
f0101000:	5e                   	pop    %esi
f0101001:	5f                   	pop    %edi
f0101002:	5d                   	pop    %ebp
f0101003:	c3                   	ret

f0101004 <check_page_free_list>:
f0101004:	55                   	push   %ebp
f0101005:	89 e5                	mov    %esp,%ebp
f0101007:	57                   	push   %edi
f0101008:	56                   	push   %esi
f0101009:	53                   	push   %ebx
f010100a:	83 ec 2c             	sub    $0x2c,%esp
f010100d:	84 c0                	test   %al,%al
f010100f:	0f 85 3b 02 00 00    	jne    f0101250 <check_page_free_list+0x24c>
f0101015:	83 3d 6c 92 18 f0 00 	cmpl   $0x0,0xf018926c
f010101c:	74 0a                	je     f0101028 <check_page_free_list+0x24>
f010101e:	be 00 04 00 00       	mov    $0x400,%esi
f0101023:	e9 80 02 00 00       	jmp    f01012a8 <check_page_free_list+0x2a4>
f0101028:	83 ec 04             	sub    $0x4,%esp
f010102b:	68 e4 6c 10 f0       	push   $0xf0106ce4
f0101030:	68 be 02 00 00       	push   $0x2be
f0101035:	68 28 7a 10 f0       	push   $0xf0107a28
f010103a:	e8 2b f0 ff ff       	call   f010006a <_panic>
f010103f:	8b 1b                	mov    (%ebx),%ebx
f0101041:	85 db                	test   %ebx,%ebx
f0101043:	74 2d                	je     f0101072 <check_page_free_list+0x6e>
f0101045:	89 d8                	mov    %ebx,%eax
f0101047:	e8 15 fb ff ff       	call   f0100b61 <page2pa>
f010104c:	c1 e8 16             	shr    $0x16,%eax
f010104f:	39 f0                	cmp    %esi,%eax
f0101051:	73 ec                	jae    f010103f <check_page_free_list+0x3b>
f0101053:	89 d8                	mov    %ebx,%eax
f0101055:	e8 cd fb ff ff       	call   f0100c27 <page2kva>
f010105a:	83 ec 04             	sub    $0x4,%esp
f010105d:	68 80 00 00 00       	push   $0x80
f0101062:	68 97 00 00 00       	push   $0x97
f0101067:	50                   	push   %eax
f0101068:	e8 2a 4c 00 00       	call   f0105c97 <memset>
f010106d:	83 c4 10             	add    $0x10,%esp
f0101070:	eb cd                	jmp    f010103f <check_page_free_list+0x3b>
f0101072:	b8 00 00 00 00       	mov    $0x0,%eax
f0101077:	e8 53 fc ff ff       	call   f0100ccf <boot_alloc>
f010107c:	89 45 cc             	mov    %eax,-0x34(%ebp)
f010107f:	8b 1d 6c 92 18 f0    	mov    0xf018926c,%ebx
f0101085:	8b 35 58 92 18 f0    	mov    0xf0189258,%esi
f010108b:	a1 60 92 18 f0       	mov    0xf0189260,%eax
f0101090:	8d 3c c6             	lea    (%esi,%eax,8),%edi
f0101093:	c7 45 d0 00 00 00 00 	movl   $0x0,-0x30(%ebp)
f010109a:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
f01010a1:	e9 c1 00 00 00       	jmp    f0101167 <check_page_free_list+0x163>
f01010a6:	68 79 7a 10 f0       	push   $0xf0107a79
f01010ab:	68 34 7a 10 f0       	push   $0xf0107a34
f01010b0:	68 d8 02 00 00       	push   $0x2d8
f01010b5:	68 28 7a 10 f0       	push   $0xf0107a28
f01010ba:	e8 ab ef ff ff       	call   f010006a <_panic>
f01010bf:	68 85 7a 10 f0       	push   $0xf0107a85
f01010c4:	68 34 7a 10 f0       	push   $0xf0107a34
f01010c9:	68 d9 02 00 00       	push   $0x2d9
f01010ce:	68 28 7a 10 f0       	push   $0xf0107a28
f01010d3:	e8 92 ef ff ff       	call   f010006a <_panic>
f01010d8:	68 08 6d 10 f0       	push   $0xf0106d08
f01010dd:	68 34 7a 10 f0       	push   $0xf0107a34
f01010e2:	68 da 02 00 00       	push   $0x2da
f01010e7:	68 28 7a 10 f0       	push   $0xf0107a28
f01010ec:	e8 79 ef ff ff       	call   f010006a <_panic>
f01010f1:	68 99 7a 10 f0       	push   $0xf0107a99
f01010f6:	68 34 7a 10 f0       	push   $0xf0107a34
f01010fb:	68 dd 02 00 00       	push   $0x2dd
f0101100:	68 28 7a 10 f0       	push   $0xf0107a28
f0101105:	e8 60 ef ff ff       	call   f010006a <_panic>
f010110a:	68 aa 7a 10 f0       	push   $0xf0107aaa
f010110f:	68 34 7a 10 f0       	push   $0xf0107a34
f0101114:	68 de 02 00 00       	push   $0x2de
f0101119:	68 28 7a 10 f0       	push   $0xf0107a28
f010111e:	e8 47 ef ff ff       	call   f010006a <_panic>
f0101123:	68 3c 6d 10 f0       	push   $0xf0106d3c
f0101128:	68 34 7a 10 f0       	push   $0xf0107a34
f010112d:	68 df 02 00 00       	push   $0x2df
f0101132:	68 28 7a 10 f0       	push   $0xf0107a28
f0101137:	e8 2e ef ff ff       	call   f010006a <_panic>
f010113c:	68 c3 7a 10 f0       	push   $0xf0107ac3
f0101141:	68 34 7a 10 f0       	push   $0xf0107a34
f0101146:	68 e0 02 00 00       	push   $0x2e0
f010114b:	68 28 7a 10 f0       	push   $0xf0107a28
f0101150:	e8 15 ef ff ff       	call   f010006a <_panic>
f0101155:	89 d8                	mov    %ebx,%eax
f0101157:	e8 cb fa ff ff       	call   f0100c27 <page2kva>
f010115c:	39 45 cc             	cmp    %eax,-0x34(%ebp)
f010115f:	77 6a                	ja     f01011cb <check_page_free_list+0x1c7>
f0101161:	83 45 d0 01          	addl   $0x1,-0x30(%ebp)
f0101165:	8b 1b                	mov    (%ebx),%ebx
f0101167:	85 db                	test   %ebx,%ebx
f0101169:	0f 84 8e 00 00 00    	je     f01011fd <check_page_free_list+0x1f9>
f010116f:	39 f3                	cmp    %esi,%ebx
f0101171:	0f 82 2f ff ff ff    	jb     f01010a6 <check_page_free_list+0xa2>
f0101177:	39 fb                	cmp    %edi,%ebx
f0101179:	0f 83 40 ff ff ff    	jae    f01010bf <check_page_free_list+0xbb>
f010117f:	89 d8                	mov    %ebx,%eax
f0101181:	29 f0                	sub    %esi,%eax
f0101183:	a8 07                	test   $0x7,%al
f0101185:	0f 85 4d ff ff ff    	jne    f01010d8 <check_page_free_list+0xd4>
f010118b:	89 d8                	mov    %ebx,%eax
f010118d:	e8 cf f9 ff ff       	call   f0100b61 <page2pa>
f0101192:	85 c0                	test   %eax,%eax
f0101194:	0f 84 57 ff ff ff    	je     f01010f1 <check_page_free_list+0xed>
f010119a:	3d 00 00 0a 00       	cmp    $0xa0000,%eax
f010119f:	0f 84 65 ff ff ff    	je     f010110a <check_page_free_list+0x106>
f01011a5:	3d 00 f0 0f 00       	cmp    $0xff000,%eax
f01011aa:	0f 84 73 ff ff ff    	je     f0101123 <check_page_free_list+0x11f>
f01011b0:	3d 00 00 10 00       	cmp    $0x100000,%eax
f01011b5:	74 85                	je     f010113c <check_page_free_list+0x138>
f01011b7:	3d ff ff 0f 00       	cmp    $0xfffff,%eax
f01011bc:	77 97                	ja     f0101155 <check_page_free_list+0x151>
f01011be:	3d 00 70 00 00       	cmp    $0x7000,%eax
f01011c3:	74 1f                	je     f01011e4 <check_page_free_list+0x1e0>
f01011c5:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
f01011c9:	eb 9a                	jmp    f0101165 <check_page_free_list+0x161>
f01011cb:	68 60 6d 10 f0       	push   $0xf0106d60
f01011d0:	68 34 7a 10 f0       	push   $0xf0107a34
f01011d5:	68 e1 02 00 00       	push   $0x2e1
f01011da:	68 28 7a 10 f0       	push   $0xf0107a28
f01011df:	e8 86 ee ff ff       	call   f010006a <_panic>
f01011e4:	68 dd 7a 10 f0       	push   $0xf0107add
f01011e9:	68 34 7a 10 f0       	push   $0xf0107a34
f01011ee:	68 e4 02 00 00       	push   $0x2e4
f01011f3:	68 28 7a 10 f0       	push   $0xf0107a28
f01011f8:	e8 6d ee ff ff       	call   f010006a <_panic>
f01011fd:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
f0101201:	7e 1b                	jle    f010121e <check_page_free_list+0x21a>
f0101203:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
f0101207:	7e 2e                	jle    f0101237 <check_page_free_list+0x233>
f0101209:	83 ec 0c             	sub    $0xc,%esp
f010120c:	68 a8 6d 10 f0       	push   $0xf0106da8
f0101211:	e8 20 26 00 00       	call   f0103836 <cprintf>
f0101216:	8d 65 f4             	lea    -0xc(%ebp),%esp
f0101219:	5b                   	pop    %ebx
f010121a:	5e                   	pop    %esi
f010121b:	5f                   	pop    %edi
f010121c:	5d                   	pop    %ebp
f010121d:	c3                   	ret
f010121e:	68 fa 7a 10 f0       	push   $0xf0107afa
f0101223:	68 34 7a 10 f0       	push   $0xf0107a34
f0101228:	68 ec 02 00 00       	push   $0x2ec
f010122d:	68 28 7a 10 f0       	push   $0xf0107a28
f0101232:	e8 33 ee ff ff       	call   f010006a <_panic>
f0101237:	68 0c 7b 10 f0       	push   $0xf0107b0c
f010123c:	68 34 7a 10 f0       	push   $0xf0107a34
f0101241:	68 ed 02 00 00       	push   $0x2ed
f0101246:	68 28 7a 10 f0       	push   $0xf0107a28
f010124b:	e8 1a ee ff ff       	call   f010006a <_panic>
f0101250:	8b 1d 6c 92 18 f0    	mov    0xf018926c,%ebx
f0101256:	85 db                	test   %ebx,%ebx
f0101258:	0f 84 ca fd ff ff    	je     f0101028 <check_page_free_list+0x24>
f010125e:	8d 45 d8             	lea    -0x28(%ebp),%eax
f0101261:	89 45 e0             	mov    %eax,-0x20(%ebp)
f0101264:	8d 45 dc             	lea    -0x24(%ebp),%eax
f0101267:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f010126a:	89 d8                	mov    %ebx,%eax
f010126c:	e8 f0 f8 ff ff       	call   f0100b61 <page2pa>
f0101271:	c1 e8 16             	shr    $0x16,%eax
f0101274:	0f 95 c0             	setne  %al
f0101277:	0f b6 c0             	movzbl %al,%eax
f010127a:	8b 54 85 e0          	mov    -0x20(%ebp,%eax,4),%edx
f010127e:	89 1a                	mov    %ebx,(%edx)
f0101280:	89 5c 85 e0          	mov    %ebx,-0x20(%ebp,%eax,4)
f0101284:	8b 1b                	mov    (%ebx),%ebx
f0101286:	85 db                	test   %ebx,%ebx
f0101288:	75 e0                	jne    f010126a <check_page_free_list+0x266>
f010128a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f010128d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
f0101293:	8b 55 dc             	mov    -0x24(%ebp),%edx
f0101296:	8b 45 e0             	mov    -0x20(%ebp),%eax
f0101299:	89 10                	mov    %edx,(%eax)
f010129b:	8b 45 d8             	mov    -0x28(%ebp),%eax
f010129e:	a3 6c 92 18 f0       	mov    %eax,0xf018926c
f01012a3:	be 01 00 00 00       	mov    $0x1,%esi
f01012a8:	8b 1d 6c 92 18 f0    	mov    0xf018926c,%ebx
f01012ae:	e9 8e fd ff ff       	jmp    f0101041 <check_page_free_list+0x3d>

f01012b3 <pa2page>:
f01012b3:	c1 e8 0c             	shr    $0xc,%eax
f01012b6:	3b 05 60 92 18 f0    	cmp    0xf0189260,%eax
f01012bc:	73 0a                	jae    f01012c8 <pa2page+0x15>
f01012be:	8b 15 58 92 18 f0    	mov    0xf0189258,%edx
f01012c4:	8d 04 c2             	lea    (%edx,%eax,8),%eax
f01012c7:	c3                   	ret
f01012c8:	55                   	push   %ebp
f01012c9:	89 e5                	mov    %esp,%ebp
f01012cb:	83 ec 0c             	sub    $0xc,%esp
f01012ce:	68 cc 6d 10 f0       	push   $0xf0106dcc
f01012d3:	6a 51                	push   $0x51
f01012d5:	68 1a 7a 10 f0       	push   $0xf0107a1a
f01012da:	e8 8b ed ff ff       	call   f010006a <_panic>

f01012df <page_init>:
f01012df:	55                   	push   %ebp
f01012e0:	89 e5                	mov    %esp,%ebp
f01012e2:	56                   	push   %esi
f01012e3:	53                   	push   %ebx
f01012e4:	bb 00 00 00 00       	mov    $0x0,%ebx
f01012e9:	eb 23                	jmp    f010130e <page_init+0x2f>
f01012eb:	a1 58 92 18 f0       	mov    0xf0189258,%eax
f01012f0:	8b 15 6c 92 18 f0    	mov    0xf018926c,%edx
f01012f6:	89 14 30             	mov    %edx,(%eax,%esi,1)
f01012f9:	03 35 58 92 18 f0    	add    0xf0189258,%esi
f01012ff:	66 c7 46 04 00 00    	movw   $0x0,0x4(%esi)
f0101305:	89 35 6c 92 18 f0    	mov    %esi,0xf018926c
f010130b:	83 c3 01             	add    $0x1,%ebx
f010130e:	3b 1d 60 92 18 f0    	cmp    0xf0189260,%ebx
f0101314:	73 53                	jae    f0101369 <page_init+0x8a>
f0101316:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
f010131d:	a1 58 92 18 f0       	mov    0xf0189258,%eax
f0101322:	c7 04 d8 00 00 00 00 	movl   $0x0,(%eax,%ebx,8)
f0101329:	83 fb 07             	cmp    $0x7,%ebx
f010132c:	74 dd                	je     f010130b <page_init+0x2c>
f010132e:	85 db                	test   %ebx,%ebx
f0101330:	74 d9                	je     f010130b <page_init+0x2c>
f0101332:	8d 83 60 ff ff ff    	lea    -0xa0(%ebx),%eax
f0101338:	83 f8 5f             	cmp    $0x5f,%eax
f010133b:	76 ce                	jbe    f010130b <page_init+0x2c>
f010133d:	81 fb ff 00 00 00    	cmp    $0xff,%ebx
f0101343:	76 a6                	jbe    f01012eb <page_init+0xc>
f0101345:	b8 00 00 00 00       	mov    $0x0,%eax
f010134a:	e8 80 f9 ff ff       	call   f0100ccf <boot_alloc>
f010134f:	89 c1                	mov    %eax,%ecx
f0101351:	ba 45 01 00 00       	mov    $0x145,%edx
f0101356:	b8 28 7a 10 f0       	mov    $0xf0107a28,%eax
f010135b:	e8 4d f9 ff ff       	call   f0100cad <_paddr>
f0101360:	c1 e8 0c             	shr    $0xc,%eax
f0101363:	39 c3                	cmp    %eax,%ebx
f0101365:	73 84                	jae    f01012eb <page_init+0xc>
f0101367:	eb a2                	jmp    f010130b <page_init+0x2c>
f0101369:	5b                   	pop    %ebx
f010136a:	5e                   	pop    %esi
f010136b:	5d                   	pop    %ebp
f010136c:	c3                   	ret

f010136d <page_alloc>:
f010136d:	55                   	push   %ebp
f010136e:	89 e5                	mov    %esp,%ebp
f0101370:	53                   	push   %ebx
f0101371:	83 ec 04             	sub    $0x4,%esp
f0101374:	8b 1d 6c 92 18 f0    	mov    0xf018926c,%ebx
f010137a:	85 db                	test   %ebx,%ebx
f010137c:	74 13                	je     f0101391 <page_alloc+0x24>
f010137e:	8b 03                	mov    (%ebx),%eax
f0101380:	a3 6c 92 18 f0       	mov    %eax,0xf018926c
f0101385:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
f010138b:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
f010138f:	75 07                	jne    f0101398 <page_alloc+0x2b>
f0101391:	89 d8                	mov    %ebx,%eax
f0101393:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f0101396:	c9                   	leave
f0101397:	c3                   	ret
f0101398:	89 d8                	mov    %ebx,%eax
f010139a:	e8 88 f8 ff ff       	call   f0100c27 <page2kva>
f010139f:	83 ec 04             	sub    $0x4,%esp
f01013a2:	68 00 10 00 00       	push   $0x1000
f01013a7:	6a 00                	push   $0x0
f01013a9:	50                   	push   %eax
f01013aa:	e8 e8 48 00 00       	call   f0105c97 <memset>
f01013af:	83 c4 10             	add    $0x10,%esp
f01013b2:	eb dd                	jmp    f0101391 <page_alloc+0x24>

f01013b4 <page_free>:
f01013b4:	55                   	push   %ebp
f01013b5:	89 e5                	mov    %esp,%ebp
f01013b7:	83 ec 08             	sub    $0x8,%esp
f01013ba:	8b 45 08             	mov    0x8(%ebp),%eax
f01013bd:	66 83 78 04 00       	cmpw   $0x0,0x4(%eax)
f01013c2:	75 14                	jne    f01013d8 <page_free+0x24>
f01013c4:	83 38 00             	cmpl   $0x0,(%eax)
f01013c7:	75 26                	jne    f01013ef <page_free+0x3b>
f01013c9:	8b 15 6c 92 18 f0    	mov    0xf018926c,%edx
f01013cf:	89 10                	mov    %edx,(%eax)
f01013d1:	a3 6c 92 18 f0       	mov    %eax,0xf018926c
f01013d6:	c9                   	leave
f01013d7:	c3                   	ret
f01013d8:	83 ec 04             	sub    $0x4,%esp
f01013db:	68 1d 7b 10 f0       	push   $0xf0107b1d
f01013e0:	68 74 01 00 00       	push   $0x174
f01013e5:	68 28 7a 10 f0       	push   $0xf0107a28
f01013ea:	e8 7b ec ff ff       	call   f010006a <_panic>
f01013ef:	83 ec 04             	sub    $0x4,%esp
f01013f2:	68 ec 6d 10 f0       	push   $0xf0106dec
f01013f7:	68 76 01 00 00       	push   $0x176
f01013fc:	68 28 7a 10 f0       	push   $0xf0107a28
f0101401:	e8 64 ec ff ff       	call   f010006a <_panic>

f0101406 <check_page_alloc>:
f0101406:	55                   	push   %ebp
f0101407:	89 e5                	mov    %esp,%ebp
f0101409:	57                   	push   %edi
f010140a:	56                   	push   %esi
f010140b:	53                   	push   %ebx
f010140c:	83 ec 1c             	sub    $0x1c,%esp
f010140f:	83 3d 58 92 18 f0 00 	cmpl   $0x0,0xf0189258
f0101416:	74 0c                	je     f0101424 <check_page_alloc+0x1e>
f0101418:	a1 6c 92 18 f0       	mov    0xf018926c,%eax
f010141d:	bf 00 00 00 00       	mov    $0x0,%edi
f0101422:	eb 1c                	jmp    f0101440 <check_page_alloc+0x3a>
f0101424:	83 ec 04             	sub    $0x4,%esp
f0101427:	68 3b 7b 10 f0       	push   $0xf0107b3b
f010142c:	68 00 03 00 00       	push   $0x300
f0101431:	68 28 7a 10 f0       	push   $0xf0107a28
f0101436:	e8 2f ec ff ff       	call   f010006a <_panic>
f010143b:	83 c7 01             	add    $0x1,%edi
f010143e:	8b 00                	mov    (%eax),%eax
f0101440:	85 c0                	test   %eax,%eax
f0101442:	75 f7                	jne    f010143b <check_page_alloc+0x35>
f0101444:	83 ec 0c             	sub    $0xc,%esp
f0101447:	6a 00                	push   $0x0
f0101449:	e8 1f ff ff ff       	call   f010136d <page_alloc>
f010144e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f0101451:	83 c4 10             	add    $0x10,%esp
f0101454:	85 c0                	test   %eax,%eax
f0101456:	0f 84 ce 01 00 00    	je     f010162a <check_page_alloc+0x224>
f010145c:	83 ec 0c             	sub    $0xc,%esp
f010145f:	6a 00                	push   $0x0
f0101461:	e8 07 ff ff ff       	call   f010136d <page_alloc>
f0101466:	89 c6                	mov    %eax,%esi
f0101468:	83 c4 10             	add    $0x10,%esp
f010146b:	85 c0                	test   %eax,%eax
f010146d:	0f 84 d0 01 00 00    	je     f0101643 <check_page_alloc+0x23d>
f0101473:	83 ec 0c             	sub    $0xc,%esp
f0101476:	6a 00                	push   $0x0
f0101478:	e8 f0 fe ff ff       	call   f010136d <page_alloc>
f010147d:	89 c3                	mov    %eax,%ebx
f010147f:	83 c4 10             	add    $0x10,%esp
f0101482:	85 c0                	test   %eax,%eax
f0101484:	0f 84 d2 01 00 00    	je     f010165c <check_page_alloc+0x256>
f010148a:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
f010148d:	0f 84 e2 01 00 00    	je     f0101675 <check_page_alloc+0x26f>
f0101493:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
f0101496:	0f 84 f2 01 00 00    	je     f010168e <check_page_alloc+0x288>
f010149c:	39 c6                	cmp    %eax,%esi
f010149e:	0f 84 ea 01 00 00    	je     f010168e <check_page_alloc+0x288>
f01014a4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f01014a7:	e8 b5 f6 ff ff       	call   f0100b61 <page2pa>
f01014ac:	8b 0d 60 92 18 f0    	mov    0xf0189260,%ecx
f01014b2:	c1 e1 0c             	shl    $0xc,%ecx
f01014b5:	89 4d e0             	mov    %ecx,-0x20(%ebp)
f01014b8:	39 c8                	cmp    %ecx,%eax
f01014ba:	0f 83 e7 01 00 00    	jae    f01016a7 <check_page_alloc+0x2a1>
f01014c0:	89 f0                	mov    %esi,%eax
f01014c2:	e8 9a f6 ff ff       	call   f0100b61 <page2pa>
f01014c7:	8b 4d e0             	mov    -0x20(%ebp),%ecx
f01014ca:	39 c8                	cmp    %ecx,%eax
f01014cc:	0f 83 ee 01 00 00    	jae    f01016c0 <check_page_alloc+0x2ba>
f01014d2:	89 d8                	mov    %ebx,%eax
f01014d4:	e8 88 f6 ff ff       	call   f0100b61 <page2pa>
f01014d9:	8b 4d e0             	mov    -0x20(%ebp),%ecx
f01014dc:	39 c8                	cmp    %ecx,%eax
f01014de:	0f 83 f5 01 00 00    	jae    f01016d9 <check_page_alloc+0x2d3>
f01014e4:	a1 6c 92 18 f0       	mov    0xf018926c,%eax
f01014e9:	89 45 e0             	mov    %eax,-0x20(%ebp)
f01014ec:	c7 05 6c 92 18 f0 00 	movl   $0x0,0xf018926c
f01014f3:	00 00 00 
f01014f6:	83 ec 0c             	sub    $0xc,%esp
f01014f9:	6a 00                	push   $0x0
f01014fb:	e8 6d fe ff ff       	call   f010136d <page_alloc>
f0101500:	83 c4 10             	add    $0x10,%esp
f0101503:	85 c0                	test   %eax,%eax
f0101505:	0f 85 e7 01 00 00    	jne    f01016f2 <check_page_alloc+0x2ec>
f010150b:	83 ec 0c             	sub    $0xc,%esp
f010150e:	ff 75 e4             	push   -0x1c(%ebp)
f0101511:	e8 9e fe ff ff       	call   f01013b4 <page_free>
f0101516:	89 34 24             	mov    %esi,(%esp)
f0101519:	e8 96 fe ff ff       	call   f01013b4 <page_free>
f010151e:	89 1c 24             	mov    %ebx,(%esp)
f0101521:	e8 8e fe ff ff       	call   f01013b4 <page_free>
f0101526:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
f010152d:	e8 3b fe ff ff       	call   f010136d <page_alloc>
f0101532:	89 c3                	mov    %eax,%ebx
f0101534:	83 c4 10             	add    $0x10,%esp
f0101537:	85 c0                	test   %eax,%eax
f0101539:	0f 84 cc 01 00 00    	je     f010170b <check_page_alloc+0x305>
f010153f:	83 ec 0c             	sub    $0xc,%esp
f0101542:	6a 00                	push   $0x0
f0101544:	e8 24 fe ff ff       	call   f010136d <page_alloc>
f0101549:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f010154c:	83 c4 10             	add    $0x10,%esp
f010154f:	85 c0                	test   %eax,%eax
f0101551:	0f 84 cd 01 00 00    	je     f0101724 <check_page_alloc+0x31e>
f0101557:	83 ec 0c             	sub    $0xc,%esp
f010155a:	6a 00                	push   $0x0
f010155c:	e8 0c fe ff ff       	call   f010136d <page_alloc>
f0101561:	89 c6                	mov    %eax,%esi
f0101563:	83 c4 10             	add    $0x10,%esp
f0101566:	85 c0                	test   %eax,%eax
f0101568:	0f 84 cf 01 00 00    	je     f010173d <check_page_alloc+0x337>
f010156e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f0101571:	39 c3                	cmp    %eax,%ebx
f0101573:	0f 84 dd 01 00 00    	je     f0101756 <check_page_alloc+0x350>
f0101579:	39 f3                	cmp    %esi,%ebx
f010157b:	0f 84 ee 01 00 00    	je     f010176f <check_page_alloc+0x369>
f0101581:	39 75 e4             	cmp    %esi,-0x1c(%ebp)
f0101584:	0f 84 e5 01 00 00    	je     f010176f <check_page_alloc+0x369>
f010158a:	83 ec 0c             	sub    $0xc,%esp
f010158d:	6a 00                	push   $0x0
f010158f:	e8 d9 fd ff ff       	call   f010136d <page_alloc>
f0101594:	83 c4 10             	add    $0x10,%esp
f0101597:	85 c0                	test   %eax,%eax
f0101599:	0f 85 e9 01 00 00    	jne    f0101788 <check_page_alloc+0x382>
f010159f:	89 d8                	mov    %ebx,%eax
f01015a1:	e8 81 f6 ff ff       	call   f0100c27 <page2kva>
f01015a6:	83 ec 04             	sub    $0x4,%esp
f01015a9:	68 00 10 00 00       	push   $0x1000
f01015ae:	6a 01                	push   $0x1
f01015b0:	50                   	push   %eax
f01015b1:	e8 e1 46 00 00       	call   f0105c97 <memset>
f01015b6:	89 1c 24             	mov    %ebx,(%esp)
f01015b9:	e8 f6 fd ff ff       	call   f01013b4 <page_free>
f01015be:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
f01015c5:	e8 a3 fd ff ff       	call   f010136d <page_alloc>
f01015ca:	83 c4 10             	add    $0x10,%esp
f01015cd:	85 c0                	test   %eax,%eax
f01015cf:	0f 84 cc 01 00 00    	je     f01017a1 <check_page_alloc+0x39b>
f01015d5:	39 c3                	cmp    %eax,%ebx
f01015d7:	0f 85 dd 01 00 00    	jne    f01017ba <check_page_alloc+0x3b4>
f01015dd:	e8 45 f6 ff ff       	call   f0100c27 <page2kva>
f01015e2:	8d 90 00 10 00 00    	lea    0x1000(%eax),%edx
f01015e8:	83 c0 01             	add    $0x1,%eax
f01015eb:	80 78 ff 00          	cmpb   $0x0,-0x1(%eax)
f01015ef:	0f 85 de 01 00 00    	jne    f01017d3 <check_page_alloc+0x3cd>
f01015f5:	39 d0                	cmp    %edx,%eax
f01015f7:	75 ef                	jne    f01015e8 <check_page_alloc+0x1e2>
f01015f9:	8b 45 e0             	mov    -0x20(%ebp),%eax
f01015fc:	a3 6c 92 18 f0       	mov    %eax,0xf018926c
f0101601:	83 ec 0c             	sub    $0xc,%esp
f0101604:	53                   	push   %ebx
f0101605:	e8 aa fd ff ff       	call   f01013b4 <page_free>
f010160a:	83 c4 04             	add    $0x4,%esp
f010160d:	ff 75 e4             	push   -0x1c(%ebp)
f0101610:	e8 9f fd ff ff       	call   f01013b4 <page_free>
f0101615:	89 34 24             	mov    %esi,(%esp)
f0101618:	e8 97 fd ff ff       	call   f01013b4 <page_free>
f010161d:	a1 6c 92 18 f0       	mov    0xf018926c,%eax
f0101622:	83 c4 10             	add    $0x10,%esp
f0101625:	e9 c7 01 00 00       	jmp    f01017f1 <check_page_alloc+0x3eb>
f010162a:	68 56 7b 10 f0       	push   $0xf0107b56
f010162f:	68 34 7a 10 f0       	push   $0xf0107a34
f0101634:	68 08 03 00 00       	push   $0x308
f0101639:	68 28 7a 10 f0       	push   $0xf0107a28
f010163e:	e8 27 ea ff ff       	call   f010006a <_panic>
f0101643:	68 6c 7b 10 f0       	push   $0xf0107b6c
f0101648:	68 34 7a 10 f0       	push   $0xf0107a34
f010164d:	68 09 03 00 00       	push   $0x309
f0101652:	68 28 7a 10 f0       	push   $0xf0107a28
f0101657:	e8 0e ea ff ff       	call   f010006a <_panic>
f010165c:	68 82 7b 10 f0       	push   $0xf0107b82
f0101661:	68 34 7a 10 f0       	push   $0xf0107a34
f0101666:	68 0a 03 00 00       	push   $0x30a
f010166b:	68 28 7a 10 f0       	push   $0xf0107a28
f0101670:	e8 f5 e9 ff ff       	call   f010006a <_panic>
f0101675:	68 98 7b 10 f0       	push   $0xf0107b98
f010167a:	68 34 7a 10 f0       	push   $0xf0107a34
f010167f:	68 0d 03 00 00       	push   $0x30d
f0101684:	68 28 7a 10 f0       	push   $0xf0107a28
f0101689:	e8 dc e9 ff ff       	call   f010006a <_panic>
f010168e:	68 0c 6e 10 f0       	push   $0xf0106e0c
f0101693:	68 34 7a 10 f0       	push   $0xf0107a34
f0101698:	68 0e 03 00 00       	push   $0x30e
f010169d:	68 28 7a 10 f0       	push   $0xf0107a28
f01016a2:	e8 c3 e9 ff ff       	call   f010006a <_panic>
f01016a7:	68 2c 6e 10 f0       	push   $0xf0106e2c
f01016ac:	68 34 7a 10 f0       	push   $0xf0107a34
f01016b1:	68 0f 03 00 00       	push   $0x30f
f01016b6:	68 28 7a 10 f0       	push   $0xf0107a28
f01016bb:	e8 aa e9 ff ff       	call   f010006a <_panic>
f01016c0:	68 4c 6e 10 f0       	push   $0xf0106e4c
f01016c5:	68 34 7a 10 f0       	push   $0xf0107a34
f01016ca:	68 10 03 00 00       	push   $0x310
f01016cf:	68 28 7a 10 f0       	push   $0xf0107a28
f01016d4:	e8 91 e9 ff ff       	call   f010006a <_panic>
f01016d9:	68 6c 6e 10 f0       	push   $0xf0106e6c
f01016de:	68 34 7a 10 f0       	push   $0xf0107a34
f01016e3:	68 11 03 00 00       	push   $0x311
f01016e8:	68 28 7a 10 f0       	push   $0xf0107a28
f01016ed:	e8 78 e9 ff ff       	call   f010006a <_panic>
f01016f2:	68 aa 7b 10 f0       	push   $0xf0107baa
f01016f7:	68 34 7a 10 f0       	push   $0xf0107a34
f01016fc:	68 18 03 00 00       	push   $0x318
f0101701:	68 28 7a 10 f0       	push   $0xf0107a28
f0101706:	e8 5f e9 ff ff       	call   f010006a <_panic>
f010170b:	68 56 7b 10 f0       	push   $0xf0107b56
f0101710:	68 34 7a 10 f0       	push   $0xf0107a34
f0101715:	68 1f 03 00 00       	push   $0x31f
f010171a:	68 28 7a 10 f0       	push   $0xf0107a28
f010171f:	e8 46 e9 ff ff       	call   f010006a <_panic>
f0101724:	68 6c 7b 10 f0       	push   $0xf0107b6c
f0101729:	68 34 7a 10 f0       	push   $0xf0107a34
f010172e:	68 20 03 00 00       	push   $0x320
f0101733:	68 28 7a 10 f0       	push   $0xf0107a28
f0101738:	e8 2d e9 ff ff       	call   f010006a <_panic>
f010173d:	68 82 7b 10 f0       	push   $0xf0107b82
f0101742:	68 34 7a 10 f0       	push   $0xf0107a34
f0101747:	68 21 03 00 00       	push   $0x321
f010174c:	68 28 7a 10 f0       	push   $0xf0107a28
f0101751:	e8 14 e9 ff ff       	call   f010006a <_panic>
f0101756:	68 98 7b 10 f0       	push   $0xf0107b98
f010175b:	68 34 7a 10 f0       	push   $0xf0107a34
f0101760:	68 23 03 00 00       	push   $0x323
f0101765:	68 28 7a 10 f0       	push   $0xf0107a28
f010176a:	e8 fb e8 ff ff       	call   f010006a <_panic>
f010176f:	68 0c 6e 10 f0       	push   $0xf0106e0c
f0101774:	68 34 7a 10 f0       	push   $0xf0107a34
f0101779:	68 24 03 00 00       	push   $0x324
f010177e:	68 28 7a 10 f0       	push   $0xf0107a28
f0101783:	e8 e2 e8 ff ff       	call   f010006a <_panic>
f0101788:	68 aa 7b 10 f0       	push   $0xf0107baa
f010178d:	68 34 7a 10 f0       	push   $0xf0107a34
f0101792:	68 25 03 00 00       	push   $0x325
f0101797:	68 28 7a 10 f0       	push   $0xf0107a28
f010179c:	e8 c9 e8 ff ff       	call   f010006a <_panic>
f01017a1:	68 b9 7b 10 f0       	push   $0xf0107bb9
f01017a6:	68 34 7a 10 f0       	push   $0xf0107a34
f01017ab:	68 2a 03 00 00       	push   $0x32a
f01017b0:	68 28 7a 10 f0       	push   $0xf0107a28
f01017b5:	e8 b0 e8 ff ff       	call   f010006a <_panic>
f01017ba:	68 d7 7b 10 f0       	push   $0xf0107bd7
f01017bf:	68 34 7a 10 f0       	push   $0xf0107a34
f01017c4:	68 2b 03 00 00       	push   $0x32b
f01017c9:	68 28 7a 10 f0       	push   $0xf0107a28
f01017ce:	e8 97 e8 ff ff       	call   f010006a <_panic>
f01017d3:	68 e7 7b 10 f0       	push   $0xf0107be7
f01017d8:	68 34 7a 10 f0       	push   $0xf0107a34
f01017dd:	68 2e 03 00 00       	push   $0x32e
f01017e2:	68 28 7a 10 f0       	push   $0xf0107a28
f01017e7:	e8 7e e8 ff ff       	call   f010006a <_panic>
f01017ec:	83 ef 01             	sub    $0x1,%edi
f01017ef:	8b 00                	mov    (%eax),%eax
f01017f1:	85 c0                	test   %eax,%eax
f01017f3:	75 f7                	jne    f01017ec <check_page_alloc+0x3e6>
f01017f5:	85 ff                	test   %edi,%edi
f01017f7:	75 18                	jne    f0101811 <check_page_alloc+0x40b>
f01017f9:	83 ec 0c             	sub    $0xc,%esp
f01017fc:	68 8c 6e 10 f0       	push   $0xf0106e8c
f0101801:	e8 30 20 00 00       	call   f0103836 <cprintf>
f0101806:	83 c4 10             	add    $0x10,%esp
f0101809:	8d 65 f4             	lea    -0xc(%ebp),%esp
f010180c:	5b                   	pop    %ebx
f010180d:	5e                   	pop    %esi
f010180e:	5f                   	pop    %edi
f010180f:	5d                   	pop    %ebp
f0101810:	c3                   	ret
f0101811:	68 f1 7b 10 f0       	push   $0xf0107bf1
f0101816:	68 34 7a 10 f0       	push   $0xf0107a34
f010181b:	68 3b 03 00 00       	push   $0x33b
f0101820:	68 28 7a 10 f0       	push   $0xf0107a28
f0101825:	e8 40 e8 ff ff       	call   f010006a <_panic>

f010182a <page_decref>:
f010182a:	55                   	push   %ebp
f010182b:	89 e5                	mov    %esp,%ebp
f010182d:	83 ec 08             	sub    $0x8,%esp
f0101830:	8b 55 08             	mov    0x8(%ebp),%edx
f0101833:	0f b7 42 04          	movzwl 0x4(%edx),%eax
f0101837:	83 e8 01             	sub    $0x1,%eax
f010183a:	66 89 42 04          	mov    %ax,0x4(%edx)
f010183e:	66 85 c0             	test   %ax,%ax
f0101841:	74 02                	je     f0101845 <page_decref+0x1b>
f0101843:	c9                   	leave
f0101844:	c3                   	ret
f0101845:	83 ec 0c             	sub    $0xc,%esp
f0101848:	52                   	push   %edx
f0101849:	e8 66 fb ff ff       	call   f01013b4 <page_free>
f010184e:	83 c4 10             	add    $0x10,%esp
f0101851:	eb f0                	jmp    f0101843 <page_decref+0x19>

f0101853 <pgdir_walk>:
f0101853:	55                   	push   %ebp
f0101854:	89 e5                	mov    %esp,%ebp
f0101856:	56                   	push   %esi
f0101857:	53                   	push   %ebx
f0101858:	8b 75 0c             	mov    0xc(%ebp),%esi
f010185b:	89 f3                	mov    %esi,%ebx
f010185d:	c1 eb 16             	shr    $0x16,%ebx
f0101860:	c1 e3 02             	shl    $0x2,%ebx
f0101863:	03 5d 08             	add    0x8(%ebp),%ebx
f0101866:	83 3b 00             	cmpl   $0x0,(%ebx)
f0101869:	75 06                	jne    f0101871 <pgdir_walk+0x1e>
f010186b:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
f010186f:	75 12                	jne    f0101883 <pgdir_walk+0x30>
f0101871:	8b 0b                	mov    (%ebx),%ecx
f0101873:	b8 00 00 00 00       	mov    $0x0,%eax
f0101878:	85 c9                	test   %ecx,%ecx
f010187a:	75 29                	jne    f01018a5 <pgdir_walk+0x52>
f010187c:	8d 65 f8             	lea    -0x8(%ebp),%esp
f010187f:	5b                   	pop    %ebx
f0101880:	5e                   	pop    %esi
f0101881:	5d                   	pop    %ebp
f0101882:	c3                   	ret
f0101883:	83 ec 0c             	sub    $0xc,%esp
f0101886:	6a 01                	push   $0x1
f0101888:	e8 e0 fa ff ff       	call   f010136d <page_alloc>
f010188d:	83 c4 10             	add    $0x10,%esp
f0101890:	85 c0                	test   %eax,%eax
f0101892:	74 dd                	je     f0101871 <pgdir_walk+0x1e>
f0101894:	66 83 40 04 01       	addw   $0x1,0x4(%eax)
f0101899:	e8 c3 f2 ff ff       	call   f0100b61 <page2pa>
f010189e:	83 c8 07             	or     $0x7,%eax
f01018a1:	89 c1                	mov    %eax,%ecx
f01018a3:	89 03                	mov    %eax,(%ebx)
f01018a5:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
f01018ab:	ba a8 01 00 00       	mov    $0x1a8,%edx
f01018b0:	b8 28 7a 10 f0       	mov    $0xf0107a28,%eax
f01018b5:	e8 41 f3 ff ff       	call   f0100bfb <_kaddr>
f01018ba:	c1 ee 0a             	shr    $0xa,%esi
f01018bd:	81 e6 fc 0f 00 00    	and    $0xffc,%esi
f01018c3:	01 f0                	add    %esi,%eax
f01018c5:	eb b5                	jmp    f010187c <pgdir_walk+0x29>

f01018c7 <page_lookup>:
f01018c7:	55                   	push   %ebp
f01018c8:	89 e5                	mov    %esp,%ebp
f01018ca:	53                   	push   %ebx
f01018cb:	83 ec 08             	sub    $0x8,%esp
f01018ce:	8b 5d 10             	mov    0x10(%ebp),%ebx
f01018d1:	6a 00                	push   $0x0
f01018d3:	ff 75 0c             	push   0xc(%ebp)
f01018d6:	ff 75 08             	push   0x8(%ebp)
f01018d9:	e8 75 ff ff ff       	call   f0101853 <pgdir_walk>
f01018de:	83 c4 10             	add    $0x10,%esp
f01018e1:	85 c0                	test   %eax,%eax
f01018e3:	74 17                	je     f01018fc <page_lookup+0x35>
f01018e5:	83 38 00             	cmpl   $0x0,(%eax)
f01018e8:	74 17                	je     f0101901 <page_lookup+0x3a>
f01018ea:	85 db                	test   %ebx,%ebx
f01018ec:	74 02                	je     f01018f0 <page_lookup+0x29>
f01018ee:	89 03                	mov    %eax,(%ebx)
f01018f0:	8b 00                	mov    (%eax),%eax
f01018f2:	25 00 f0 ff ff       	and    $0xfffff000,%eax
f01018f7:	e8 b7 f9 ff ff       	call   f01012b3 <pa2page>
f01018fc:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f01018ff:	c9                   	leave
f0101900:	c3                   	ret
f0101901:	b8 00 00 00 00       	mov    $0x0,%eax
f0101906:	eb f4                	jmp    f01018fc <page_lookup+0x35>

f0101908 <tlb_invalidate>:
f0101908:	55                   	push   %ebp
f0101909:	89 e5                	mov    %esp,%ebp
f010190b:	83 ec 08             	sub    $0x8,%esp
f010190e:	e8 e9 49 00 00       	call   f01062fc <cpunum>
f0101913:	6b c0 74             	imul   $0x74,%eax,%eax
f0101916:	83 b8 28 d0 1c f0 00 	cmpl   $0x0,-0xfe32fd8(%eax)
f010191d:	74 16                	je     f0101935 <tlb_invalidate+0x2d>
f010191f:	e8 d8 49 00 00       	call   f01062fc <cpunum>
f0101924:	6b c0 74             	imul   $0x74,%eax,%eax
f0101927:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f010192d:	8b 55 08             	mov    0x8(%ebp),%edx
f0101930:	39 50 60             	cmp    %edx,0x60(%eax)
f0101933:	75 08                	jne    f010193d <tlb_invalidate+0x35>
f0101935:	8b 45 0c             	mov    0xc(%ebp),%eax
f0101938:	e8 14 f2 ff ff       	call   f0100b51 <invlpg>
f010193d:	c9                   	leave
f010193e:	c3                   	ret

f010193f <page_remove>:
f010193f:	55                   	push   %ebp
f0101940:	89 e5                	mov    %esp,%ebp
f0101942:	57                   	push   %edi
f0101943:	56                   	push   %esi
f0101944:	53                   	push   %ebx
f0101945:	83 ec 20             	sub    $0x20,%esp
f0101948:	8b 5d 08             	mov    0x8(%ebp),%ebx
f010194b:	8b 75 0c             	mov    0xc(%ebp),%esi
f010194e:	6a 00                	push   $0x0
f0101950:	56                   	push   %esi
f0101951:	53                   	push   %ebx
f0101952:	e8 fc fe ff ff       	call   f0101853 <pgdir_walk>
f0101957:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f010195a:	83 c4 0c             	add    $0xc,%esp
f010195d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
f0101960:	50                   	push   %eax
f0101961:	56                   	push   %esi
f0101962:	53                   	push   %ebx
f0101963:	e8 5f ff ff ff       	call   f01018c7 <page_lookup>
f0101968:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f010196b:	83 c4 10             	add    $0x10,%esp
f010196e:	85 ff                	test   %edi,%edi
f0101970:	74 05                	je     f0101977 <page_remove+0x38>
f0101972:	83 3f 00             	cmpl   $0x0,(%edi)
f0101975:	75 08                	jne    f010197f <page_remove+0x40>
f0101977:	8d 65 f4             	lea    -0xc(%ebp),%esp
f010197a:	5b                   	pop    %ebx
f010197b:	5e                   	pop    %esi
f010197c:	5f                   	pop    %edi
f010197d:	5d                   	pop    %ebp
f010197e:	c3                   	ret
f010197f:	83 ec 0c             	sub    $0xc,%esp
f0101982:	50                   	push   %eax
f0101983:	e8 a2 fe ff ff       	call   f010182a <page_decref>
f0101988:	c7 07 00 00 00 00    	movl   $0x0,(%edi)
f010198e:	83 c4 08             	add    $0x8,%esp
f0101991:	56                   	push   %esi
f0101992:	53                   	push   %ebx
f0101993:	e8 70 ff ff ff       	call   f0101908 <tlb_invalidate>
f0101998:	83 c4 10             	add    $0x10,%esp
f010199b:	eb da                	jmp    f0101977 <page_remove+0x38>

f010199d <boot_map_region>:
f010199d:	55                   	push   %ebp
f010199e:	89 e5                	mov    %esp,%ebp
f01019a0:	57                   	push   %edi
f01019a1:	56                   	push   %esi
f01019a2:	53                   	push   %ebx
f01019a3:	83 ec 1c             	sub    $0x1c,%esp
f01019a6:	89 c6                	mov    %eax,%esi
f01019a8:	89 55 dc             	mov    %edx,-0x24(%ebp)
f01019ab:	89 4d e0             	mov    %ecx,-0x20(%ebp)
f01019ae:	bb 00 00 00 00       	mov    $0x0,%ebx
f01019b3:	eb 38                	jmp    f01019ed <boot_map_region+0x50>
f01019b5:	8b 45 dc             	mov    -0x24(%ebp),%eax
f01019b8:	8d 3c 03             	lea    (%ebx,%eax,1),%edi
f01019bb:	83 ec 04             	sub    $0x4,%esp
f01019be:	6a 01                	push   $0x1
f01019c0:	57                   	push   %edi
f01019c1:	56                   	push   %esi
f01019c2:	e8 8c fe ff ff       	call   f0101853 <pgdir_walk>
f01019c7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f01019ca:	83 c4 08             	add    $0x8,%esp
f01019cd:	57                   	push   %edi
f01019ce:	56                   	push   %esi
f01019cf:	e8 6b ff ff ff       	call   f010193f <page_remove>
f01019d4:	89 d8                	mov    %ebx,%eax
f01019d6:	03 45 08             	add    0x8(%ebp),%eax
f01019d9:	0b 45 0c             	or     0xc(%ebp),%eax
f01019dc:	83 c8 01             	or     $0x1,%eax
f01019df:	8b 55 e4             	mov    -0x1c(%ebp),%edx
f01019e2:	89 02                	mov    %eax,(%edx)
f01019e4:	81 c3 00 10 00 00    	add    $0x1000,%ebx
f01019ea:	83 c4 10             	add    $0x10,%esp
f01019ed:	8b 45 e0             	mov    -0x20(%ebp),%eax
f01019f0:	39 c3                	cmp    %eax,%ebx
f01019f2:	72 c1                	jb     f01019b5 <boot_map_region+0x18>
f01019f4:	8d 65 f4             	lea    -0xc(%ebp),%esp
f01019f7:	5b                   	pop    %ebx
f01019f8:	5e                   	pop    %esi
f01019f9:	5f                   	pop    %edi
f01019fa:	5d                   	pop    %ebp
f01019fb:	c3                   	ret

f01019fc <mem_init_mp>:
f01019fc:	55                   	push   %ebp
f01019fd:	89 e5                	mov    %esp,%ebp
f01019ff:	57                   	push   %edi
f0101a00:	56                   	push   %esi
f0101a01:	53                   	push   %ebx
f0101a02:	83 ec 0c             	sub    $0xc,%esp
f0101a05:	bb 00 d0 18 f0       	mov    $0xf018d000,%ebx
f0101a0a:	bf 00 d0 1c f0       	mov    $0xf01cd000,%edi
f0101a0f:	be 00 80 ff ef       	mov    $0xefff8000,%esi
f0101a14:	89 d9                	mov    %ebx,%ecx
f0101a16:	ba 12 01 00 00       	mov    $0x112,%edx
f0101a1b:	b8 28 7a 10 f0       	mov    $0xf0107a28,%eax
f0101a20:	e8 88 f2 ff ff       	call   f0100cad <_paddr>
f0101a25:	83 ec 08             	sub    $0x8,%esp
f0101a28:	6a 03                	push   $0x3
f0101a2a:	50                   	push   %eax
f0101a2b:	b9 00 80 00 00       	mov    $0x8000,%ecx
f0101a30:	89 f2                	mov    %esi,%edx
f0101a32:	a1 5c 92 18 f0       	mov    0xf018925c,%eax
f0101a37:	e8 61 ff ff ff       	call   f010199d <boot_map_region>
f0101a3c:	81 c3 00 80 00 00    	add    $0x8000,%ebx
f0101a42:	81 ee 00 00 01 00    	sub    $0x10000,%esi
f0101a48:	83 c4 10             	add    $0x10,%esp
f0101a4b:	39 fb                	cmp    %edi,%ebx
f0101a4d:	75 c5                	jne    f0101a14 <mem_init_mp+0x18>
f0101a4f:	8d 65 f4             	lea    -0xc(%ebp),%esp
f0101a52:	5b                   	pop    %ebx
f0101a53:	5e                   	pop    %esi
f0101a54:	5f                   	pop    %edi
f0101a55:	5d                   	pop    %ebp
f0101a56:	c3                   	ret

f0101a57 <page_insert>:
f0101a57:	55                   	push   %ebp
f0101a58:	89 e5                	mov    %esp,%ebp
f0101a5a:	57                   	push   %edi
f0101a5b:	56                   	push   %esi
f0101a5c:	53                   	push   %ebx
f0101a5d:	83 ec 10             	sub    $0x10,%esp
f0101a60:	8b 75 0c             	mov    0xc(%ebp),%esi
f0101a63:	8b 7d 10             	mov    0x10(%ebp),%edi
f0101a66:	6a 01                	push   $0x1
f0101a68:	57                   	push   %edi
f0101a69:	ff 75 08             	push   0x8(%ebp)
f0101a6c:	e8 e2 fd ff ff       	call   f0101853 <pgdir_walk>
f0101a71:	83 c4 10             	add    $0x10,%esp
f0101a74:	85 c0                	test   %eax,%eax
f0101a76:	74 32                	je     f0101aaa <page_insert+0x53>
f0101a78:	89 c3                	mov    %eax,%ebx
f0101a7a:	66 83 46 04 01       	addw   $0x1,0x4(%esi)
f0101a7f:	83 ec 08             	sub    $0x8,%esp
f0101a82:	57                   	push   %edi
f0101a83:	ff 75 08             	push   0x8(%ebp)
f0101a86:	e8 b4 fe ff ff       	call   f010193f <page_remove>
f0101a8b:	89 f0                	mov    %esi,%eax
f0101a8d:	e8 cf f0 ff ff       	call   f0100b61 <page2pa>
f0101a92:	0b 45 14             	or     0x14(%ebp),%eax
f0101a95:	83 c8 01             	or     $0x1,%eax
f0101a98:	89 03                	mov    %eax,(%ebx)
f0101a9a:	83 c4 10             	add    $0x10,%esp
f0101a9d:	b8 00 00 00 00       	mov    $0x0,%eax
f0101aa2:	8d 65 f4             	lea    -0xc(%ebp),%esp
f0101aa5:	5b                   	pop    %ebx
f0101aa6:	5e                   	pop    %esi
f0101aa7:	5f                   	pop    %edi
f0101aa8:	5d                   	pop    %ebp
f0101aa9:	c3                   	ret
f0101aaa:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
f0101aaf:	eb f1                	jmp    f0101aa2 <page_insert+0x4b>

f0101ab1 <check_page_installed_pgdir>:
f0101ab1:	55                   	push   %ebp
f0101ab2:	89 e5                	mov    %esp,%ebp
f0101ab4:	57                   	push   %edi
f0101ab5:	56                   	push   %esi
f0101ab6:	53                   	push   %ebx
f0101ab7:	83 ec 18             	sub    $0x18,%esp
f0101aba:	6a 00                	push   $0x0
f0101abc:	e8 ac f8 ff ff       	call   f010136d <page_alloc>
f0101ac1:	83 c4 10             	add    $0x10,%esp
f0101ac4:	85 c0                	test   %eax,%eax
f0101ac6:	0f 84 67 01 00 00    	je     f0101c33 <check_page_installed_pgdir+0x182>
f0101acc:	89 c6                	mov    %eax,%esi
f0101ace:	83 ec 0c             	sub    $0xc,%esp
f0101ad1:	6a 00                	push   $0x0
f0101ad3:	e8 95 f8 ff ff       	call   f010136d <page_alloc>
f0101ad8:	89 c7                	mov    %eax,%edi
f0101ada:	83 c4 10             	add    $0x10,%esp
f0101add:	85 c0                	test   %eax,%eax
f0101adf:	0f 84 67 01 00 00    	je     f0101c4c <check_page_installed_pgdir+0x19b>
f0101ae5:	83 ec 0c             	sub    $0xc,%esp
f0101ae8:	6a 00                	push   $0x0
f0101aea:	e8 7e f8 ff ff       	call   f010136d <page_alloc>
f0101aef:	89 c3                	mov    %eax,%ebx
f0101af1:	83 c4 10             	add    $0x10,%esp
f0101af4:	85 c0                	test   %eax,%eax
f0101af6:	0f 84 69 01 00 00    	je     f0101c65 <check_page_installed_pgdir+0x1b4>
f0101afc:	83 ec 0c             	sub    $0xc,%esp
f0101aff:	56                   	push   %esi
f0101b00:	e8 af f8 ff ff       	call   f01013b4 <page_free>
f0101b05:	89 f8                	mov    %edi,%eax
f0101b07:	e8 1b f1 ff ff       	call   f0100c27 <page2kva>
f0101b0c:	83 c4 0c             	add    $0xc,%esp
f0101b0f:	68 00 10 00 00       	push   $0x1000
f0101b14:	6a 01                	push   $0x1
f0101b16:	50                   	push   %eax
f0101b17:	e8 7b 41 00 00       	call   f0105c97 <memset>
f0101b1c:	89 d8                	mov    %ebx,%eax
f0101b1e:	e8 04 f1 ff ff       	call   f0100c27 <page2kva>
f0101b23:	83 c4 0c             	add    $0xc,%esp
f0101b26:	68 00 10 00 00       	push   $0x1000
f0101b2b:	6a 02                	push   $0x2
f0101b2d:	50                   	push   %eax
f0101b2e:	e8 64 41 00 00       	call   f0105c97 <memset>
f0101b33:	6a 02                	push   $0x2
f0101b35:	68 00 10 00 00       	push   $0x1000
f0101b3a:	57                   	push   %edi
f0101b3b:	ff 35 5c 92 18 f0    	push   0xf018925c
f0101b41:	e8 11 ff ff ff       	call   f0101a57 <page_insert>
f0101b46:	83 c4 20             	add    $0x20,%esp
f0101b49:	66 83 7f 04 01       	cmpw   $0x1,0x4(%edi)
f0101b4e:	0f 85 2a 01 00 00    	jne    f0101c7e <check_page_installed_pgdir+0x1cd>
f0101b54:	81 3d 00 10 00 00 01 	cmpl   $0x1010101,0x1000
f0101b5b:	01 01 01 
f0101b5e:	0f 85 33 01 00 00    	jne    f0101c97 <check_page_installed_pgdir+0x1e6>
f0101b64:	6a 02                	push   $0x2
f0101b66:	68 00 10 00 00       	push   $0x1000
f0101b6b:	53                   	push   %ebx
f0101b6c:	ff 35 5c 92 18 f0    	push   0xf018925c
f0101b72:	e8 e0 fe ff ff       	call   f0101a57 <page_insert>
f0101b77:	83 c4 10             	add    $0x10,%esp
f0101b7a:	81 3d 00 10 00 00 02 	cmpl   $0x2020202,0x1000
f0101b81:	02 02 02 
f0101b84:	0f 85 26 01 00 00    	jne    f0101cb0 <check_page_installed_pgdir+0x1ff>
f0101b8a:	66 83 7b 04 01       	cmpw   $0x1,0x4(%ebx)
f0101b8f:	0f 85 34 01 00 00    	jne    f0101cc9 <check_page_installed_pgdir+0x218>
f0101b95:	66 83 7f 04 00       	cmpw   $0x0,0x4(%edi)
f0101b9a:	0f 85 42 01 00 00    	jne    f0101ce2 <check_page_installed_pgdir+0x231>
f0101ba0:	c7 05 00 10 00 00 03 	movl   $0x3030303,0x1000
f0101ba7:	03 03 03 
f0101baa:	89 d8                	mov    %ebx,%eax
f0101bac:	e8 76 f0 ff ff       	call   f0100c27 <page2kva>
f0101bb1:	81 38 03 03 03 03    	cmpl   $0x3030303,(%eax)
f0101bb7:	0f 85 3e 01 00 00    	jne    f0101cfb <check_page_installed_pgdir+0x24a>
f0101bbd:	83 ec 08             	sub    $0x8,%esp
f0101bc0:	68 00 10 00 00       	push   $0x1000
f0101bc5:	ff 35 5c 92 18 f0    	push   0xf018925c
f0101bcb:	e8 6f fd ff ff       	call   f010193f <page_remove>
f0101bd0:	83 c4 10             	add    $0x10,%esp
f0101bd3:	66 83 7b 04 00       	cmpw   $0x0,0x4(%ebx)
f0101bd8:	0f 85 36 01 00 00    	jne    f0101d14 <check_page_installed_pgdir+0x263>
f0101bde:	8b 1d 5c 92 18 f0    	mov    0xf018925c,%ebx
f0101be4:	89 f0                	mov    %esi,%eax
f0101be6:	e8 76 ef ff ff       	call   f0100b61 <page2pa>
f0101beb:	89 c2                	mov    %eax,%edx
f0101bed:	8b 03                	mov    (%ebx),%eax
f0101bef:	25 00 f0 ff ff       	and    $0xfffff000,%eax
f0101bf4:	39 d0                	cmp    %edx,%eax
f0101bf6:	0f 85 31 01 00 00    	jne    f0101d2d <check_page_installed_pgdir+0x27c>
f0101bfc:	c7 03 00 00 00 00    	movl   $0x0,(%ebx)
f0101c02:	66 83 7e 04 01       	cmpw   $0x1,0x4(%esi)
f0101c07:	0f 85 39 01 00 00    	jne    f0101d46 <check_page_installed_pgdir+0x295>
f0101c0d:	66 c7 46 04 00 00    	movw   $0x0,0x4(%esi)
f0101c13:	83 ec 0c             	sub    $0xc,%esp
f0101c16:	56                   	push   %esi
f0101c17:	e8 98 f7 ff ff       	call   f01013b4 <page_free>
f0101c1c:	c7 04 24 48 6f 10 f0 	movl   $0xf0106f48,(%esp)
f0101c23:	e8 0e 1c 00 00       	call   f0103836 <cprintf>
f0101c28:	83 c4 10             	add    $0x10,%esp
f0101c2b:	8d 65 f4             	lea    -0xc(%ebp),%esp
f0101c2e:	5b                   	pop    %ebx
f0101c2f:	5e                   	pop    %esi
f0101c30:	5f                   	pop    %edi
f0101c31:	5d                   	pop    %ebp
f0101c32:	c3                   	ret
f0101c33:	68 56 7b 10 f0       	push   $0xf0107b56
f0101c38:	68 34 7a 10 f0       	push   $0xf0107a34
f0101c3d:	68 5e 04 00 00       	push   $0x45e
f0101c42:	68 28 7a 10 f0       	push   $0xf0107a28
f0101c47:	e8 1e e4 ff ff       	call   f010006a <_panic>
f0101c4c:	68 6c 7b 10 f0       	push   $0xf0107b6c
f0101c51:	68 34 7a 10 f0       	push   $0xf0107a34
f0101c56:	68 5f 04 00 00       	push   $0x45f
f0101c5b:	68 28 7a 10 f0       	push   $0xf0107a28
f0101c60:	e8 05 e4 ff ff       	call   f010006a <_panic>
f0101c65:	68 82 7b 10 f0       	push   $0xf0107b82
f0101c6a:	68 34 7a 10 f0       	push   $0xf0107a34
f0101c6f:	68 60 04 00 00       	push   $0x460
f0101c74:	68 28 7a 10 f0       	push   $0xf0107a28
f0101c79:	e8 ec e3 ff ff       	call   f010006a <_panic>
f0101c7e:	68 fc 7b 10 f0       	push   $0xf0107bfc
f0101c83:	68 34 7a 10 f0       	push   $0xf0107a34
f0101c88:	68 65 04 00 00       	push   $0x465
f0101c8d:	68 28 7a 10 f0       	push   $0xf0107a28
f0101c92:	e8 d3 e3 ff ff       	call   f010006a <_panic>
f0101c97:	68 ac 6e 10 f0       	push   $0xf0106eac
f0101c9c:	68 34 7a 10 f0       	push   $0xf0107a34
f0101ca1:	68 66 04 00 00       	push   $0x466
f0101ca6:	68 28 7a 10 f0       	push   $0xf0107a28
f0101cab:	e8 ba e3 ff ff       	call   f010006a <_panic>
f0101cb0:	68 d0 6e 10 f0       	push   $0xf0106ed0
f0101cb5:	68 34 7a 10 f0       	push   $0xf0107a34
f0101cba:	68 68 04 00 00       	push   $0x468
f0101cbf:	68 28 7a 10 f0       	push   $0xf0107a28
f0101cc4:	e8 a1 e3 ff ff       	call   f010006a <_panic>
f0101cc9:	68 0d 7c 10 f0       	push   $0xf0107c0d
f0101cce:	68 34 7a 10 f0       	push   $0xf0107a34
f0101cd3:	68 69 04 00 00       	push   $0x469
f0101cd8:	68 28 7a 10 f0       	push   $0xf0107a28
f0101cdd:	e8 88 e3 ff ff       	call   f010006a <_panic>
f0101ce2:	68 1e 7c 10 f0       	push   $0xf0107c1e
f0101ce7:	68 34 7a 10 f0       	push   $0xf0107a34
f0101cec:	68 6a 04 00 00       	push   $0x46a
f0101cf1:	68 28 7a 10 f0       	push   $0xf0107a28
f0101cf6:	e8 6f e3 ff ff       	call   f010006a <_panic>
f0101cfb:	68 f4 6e 10 f0       	push   $0xf0106ef4
f0101d00:	68 34 7a 10 f0       	push   $0xf0107a34
f0101d05:	68 6c 04 00 00       	push   $0x46c
f0101d0a:	68 28 7a 10 f0       	push   $0xf0107a28
f0101d0f:	e8 56 e3 ff ff       	call   f010006a <_panic>
f0101d14:	68 2f 7c 10 f0       	push   $0xf0107c2f
f0101d19:	68 34 7a 10 f0       	push   $0xf0107a34
f0101d1e:	68 6e 04 00 00       	push   $0x46e
f0101d23:	68 28 7a 10 f0       	push   $0xf0107a28
f0101d28:	e8 3d e3 ff ff       	call   f010006a <_panic>
f0101d2d:	68 20 6f 10 f0       	push   $0xf0106f20
f0101d32:	68 34 7a 10 f0       	push   $0xf0107a34
f0101d37:	68 71 04 00 00       	push   $0x471
f0101d3c:	68 28 7a 10 f0       	push   $0xf0107a28
f0101d41:	e8 24 e3 ff ff       	call   f010006a <_panic>
f0101d46:	68 40 7c 10 f0       	push   $0xf0107c40
f0101d4b:	68 34 7a 10 f0       	push   $0xf0107a34
f0101d50:	68 73 04 00 00       	push   $0x473
f0101d55:	68 28 7a 10 f0       	push   $0xf0107a28
f0101d5a:	e8 0b e3 ff ff       	call   f010006a <_panic>

f0101d5f <mmio_map_region>:
f0101d5f:	55                   	push   %ebp
f0101d60:	89 e5                	mov    %esp,%ebp
f0101d62:	53                   	push   %ebx
f0101d63:	83 ec 04             	sub    $0x4,%esp
f0101d66:	8b 45 08             	mov    0x8(%ebp),%eax
f0101d69:	25 00 f0 ff ff       	and    $0xfffff000,%eax
f0101d6e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
f0101d71:	8d 99 ff 0f 00 00    	lea    0xfff(%ecx),%ebx
f0101d77:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
f0101d7d:	8b 15 00 23 11 f0    	mov    0xf0112300,%edx
f0101d83:	8d 0c 1a             	lea    (%edx,%ebx,1),%ecx
f0101d86:	81 f9 ff ff bf ef    	cmp    $0xefbfffff,%ecx
f0101d8c:	77 24                	ja     f0101db2 <mmio_map_region+0x53>
f0101d8e:	83 ec 08             	sub    $0x8,%esp
f0101d91:	6a 1b                	push   $0x1b
f0101d93:	50                   	push   %eax
f0101d94:	89 d9                	mov    %ebx,%ecx
f0101d96:	a1 5c 92 18 f0       	mov    0xf018925c,%eax
f0101d9b:	e8 fd fb ff ff       	call   f010199d <boot_map_region>
f0101da0:	a1 00 23 11 f0       	mov    0xf0112300,%eax
f0101da5:	01 c3                	add    %eax,%ebx
f0101da7:	89 1d 00 23 11 f0    	mov    %ebx,0xf0112300
f0101dad:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f0101db0:	c9                   	leave
f0101db1:	c3                   	ret
f0101db2:	83 ec 04             	sub    $0x4,%esp
f0101db5:	68 74 6f 10 f0       	push   $0xf0106f74
f0101dba:	68 69 02 00 00       	push   $0x269
f0101dbf:	68 28 7a 10 f0       	push   $0xf0107a28
f0101dc4:	e8 a1 e2 ff ff       	call   f010006a <_panic>

f0101dc9 <check_page>:
f0101dc9:	55                   	push   %ebp
f0101dca:	89 e5                	mov    %esp,%ebp
f0101dcc:	57                   	push   %edi
f0101dcd:	56                   	push   %esi
f0101dce:	53                   	push   %ebx
f0101dcf:	83 ec 38             	sub    $0x38,%esp
f0101dd2:	6a 00                	push   $0x0
f0101dd4:	e8 94 f5 ff ff       	call   f010136d <page_alloc>
f0101dd9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
f0101ddc:	83 c4 10             	add    $0x10,%esp
f0101ddf:	85 c0                	test   %eax,%eax
f0101de1:	0f 84 6a 07 00 00    	je     f0102551 <check_page+0x788>
f0101de7:	83 ec 0c             	sub    $0xc,%esp
f0101dea:	6a 00                	push   $0x0
f0101dec:	e8 7c f5 ff ff       	call   f010136d <page_alloc>
f0101df1:	89 c7                	mov    %eax,%edi
f0101df3:	83 c4 10             	add    $0x10,%esp
f0101df6:	85 c0                	test   %eax,%eax
f0101df8:	0f 84 6c 07 00 00    	je     f010256a <check_page+0x7a1>
f0101dfe:	83 ec 0c             	sub    $0xc,%esp
f0101e01:	6a 00                	push   $0x0
f0101e03:	e8 65 f5 ff ff       	call   f010136d <page_alloc>
f0101e08:	89 c3                	mov    %eax,%ebx
f0101e0a:	83 c4 10             	add    $0x10,%esp
f0101e0d:	85 c0                	test   %eax,%eax
f0101e0f:	0f 84 6e 07 00 00    	je     f0102583 <check_page+0x7ba>
f0101e15:	39 7d d4             	cmp    %edi,-0x2c(%ebp)
f0101e18:	0f 84 7e 07 00 00    	je     f010259c <check_page+0x7d3>
f0101e1e:	39 45 d4             	cmp    %eax,-0x2c(%ebp)
f0101e21:	0f 84 8e 07 00 00    	je     f01025b5 <check_page+0x7ec>
f0101e27:	39 c7                	cmp    %eax,%edi
f0101e29:	0f 84 86 07 00 00    	je     f01025b5 <check_page+0x7ec>
f0101e2f:	a1 6c 92 18 f0       	mov    0xf018926c,%eax
f0101e34:	89 45 c8             	mov    %eax,-0x38(%ebp)
f0101e37:	c7 05 6c 92 18 f0 00 	movl   $0x0,0xf018926c
f0101e3e:	00 00 00 
f0101e41:	83 ec 0c             	sub    $0xc,%esp
f0101e44:	6a 00                	push   $0x0
f0101e46:	e8 22 f5 ff ff       	call   f010136d <page_alloc>
f0101e4b:	83 c4 10             	add    $0x10,%esp
f0101e4e:	85 c0                	test   %eax,%eax
f0101e50:	0f 85 78 07 00 00    	jne    f01025ce <check_page+0x805>
f0101e56:	83 ec 04             	sub    $0x4,%esp
f0101e59:	8d 45 e4             	lea    -0x1c(%ebp),%eax
f0101e5c:	50                   	push   %eax
f0101e5d:	6a 00                	push   $0x0
f0101e5f:	ff 35 5c 92 18 f0    	push   0xf018925c
f0101e65:	e8 5d fa ff ff       	call   f01018c7 <page_lookup>
f0101e6a:	83 c4 10             	add    $0x10,%esp
f0101e6d:	85 c0                	test   %eax,%eax
f0101e6f:	0f 85 72 07 00 00    	jne    f01025e7 <check_page+0x81e>
f0101e75:	6a 02                	push   $0x2
f0101e77:	6a 00                	push   $0x0
f0101e79:	57                   	push   %edi
f0101e7a:	ff 35 5c 92 18 f0    	push   0xf018925c
f0101e80:	e8 d2 fb ff ff       	call   f0101a57 <page_insert>
f0101e85:	83 c4 10             	add    $0x10,%esp
f0101e88:	85 c0                	test   %eax,%eax
f0101e8a:	0f 89 70 07 00 00    	jns    f0102600 <check_page+0x837>
f0101e90:	83 ec 0c             	sub    $0xc,%esp
f0101e93:	ff 75 d4             	push   -0x2c(%ebp)
f0101e96:	e8 19 f5 ff ff       	call   f01013b4 <page_free>
f0101e9b:	6a 02                	push   $0x2
f0101e9d:	6a 00                	push   $0x0
f0101e9f:	57                   	push   %edi
f0101ea0:	ff 35 5c 92 18 f0    	push   0xf018925c
f0101ea6:	e8 ac fb ff ff       	call   f0101a57 <page_insert>
f0101eab:	83 c4 20             	add    $0x20,%esp
f0101eae:	85 c0                	test   %eax,%eax
f0101eb0:	0f 85 63 07 00 00    	jne    f0102619 <check_page+0x850>
f0101eb6:	8b 35 5c 92 18 f0    	mov    0xf018925c,%esi
f0101ebc:	8b 45 d4             	mov    -0x2c(%ebp),%eax
f0101ebf:	e8 9d ec ff ff       	call   f0100b61 <page2pa>
f0101ec4:	89 c2                	mov    %eax,%edx
f0101ec6:	8b 06                	mov    (%esi),%eax
f0101ec8:	25 00 f0 ff ff       	and    $0xfffff000,%eax
f0101ecd:	39 d0                	cmp    %edx,%eax
f0101ecf:	0f 85 5d 07 00 00    	jne    f0102632 <check_page+0x869>
f0101ed5:	ba 00 00 00 00       	mov    $0x0,%edx
f0101eda:	89 f0                	mov    %esi,%eax
f0101edc:	e8 64 ed ff ff       	call   f0100c45 <check_va2pa>
f0101ee1:	89 45 d0             	mov    %eax,-0x30(%ebp)
f0101ee4:	89 f8                	mov    %edi,%eax
f0101ee6:	e8 76 ec ff ff       	call   f0100b61 <page2pa>
f0101eeb:	39 45 d0             	cmp    %eax,-0x30(%ebp)
f0101eee:	0f 85 57 07 00 00    	jne    f010264b <check_page+0x882>
f0101ef4:	66 83 7f 04 01       	cmpw   $0x1,0x4(%edi)
f0101ef9:	0f 85 65 07 00 00    	jne    f0102664 <check_page+0x89b>
f0101eff:	8b 45 d4             	mov    -0x2c(%ebp),%eax
f0101f02:	66 83 78 04 01       	cmpw   $0x1,0x4(%eax)
f0101f07:	0f 85 70 07 00 00    	jne    f010267d <check_page+0x8b4>
f0101f0d:	6a 02                	push   $0x2
f0101f0f:	68 00 10 00 00       	push   $0x1000
f0101f14:	53                   	push   %ebx
f0101f15:	56                   	push   %esi
f0101f16:	e8 3c fb ff ff       	call   f0101a57 <page_insert>
f0101f1b:	83 c4 10             	add    $0x10,%esp
f0101f1e:	85 c0                	test   %eax,%eax
f0101f20:	0f 85 70 07 00 00    	jne    f0102696 <check_page+0x8cd>
f0101f26:	ba 00 10 00 00       	mov    $0x1000,%edx
f0101f2b:	a1 5c 92 18 f0       	mov    0xf018925c,%eax
f0101f30:	e8 10 ed ff ff       	call   f0100c45 <check_va2pa>
f0101f35:	89 c6                	mov    %eax,%esi
f0101f37:	89 d8                	mov    %ebx,%eax
f0101f39:	e8 23 ec ff ff       	call   f0100b61 <page2pa>
f0101f3e:	39 c6                	cmp    %eax,%esi
f0101f40:	0f 85 69 07 00 00    	jne    f01026af <check_page+0x8e6>
f0101f46:	66 83 7b 04 01       	cmpw   $0x1,0x4(%ebx)
f0101f4b:	0f 85 77 07 00 00    	jne    f01026c8 <check_page+0x8ff>
f0101f51:	83 ec 0c             	sub    $0xc,%esp
f0101f54:	6a 00                	push   $0x0
f0101f56:	e8 12 f4 ff ff       	call   f010136d <page_alloc>
f0101f5b:	83 c4 10             	add    $0x10,%esp
f0101f5e:	85 c0                	test   %eax,%eax
f0101f60:	0f 85 7b 07 00 00    	jne    f01026e1 <check_page+0x918>
f0101f66:	6a 02                	push   $0x2
f0101f68:	68 00 10 00 00       	push   $0x1000
f0101f6d:	53                   	push   %ebx
f0101f6e:	ff 35 5c 92 18 f0    	push   0xf018925c
f0101f74:	e8 de fa ff ff       	call   f0101a57 <page_insert>
f0101f79:	83 c4 10             	add    $0x10,%esp
f0101f7c:	85 c0                	test   %eax,%eax
f0101f7e:	0f 85 76 07 00 00    	jne    f01026fa <check_page+0x931>
f0101f84:	ba 00 10 00 00       	mov    $0x1000,%edx
f0101f89:	a1 5c 92 18 f0       	mov    0xf018925c,%eax
f0101f8e:	e8 b2 ec ff ff       	call   f0100c45 <check_va2pa>
f0101f93:	89 c6                	mov    %eax,%esi
f0101f95:	89 d8                	mov    %ebx,%eax
f0101f97:	e8 c5 eb ff ff       	call   f0100b61 <page2pa>
f0101f9c:	39 c6                	cmp    %eax,%esi
f0101f9e:	0f 85 6f 07 00 00    	jne    f0102713 <check_page+0x94a>
f0101fa4:	66 83 7b 04 01       	cmpw   $0x1,0x4(%ebx)
f0101fa9:	0f 85 7d 07 00 00    	jne    f010272c <check_page+0x963>
f0101faf:	83 ec 0c             	sub    $0xc,%esp
f0101fb2:	6a 00                	push   $0x0
f0101fb4:	e8 b4 f3 ff ff       	call   f010136d <page_alloc>
f0101fb9:	83 c4 10             	add    $0x10,%esp
f0101fbc:	85 c0                	test   %eax,%eax
f0101fbe:	0f 85 81 07 00 00    	jne    f0102745 <check_page+0x97c>
f0101fc4:	8b 35 5c 92 18 f0    	mov    0xf018925c,%esi
f0101fca:	8b 0e                	mov    (%esi),%ecx
f0101fcc:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
f0101fd2:	ba dc 03 00 00       	mov    $0x3dc,%edx
f0101fd7:	b8 28 7a 10 f0       	mov    $0xf0107a28,%eax
f0101fdc:	e8 1a ec ff ff       	call   f0100bfb <_kaddr>
f0101fe1:	89 45 d0             	mov    %eax,-0x30(%ebp)
f0101fe4:	83 ec 04             	sub    $0x4,%esp
f0101fe7:	6a 00                	push   $0x0
f0101fe9:	68 00 10 00 00       	push   $0x1000
f0101fee:	56                   	push   %esi
f0101fef:	e8 5f f8 ff ff       	call   f0101853 <pgdir_walk>
f0101ff4:	8b 75 d0             	mov    -0x30(%ebp),%esi
f0101ff7:	83 c6 04             	add    $0x4,%esi
f0101ffa:	83 c4 10             	add    $0x10,%esp
f0101ffd:	39 c6                	cmp    %eax,%esi
f0101fff:	0f 85 59 07 00 00    	jne    f010275e <check_page+0x995>
f0102005:	6a 06                	push   $0x6
f0102007:	68 00 10 00 00       	push   $0x1000
f010200c:	53                   	push   %ebx
f010200d:	ff 35 5c 92 18 f0    	push   0xf018925c
f0102013:	e8 3f fa ff ff       	call   f0101a57 <page_insert>
f0102018:	83 c4 10             	add    $0x10,%esp
f010201b:	85 c0                	test   %eax,%eax
f010201d:	0f 85 54 07 00 00    	jne    f0102777 <check_page+0x9ae>
f0102023:	8b 35 5c 92 18 f0    	mov    0xf018925c,%esi
f0102029:	ba 00 10 00 00       	mov    $0x1000,%edx
f010202e:	89 f0                	mov    %esi,%eax
f0102030:	e8 10 ec ff ff       	call   f0100c45 <check_va2pa>
f0102035:	89 45 d0             	mov    %eax,-0x30(%ebp)
f0102038:	89 d8                	mov    %ebx,%eax
f010203a:	e8 22 eb ff ff       	call   f0100b61 <page2pa>
f010203f:	39 45 d0             	cmp    %eax,-0x30(%ebp)
f0102042:	0f 85 48 07 00 00    	jne    f0102790 <check_page+0x9c7>
f0102048:	66 83 7b 04 01       	cmpw   $0x1,0x4(%ebx)
f010204d:	0f 85 56 07 00 00    	jne    f01027a9 <check_page+0x9e0>
f0102053:	83 ec 04             	sub    $0x4,%esp
f0102056:	6a 00                	push   $0x0
f0102058:	68 00 10 00 00       	push   $0x1000
f010205d:	56                   	push   %esi
f010205e:	e8 f0 f7 ff ff       	call   f0101853 <pgdir_walk>
f0102063:	83 c4 10             	add    $0x10,%esp
f0102066:	f6 00 04             	testb  $0x4,(%eax)
f0102069:	0f 84 53 07 00 00    	je     f01027c2 <check_page+0x9f9>
f010206f:	a1 5c 92 18 f0       	mov    0xf018925c,%eax
f0102074:	f6 00 04             	testb  $0x4,(%eax)
f0102077:	0f 84 5e 07 00 00    	je     f01027db <check_page+0xa12>
f010207d:	6a 02                	push   $0x2
f010207f:	68 00 10 00 00       	push   $0x1000
f0102084:	53                   	push   %ebx
f0102085:	50                   	push   %eax
f0102086:	e8 cc f9 ff ff       	call   f0101a57 <page_insert>
f010208b:	83 c4 10             	add    $0x10,%esp
f010208e:	85 c0                	test   %eax,%eax
f0102090:	0f 85 5e 07 00 00    	jne    f01027f4 <check_page+0xa2b>
f0102096:	83 ec 04             	sub    $0x4,%esp
f0102099:	6a 00                	push   $0x0
f010209b:	68 00 10 00 00       	push   $0x1000
f01020a0:	ff 35 5c 92 18 f0    	push   0xf018925c
f01020a6:	e8 a8 f7 ff ff       	call   f0101853 <pgdir_walk>
f01020ab:	83 c4 10             	add    $0x10,%esp
f01020ae:	f6 00 02             	testb  $0x2,(%eax)
f01020b1:	0f 84 56 07 00 00    	je     f010280d <check_page+0xa44>
f01020b7:	83 ec 04             	sub    $0x4,%esp
f01020ba:	6a 00                	push   $0x0
f01020bc:	68 00 10 00 00       	push   $0x1000
f01020c1:	ff 35 5c 92 18 f0    	push   0xf018925c
f01020c7:	e8 87 f7 ff ff       	call   f0101853 <pgdir_walk>
f01020cc:	83 c4 10             	add    $0x10,%esp
f01020cf:	f6 00 04             	testb  $0x4,(%eax)
f01020d2:	0f 85 4e 07 00 00    	jne    f0102826 <check_page+0xa5d>
f01020d8:	6a 02                	push   $0x2
f01020da:	68 00 00 40 00       	push   $0x400000
f01020df:	ff 75 d4             	push   -0x2c(%ebp)
f01020e2:	ff 35 5c 92 18 f0    	push   0xf018925c
f01020e8:	e8 6a f9 ff ff       	call   f0101a57 <page_insert>
f01020ed:	83 c4 10             	add    $0x10,%esp
f01020f0:	85 c0                	test   %eax,%eax
f01020f2:	0f 89 47 07 00 00    	jns    f010283f <check_page+0xa76>
f01020f8:	6a 02                	push   $0x2
f01020fa:	68 00 10 00 00       	push   $0x1000
f01020ff:	57                   	push   %edi
f0102100:	ff 35 5c 92 18 f0    	push   0xf018925c
f0102106:	e8 4c f9 ff ff       	call   f0101a57 <page_insert>
f010210b:	83 c4 10             	add    $0x10,%esp
f010210e:	85 c0                	test   %eax,%eax
f0102110:	0f 85 42 07 00 00    	jne    f0102858 <check_page+0xa8f>
f0102116:	83 ec 04             	sub    $0x4,%esp
f0102119:	6a 00                	push   $0x0
f010211b:	68 00 10 00 00       	push   $0x1000
f0102120:	ff 35 5c 92 18 f0    	push   0xf018925c
f0102126:	e8 28 f7 ff ff       	call   f0101853 <pgdir_walk>
f010212b:	83 c4 10             	add    $0x10,%esp
f010212e:	f6 00 04             	testb  $0x4,(%eax)
f0102131:	0f 85 3a 07 00 00    	jne    f0102871 <check_page+0xaa8>
f0102137:	8b 35 5c 92 18 f0    	mov    0xf018925c,%esi
f010213d:	ba 00 00 00 00       	mov    $0x0,%edx
f0102142:	89 f0                	mov    %esi,%eax
f0102144:	e8 fc ea ff ff       	call   f0100c45 <check_va2pa>
f0102149:	89 45 d0             	mov    %eax,-0x30(%ebp)
f010214c:	89 f8                	mov    %edi,%eax
f010214e:	e8 0e ea ff ff       	call   f0100b61 <page2pa>
f0102153:	89 45 cc             	mov    %eax,-0x34(%ebp)
f0102156:	39 45 d0             	cmp    %eax,-0x30(%ebp)
f0102159:	0f 85 2b 07 00 00    	jne    f010288a <check_page+0xac1>
f010215f:	ba 00 10 00 00       	mov    $0x1000,%edx
f0102164:	89 f0                	mov    %esi,%eax
f0102166:	e8 da ea ff ff       	call   f0100c45 <check_va2pa>
f010216b:	39 45 cc             	cmp    %eax,-0x34(%ebp)
f010216e:	0f 85 2f 07 00 00    	jne    f01028a3 <check_page+0xada>
f0102174:	66 83 7f 04 02       	cmpw   $0x2,0x4(%edi)
f0102179:	0f 85 3d 07 00 00    	jne    f01028bc <check_page+0xaf3>
f010217f:	66 83 7b 04 00       	cmpw   $0x0,0x4(%ebx)
f0102184:	0f 85 4b 07 00 00    	jne    f01028d5 <check_page+0xb0c>
f010218a:	83 ec 0c             	sub    $0xc,%esp
f010218d:	6a 00                	push   $0x0
f010218f:	e8 d9 f1 ff ff       	call   f010136d <page_alloc>
f0102194:	83 c4 10             	add    $0x10,%esp
f0102197:	39 c3                	cmp    %eax,%ebx
f0102199:	0f 85 4f 07 00 00    	jne    f01028ee <check_page+0xb25>
f010219f:	85 c0                	test   %eax,%eax
f01021a1:	0f 84 47 07 00 00    	je     f01028ee <check_page+0xb25>
f01021a7:	83 ec 08             	sub    $0x8,%esp
f01021aa:	6a 00                	push   $0x0
f01021ac:	ff 35 5c 92 18 f0    	push   0xf018925c
f01021b2:	e8 88 f7 ff ff       	call   f010193f <page_remove>
f01021b7:	8b 35 5c 92 18 f0    	mov    0xf018925c,%esi
f01021bd:	ba 00 00 00 00       	mov    $0x0,%edx
f01021c2:	89 f0                	mov    %esi,%eax
f01021c4:	e8 7c ea ff ff       	call   f0100c45 <check_va2pa>
f01021c9:	83 c4 10             	add    $0x10,%esp
f01021cc:	83 f8 ff             	cmp    $0xffffffff,%eax
f01021cf:	0f 85 32 07 00 00    	jne    f0102907 <check_page+0xb3e>
f01021d5:	ba 00 10 00 00       	mov    $0x1000,%edx
f01021da:	89 f0                	mov    %esi,%eax
f01021dc:	e8 64 ea ff ff       	call   f0100c45 <check_va2pa>
f01021e1:	89 45 d0             	mov    %eax,-0x30(%ebp)
f01021e4:	89 f8                	mov    %edi,%eax
f01021e6:	e8 76 e9 ff ff       	call   f0100b61 <page2pa>
f01021eb:	39 45 d0             	cmp    %eax,-0x30(%ebp)
f01021ee:	0f 85 2c 07 00 00    	jne    f0102920 <check_page+0xb57>
f01021f4:	66 83 7f 04 01       	cmpw   $0x1,0x4(%edi)
f01021f9:	0f 85 3a 07 00 00    	jne    f0102939 <check_page+0xb70>
f01021ff:	66 83 7b 04 00       	cmpw   $0x0,0x4(%ebx)
f0102204:	0f 85 48 07 00 00    	jne    f0102952 <check_page+0xb89>
f010220a:	6a 00                	push   $0x0
f010220c:	68 00 10 00 00       	push   $0x1000
f0102211:	57                   	push   %edi
f0102212:	56                   	push   %esi
f0102213:	e8 3f f8 ff ff       	call   f0101a57 <page_insert>
f0102218:	83 c4 10             	add    $0x10,%esp
f010221b:	85 c0                	test   %eax,%eax
f010221d:	0f 85 48 07 00 00    	jne    f010296b <check_page+0xba2>
f0102223:	66 83 7f 04 00       	cmpw   $0x0,0x4(%edi)
f0102228:	0f 84 56 07 00 00    	je     f0102984 <check_page+0xbbb>
f010222e:	83 3f 00             	cmpl   $0x0,(%edi)
f0102231:	0f 85 66 07 00 00    	jne    f010299d <check_page+0xbd4>
f0102237:	83 ec 08             	sub    $0x8,%esp
f010223a:	68 00 10 00 00       	push   $0x1000
f010223f:	ff 35 5c 92 18 f0    	push   0xf018925c
f0102245:	e8 f5 f6 ff ff       	call   f010193f <page_remove>
f010224a:	8b 35 5c 92 18 f0    	mov    0xf018925c,%esi
f0102250:	ba 00 00 00 00       	mov    $0x0,%edx
f0102255:	89 f0                	mov    %esi,%eax
f0102257:	e8 e9 e9 ff ff       	call   f0100c45 <check_va2pa>
f010225c:	83 c4 10             	add    $0x10,%esp
f010225f:	83 f8 ff             	cmp    $0xffffffff,%eax
f0102262:	0f 85 4e 07 00 00    	jne    f01029b6 <check_page+0xbed>
f0102268:	ba 00 10 00 00       	mov    $0x1000,%edx
f010226d:	89 f0                	mov    %esi,%eax
f010226f:	e8 d1 e9 ff ff       	call   f0100c45 <check_va2pa>
f0102274:	83 f8 ff             	cmp    $0xffffffff,%eax
f0102277:	0f 85 52 07 00 00    	jne    f01029cf <check_page+0xc06>
f010227d:	66 83 7f 04 00       	cmpw   $0x0,0x4(%edi)
f0102282:	0f 85 60 07 00 00    	jne    f01029e8 <check_page+0xc1f>
f0102288:	66 83 7b 04 00       	cmpw   $0x0,0x4(%ebx)
f010228d:	0f 85 6e 07 00 00    	jne    f0102a01 <check_page+0xc38>
f0102293:	83 ec 0c             	sub    $0xc,%esp
f0102296:	6a 00                	push   $0x0
f0102298:	e8 d0 f0 ff ff       	call   f010136d <page_alloc>
f010229d:	83 c4 10             	add    $0x10,%esp
f01022a0:	39 c7                	cmp    %eax,%edi
f01022a2:	0f 85 72 07 00 00    	jne    f0102a1a <check_page+0xc51>
f01022a8:	85 c0                	test   %eax,%eax
f01022aa:	0f 84 6a 07 00 00    	je     f0102a1a <check_page+0xc51>
f01022b0:	83 ec 0c             	sub    $0xc,%esp
f01022b3:	6a 00                	push   $0x0
f01022b5:	e8 b3 f0 ff ff       	call   f010136d <page_alloc>
f01022ba:	83 c4 10             	add    $0x10,%esp
f01022bd:	85 c0                	test   %eax,%eax
f01022bf:	0f 85 6e 07 00 00    	jne    f0102a33 <check_page+0xc6a>
f01022c5:	8b 35 5c 92 18 f0    	mov    0xf018925c,%esi
f01022cb:	8b 45 d4             	mov    -0x2c(%ebp),%eax
f01022ce:	e8 8e e8 ff ff       	call   f0100b61 <page2pa>
f01022d3:	89 c2                	mov    %eax,%edx
f01022d5:	8b 06                	mov    (%esi),%eax
f01022d7:	25 00 f0 ff ff       	and    $0xfffff000,%eax
f01022dc:	39 d0                	cmp    %edx,%eax
f01022de:	0f 85 68 07 00 00    	jne    f0102a4c <check_page+0xc83>
f01022e4:	c7 06 00 00 00 00    	movl   $0x0,(%esi)
f01022ea:	8b 45 d4             	mov    -0x2c(%ebp),%eax
f01022ed:	66 83 78 04 01       	cmpw   $0x1,0x4(%eax)
f01022f2:	0f 85 6d 07 00 00    	jne    f0102a65 <check_page+0xc9c>
f01022f8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
f01022fb:	66 c7 40 04 00 00    	movw   $0x0,0x4(%eax)
f0102301:	83 ec 0c             	sub    $0xc,%esp
f0102304:	50                   	push   %eax
f0102305:	e8 aa f0 ff ff       	call   f01013b4 <page_free>
f010230a:	83 c4 0c             	add    $0xc,%esp
f010230d:	6a 01                	push   $0x1
f010230f:	68 00 10 40 00       	push   $0x401000
f0102314:	ff 35 5c 92 18 f0    	push   0xf018925c
f010231a:	e8 34 f5 ff ff       	call   f0101853 <pgdir_walk>
f010231f:	89 45 d0             	mov    %eax,-0x30(%ebp)
f0102322:	8b 35 5c 92 18 f0    	mov    0xf018925c,%esi
f0102328:	8b 4e 04             	mov    0x4(%esi),%ecx
f010232b:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
f0102331:	ba 20 04 00 00       	mov    $0x420,%edx
f0102336:	b8 28 7a 10 f0       	mov    $0xf0107a28,%eax
f010233b:	e8 bb e8 ff ff       	call   f0100bfb <_kaddr>
f0102340:	83 c0 04             	add    $0x4,%eax
f0102343:	83 c4 10             	add    $0x10,%esp
f0102346:	39 45 d0             	cmp    %eax,-0x30(%ebp)
f0102349:	0f 85 2f 07 00 00    	jne    f0102a7e <check_page+0xcb5>
f010234f:	c7 46 04 00 00 00 00 	movl   $0x0,0x4(%esi)
f0102356:	8b 75 d4             	mov    -0x2c(%ebp),%esi
f0102359:	89 f0                	mov    %esi,%eax
f010235b:	66 c7 46 04 00 00    	movw   $0x0,0x4(%esi)
f0102361:	e8 c1 e8 ff ff       	call   f0100c27 <page2kva>
f0102366:	83 ec 04             	sub    $0x4,%esp
f0102369:	68 00 10 00 00       	push   $0x1000
f010236e:	68 ff 00 00 00       	push   $0xff
f0102373:	50                   	push   %eax
f0102374:	e8 1e 39 00 00       	call   f0105c97 <memset>
f0102379:	89 34 24             	mov    %esi,(%esp)
f010237c:	e8 33 f0 ff ff       	call   f01013b4 <page_free>
f0102381:	83 c4 0c             	add    $0xc,%esp
f0102384:	6a 01                	push   $0x1
f0102386:	6a 00                	push   $0x0
f0102388:	ff 35 5c 92 18 f0    	push   0xf018925c
f010238e:	e8 c0 f4 ff ff       	call   f0101853 <pgdir_walk>
f0102393:	89 f0                	mov    %esi,%eax
f0102395:	e8 8d e8 ff ff       	call   f0100c27 <page2kva>
f010239a:	8d 88 00 10 00 00    	lea    0x1000(%eax),%ecx
f01023a0:	83 c4 10             	add    $0x10,%esp
f01023a3:	8b 10                	mov    (%eax),%edx
f01023a5:	83 c0 04             	add    $0x4,%eax
f01023a8:	f6 c2 01             	test   $0x1,%dl
f01023ab:	0f 85 e6 06 00 00    	jne    f0102a97 <check_page+0xcce>
f01023b1:	39 c8                	cmp    %ecx,%eax
f01023b3:	75 ee                	jne    f01023a3 <check_page+0x5da>
f01023b5:	a1 5c 92 18 f0       	mov    0xf018925c,%eax
f01023ba:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
f01023c0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
f01023c3:	66 c7 40 04 00 00    	movw   $0x0,0x4(%eax)
f01023c9:	8b 75 c8             	mov    -0x38(%ebp),%esi
f01023cc:	89 35 6c 92 18 f0    	mov    %esi,0xf018926c
f01023d2:	83 ec 0c             	sub    $0xc,%esp
f01023d5:	50                   	push   %eax
f01023d6:	e8 d9 ef ff ff       	call   f01013b4 <page_free>
f01023db:	89 3c 24             	mov    %edi,(%esp)
f01023de:	e8 d1 ef ff ff       	call   f01013b4 <page_free>
f01023e3:	89 1c 24             	mov    %ebx,(%esp)
f01023e6:	e8 c9 ef ff ff       	call   f01013b4 <page_free>
f01023eb:	83 c4 08             	add    $0x8,%esp
f01023ee:	68 01 10 00 00       	push   $0x1001
f01023f3:	6a 00                	push   $0x0
f01023f5:	e8 65 f9 ff ff       	call   f0101d5f <mmio_map_region>
f01023fa:	89 c3                	mov    %eax,%ebx
f01023fc:	83 c4 08             	add    $0x8,%esp
f01023ff:	68 00 10 00 00       	push   $0x1000
f0102404:	6a 00                	push   $0x0
f0102406:	e8 54 f9 ff ff       	call   f0101d5f <mmio_map_region>
f010240b:	89 c6                	mov    %eax,%esi
f010240d:	8d 83 a0 1f 00 00    	lea    0x1fa0(%ebx),%eax
f0102413:	83 c4 10             	add    $0x10,%esp
f0102416:	81 fb ff ff 7f ef    	cmp    $0xef7fffff,%ebx
f010241c:	0f 86 8e 06 00 00    	jbe    f0102ab0 <check_page+0xce7>
f0102422:	3d ff ff bf ef       	cmp    $0xefbfffff,%eax
f0102427:	0f 87 83 06 00 00    	ja     f0102ab0 <check_page+0xce7>
f010242d:	8d 96 a0 1f 00 00    	lea    0x1fa0(%esi),%edx
f0102433:	81 fa ff ff bf ef    	cmp    $0xefbfffff,%edx
f0102439:	0f 87 8a 06 00 00    	ja     f0102ac9 <check_page+0xd00>
f010243f:	81 fe ff ff 7f ef    	cmp    $0xef7fffff,%esi
f0102445:	0f 86 7e 06 00 00    	jbe    f0102ac9 <check_page+0xd00>
f010244b:	89 da                	mov    %ebx,%edx
f010244d:	09 f2                	or     %esi,%edx
f010244f:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
f0102455:	0f 85 87 06 00 00    	jne    f0102ae2 <check_page+0xd19>
f010245b:	39 c6                	cmp    %eax,%esi
f010245d:	0f 82 98 06 00 00    	jb     f0102afb <check_page+0xd32>
f0102463:	8b 3d 5c 92 18 f0    	mov    0xf018925c,%edi
f0102469:	89 da                	mov    %ebx,%edx
f010246b:	89 f8                	mov    %edi,%eax
f010246d:	e8 d3 e7 ff ff       	call   f0100c45 <check_va2pa>
f0102472:	85 c0                	test   %eax,%eax
f0102474:	0f 85 9a 06 00 00    	jne    f0102b14 <check_page+0xd4b>
f010247a:	8d 83 00 10 00 00    	lea    0x1000(%ebx),%eax
f0102480:	89 45 d4             	mov    %eax,-0x2c(%ebp)
f0102483:	89 c2                	mov    %eax,%edx
f0102485:	89 f8                	mov    %edi,%eax
f0102487:	e8 b9 e7 ff ff       	call   f0100c45 <check_va2pa>
f010248c:	3d 00 10 00 00       	cmp    $0x1000,%eax
f0102491:	0f 85 96 06 00 00    	jne    f0102b2d <check_page+0xd64>
f0102497:	89 f2                	mov    %esi,%edx
f0102499:	89 f8                	mov    %edi,%eax
f010249b:	e8 a5 e7 ff ff       	call   f0100c45 <check_va2pa>
f01024a0:	85 c0                	test   %eax,%eax
f01024a2:	0f 85 9e 06 00 00    	jne    f0102b46 <check_page+0xd7d>
f01024a8:	8d 96 00 10 00 00    	lea    0x1000(%esi),%edx
f01024ae:	89 f8                	mov    %edi,%eax
f01024b0:	e8 90 e7 ff ff       	call   f0100c45 <check_va2pa>
f01024b5:	83 f8 ff             	cmp    $0xffffffff,%eax
f01024b8:	0f 85 a1 06 00 00    	jne    f0102b5f <check_page+0xd96>
f01024be:	83 ec 04             	sub    $0x4,%esp
f01024c1:	6a 00                	push   $0x0
f01024c3:	53                   	push   %ebx
f01024c4:	57                   	push   %edi
f01024c5:	e8 89 f3 ff ff       	call   f0101853 <pgdir_walk>
f01024ca:	83 c4 10             	add    $0x10,%esp
f01024cd:	f6 00 1a             	testb  $0x1a,(%eax)
f01024d0:	0f 84 a2 06 00 00    	je     f0102b78 <check_page+0xdaf>
f01024d6:	83 ec 04             	sub    $0x4,%esp
f01024d9:	6a 00                	push   $0x0
f01024db:	53                   	push   %ebx
f01024dc:	ff 35 5c 92 18 f0    	push   0xf018925c
f01024e2:	e8 6c f3 ff ff       	call   f0101853 <pgdir_walk>
f01024e7:	83 c4 10             	add    $0x10,%esp
f01024ea:	f6 00 04             	testb  $0x4,(%eax)
f01024ed:	0f 85 9e 06 00 00    	jne    f0102b91 <check_page+0xdc8>
f01024f3:	83 ec 04             	sub    $0x4,%esp
f01024f6:	6a 00                	push   $0x0
f01024f8:	53                   	push   %ebx
f01024f9:	ff 35 5c 92 18 f0    	push   0xf018925c
f01024ff:	e8 4f f3 ff ff       	call   f0101853 <pgdir_walk>
f0102504:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
f010250a:	83 c4 0c             	add    $0xc,%esp
f010250d:	6a 00                	push   $0x0
f010250f:	ff 75 d4             	push   -0x2c(%ebp)
f0102512:	ff 35 5c 92 18 f0    	push   0xf018925c
f0102518:	e8 36 f3 ff ff       	call   f0101853 <pgdir_walk>
f010251d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
f0102523:	83 c4 0c             	add    $0xc,%esp
f0102526:	6a 00                	push   $0x0
f0102528:	56                   	push   %esi
f0102529:	ff 35 5c 92 18 f0    	push   0xf018925c
f010252f:	e8 1f f3 ff ff       	call   f0101853 <pgdir_walk>
f0102534:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
f010253a:	c7 04 24 da 7c 10 f0 	movl   $0xf0107cda,(%esp)
f0102541:	e8 f0 12 00 00       	call   f0103836 <cprintf>
f0102546:	83 c4 10             	add    $0x10,%esp
f0102549:	8d 65 f4             	lea    -0xc(%ebp),%esp
f010254c:	5b                   	pop    %ebx
f010254d:	5e                   	pop    %esi
f010254e:	5f                   	pop    %edi
f010254f:	5d                   	pop    %ebp
f0102550:	c3                   	ret
f0102551:	68 56 7b 10 f0       	push   $0xf0107b56
f0102556:	68 34 7a 10 f0       	push   $0xf0107a34
f010255b:	68 ac 03 00 00       	push   $0x3ac
f0102560:	68 28 7a 10 f0       	push   $0xf0107a28
f0102565:	e8 00 db ff ff       	call   f010006a <_panic>
f010256a:	68 6c 7b 10 f0       	push   $0xf0107b6c
f010256f:	68 34 7a 10 f0       	push   $0xf0107a34
f0102574:	68 ad 03 00 00       	push   $0x3ad
f0102579:	68 28 7a 10 f0       	push   $0xf0107a28
f010257e:	e8 e7 da ff ff       	call   f010006a <_panic>
f0102583:	68 82 7b 10 f0       	push   $0xf0107b82
f0102588:	68 34 7a 10 f0       	push   $0xf0107a34
f010258d:	68 ae 03 00 00       	push   $0x3ae
f0102592:	68 28 7a 10 f0       	push   $0xf0107a28
f0102597:	e8 ce da ff ff       	call   f010006a <_panic>
f010259c:	68 98 7b 10 f0       	push   $0xf0107b98
f01025a1:	68 34 7a 10 f0       	push   $0xf0107a34
f01025a6:	68 b1 03 00 00       	push   $0x3b1
f01025ab:	68 28 7a 10 f0       	push   $0xf0107a28
f01025b0:	e8 b5 da ff ff       	call   f010006a <_panic>
f01025b5:	68 0c 6e 10 f0       	push   $0xf0106e0c
f01025ba:	68 34 7a 10 f0       	push   $0xf0107a34
f01025bf:	68 b2 03 00 00       	push   $0x3b2
f01025c4:	68 28 7a 10 f0       	push   $0xf0107a28
f01025c9:	e8 9c da ff ff       	call   f010006a <_panic>
f01025ce:	68 aa 7b 10 f0       	push   $0xf0107baa
f01025d3:	68 34 7a 10 f0       	push   $0xf0107a34
f01025d8:	68 b9 03 00 00       	push   $0x3b9
f01025dd:	68 28 7a 10 f0       	push   $0xf0107a28
f01025e2:	e8 83 da ff ff       	call   f010006a <_panic>
f01025e7:	68 98 6f 10 f0       	push   $0xf0106f98
f01025ec:	68 34 7a 10 f0       	push   $0xf0107a34
f01025f1:	68 bc 03 00 00       	push   $0x3bc
f01025f6:	68 28 7a 10 f0       	push   $0xf0107a28
f01025fb:	e8 6a da ff ff       	call   f010006a <_panic>
f0102600:	68 d0 6f 10 f0       	push   $0xf0106fd0
f0102605:	68 34 7a 10 f0       	push   $0xf0107a34
f010260a:	68 bf 03 00 00       	push   $0x3bf
f010260f:	68 28 7a 10 f0       	push   $0xf0107a28
f0102614:	e8 51 da ff ff       	call   f010006a <_panic>
f0102619:	68 00 70 10 f0       	push   $0xf0107000
f010261e:	68 34 7a 10 f0       	push   $0xf0107a34
f0102623:	68 c3 03 00 00       	push   $0x3c3
f0102628:	68 28 7a 10 f0       	push   $0xf0107a28
f010262d:	e8 38 da ff ff       	call   f010006a <_panic>
f0102632:	68 20 6f 10 f0       	push   $0xf0106f20
f0102637:	68 34 7a 10 f0       	push   $0xf0107a34
f010263c:	68 c4 03 00 00       	push   $0x3c4
f0102641:	68 28 7a 10 f0       	push   $0xf0107a28
f0102646:	e8 1f da ff ff       	call   f010006a <_panic>
f010264b:	68 30 70 10 f0       	push   $0xf0107030
f0102650:	68 34 7a 10 f0       	push   $0xf0107a34
f0102655:	68 c5 03 00 00       	push   $0x3c5
f010265a:	68 28 7a 10 f0       	push   $0xf0107a28
f010265f:	e8 06 da ff ff       	call   f010006a <_panic>
f0102664:	68 fc 7b 10 f0       	push   $0xf0107bfc
f0102669:	68 34 7a 10 f0       	push   $0xf0107a34
f010266e:	68 c6 03 00 00       	push   $0x3c6
f0102673:	68 28 7a 10 f0       	push   $0xf0107a28
f0102678:	e8 ed d9 ff ff       	call   f010006a <_panic>
f010267d:	68 40 7c 10 f0       	push   $0xf0107c40
f0102682:	68 34 7a 10 f0       	push   $0xf0107a34
f0102687:	68 c7 03 00 00       	push   $0x3c7
f010268c:	68 28 7a 10 f0       	push   $0xf0107a28
f0102691:	e8 d4 d9 ff ff       	call   f010006a <_panic>
f0102696:	68 60 70 10 f0       	push   $0xf0107060
f010269b:	68 34 7a 10 f0       	push   $0xf0107a34
f01026a0:	68 cb 03 00 00       	push   $0x3cb
f01026a5:	68 28 7a 10 f0       	push   $0xf0107a28
f01026aa:	e8 bb d9 ff ff       	call   f010006a <_panic>
f01026af:	68 9c 70 10 f0       	push   $0xf010709c
f01026b4:	68 34 7a 10 f0       	push   $0xf0107a34
f01026b9:	68 cc 03 00 00       	push   $0x3cc
f01026be:	68 28 7a 10 f0       	push   $0xf0107a28
f01026c3:	e8 a2 d9 ff ff       	call   f010006a <_panic>
f01026c8:	68 0d 7c 10 f0       	push   $0xf0107c0d
f01026cd:	68 34 7a 10 f0       	push   $0xf0107a34
f01026d2:	68 cd 03 00 00       	push   $0x3cd
f01026d7:	68 28 7a 10 f0       	push   $0xf0107a28
f01026dc:	e8 89 d9 ff ff       	call   f010006a <_panic>
f01026e1:	68 aa 7b 10 f0       	push   $0xf0107baa
f01026e6:	68 34 7a 10 f0       	push   $0xf0107a34
f01026eb:	68 d0 03 00 00       	push   $0x3d0
f01026f0:	68 28 7a 10 f0       	push   $0xf0107a28
f01026f5:	e8 70 d9 ff ff       	call   f010006a <_panic>
f01026fa:	68 60 70 10 f0       	push   $0xf0107060
f01026ff:	68 34 7a 10 f0       	push   $0xf0107a34
f0102704:	68 d3 03 00 00       	push   $0x3d3
f0102709:	68 28 7a 10 f0       	push   $0xf0107a28
f010270e:	e8 57 d9 ff ff       	call   f010006a <_panic>
f0102713:	68 9c 70 10 f0       	push   $0xf010709c
f0102718:	68 34 7a 10 f0       	push   $0xf0107a34
f010271d:	68 d4 03 00 00       	push   $0x3d4
f0102722:	68 28 7a 10 f0       	push   $0xf0107a28
f0102727:	e8 3e d9 ff ff       	call   f010006a <_panic>
f010272c:	68 0d 7c 10 f0       	push   $0xf0107c0d
f0102731:	68 34 7a 10 f0       	push   $0xf0107a34
f0102736:	68 d5 03 00 00       	push   $0x3d5
f010273b:	68 28 7a 10 f0       	push   $0xf0107a28
f0102740:	e8 25 d9 ff ff       	call   f010006a <_panic>
f0102745:	68 aa 7b 10 f0       	push   $0xf0107baa
f010274a:	68 34 7a 10 f0       	push   $0xf0107a34
f010274f:	68 d9 03 00 00       	push   $0x3d9
f0102754:	68 28 7a 10 f0       	push   $0xf0107a28
f0102759:	e8 0c d9 ff ff       	call   f010006a <_panic>
f010275e:	68 cc 70 10 f0       	push   $0xf01070cc
f0102763:	68 34 7a 10 f0       	push   $0xf0107a34
f0102768:	68 dd 03 00 00       	push   $0x3dd
f010276d:	68 28 7a 10 f0       	push   $0xf0107a28
f0102772:	e8 f3 d8 ff ff       	call   f010006a <_panic>
f0102777:	68 10 71 10 f0       	push   $0xf0107110
f010277c:	68 34 7a 10 f0       	push   $0xf0107a34
f0102781:	68 e0 03 00 00       	push   $0x3e0
f0102786:	68 28 7a 10 f0       	push   $0xf0107a28
f010278b:	e8 da d8 ff ff       	call   f010006a <_panic>
f0102790:	68 9c 70 10 f0       	push   $0xf010709c
f0102795:	68 34 7a 10 f0       	push   $0xf0107a34
f010279a:	68 e1 03 00 00       	push   $0x3e1
f010279f:	68 28 7a 10 f0       	push   $0xf0107a28
f01027a4:	e8 c1 d8 ff ff       	call   f010006a <_panic>
f01027a9:	68 0d 7c 10 f0       	push   $0xf0107c0d
f01027ae:	68 34 7a 10 f0       	push   $0xf0107a34
f01027b3:	68 e2 03 00 00       	push   $0x3e2
f01027b8:	68 28 7a 10 f0       	push   $0xf0107a28
f01027bd:	e8 a8 d8 ff ff       	call   f010006a <_panic>
f01027c2:	68 54 71 10 f0       	push   $0xf0107154
f01027c7:	68 34 7a 10 f0       	push   $0xf0107a34
f01027cc:	68 e3 03 00 00       	push   $0x3e3
f01027d1:	68 28 7a 10 f0       	push   $0xf0107a28
f01027d6:	e8 8f d8 ff ff       	call   f010006a <_panic>
f01027db:	68 51 7c 10 f0       	push   $0xf0107c51
f01027e0:	68 34 7a 10 f0       	push   $0xf0107a34
f01027e5:	68 e4 03 00 00       	push   $0x3e4
f01027ea:	68 28 7a 10 f0       	push   $0xf0107a28
f01027ef:	e8 76 d8 ff ff       	call   f010006a <_panic>
f01027f4:	68 60 70 10 f0       	push   $0xf0107060
f01027f9:	68 34 7a 10 f0       	push   $0xf0107a34
f01027fe:	68 e7 03 00 00       	push   $0x3e7
f0102803:	68 28 7a 10 f0       	push   $0xf0107a28
f0102808:	e8 5d d8 ff ff       	call   f010006a <_panic>
f010280d:	68 88 71 10 f0       	push   $0xf0107188
f0102812:	68 34 7a 10 f0       	push   $0xf0107a34
f0102817:	68 e8 03 00 00       	push   $0x3e8
f010281c:	68 28 7a 10 f0       	push   $0xf0107a28
f0102821:	e8 44 d8 ff ff       	call   f010006a <_panic>
f0102826:	68 bc 71 10 f0       	push   $0xf01071bc
f010282b:	68 34 7a 10 f0       	push   $0xf0107a34
f0102830:	68 e9 03 00 00       	push   $0x3e9
f0102835:	68 28 7a 10 f0       	push   $0xf0107a28
f010283a:	e8 2b d8 ff ff       	call   f010006a <_panic>
f010283f:	68 f4 71 10 f0       	push   $0xf01071f4
f0102844:	68 34 7a 10 f0       	push   $0xf0107a34
f0102849:	68 ed 03 00 00       	push   $0x3ed
f010284e:	68 28 7a 10 f0       	push   $0xf0107a28
f0102853:	e8 12 d8 ff ff       	call   f010006a <_panic>
f0102858:	68 30 72 10 f0       	push   $0xf0107230
f010285d:	68 34 7a 10 f0       	push   $0xf0107a34
f0102862:	68 f0 03 00 00       	push   $0x3f0
f0102867:	68 28 7a 10 f0       	push   $0xf0107a28
f010286c:	e8 f9 d7 ff ff       	call   f010006a <_panic>
f0102871:	68 bc 71 10 f0       	push   $0xf01071bc
f0102876:	68 34 7a 10 f0       	push   $0xf0107a34
f010287b:	68 f1 03 00 00       	push   $0x3f1
f0102880:	68 28 7a 10 f0       	push   $0xf0107a28
f0102885:	e8 e0 d7 ff ff       	call   f010006a <_panic>
f010288a:	68 6c 72 10 f0       	push   $0xf010726c
f010288f:	68 34 7a 10 f0       	push   $0xf0107a34
f0102894:	68 f4 03 00 00       	push   $0x3f4
f0102899:	68 28 7a 10 f0       	push   $0xf0107a28
f010289e:	e8 c7 d7 ff ff       	call   f010006a <_panic>
f01028a3:	68 98 72 10 f0       	push   $0xf0107298
f01028a8:	68 34 7a 10 f0       	push   $0xf0107a34
f01028ad:	68 f5 03 00 00       	push   $0x3f5
f01028b2:	68 28 7a 10 f0       	push   $0xf0107a28
f01028b7:	e8 ae d7 ff ff       	call   f010006a <_panic>
f01028bc:	68 67 7c 10 f0       	push   $0xf0107c67
f01028c1:	68 34 7a 10 f0       	push   $0xf0107a34
f01028c6:	68 f7 03 00 00       	push   $0x3f7
f01028cb:	68 28 7a 10 f0       	push   $0xf0107a28
f01028d0:	e8 95 d7 ff ff       	call   f010006a <_panic>
f01028d5:	68 2f 7c 10 f0       	push   $0xf0107c2f
f01028da:	68 34 7a 10 f0       	push   $0xf0107a34
f01028df:	68 f8 03 00 00       	push   $0x3f8
f01028e4:	68 28 7a 10 f0       	push   $0xf0107a28
f01028e9:	e8 7c d7 ff ff       	call   f010006a <_panic>
f01028ee:	68 c8 72 10 f0       	push   $0xf01072c8
f01028f3:	68 34 7a 10 f0       	push   $0xf0107a34
f01028f8:	68 fb 03 00 00       	push   $0x3fb
f01028fd:	68 28 7a 10 f0       	push   $0xf0107a28
f0102902:	e8 63 d7 ff ff       	call   f010006a <_panic>
f0102907:	68 ec 72 10 f0       	push   $0xf01072ec
f010290c:	68 34 7a 10 f0       	push   $0xf0107a34
f0102911:	68 ff 03 00 00       	push   $0x3ff
f0102916:	68 28 7a 10 f0       	push   $0xf0107a28
f010291b:	e8 4a d7 ff ff       	call   f010006a <_panic>
f0102920:	68 98 72 10 f0       	push   $0xf0107298
f0102925:	68 34 7a 10 f0       	push   $0xf0107a34
f010292a:	68 00 04 00 00       	push   $0x400
f010292f:	68 28 7a 10 f0       	push   $0xf0107a28
f0102934:	e8 31 d7 ff ff       	call   f010006a <_panic>
f0102939:	68 fc 7b 10 f0       	push   $0xf0107bfc
f010293e:	68 34 7a 10 f0       	push   $0xf0107a34
f0102943:	68 01 04 00 00       	push   $0x401
f0102948:	68 28 7a 10 f0       	push   $0xf0107a28
f010294d:	e8 18 d7 ff ff       	call   f010006a <_panic>
f0102952:	68 2f 7c 10 f0       	push   $0xf0107c2f
f0102957:	68 34 7a 10 f0       	push   $0xf0107a34
f010295c:	68 02 04 00 00       	push   $0x402
f0102961:	68 28 7a 10 f0       	push   $0xf0107a28
f0102966:	e8 ff d6 ff ff       	call   f010006a <_panic>
f010296b:	68 10 73 10 f0       	push   $0xf0107310
f0102970:	68 34 7a 10 f0       	push   $0xf0107a34
f0102975:	68 05 04 00 00       	push   $0x405
f010297a:	68 28 7a 10 f0       	push   $0xf0107a28
f010297f:	e8 e6 d6 ff ff       	call   f010006a <_panic>
f0102984:	68 78 7c 10 f0       	push   $0xf0107c78
f0102989:	68 34 7a 10 f0       	push   $0xf0107a34
f010298e:	68 06 04 00 00       	push   $0x406
f0102993:	68 28 7a 10 f0       	push   $0xf0107a28
f0102998:	e8 cd d6 ff ff       	call   f010006a <_panic>
f010299d:	68 84 7c 10 f0       	push   $0xf0107c84
f01029a2:	68 34 7a 10 f0       	push   $0xf0107a34
f01029a7:	68 07 04 00 00       	push   $0x407
f01029ac:	68 28 7a 10 f0       	push   $0xf0107a28
f01029b1:	e8 b4 d6 ff ff       	call   f010006a <_panic>
f01029b6:	68 ec 72 10 f0       	push   $0xf01072ec
f01029bb:	68 34 7a 10 f0       	push   $0xf0107a34
f01029c0:	68 0b 04 00 00       	push   $0x40b
f01029c5:	68 28 7a 10 f0       	push   $0xf0107a28
f01029ca:	e8 9b d6 ff ff       	call   f010006a <_panic>
f01029cf:	68 48 73 10 f0       	push   $0xf0107348
f01029d4:	68 34 7a 10 f0       	push   $0xf0107a34
f01029d9:	68 0c 04 00 00       	push   $0x40c
f01029de:	68 28 7a 10 f0       	push   $0xf0107a28
f01029e3:	e8 82 d6 ff ff       	call   f010006a <_panic>
f01029e8:	68 1e 7c 10 f0       	push   $0xf0107c1e
f01029ed:	68 34 7a 10 f0       	push   $0xf0107a34
f01029f2:	68 0d 04 00 00       	push   $0x40d
f01029f7:	68 28 7a 10 f0       	push   $0xf0107a28
f01029fc:	e8 69 d6 ff ff       	call   f010006a <_panic>
f0102a01:	68 2f 7c 10 f0       	push   $0xf0107c2f
f0102a06:	68 34 7a 10 f0       	push   $0xf0107a34
f0102a0b:	68 0e 04 00 00       	push   $0x40e
f0102a10:	68 28 7a 10 f0       	push   $0xf0107a28
f0102a15:	e8 50 d6 ff ff       	call   f010006a <_panic>
f0102a1a:	68 70 73 10 f0       	push   $0xf0107370
f0102a1f:	68 34 7a 10 f0       	push   $0xf0107a34
f0102a24:	68 11 04 00 00       	push   $0x411
f0102a29:	68 28 7a 10 f0       	push   $0xf0107a28
f0102a2e:	e8 37 d6 ff ff       	call   f010006a <_panic>
f0102a33:	68 aa 7b 10 f0       	push   $0xf0107baa
f0102a38:	68 34 7a 10 f0       	push   $0xf0107a34
f0102a3d:	68 14 04 00 00       	push   $0x414
f0102a42:	68 28 7a 10 f0       	push   $0xf0107a28
f0102a47:	e8 1e d6 ff ff       	call   f010006a <_panic>
f0102a4c:	68 20 6f 10 f0       	push   $0xf0106f20
f0102a51:	68 34 7a 10 f0       	push   $0xf0107a34
f0102a56:	68 17 04 00 00       	push   $0x417
f0102a5b:	68 28 7a 10 f0       	push   $0xf0107a28
f0102a60:	e8 05 d6 ff ff       	call   f010006a <_panic>
f0102a65:	68 40 7c 10 f0       	push   $0xf0107c40
f0102a6a:	68 34 7a 10 f0       	push   $0xf0107a34
f0102a6f:	68 19 04 00 00       	push   $0x419
f0102a74:	68 28 7a 10 f0       	push   $0xf0107a28
f0102a79:	e8 ec d5 ff ff       	call   f010006a <_panic>
f0102a7e:	68 99 7c 10 f0       	push   $0xf0107c99
f0102a83:	68 34 7a 10 f0       	push   $0xf0107a34
f0102a88:	68 21 04 00 00       	push   $0x421
f0102a8d:	68 28 7a 10 f0       	push   $0xf0107a28
f0102a92:	e8 d3 d5 ff ff       	call   f010006a <_panic>
f0102a97:	68 b1 7c 10 f0       	push   $0xf0107cb1
f0102a9c:	68 34 7a 10 f0       	push   $0xf0107a34
f0102aa1:	68 2b 04 00 00       	push   $0x42b
f0102aa6:	68 28 7a 10 f0       	push   $0xf0107a28
f0102aab:	e8 ba d5 ff ff       	call   f010006a <_panic>
f0102ab0:	68 94 73 10 f0       	push   $0xf0107394
f0102ab5:	68 34 7a 10 f0       	push   $0xf0107a34
f0102aba:	68 3b 04 00 00       	push   $0x43b
f0102abf:	68 28 7a 10 f0       	push   $0xf0107a28
f0102ac4:	e8 a1 d5 ff ff       	call   f010006a <_panic>
f0102ac9:	68 bc 73 10 f0       	push   $0xf01073bc
f0102ace:	68 34 7a 10 f0       	push   $0xf0107a34
f0102ad3:	68 3c 04 00 00       	push   $0x43c
f0102ad8:	68 28 7a 10 f0       	push   $0xf0107a28
f0102add:	e8 88 d5 ff ff       	call   f010006a <_panic>
f0102ae2:	68 e4 73 10 f0       	push   $0xf01073e4
f0102ae7:	68 34 7a 10 f0       	push   $0xf0107a34
f0102aec:	68 3e 04 00 00       	push   $0x43e
f0102af1:	68 28 7a 10 f0       	push   $0xf0107a28
f0102af6:	e8 6f d5 ff ff       	call   f010006a <_panic>
f0102afb:	68 c8 7c 10 f0       	push   $0xf0107cc8
f0102b00:	68 34 7a 10 f0       	push   $0xf0107a34
f0102b05:	68 40 04 00 00       	push   $0x440
f0102b0a:	68 28 7a 10 f0       	push   $0xf0107a28
f0102b0f:	e8 56 d5 ff ff       	call   f010006a <_panic>
f0102b14:	68 0c 74 10 f0       	push   $0xf010740c
f0102b19:	68 34 7a 10 f0       	push   $0xf0107a34
f0102b1e:	68 42 04 00 00       	push   $0x442
f0102b23:	68 28 7a 10 f0       	push   $0xf0107a28
f0102b28:	e8 3d d5 ff ff       	call   f010006a <_panic>
f0102b2d:	68 30 74 10 f0       	push   $0xf0107430
f0102b32:	68 34 7a 10 f0       	push   $0xf0107a34
f0102b37:	68 43 04 00 00       	push   $0x443
f0102b3c:	68 28 7a 10 f0       	push   $0xf0107a28
f0102b41:	e8 24 d5 ff ff       	call   f010006a <_panic>
f0102b46:	68 60 74 10 f0       	push   $0xf0107460
f0102b4b:	68 34 7a 10 f0       	push   $0xf0107a34
f0102b50:	68 44 04 00 00       	push   $0x444
f0102b55:	68 28 7a 10 f0       	push   $0xf0107a28
f0102b5a:	e8 0b d5 ff ff       	call   f010006a <_panic>
f0102b5f:	68 84 74 10 f0       	push   $0xf0107484
f0102b64:	68 34 7a 10 f0       	push   $0xf0107a34
f0102b69:	68 45 04 00 00       	push   $0x445
f0102b6e:	68 28 7a 10 f0       	push   $0xf0107a28
f0102b73:	e8 f2 d4 ff ff       	call   f010006a <_panic>
f0102b78:	68 b0 74 10 f0       	push   $0xf01074b0
f0102b7d:	68 34 7a 10 f0       	push   $0xf0107a34
f0102b82:	68 47 04 00 00       	push   $0x447
f0102b87:	68 28 7a 10 f0       	push   $0xf0107a28
f0102b8c:	e8 d9 d4 ff ff       	call   f010006a <_panic>
f0102b91:	68 f8 74 10 f0       	push   $0xf01074f8
f0102b96:	68 34 7a 10 f0       	push   $0xf0107a34
f0102b9b:	68 49 04 00 00       	push   $0x449
f0102ba0:	68 28 7a 10 f0       	push   $0xf0107a28
f0102ba5:	e8 c0 d4 ff ff       	call   f010006a <_panic>

f0102baa <mem_init>:
f0102baa:	55                   	push   %ebp
f0102bab:	89 e5                	mov    %esp,%ebp
f0102bad:	53                   	push   %ebx
f0102bae:	83 ec 04             	sub    $0x4,%esp
f0102bb1:	e8 e1 df ff ff       	call   f0100b97 <i386_detect_memory>
f0102bb6:	b8 00 10 00 00       	mov    $0x1000,%eax
f0102bbb:	e8 0f e1 ff ff       	call   f0100ccf <boot_alloc>
f0102bc0:	a3 5c 92 18 f0       	mov    %eax,0xf018925c
f0102bc5:	83 ec 04             	sub    $0x4,%esp
f0102bc8:	68 00 10 00 00       	push   $0x1000
f0102bcd:	6a 00                	push   $0x0
f0102bcf:	50                   	push   %eax
f0102bd0:	e8 c2 30 00 00       	call   f0105c97 <memset>
f0102bd5:	8b 1d 5c 92 18 f0    	mov    0xf018925c,%ebx
f0102bdb:	89 d9                	mov    %ebx,%ecx
f0102bdd:	ba 95 00 00 00       	mov    $0x95,%edx
f0102be2:	b8 28 7a 10 f0       	mov    $0xf0107a28,%eax
f0102be7:	e8 c1 e0 ff ff       	call   f0100cad <_paddr>
f0102bec:	83 c8 05             	or     $0x5,%eax
f0102bef:	89 83 f4 0e 00 00    	mov    %eax,0xef4(%ebx)
f0102bf5:	a1 60 92 18 f0       	mov    0xf0189260,%eax
f0102bfa:	8d 1c c5 00 00 00 00 	lea    0x0(,%eax,8),%ebx
f0102c01:	89 d8                	mov    %ebx,%eax
f0102c03:	e8 c7 e0 ff ff       	call   f0100ccf <boot_alloc>
f0102c08:	a3 58 92 18 f0       	mov    %eax,0xf0189258
f0102c0d:	83 c4 0c             	add    $0xc,%esp
f0102c10:	53                   	push   %ebx
f0102c11:	6a 00                	push   $0x0
f0102c13:	50                   	push   %eax
f0102c14:	e8 7e 30 00 00       	call   f0105c97 <memset>
f0102c19:	b8 00 10 02 00       	mov    $0x21000,%eax
f0102c1e:	e8 ac e0 ff ff       	call   f0100ccf <boot_alloc>
f0102c23:	a3 70 92 18 f0       	mov    %eax,0xf0189270
f0102c28:	83 c4 0c             	add    $0xc,%esp
f0102c2b:	68 00 10 02 00       	push   $0x21000
f0102c30:	6a 00                	push   $0x0
f0102c32:	50                   	push   %eax
f0102c33:	e8 5f 30 00 00       	call   f0105c97 <memset>
f0102c38:	e8 a2 e6 ff ff       	call   f01012df <page_init>
f0102c3d:	b8 01 00 00 00       	mov    $0x1,%eax
f0102c42:	e8 bd e3 ff ff       	call   f0101004 <check_page_free_list>
f0102c47:	e8 ba e7 ff ff       	call   f0101406 <check_page_alloc>
f0102c4c:	e8 78 f1 ff ff       	call   f0101dc9 <check_page>
f0102c51:	8b 0d 58 92 18 f0    	mov    0xf0189258,%ecx
f0102c57:	ba bf 00 00 00       	mov    $0xbf,%edx
f0102c5c:	b8 28 7a 10 f0       	mov    $0xf0107a28,%eax
f0102c61:	e8 47 e0 ff ff       	call   f0100cad <_paddr>
f0102c66:	8d 8b ff 0f 00 00    	lea    0xfff(%ebx),%ecx
f0102c6c:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
f0102c72:	83 c4 08             	add    $0x8,%esp
f0102c75:	6a 05                	push   $0x5
f0102c77:	50                   	push   %eax
f0102c78:	ba 00 00 00 ef       	mov    $0xef000000,%edx
f0102c7d:	a1 5c 92 18 f0       	mov    0xf018925c,%eax
f0102c82:	e8 16 ed ff ff       	call   f010199d <boot_map_region>
f0102c87:	8b 0d 70 92 18 f0    	mov    0xf0189270,%ecx
f0102c8d:	ba cb 00 00 00       	mov    $0xcb,%edx
f0102c92:	b8 28 7a 10 f0       	mov    $0xf0107a28,%eax
f0102c97:	e8 11 e0 ff ff       	call   f0100cad <_paddr>
f0102c9c:	83 c4 08             	add    $0x8,%esp
f0102c9f:	6a 05                	push   $0x5
f0102ca1:	50                   	push   %eax
f0102ca2:	b9 00 10 02 00       	mov    $0x21000,%ecx
f0102ca7:	ba 00 00 c0 ee       	mov    $0xeec00000,%edx
f0102cac:	a1 5c 92 18 f0       	mov    0xf018925c,%eax
f0102cb1:	e8 e7 ec ff ff       	call   f010199d <boot_map_region>
f0102cb6:	83 c4 08             	add    $0x8,%esp
f0102cb9:	6a 03                	push   $0x3
f0102cbb:	6a 00                	push   $0x0
f0102cbd:	b9 00 00 00 10       	mov    $0x10000000,%ecx
f0102cc2:	ba 00 00 00 f0       	mov    $0xf0000000,%edx
f0102cc7:	a1 5c 92 18 f0       	mov    0xf018925c,%eax
f0102ccc:	e8 cc ec ff ff       	call   f010199d <boot_map_region>
f0102cd1:	e8 26 ed ff ff       	call   f01019fc <mem_init_mp>
f0102cd6:	e8 76 e0 ff ff       	call   f0100d51 <check_kern_pgdir>
f0102cdb:	8b 0d 5c 92 18 f0    	mov    0xf018925c,%ecx
f0102ce1:	ba e8 00 00 00       	mov    $0xe8,%edx
f0102ce6:	b8 28 7a 10 f0       	mov    $0xf0107a28,%eax
f0102ceb:	e8 bd df ff ff       	call   f0100cad <_paddr>
f0102cf0:	e8 68 de ff ff       	call   f0100b5d <lcr3>
f0102cf5:	b8 00 00 00 00       	mov    $0x0,%eax
f0102cfa:	e8 05 e3 ff ff       	call   f0101004 <check_page_free_list>
f0102cff:	e8 55 de ff ff       	call   f0100b59 <rcr0>
f0102d04:	83 e0 f3             	and    $0xfffffff3,%eax
f0102d07:	0d 23 00 05 80       	or     $0x80050023,%eax
f0102d0c:	e8 44 de ff ff       	call   f0100b55 <lcr0>
f0102d11:	e8 9b ed ff ff       	call   f0101ab1 <check_page_installed_pgdir>
f0102d16:	83 c4 10             	add    $0x10,%esp
f0102d19:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f0102d1c:	c9                   	leave
f0102d1d:	c3                   	ret

f0102d1e <user_mem_check>:
f0102d1e:	55                   	push   %ebp
f0102d1f:	89 e5                	mov    %esp,%ebp
f0102d21:	57                   	push   %edi
f0102d22:	56                   	push   %esi
f0102d23:	53                   	push   %ebx
f0102d24:	83 ec 0c             	sub    $0xc,%esp
f0102d27:	8b 45 10             	mov    0x10(%ebp),%eax
f0102d2a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
f0102d2d:	8d bc 01 ff 0f 00 00 	lea    0xfff(%ecx,%eax,1),%edi
f0102d34:	81 e7 00 f0 ff ff    	and    $0xfffff000,%edi
f0102d3a:	81 ff 00 00 c0 ee    	cmp    $0xeec00000,%edi
f0102d40:	77 3b                	ja     f0102d7d <user_mem_check+0x5f>
f0102d42:	8b 5d 0c             	mov    0xc(%ebp),%ebx
f0102d45:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
f0102d4b:	8b 75 14             	mov    0x14(%ebp),%esi
f0102d4e:	83 ce 01             	or     $0x1,%esi
f0102d51:	39 fb                	cmp    %edi,%ebx
f0102d53:	73 50                	jae    f0102da5 <user_mem_check+0x87>
f0102d55:	83 ec 04             	sub    $0x4,%esp
f0102d58:	6a 00                	push   $0x0
f0102d5a:	53                   	push   %ebx
f0102d5b:	8b 45 08             	mov    0x8(%ebp),%eax
f0102d5e:	ff 70 60             	push   0x60(%eax)
f0102d61:	e8 ed ea ff ff       	call   f0101853 <pgdir_walk>
f0102d66:	83 c4 10             	add    $0x10,%esp
f0102d69:	85 c0                	test   %eax,%eax
f0102d6b:	74 1d                	je     f0102d8a <user_mem_check+0x6c>
f0102d6d:	89 f2                	mov    %esi,%edx
f0102d6f:	23 10                	and    (%eax),%edx
f0102d71:	39 d6                	cmp    %edx,%esi
f0102d73:	75 15                	jne    f0102d8a <user_mem_check+0x6c>
f0102d75:	81 c3 00 10 00 00    	add    $0x1000,%ebx
f0102d7b:	eb d4                	jmp    f0102d51 <user_mem_check+0x33>
f0102d7d:	89 0d 68 92 18 f0    	mov    %ecx,0xf0189268
f0102d83:	b8 fa ff ff ff       	mov    $0xfffffffa,%eax
f0102d88:	eb 13                	jmp    f0102d9d <user_mem_check+0x7f>
f0102d8a:	39 5d 0c             	cmp    %ebx,0xc(%ebp)
f0102d8d:	89 d8                	mov    %ebx,%eax
f0102d8f:	0f 43 45 0c          	cmovae 0xc(%ebp),%eax
f0102d93:	a3 68 92 18 f0       	mov    %eax,0xf0189268
f0102d98:	b8 fa ff ff ff       	mov    $0xfffffffa,%eax
f0102d9d:	8d 65 f4             	lea    -0xc(%ebp),%esp
f0102da0:	5b                   	pop    %ebx
f0102da1:	5e                   	pop    %esi
f0102da2:	5f                   	pop    %edi
f0102da3:	5d                   	pop    %ebp
f0102da4:	c3                   	ret
f0102da5:	b8 00 00 00 00       	mov    $0x0,%eax
f0102daa:	eb f1                	jmp    f0102d9d <user_mem_check+0x7f>

f0102dac <user_mem_assert>:
f0102dac:	55                   	push   %ebp
f0102dad:	89 e5                	mov    %esp,%ebp
f0102daf:	53                   	push   %ebx
f0102db0:	83 ec 04             	sub    $0x4,%esp
f0102db3:	8b 5d 08             	mov    0x8(%ebp),%ebx
f0102db6:	8b 45 14             	mov    0x14(%ebp),%eax
f0102db9:	83 c8 04             	or     $0x4,%eax
f0102dbc:	50                   	push   %eax
f0102dbd:	ff 75 10             	push   0x10(%ebp)
f0102dc0:	ff 75 0c             	push   0xc(%ebp)
f0102dc3:	53                   	push   %ebx
f0102dc4:	e8 55 ff ff ff       	call   f0102d1e <user_mem_check>
f0102dc9:	83 c4 10             	add    $0x10,%esp
f0102dcc:	85 c0                	test   %eax,%eax
f0102dce:	78 05                	js     f0102dd5 <user_mem_assert+0x29>
f0102dd0:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f0102dd3:	c9                   	leave
f0102dd4:	c3                   	ret
f0102dd5:	83 ec 04             	sub    $0x4,%esp
f0102dd8:	ff 35 68 92 18 f0    	push   0xf0189268
f0102dde:	ff 73 48             	push   0x48(%ebx)
f0102de1:	68 2c 75 10 f0       	push   $0xf010752c
f0102de6:	e8 4b 0a 00 00       	call   f0103836 <cprintf>
f0102deb:	89 1c 24             	mov    %ebx,(%esp)
f0102dee:	e8 d5 06 00 00       	call   f01034c8 <env_destroy>
f0102df3:	83 c4 10             	add    $0x10,%esp
f0102df6:	eb d8                	jmp    f0102dd0 <user_mem_assert+0x24>

f0102df8 <lgdt>:
f0102df8:	0f 01 10             	lgdtl  (%eax)
f0102dfb:	c3                   	ret

f0102dfc <lldt>:
f0102dfc:	0f 00 d0             	lldt   %eax
f0102dff:	c3                   	ret

f0102e00 <lcr3>:
f0102e00:	0f 22 d8             	mov    %eax,%cr3
f0102e03:	c3                   	ret

f0102e04 <page2pa>:
f0102e04:	2b 05 58 92 18 f0    	sub    0xf0189258,%eax
f0102e0a:	c1 f8 03             	sar    $0x3,%eax
f0102e0d:	c1 e0 0c             	shl    $0xc,%eax
f0102e10:	c3                   	ret

f0102e11 <_kaddr>:
f0102e11:	55                   	push   %ebp
f0102e12:	89 e5                	mov    %esp,%ebp
f0102e14:	53                   	push   %ebx
f0102e15:	83 ec 04             	sub    $0x4,%esp
f0102e18:	89 cb                	mov    %ecx,%ebx
f0102e1a:	c1 eb 0c             	shr    $0xc,%ebx
f0102e1d:	3b 1d 60 92 18 f0    	cmp    0xf0189260,%ebx
f0102e23:	73 0b                	jae    f0102e30 <_kaddr+0x1f>
f0102e25:	8d 81 00 00 00 f0    	lea    -0x10000000(%ecx),%eax
f0102e2b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f0102e2e:	c9                   	leave
f0102e2f:	c3                   	ret
f0102e30:	51                   	push   %ecx
f0102e31:	68 cc 69 10 f0       	push   $0xf01069cc
f0102e36:	52                   	push   %edx
f0102e37:	50                   	push   %eax
f0102e38:	e8 2d d2 ff ff       	call   f010006a <_panic>

f0102e3d <page2kva>:
f0102e3d:	55                   	push   %ebp
f0102e3e:	89 e5                	mov    %esp,%ebp
f0102e40:	83 ec 08             	sub    $0x8,%esp
f0102e43:	e8 bc ff ff ff       	call   f0102e04 <page2pa>
f0102e48:	89 c1                	mov    %eax,%ecx
f0102e4a:	ba 58 00 00 00       	mov    $0x58,%edx
f0102e4f:	b8 1a 7a 10 f0       	mov    $0xf0107a1a,%eax
f0102e54:	e8 b8 ff ff ff       	call   f0102e11 <_kaddr>
f0102e59:	c9                   	leave
f0102e5a:	c3                   	ret

f0102e5b <_paddr>:
f0102e5b:	81 f9 ff ff ff ef    	cmp    $0xefffffff,%ecx
f0102e61:	76 07                	jbe    f0102e6a <_paddr+0xf>
f0102e63:	8d 81 00 00 00 10    	lea    0x10000000(%ecx),%eax
f0102e69:	c3                   	ret
f0102e6a:	55                   	push   %ebp
f0102e6b:	89 e5                	mov    %esp,%ebp
f0102e6d:	83 ec 08             	sub    $0x8,%esp
f0102e70:	51                   	push   %ecx
f0102e71:	68 f0 69 10 f0       	push   $0xf01069f0
f0102e76:	52                   	push   %edx
f0102e77:	50                   	push   %eax
f0102e78:	e8 ed d1 ff ff       	call   f010006a <_panic>

f0102e7d <env_setup_vm>:
f0102e7d:	55                   	push   %ebp
f0102e7e:	89 e5                	mov    %esp,%ebp
f0102e80:	56                   	push   %esi
f0102e81:	53                   	push   %ebx
f0102e82:	89 c6                	mov    %eax,%esi
f0102e84:	83 ec 0c             	sub    $0xc,%esp
f0102e87:	6a 01                	push   $0x1
f0102e89:	e8 df e4 ff ff       	call   f010136d <page_alloc>
f0102e8e:	83 c4 10             	add    $0x10,%esp
f0102e91:	85 c0                	test   %eax,%eax
f0102e93:	74 4f                	je     f0102ee4 <env_setup_vm+0x67>
f0102e95:	89 c3                	mov    %eax,%ebx
f0102e97:	e8 a1 ff ff ff       	call   f0102e3d <page2kva>
f0102e9c:	89 46 60             	mov    %eax,0x60(%esi)
f0102e9f:	83 ec 04             	sub    $0x4,%esp
f0102ea2:	68 00 10 00 00       	push   $0x1000
f0102ea7:	ff 35 5c 92 18 f0    	push   0xf018925c
f0102ead:	50                   	push   %eax
f0102eae:	e8 7f 2e 00 00       	call   f0105d32 <memcpy>
f0102eb3:	66 83 43 04 01       	addw   $0x1,0x4(%ebx)
f0102eb8:	8b 5e 60             	mov    0x60(%esi),%ebx
f0102ebb:	89 d9                	mov    %ebx,%ecx
f0102ebd:	ba c1 00 00 00       	mov    $0xc1,%edx
f0102ec2:	b8 f3 7c 10 f0       	mov    $0xf0107cf3,%eax
f0102ec7:	e8 8f ff ff ff       	call   f0102e5b <_paddr>
f0102ecc:	83 c8 05             	or     $0x5,%eax
f0102ecf:	89 83 f4 0e 00 00    	mov    %eax,0xef4(%ebx)
f0102ed5:	83 c4 10             	add    $0x10,%esp
f0102ed8:	b8 00 00 00 00       	mov    $0x0,%eax
f0102edd:	8d 65 f8             	lea    -0x8(%ebp),%esp
f0102ee0:	5b                   	pop    %ebx
f0102ee1:	5e                   	pop    %esi
f0102ee2:	5d                   	pop    %ebp
f0102ee3:	c3                   	ret
f0102ee4:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
f0102ee9:	eb f2                	jmp    f0102edd <env_setup_vm+0x60>

f0102eeb <pa2page>:
f0102eeb:	c1 e8 0c             	shr    $0xc,%eax
f0102eee:	3b 05 60 92 18 f0    	cmp    0xf0189260,%eax
f0102ef4:	73 0a                	jae    f0102f00 <pa2page+0x15>
f0102ef6:	8b 15 58 92 18 f0    	mov    0xf0189258,%edx
f0102efc:	8d 04 c2             	lea    (%edx,%eax,8),%eax
f0102eff:	c3                   	ret
f0102f00:	55                   	push   %ebp
f0102f01:	89 e5                	mov    %esp,%ebp
f0102f03:	83 ec 0c             	sub    $0xc,%esp
f0102f06:	68 cc 6d 10 f0       	push   $0xf0106dcc
f0102f0b:	6a 51                	push   $0x51
f0102f0d:	68 1a 7a 10 f0       	push   $0xf0107a1a
f0102f12:	e8 53 d1 ff ff       	call   f010006a <_panic>

f0102f17 <region_alloc>:
f0102f17:	55                   	push   %ebp
f0102f18:	89 e5                	mov    %esp,%ebp
f0102f1a:	57                   	push   %edi
f0102f1b:	56                   	push   %esi
f0102f1c:	53                   	push   %ebx
f0102f1d:	83 ec 0c             	sub    $0xc,%esp
f0102f20:	89 c7                	mov    %eax,%edi
f0102f22:	89 d3                	mov    %edx,%ebx
f0102f24:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
f0102f2a:	8d b4 0a ff 0f 00 00 	lea    0xfff(%edx,%ecx,1),%esi
f0102f31:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
f0102f37:	81 fe 00 00 c0 ee    	cmp    $0xeec00000,%esi
f0102f3d:	77 30                	ja     f0102f6f <region_alloc+0x58>
f0102f3f:	39 f3                	cmp    %esi,%ebx
f0102f41:	73 71                	jae    f0102fb4 <region_alloc+0x9d>
f0102f43:	83 ec 0c             	sub    $0xc,%esp
f0102f46:	6a 00                	push   $0x0
f0102f48:	e8 20 e4 ff ff       	call   f010136d <page_alloc>
f0102f4d:	83 c4 10             	add    $0x10,%esp
f0102f50:	85 c0                	test   %eax,%eax
f0102f52:	74 32                	je     f0102f86 <region_alloc+0x6f>
f0102f54:	6a 06                	push   $0x6
f0102f56:	53                   	push   %ebx
f0102f57:	50                   	push   %eax
f0102f58:	ff 77 60             	push   0x60(%edi)
f0102f5b:	e8 f7 ea ff ff       	call   f0101a57 <page_insert>
f0102f60:	83 c4 10             	add    $0x10,%esp
f0102f63:	85 c0                	test   %eax,%eax
f0102f65:	75 36                	jne    f0102f9d <region_alloc+0x86>
f0102f67:	81 c3 00 10 00 00    	add    $0x1000,%ebx
f0102f6d:	eb d0                	jmp    f0102f3f <region_alloc+0x28>
f0102f6f:	83 ec 04             	sub    $0x4,%esp
f0102f72:	68 64 75 10 f0       	push   $0xf0107564
f0102f77:	68 21 01 00 00       	push   $0x121
f0102f7c:	68 f3 7c 10 f0       	push   $0xf0107cf3
f0102f81:	e8 e4 d0 ff ff       	call   f010006a <_panic>
f0102f86:	83 ec 04             	sub    $0x4,%esp
f0102f89:	68 8c 75 10 f0       	push   $0xf010758c
f0102f8e:	68 26 01 00 00       	push   $0x126
f0102f93:	68 f3 7c 10 f0       	push   $0xf0107cf3
f0102f98:	e8 cd d0 ff ff       	call   f010006a <_panic>
f0102f9d:	83 ec 04             	sub    $0x4,%esp
f0102fa0:	68 b0 75 10 f0       	push   $0xf01075b0
f0102fa5:	68 28 01 00 00       	push   $0x128
f0102faa:	68 f3 7c 10 f0       	push   $0xf0107cf3
f0102faf:	e8 b6 d0 ff ff       	call   f010006a <_panic>
f0102fb4:	8d 65 f4             	lea    -0xc(%ebp),%esp
f0102fb7:	5b                   	pop    %ebx
f0102fb8:	5e                   	pop    %esi
f0102fb9:	5f                   	pop    %edi
f0102fba:	5d                   	pop    %ebp
f0102fbb:	c3                   	ret

f0102fbc <load_icode>:
f0102fbc:	55                   	push   %ebp
f0102fbd:	89 e5                	mov    %esp,%ebp
f0102fbf:	57                   	push   %edi
f0102fc0:	56                   	push   %esi
f0102fc1:	53                   	push   %ebx
f0102fc2:	83 ec 24             	sub    $0x24,%esp
f0102fc5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f0102fc8:	89 d7                	mov    %edx,%edi
f0102fca:	52                   	push   %edx
f0102fcb:	68 fe 7c 10 f0       	push   $0xf0107cfe
f0102fd0:	e8 61 08 00 00       	call   f0103836 <cprintf>
f0102fd5:	83 c4 10             	add    $0x10,%esp
f0102fd8:	81 3f 7f 45 4c 46    	cmpl   $0x464c457f,(%edi)
f0102fde:	75 2a                	jne    f010300a <load_icode+0x4e>
f0102fe0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f0102fe3:	8b 48 60             	mov    0x60(%eax),%ecx
f0102fe6:	ba 6b 01 00 00       	mov    $0x16b,%edx
f0102feb:	b8 f3 7c 10 f0       	mov    $0xf0107cf3,%eax
f0102ff0:	e8 66 fe ff ff       	call   f0102e5b <_paddr>
f0102ff5:	e8 06 fe ff ff       	call   f0102e00 <lcr3>
f0102ffa:	89 fb                	mov    %edi,%ebx
f0102ffc:	03 5f 1c             	add    0x1c(%edi),%ebx
f0102fff:	0f b7 77 2c          	movzwl 0x2c(%edi),%esi
f0103003:	c1 e6 05             	shl    $0x5,%esi
f0103006:	01 de                	add    %ebx,%esi
f0103008:	eb 1a                	jmp    f0103024 <load_icode+0x68>
f010300a:	83 ec 04             	sub    $0x4,%esp
f010300d:	68 02 7d 10 f0       	push   $0xf0107d02
f0103012:	68 69 01 00 00       	push   $0x169
f0103017:	68 f3 7c 10 f0       	push   $0xf0107cf3
f010301c:	e8 49 d0 ff ff       	call   f010006a <_panic>
f0103021:	83 c3 20             	add    $0x20,%ebx
f0103024:	39 f3                	cmp    %esi,%ebx
f0103026:	73 3c                	jae    f0103064 <load_icode+0xa8>
f0103028:	83 3b 01             	cmpl   $0x1,(%ebx)
f010302b:	75 f4                	jne    f0103021 <load_icode+0x65>
f010302d:	8b 4b 14             	mov    0x14(%ebx),%ecx
f0103030:	8b 53 08             	mov    0x8(%ebx),%edx
f0103033:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f0103036:	e8 dc fe ff ff       	call   f0102f17 <region_alloc>
f010303b:	83 ec 04             	sub    $0x4,%esp
f010303e:	ff 73 14             	push   0x14(%ebx)
f0103041:	6a 00                	push   $0x0
f0103043:	ff 73 08             	push   0x8(%ebx)
f0103046:	e8 4c 2c 00 00       	call   f0105c97 <memset>
f010304b:	83 c4 0c             	add    $0xc,%esp
f010304e:	ff 73 10             	push   0x10(%ebx)
f0103051:	89 f8                	mov    %edi,%eax
f0103053:	03 43 04             	add    0x4(%ebx),%eax
f0103056:	50                   	push   %eax
f0103057:	ff 73 08             	push   0x8(%ebx)
f010305a:	e8 d3 2c 00 00       	call   f0105d32 <memcpy>
f010305f:	83 c4 10             	add    $0x10,%esp
f0103062:	eb bd                	jmp    f0103021 <load_icode+0x65>
f0103064:	b9 00 10 00 00       	mov    $0x1000,%ecx
f0103069:	ba 00 d0 bf ee       	mov    $0xeebfd000,%edx
f010306e:	8b 75 e4             	mov    -0x1c(%ebp),%esi
f0103071:	89 f0                	mov    %esi,%eax
f0103073:	e8 9f fe ff ff       	call   f0102f17 <region_alloc>
f0103078:	8b 47 18             	mov    0x18(%edi),%eax
f010307b:	89 46 30             	mov    %eax,0x30(%esi)
f010307e:	8b 0d 5c 92 18 f0    	mov    0xf018925c,%ecx
f0103084:	ba 85 01 00 00       	mov    $0x185,%edx
f0103089:	b8 f3 7c 10 f0       	mov    $0xf0107cf3,%eax
f010308e:	e8 c8 fd ff ff       	call   f0102e5b <_paddr>
f0103093:	e8 68 fd ff ff       	call   f0102e00 <lcr3>
f0103098:	8d 65 f4             	lea    -0xc(%ebp),%esp
f010309b:	5b                   	pop    %ebx
f010309c:	5e                   	pop    %esi
f010309d:	5f                   	pop    %edi
f010309e:	5d                   	pop    %ebp
f010309f:	c3                   	ret

f01030a0 <unlock_kernel>:
f01030a0:	55                   	push   %ebp
f01030a1:	89 e5                	mov    %esp,%ebp
f01030a3:	83 ec 14             	sub    $0x14,%esp
f01030a6:	68 c0 23 11 f0       	push   $0xf01123c0
f01030ab:	e8 a6 35 00 00       	call   f0106656 <spin_unlock>
f01030b0:	f3 90                	pause
f01030b2:	83 c4 10             	add    $0x10,%esp
f01030b5:	c9                   	leave
f01030b6:	c3                   	ret

f01030b7 <envid2env>:
f01030b7:	55                   	push   %ebp
f01030b8:	89 e5                	mov    %esp,%ebp
f01030ba:	56                   	push   %esi
f01030bb:	53                   	push   %ebx
f01030bc:	8b 75 08             	mov    0x8(%ebp),%esi
f01030bf:	8b 45 10             	mov    0x10(%ebp),%eax
f01030c2:	85 f6                	test   %esi,%esi
f01030c4:	74 31                	je     f01030f7 <envid2env+0x40>
f01030c6:	89 f3                	mov    %esi,%ebx
f01030c8:	81 e3 ff 03 00 00    	and    $0x3ff,%ebx
f01030ce:	69 db 84 00 00 00    	imul   $0x84,%ebx,%ebx
f01030d4:	03 1d 70 92 18 f0    	add    0xf0189270,%ebx
f01030da:	83 7b 54 00          	cmpl   $0x0,0x54(%ebx)
f01030de:	74 5b                	je     f010313b <envid2env+0x84>
f01030e0:	39 73 48             	cmp    %esi,0x48(%ebx)
f01030e3:	75 62                	jne    f0103147 <envid2env+0x90>
f01030e5:	84 c0                	test   %al,%al
f01030e7:	75 20                	jne    f0103109 <envid2env+0x52>
f01030e9:	b8 00 00 00 00       	mov    $0x0,%eax
f01030ee:	8b 55 0c             	mov    0xc(%ebp),%edx
f01030f1:	89 1a                	mov    %ebx,(%edx)
f01030f3:	5b                   	pop    %ebx
f01030f4:	5e                   	pop    %esi
f01030f5:	5d                   	pop    %ebp
f01030f6:	c3                   	ret
f01030f7:	e8 00 32 00 00       	call   f01062fc <cpunum>
f01030fc:	6b c0 74             	imul   $0x74,%eax,%eax
f01030ff:	8b 98 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%ebx
f0103105:	89 f0                	mov    %esi,%eax
f0103107:	eb e5                	jmp    f01030ee <envid2env+0x37>
f0103109:	e8 ee 31 00 00       	call   f01062fc <cpunum>
f010310e:	6b c0 74             	imul   $0x74,%eax,%eax
f0103111:	39 98 28 d0 1c f0    	cmp    %ebx,-0xfe32fd8(%eax)
f0103117:	74 d0                	je     f01030e9 <envid2env+0x32>
f0103119:	8b 73 4c             	mov    0x4c(%ebx),%esi
f010311c:	e8 db 31 00 00       	call   f01062fc <cpunum>
f0103121:	6b c0 74             	imul   $0x74,%eax,%eax
f0103124:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f010312a:	3b 70 48             	cmp    0x48(%eax),%esi
f010312d:	74 ba                	je     f01030e9 <envid2env+0x32>
f010312f:	bb 00 00 00 00       	mov    $0x0,%ebx
f0103134:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
f0103139:	eb b3                	jmp    f01030ee <envid2env+0x37>
f010313b:	bb 00 00 00 00       	mov    $0x0,%ebx
f0103140:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
f0103145:	eb a7                	jmp    f01030ee <envid2env+0x37>
f0103147:	bb 00 00 00 00       	mov    $0x0,%ebx
f010314c:	b8 fe ff ff ff       	mov    $0xfffffffe,%eax
f0103151:	eb 9b                	jmp    f01030ee <envid2env+0x37>

f0103153 <env_init_percpu>:
f0103153:	55                   	push   %ebp
f0103154:	89 e5                	mov    %esp,%ebp
f0103156:	83 ec 08             	sub    $0x8,%esp
f0103159:	b8 20 23 11 f0       	mov    $0xf0112320,%eax
f010315e:	e8 95 fc ff ff       	call   f0102df8 <lgdt>
f0103163:	b8 23 00 00 00       	mov    $0x23,%eax
f0103168:	8e e8                	mov    %eax,%gs
f010316a:	8e e0                	mov    %eax,%fs
f010316c:	b8 10 00 00 00       	mov    $0x10,%eax
f0103171:	8e c0                	mov    %eax,%es
f0103173:	8e d8                	mov    %eax,%ds
f0103175:	8e d0                	mov    %eax,%ss
f0103177:	ea 7e 31 10 f0 08 00 	ljmp   $0x8,$0xf010317e
f010317e:	b8 00 00 00 00       	mov    $0x0,%eax
f0103183:	e8 74 fc ff ff       	call   f0102dfc <lldt>
f0103188:	c9                   	leave
f0103189:	c3                   	ret

f010318a <env_init>:
f010318a:	55                   	push   %ebp
f010318b:	89 e5                	mov    %esp,%ebp
f010318d:	83 ec 08             	sub    $0x8,%esp
f0103190:	a1 70 92 18 f0       	mov    0xf0189270,%eax
f0103195:	8d 90 84 10 02 00    	lea    0x21084(%eax),%edx
f010319b:	eb 11                	jmp    f01031ae <env_init+0x24>
f010319d:	c7 40 c4 00 00 00 00 	movl   $0x0,-0x3c(%eax)
f01031a4:	c7 40 d0 00 00 00 00 	movl   $0x0,-0x30(%eax)
f01031ab:	89 40 c0             	mov    %eax,-0x40(%eax)
f01031ae:	05 84 00 00 00       	add    $0x84,%eax
f01031b3:	39 d0                	cmp    %edx,%eax
f01031b5:	75 e6                	jne    f010319d <env_init+0x13>
f01031b7:	a1 70 92 18 f0       	mov    0xf0189270,%eax
f01031bc:	c7 80 c0 0f 02 00 00 	movl   $0x0,0x20fc0(%eax)
f01031c3:	00 00 00 
f01031c6:	a3 74 92 18 f0       	mov    %eax,0xf0189274
f01031cb:	e8 83 ff ff ff       	call   f0103153 <env_init_percpu>
f01031d0:	c9                   	leave
f01031d1:	c3                   	ret

f01031d2 <env_alloc>:
f01031d2:	55                   	push   %ebp
f01031d3:	89 e5                	mov    %esp,%ebp
f01031d5:	56                   	push   %esi
f01031d6:	53                   	push   %ebx
f01031d7:	83 ec 10             	sub    $0x10,%esp
f01031da:	8b 75 0c             	mov    0xc(%ebp),%esi
f01031dd:	8b 1d 74 92 18 f0    	mov    0xf0189274,%ebx
f01031e3:	85 db                	test   %ebx,%ebx
f01031e5:	0f 84 2f 01 00 00    	je     f010331a <env_alloc+0x148>
f01031eb:	89 d8                	mov    %ebx,%eax
f01031ed:	e8 8b fc ff ff       	call   f0102e7d <env_setup_vm>
f01031f2:	85 c0                	test   %eax,%eax
f01031f4:	0f 88 19 01 00 00    	js     f0103313 <env_alloc+0x141>
f01031fa:	8b 43 48             	mov    0x48(%ebx),%eax
f01031fd:	05 00 10 00 00       	add    $0x1000,%eax
f0103202:	25 00 fc ff ff       	and    $0xfffffc00,%eax
f0103207:	ba 00 10 00 00       	mov    $0x1000,%edx
f010320c:	0f 4e c2             	cmovle %edx,%eax
f010320f:	8b 0d 70 92 18 f0    	mov    0xf0189270,%ecx
f0103215:	89 da                	mov    %ebx,%edx
f0103217:	29 ca                	sub    %ecx,%edx
f0103219:	c1 fa 02             	sar    $0x2,%edx
f010321c:	69 d2 e1 83 0f 3e    	imul   $0x3e0f83e1,%edx,%edx
f0103222:	09 d0                	or     %edx,%eax
f0103224:	89 43 48             	mov    %eax,0x48(%ebx)
f0103227:	89 73 4c             	mov    %esi,0x4c(%ebx)
f010322a:	c7 43 50 00 00 00 00 	movl   $0x0,0x50(%ebx)
f0103231:	c7 43 54 02 00 00 00 	movl   $0x2,0x54(%ebx)
f0103238:	c7 43 58 00 00 00 00 	movl   $0x0,0x58(%ebx)
f010323f:	85 f6                	test   %esi,%esi
f0103241:	74 14                	je     f0103257 <env_alloc+0x85>
f0103243:	89 f0                	mov    %esi,%eax
f0103245:	25 ff 03 00 00       	and    $0x3ff,%eax
f010324a:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
f0103250:	8b 44 01 7c          	mov    0x7c(%ecx,%eax,1),%eax
f0103254:	89 43 7c             	mov    %eax,0x7c(%ebx)
f0103257:	83 ec 04             	sub    $0x4,%esp
f010325a:	6a 44                	push   $0x44
f010325c:	6a 00                	push   $0x0
f010325e:	53                   	push   %ebx
f010325f:	e8 33 2a 00 00       	call   f0105c97 <memset>
f0103264:	66 c7 43 24 23 00    	movw   $0x23,0x24(%ebx)
f010326a:	66 c7 43 20 23 00    	movw   $0x23,0x20(%ebx)
f0103270:	66 c7 43 40 23 00    	movw   $0x23,0x40(%ebx)
f0103276:	c7 43 3c 00 e0 bf ee 	movl   $0xeebfe000,0x3c(%ebx)
f010327d:	66 c7 43 34 1b 00    	movw   $0x1b,0x34(%ebx)
f0103283:	81 4b 38 00 02 00 00 	orl    $0x200,0x38(%ebx)
f010328a:	c7 43 64 00 00 00 00 	movl   $0x0,0x64(%ebx)
f0103291:	c6 43 68 00          	movb   $0x0,0x68(%ebx)
f0103295:	8b 43 44             	mov    0x44(%ebx),%eax
f0103298:	a3 74 92 18 f0       	mov    %eax,0xf0189274
f010329d:	8b 45 08             	mov    0x8(%ebp),%eax
f01032a0:	89 18                	mov    %ebx,(%eax)
f01032a2:	83 c4 0c             	add    $0xc,%esp
f01032a5:	6a 00                	push   $0x0
f01032a7:	8d 45 f4             	lea    -0xc(%ebp),%eax
f01032aa:	50                   	push   %eax
f01032ab:	56                   	push   %esi
f01032ac:	e8 06 fe ff ff       	call   f01030b7 <envid2env>
f01032b1:	8b 55 f4             	mov    -0xc(%ebp),%edx
f01032b4:	83 c4 10             	add    $0x10,%esp
f01032b7:	b8 00 00 00 00       	mov    $0x0,%eax
f01032bc:	85 d2                	test   %edx,%edx
f01032be:	74 03                	je     f01032c3 <env_alloc+0xf1>
f01032c0:	8b 42 7c             	mov    0x7c(%edx),%eax
f01032c3:	83 ec 08             	sub    $0x8,%esp
f01032c6:	50                   	push   %eax
f01032c7:	ff 73 48             	push   0x48(%ebx)
f01032ca:	e8 22 12 00 00       	call   f01044f1 <sched_push_env>
f01032cf:	8b 5b 48             	mov    0x48(%ebx),%ebx
f01032d2:	e8 25 30 00 00       	call   f01062fc <cpunum>
f01032d7:	6b c0 74             	imul   $0x74,%eax,%eax
f01032da:	83 c4 10             	add    $0x10,%esp
f01032dd:	ba 00 00 00 00       	mov    $0x0,%edx
f01032e2:	83 b8 28 d0 1c f0 00 	cmpl   $0x0,-0xfe32fd8(%eax)
f01032e9:	74 11                	je     f01032fc <env_alloc+0x12a>
f01032eb:	e8 0c 30 00 00       	call   f01062fc <cpunum>
f01032f0:	6b c0 74             	imul   $0x74,%eax,%eax
f01032f3:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f01032f9:	8b 50 48             	mov    0x48(%eax),%edx
f01032fc:	83 ec 04             	sub    $0x4,%esp
f01032ff:	53                   	push   %ebx
f0103300:	52                   	push   %edx
f0103301:	68 1f 7d 10 f0       	push   $0xf0107d1f
f0103306:	e8 2b 05 00 00       	call   f0103836 <cprintf>
f010330b:	83 c4 10             	add    $0x10,%esp
f010330e:	b8 00 00 00 00       	mov    $0x0,%eax
f0103313:	8d 65 f8             	lea    -0x8(%ebp),%esp
f0103316:	5b                   	pop    %ebx
f0103317:	5e                   	pop    %esi
f0103318:	5d                   	pop    %ebp
f0103319:	c3                   	ret
f010331a:	b8 fb ff ff ff       	mov    $0xfffffffb,%eax
f010331f:	eb f2                	jmp    f0103313 <env_alloc+0x141>

f0103321 <env_create>:
f0103321:	55                   	push   %ebp
f0103322:	89 e5                	mov    %esp,%ebp
f0103324:	53                   	push   %ebx
f0103325:	83 ec 1c             	sub    $0x1c,%esp
f0103328:	6a 00                	push   $0x0
f010332a:	8d 45 f4             	lea    -0xc(%ebp),%eax
f010332d:	50                   	push   %eax
f010332e:	e8 9f fe ff ff       	call   f01031d2 <env_alloc>
f0103333:	83 c4 10             	add    $0x10,%esp
f0103336:	85 c0                	test   %eax,%eax
f0103338:	78 1f                	js     f0103359 <env_create+0x38>
f010333a:	8b 5d f4             	mov    -0xc(%ebp),%ebx
f010333d:	8b 55 08             	mov    0x8(%ebp),%edx
f0103340:	89 d8                	mov    %ebx,%eax
f0103342:	e8 75 fc ff ff       	call   f0102fbc <load_icode>
f0103347:	8b 45 0c             	mov    0xc(%ebp),%eax
f010334a:	89 43 50             	mov    %eax,0x50(%ebx)
f010334d:	c7 43 7c 00 00 00 00 	movl   $0x0,0x7c(%ebx)
f0103354:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f0103357:	c9                   	leave
f0103358:	c3                   	ret
f0103359:	50                   	push   %eax
f010335a:	68 34 7d 10 f0       	push   $0xf0107d34
f010335f:	68 95 01 00 00       	push   $0x195
f0103364:	68 f3 7c 10 f0       	push   $0xf0107cf3
f0103369:	e8 fc cc ff ff       	call   f010006a <_panic>

f010336e <env_free>:
f010336e:	55                   	push   %ebp
f010336f:	89 e5                	mov    %esp,%ebp
f0103371:	57                   	push   %edi
f0103372:	56                   	push   %esi
f0103373:	53                   	push   %ebx
f0103374:	83 ec 1c             	sub    $0x1c,%esp
f0103377:	8b 7d 08             	mov    0x8(%ebp),%edi
f010337a:	e8 7d 2f 00 00       	call   f01062fc <cpunum>
f010337f:	6b c0 74             	imul   $0x74,%eax,%eax
f0103382:	39 b8 28 d0 1c f0    	cmp    %edi,-0xfe32fd8(%eax)
f0103388:	74 45                	je     f01033cf <env_free+0x61>
f010338a:	8b 5f 48             	mov    0x48(%edi),%ebx
f010338d:	e8 6a 2f 00 00       	call   f01062fc <cpunum>
f0103392:	6b c0 74             	imul   $0x74,%eax,%eax
f0103395:	ba 00 00 00 00       	mov    $0x0,%edx
f010339a:	83 b8 28 d0 1c f0 00 	cmpl   $0x0,-0xfe32fd8(%eax)
f01033a1:	74 11                	je     f01033b4 <env_free+0x46>
f01033a3:	e8 54 2f 00 00       	call   f01062fc <cpunum>
f01033a8:	6b c0 74             	imul   $0x74,%eax,%eax
f01033ab:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f01033b1:	8b 50 48             	mov    0x48(%eax),%edx
f01033b4:	83 ec 04             	sub    $0x4,%esp
f01033b7:	53                   	push   %ebx
f01033b8:	52                   	push   %edx
f01033b9:	68 44 7d 10 f0       	push   $0xf0107d44
f01033be:	e8 73 04 00 00       	call   f0103836 <cprintf>
f01033c3:	83 c4 10             	add    $0x10,%esp
f01033c6:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
f01033cd:	eb 77                	jmp    f0103446 <env_free+0xd8>
f01033cf:	8b 0d 5c 92 18 f0    	mov    0xf018925c,%ecx
f01033d5:	ba aa 01 00 00       	mov    $0x1aa,%edx
f01033da:	b8 f3 7c 10 f0       	mov    $0xf0107cf3,%eax
f01033df:	e8 77 fa ff ff       	call   f0102e5b <_paddr>
f01033e4:	e8 17 fa ff ff       	call   f0102e00 <lcr3>
f01033e9:	eb 9f                	jmp    f010338a <env_free+0x1c>
f01033eb:	83 c3 01             	add    $0x1,%ebx
f01033ee:	81 fb 00 04 00 00    	cmp    $0x400,%ebx
f01033f4:	74 21                	je     f0103417 <env_free+0xa9>
f01033f6:	f6 04 9e 01          	testb  $0x1,(%esi,%ebx,4)
f01033fa:	74 ef                	je     f01033eb <env_free+0x7d>
f01033fc:	83 ec 08             	sub    $0x8,%esp
f01033ff:	89 d8                	mov    %ebx,%eax
f0103401:	c1 e0 0c             	shl    $0xc,%eax
f0103404:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
f0103407:	09 c8                	or     %ecx,%eax
f0103409:	50                   	push   %eax
f010340a:	ff 77 60             	push   0x60(%edi)
f010340d:	e8 2d e5 ff ff       	call   f010193f <page_remove>
f0103412:	83 c4 10             	add    $0x10,%esp
f0103415:	eb d4                	jmp    f01033eb <env_free+0x7d>
f0103417:	8b 47 60             	mov    0x60(%edi),%eax
f010341a:	8b 55 e0             	mov    -0x20(%ebp),%edx
f010341d:	c7 04 10 00 00 00 00 	movl   $0x0,(%eax,%edx,1)
f0103424:	8b 45 dc             	mov    -0x24(%ebp),%eax
f0103427:	e8 bf fa ff ff       	call   f0102eeb <pa2page>
f010342c:	83 ec 0c             	sub    $0xc,%esp
f010342f:	50                   	push   %eax
f0103430:	e8 f5 e3 ff ff       	call   f010182a <page_decref>
f0103435:	83 c4 10             	add    $0x10,%esp
f0103438:	83 45 e0 04          	addl   $0x4,-0x20(%ebp)
f010343c:	8b 45 e0             	mov    -0x20(%ebp),%eax
f010343f:	3d ec 0e 00 00       	cmp    $0xeec,%eax
f0103444:	74 3b                	je     f0103481 <env_free+0x113>
f0103446:	8b 47 60             	mov    0x60(%edi),%eax
f0103449:	8b 55 e0             	mov    -0x20(%ebp),%edx
f010344c:	8b 04 10             	mov    (%eax,%edx,1),%eax
f010344f:	a8 01                	test   $0x1,%al
f0103451:	74 e5                	je     f0103438 <env_free+0xca>
f0103453:	25 00 f0 ff ff       	and    $0xfffff000,%eax
f0103458:	89 45 dc             	mov    %eax,-0x24(%ebp)
f010345b:	89 c1                	mov    %eax,%ecx
f010345d:	ba b8 01 00 00       	mov    $0x1b8,%edx
f0103462:	b8 f3 7c 10 f0       	mov    $0xf0107cf3,%eax
f0103467:	e8 a5 f9 ff ff       	call   f0102e11 <_kaddr>
f010346c:	89 c6                	mov    %eax,%esi
f010346e:	8b 45 e0             	mov    -0x20(%ebp),%eax
f0103471:	c1 e0 14             	shl    $0x14,%eax
f0103474:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f0103477:	bb 00 00 00 00       	mov    $0x0,%ebx
f010347c:	e9 75 ff ff ff       	jmp    f01033f6 <env_free+0x88>
f0103481:	8b 4f 60             	mov    0x60(%edi),%ecx
f0103484:	ba c6 01 00 00       	mov    $0x1c6,%edx
f0103489:	b8 f3 7c 10 f0       	mov    $0xf0107cf3,%eax
f010348e:	e8 c8 f9 ff ff       	call   f0102e5b <_paddr>
f0103493:	c7 47 60 00 00 00 00 	movl   $0x0,0x60(%edi)
f010349a:	e8 4c fa ff ff       	call   f0102eeb <pa2page>
f010349f:	83 ec 0c             	sub    $0xc,%esp
f01034a2:	50                   	push   %eax
f01034a3:	e8 82 e3 ff ff       	call   f010182a <page_decref>
f01034a8:	c7 47 54 00 00 00 00 	movl   $0x0,0x54(%edi)
f01034af:	a1 74 92 18 f0       	mov    0xf0189274,%eax
f01034b4:	89 47 44             	mov    %eax,0x44(%edi)
f01034b7:	89 3d 74 92 18 f0    	mov    %edi,0xf0189274
f01034bd:	83 c4 10             	add    $0x10,%esp
f01034c0:	8d 65 f4             	lea    -0xc(%ebp),%esp
f01034c3:	5b                   	pop    %ebx
f01034c4:	5e                   	pop    %esi
f01034c5:	5f                   	pop    %edi
f01034c6:	5d                   	pop    %ebp
f01034c7:	c3                   	ret

f01034c8 <env_destroy>:
f01034c8:	55                   	push   %ebp
f01034c9:	89 e5                	mov    %esp,%ebp
f01034cb:	53                   	push   %ebx
f01034cc:	83 ec 04             	sub    $0x4,%esp
f01034cf:	8b 5d 08             	mov    0x8(%ebp),%ebx
f01034d2:	83 7b 54 03          	cmpl   $0x3,0x54(%ebx)
f01034d6:	74 21                	je     f01034f9 <env_destroy+0x31>
f01034d8:	83 ec 0c             	sub    $0xc,%esp
f01034db:	53                   	push   %ebx
f01034dc:	e8 8d fe ff ff       	call   f010336e <env_free>
f01034e1:	e8 16 2e 00 00       	call   f01062fc <cpunum>
f01034e6:	6b c0 74             	imul   $0x74,%eax,%eax
f01034e9:	83 c4 10             	add    $0x10,%esp
f01034ec:	39 98 28 d0 1c f0    	cmp    %ebx,-0xfe32fd8(%eax)
f01034f2:	74 1e                	je     f0103512 <env_destroy+0x4a>
f01034f4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f01034f7:	c9                   	leave
f01034f8:	c3                   	ret
f01034f9:	e8 fe 2d 00 00       	call   f01062fc <cpunum>
f01034fe:	6b c0 74             	imul   $0x74,%eax,%eax
f0103501:	39 98 28 d0 1c f0    	cmp    %ebx,-0xfe32fd8(%eax)
f0103507:	74 cf                	je     f01034d8 <env_destroy+0x10>
f0103509:	c7 43 54 01 00 00 00 	movl   $0x1,0x54(%ebx)
f0103510:	eb e2                	jmp    f01034f4 <env_destroy+0x2c>
f0103512:	e8 e5 2d 00 00       	call   f01062fc <cpunum>
f0103517:	6b c0 74             	imul   $0x74,%eax,%eax
f010351a:	c7 80 28 d0 1c f0 00 	movl   $0x0,-0xfe32fd8(%eax)
f0103521:	00 00 00 
f0103524:	e8 ad 13 00 00       	call   f01048d6 <sched_yield>

f0103529 <env_load_pgdir>:
f0103529:	55                   	push   %ebp
f010352a:	89 e5                	mov    %esp,%ebp
f010352c:	83 ec 08             	sub    $0x8,%esp
f010352f:	8b 45 08             	mov    0x8(%ebp),%eax
f0103532:	8b 48 60             	mov    0x60(%eax),%ecx
f0103535:	ba f3 01 00 00       	mov    $0x1f3,%edx
f010353a:	b8 f3 7c 10 f0       	mov    $0xf0107cf3,%eax
f010353f:	e8 17 f9 ff ff       	call   f0102e5b <_paddr>
f0103544:	e8 b7 f8 ff ff       	call   f0102e00 <lcr3>
f0103549:	c9                   	leave
f010354a:	c3                   	ret

f010354b <env_run>:
f010354b:	55                   	push   %ebp
f010354c:	89 e5                	mov    %esp,%ebp
f010354e:	53                   	push   %ebx
f010354f:	83 ec 04             	sub    $0x4,%esp
f0103552:	e8 a5 2d 00 00       	call   f01062fc <cpunum>
f0103557:	6b c0 74             	imul   $0x74,%eax,%eax
f010355a:	83 b8 28 d0 1c f0 00 	cmpl   $0x0,-0xfe32fd8(%eax)
f0103561:	74 14                	je     f0103577 <env_run+0x2c>
f0103563:	e8 94 2d 00 00       	call   f01062fc <cpunum>
f0103568:	6b c0 74             	imul   $0x74,%eax,%eax
f010356b:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f0103571:	83 78 54 03          	cmpl   $0x3,0x54(%eax)
f0103575:	74 7f                	je     f01035f6 <env_run+0xab>
f0103577:	e8 80 2d 00 00       	call   f01062fc <cpunum>
f010357c:	6b c0 74             	imul   $0x74,%eax,%eax
f010357f:	8b 55 08             	mov    0x8(%ebp),%edx
f0103582:	89 90 28 d0 1c f0    	mov    %edx,-0xfe32fd8(%eax)
f0103588:	e8 6f 2d 00 00       	call   f01062fc <cpunum>
f010358d:	6b c0 74             	imul   $0x74,%eax,%eax
f0103590:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f0103596:	c7 40 54 03 00 00 00 	movl   $0x3,0x54(%eax)
f010359d:	e8 5a 2d 00 00       	call   f01062fc <cpunum>
f01035a2:	6b c0 74             	imul   $0x74,%eax,%eax
f01035a5:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f01035ab:	83 40 58 01          	addl   $0x1,0x58(%eax)
f01035af:	e8 48 2d 00 00       	call   f01062fc <cpunum>
f01035b4:	83 ec 0c             	sub    $0xc,%esp
f01035b7:	6b c0 74             	imul   $0x74,%eax,%eax
f01035ba:	ff b0 28 d0 1c f0    	push   -0xfe32fd8(%eax)
f01035c0:	e8 64 ff ff ff       	call   f0103529 <env_load_pgdir>
f01035c5:	e8 d6 fa ff ff       	call   f01030a0 <unlock_kernel>
f01035ca:	e8 2d 2d 00 00       	call   f01062fc <cpunum>
f01035cf:	6b c0 74             	imul   $0x74,%eax,%eax
f01035d2:	8b 98 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%ebx
f01035d8:	e8 1f 2d 00 00       	call   f01062fc <cpunum>
f01035dd:	89 43 5c             	mov    %eax,0x5c(%ebx)
f01035e0:	e8 17 2d 00 00       	call   f01062fc <cpunum>
f01035e5:	83 c4 04             	add    $0x4,%esp
f01035e8:	6b c0 74             	imul   $0x74,%eax,%eax
f01035eb:	ff b0 28 d0 1c f0    	push   -0xfe32fd8(%eax)
f01035f1:	e8 65 0d 00 00       	call   f010435b <context_switch>
f01035f6:	e8 01 2d 00 00       	call   f01062fc <cpunum>
f01035fb:	6b c0 74             	imul   $0x74,%eax,%eax
f01035fe:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f0103604:	c7 40 54 02 00 00 00 	movl   $0x2,0x54(%eax)
f010360b:	e9 67 ff ff ff       	jmp    f0103577 <env_run+0x2c>

f0103610 <inb>:
f0103610:	89 c2                	mov    %eax,%edx
f0103612:	ec                   	in     (%dx),%al
f0103613:	c3                   	ret

f0103614 <outb>:
f0103614:	89 c1                	mov    %eax,%ecx
f0103616:	89 d0                	mov    %edx,%eax
f0103618:	89 ca                	mov    %ecx,%edx
f010361a:	ee                   	out    %al,(%dx)
f010361b:	c3                   	ret

f010361c <mc146818_read>:
f010361c:	55                   	push   %ebp
f010361d:	89 e5                	mov    %esp,%ebp
f010361f:	83 ec 08             	sub    $0x8,%esp
f0103622:	0f b6 55 08          	movzbl 0x8(%ebp),%edx
f0103626:	b8 70 00 00 00       	mov    $0x70,%eax
f010362b:	e8 e4 ff ff ff       	call   f0103614 <outb>
f0103630:	b8 71 00 00 00       	mov    $0x71,%eax
f0103635:	e8 d6 ff ff ff       	call   f0103610 <inb>
f010363a:	0f b6 c0             	movzbl %al,%eax
f010363d:	c9                   	leave
f010363e:	c3                   	ret

f010363f <mc146818_write>:
f010363f:	55                   	push   %ebp
f0103640:	89 e5                	mov    %esp,%ebp
f0103642:	83 ec 08             	sub    $0x8,%esp
f0103645:	0f b6 55 08          	movzbl 0x8(%ebp),%edx
f0103649:	b8 70 00 00 00       	mov    $0x70,%eax
f010364e:	e8 c1 ff ff ff       	call   f0103614 <outb>
f0103653:	0f b6 55 0c          	movzbl 0xc(%ebp),%edx
f0103657:	b8 71 00 00 00       	mov    $0x71,%eax
f010365c:	e8 b3 ff ff ff       	call   f0103614 <outb>
f0103661:	c9                   	leave
f0103662:	c3                   	ret

f0103663 <outb>:
f0103663:	89 c1                	mov    %eax,%ecx
f0103665:	89 d0                	mov    %edx,%eax
f0103667:	89 ca                	mov    %ecx,%edx
f0103669:	ee                   	out    %al,(%dx)
f010366a:	c3                   	ret

f010366b <irq_setmask_8259A>:
f010366b:	55                   	push   %ebp
f010366c:	89 e5                	mov    %esp,%ebp
f010366e:	56                   	push   %esi
f010366f:	53                   	push   %ebx
f0103670:	8b 5d 08             	mov    0x8(%ebp),%ebx
f0103673:	66 89 1d a8 23 11 f0 	mov    %bx,0xf01123a8
f010367a:	80 3d 78 92 18 f0 00 	cmpb   $0x0,0xf0189278
f0103681:	75 07                	jne    f010368a <irq_setmask_8259A+0x1f>
f0103683:	8d 65 f8             	lea    -0x8(%ebp),%esp
f0103686:	5b                   	pop    %ebx
f0103687:	5e                   	pop    %esi
f0103688:	5d                   	pop    %ebp
f0103689:	c3                   	ret
f010368a:	89 de                	mov    %ebx,%esi
f010368c:	0f b6 d3             	movzbl %bl,%edx
f010368f:	b8 21 00 00 00       	mov    $0x21,%eax
f0103694:	e8 ca ff ff ff       	call   f0103663 <outb>
f0103699:	0f b6 d7             	movzbl %bh,%edx
f010369c:	b8 a1 00 00 00       	mov    $0xa1,%eax
f01036a1:	e8 bd ff ff ff       	call   f0103663 <outb>
f01036a6:	83 ec 0c             	sub    $0xc,%esp
f01036a9:	68 5a 7d 10 f0       	push   $0xf0107d5a
f01036ae:	e8 83 01 00 00       	call   f0103836 <cprintf>
f01036b3:	83 c4 10             	add    $0x10,%esp
f01036b6:	bb 00 00 00 00       	mov    $0x0,%ebx
f01036bb:	0f b7 f6             	movzwl %si,%esi
f01036be:	f7 d6                	not    %esi
f01036c0:	eb 08                	jmp    f01036ca <irq_setmask_8259A+0x5f>
f01036c2:	83 c3 01             	add    $0x1,%ebx
f01036c5:	83 fb 10             	cmp    $0x10,%ebx
f01036c8:	74 18                	je     f01036e2 <irq_setmask_8259A+0x77>
f01036ca:	0f a3 de             	bt     %ebx,%esi
f01036cd:	73 f3                	jae    f01036c2 <irq_setmask_8259A+0x57>
f01036cf:	83 ec 08             	sub    $0x8,%esp
f01036d2:	53                   	push   %ebx
f01036d3:	68 6a 81 10 f0       	push   $0xf010816a
f01036d8:	e8 59 01 00 00       	call   f0103836 <cprintf>
f01036dd:	83 c4 10             	add    $0x10,%esp
f01036e0:	eb e0                	jmp    f01036c2 <irq_setmask_8259A+0x57>
f01036e2:	83 ec 0c             	sub    $0xc,%esp
f01036e5:	68 ea 80 10 f0       	push   $0xf01080ea
f01036ea:	e8 47 01 00 00       	call   f0103836 <cprintf>
f01036ef:	83 c4 10             	add    $0x10,%esp
f01036f2:	eb 8f                	jmp    f0103683 <irq_setmask_8259A+0x18>

f01036f4 <pic_init>:
f01036f4:	55                   	push   %ebp
f01036f5:	89 e5                	mov    %esp,%ebp
f01036f7:	83 ec 08             	sub    $0x8,%esp
f01036fa:	c6 05 78 92 18 f0 01 	movb   $0x1,0xf0189278
f0103701:	ba ff 00 00 00       	mov    $0xff,%edx
f0103706:	b8 21 00 00 00       	mov    $0x21,%eax
f010370b:	e8 53 ff ff ff       	call   f0103663 <outb>
f0103710:	ba ff 00 00 00       	mov    $0xff,%edx
f0103715:	b8 a1 00 00 00       	mov    $0xa1,%eax
f010371a:	e8 44 ff ff ff       	call   f0103663 <outb>
f010371f:	ba 11 00 00 00       	mov    $0x11,%edx
f0103724:	b8 20 00 00 00       	mov    $0x20,%eax
f0103729:	e8 35 ff ff ff       	call   f0103663 <outb>
f010372e:	ba 20 00 00 00       	mov    $0x20,%edx
f0103733:	b8 21 00 00 00       	mov    $0x21,%eax
f0103738:	e8 26 ff ff ff       	call   f0103663 <outb>
f010373d:	ba 04 00 00 00       	mov    $0x4,%edx
f0103742:	b8 21 00 00 00       	mov    $0x21,%eax
f0103747:	e8 17 ff ff ff       	call   f0103663 <outb>
f010374c:	ba 03 00 00 00       	mov    $0x3,%edx
f0103751:	b8 21 00 00 00       	mov    $0x21,%eax
f0103756:	e8 08 ff ff ff       	call   f0103663 <outb>
f010375b:	ba 11 00 00 00       	mov    $0x11,%edx
f0103760:	b8 a0 00 00 00       	mov    $0xa0,%eax
f0103765:	e8 f9 fe ff ff       	call   f0103663 <outb>
f010376a:	ba 28 00 00 00       	mov    $0x28,%edx
f010376f:	b8 a1 00 00 00       	mov    $0xa1,%eax
f0103774:	e8 ea fe ff ff       	call   f0103663 <outb>
f0103779:	ba 02 00 00 00       	mov    $0x2,%edx
f010377e:	b8 a1 00 00 00       	mov    $0xa1,%eax
f0103783:	e8 db fe ff ff       	call   f0103663 <outb>
f0103788:	ba 01 00 00 00       	mov    $0x1,%edx
f010378d:	b8 a1 00 00 00       	mov    $0xa1,%eax
f0103792:	e8 cc fe ff ff       	call   f0103663 <outb>
f0103797:	ba 68 00 00 00       	mov    $0x68,%edx
f010379c:	b8 20 00 00 00       	mov    $0x20,%eax
f01037a1:	e8 bd fe ff ff       	call   f0103663 <outb>
f01037a6:	ba 0a 00 00 00       	mov    $0xa,%edx
f01037ab:	b8 20 00 00 00       	mov    $0x20,%eax
f01037b0:	e8 ae fe ff ff       	call   f0103663 <outb>
f01037b5:	ba 68 00 00 00       	mov    $0x68,%edx
f01037ba:	b8 a0 00 00 00       	mov    $0xa0,%eax
f01037bf:	e8 9f fe ff ff       	call   f0103663 <outb>
f01037c4:	ba 0a 00 00 00       	mov    $0xa,%edx
f01037c9:	b8 a0 00 00 00       	mov    $0xa0,%eax
f01037ce:	e8 90 fe ff ff       	call   f0103663 <outb>
f01037d3:	0f b7 05 a8 23 11 f0 	movzwl 0xf01123a8,%eax
f01037da:	66 83 f8 ff          	cmp    $0xffff,%ax
f01037de:	75 02                	jne    f01037e2 <pic_init+0xee>
f01037e0:	c9                   	leave
f01037e1:	c3                   	ret
f01037e2:	83 ec 0c             	sub    $0xc,%esp
f01037e5:	0f b7 c0             	movzwl %ax,%eax
f01037e8:	50                   	push   %eax
f01037e9:	e8 7d fe ff ff       	call   f010366b <irq_setmask_8259A>
f01037ee:	83 c4 10             	add    $0x10,%esp
f01037f1:	eb ed                	jmp    f01037e0 <pic_init+0xec>

f01037f3 <putch>:
f01037f3:	55                   	push   %ebp
f01037f4:	89 e5                	mov    %esp,%ebp
f01037f6:	53                   	push   %ebx
f01037f7:	83 ec 10             	sub    $0x10,%esp
f01037fa:	8b 5d 0c             	mov    0xc(%ebp),%ebx
f01037fd:	ff 75 08             	push   0x8(%ebp)
f0103800:	e8 d4 d0 ff ff       	call   f01008d9 <cputchar>
f0103805:	83 03 01             	addl   $0x1,(%ebx)
f0103808:	83 c4 10             	add    $0x10,%esp
f010380b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f010380e:	c9                   	leave
f010380f:	c3                   	ret

f0103810 <vcprintf>:
f0103810:	55                   	push   %ebp
f0103811:	89 e5                	mov    %esp,%ebp
f0103813:	83 ec 18             	sub    $0x18,%esp
f0103816:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
f010381d:	ff 75 0c             	push   0xc(%ebp)
f0103820:	ff 75 08             	push   0x8(%ebp)
f0103823:	8d 45 f4             	lea    -0xc(%ebp),%eax
f0103826:	50                   	push   %eax
f0103827:	68 f3 37 10 f0       	push   $0xf01037f3
f010382c:	e8 45 1e 00 00       	call   f0105676 <vprintfmt>
f0103831:	8b 45 f4             	mov    -0xc(%ebp),%eax
f0103834:	c9                   	leave
f0103835:	c3                   	ret

f0103836 <cprintf>:
f0103836:	55                   	push   %ebp
f0103837:	89 e5                	mov    %esp,%ebp
f0103839:	83 ec 10             	sub    $0x10,%esp
f010383c:	8d 45 0c             	lea    0xc(%ebp),%eax
f010383f:	50                   	push   %eax
f0103840:	ff 75 08             	push   0x8(%ebp)
f0103843:	e8 c8 ff ff ff       	call   f0103810 <vcprintf>
f0103848:	c9                   	leave
f0103849:	c3                   	ret

f010384a <lidt>:
f010384a:	0f 01 18             	lidtl  (%eax)
f010384d:	c3                   	ret

f010384e <ltr>:
f010384e:	0f 00 d8             	ltr    %eax
f0103851:	c3                   	ret

f0103852 <rcr2>:
f0103852:	0f 20 d0             	mov    %cr2,%eax
f0103855:	c3                   	ret

f0103856 <read_eflags>:
f0103856:	9c                   	pushf
f0103857:	58                   	pop    %eax
f0103858:	c3                   	ret

f0103859 <xchg>:
f0103859:	89 c1                	mov    %eax,%ecx
f010385b:	89 d0                	mov    %edx,%eax
f010385d:	f0 87 01             	lock xchg %eax,(%ecx)
f0103860:	c3                   	ret

f0103861 <trapname>:
f0103861:	83 f8 13             	cmp    $0x13,%eax
f0103864:	76 20                	jbe    f0103886 <trapname+0x25>
f0103866:	ba 6e 7d 10 f0       	mov    $0xf0107d6e,%edx
f010386b:	83 f8 30             	cmp    $0x30,%eax
f010386e:	74 13                	je     f0103883 <trapname+0x22>
f0103870:	83 e8 20             	sub    $0x20,%eax
f0103873:	83 f8 10             	cmp    $0x10,%eax
f0103876:	ba 7a 7d 10 f0       	mov    $0xf0107d7a,%edx
f010387b:	b8 8d 7d 10 f0       	mov    $0xf0107d8d,%eax
f0103880:	0f 43 d0             	cmovae %eax,%edx
f0103883:	89 d0                	mov    %edx,%eax
f0103885:	c3                   	ret
f0103886:	8b 14 85 e0 84 10 f0 	mov    -0xfef7b20(,%eax,4),%edx
f010388d:	eb f4                	jmp    f0103883 <trapname+0x22>

f010388f <lock_kernel>:
f010388f:	55                   	push   %ebp
f0103890:	89 e5                	mov    %esp,%ebp
f0103892:	83 ec 14             	sub    $0x14,%esp
f0103895:	68 c0 23 11 f0       	push   $0xf01123c0
f010389a:	e8 55 2d 00 00       	call   f01065f4 <spin_lock>
f010389f:	83 c4 10             	add    $0x10,%esp
f01038a2:	c9                   	leave
f01038a3:	c3                   	ret

f01038a4 <trap_init_percpu>:
f01038a4:	55                   	push   %ebp
f01038a5:	89 e5                	mov    %esp,%ebp
f01038a7:	57                   	push   %edi
f01038a8:	56                   	push   %esi
f01038a9:	53                   	push   %ebx
f01038aa:	83 ec 0c             	sub    $0xc,%esp
f01038ad:	e8 4a 2a 00 00       	call   f01062fc <cpunum>
f01038b2:	6b f0 74             	imul   $0x74,%eax,%esi
f01038b5:	8d 9e 2c d0 1c f0    	lea    -0xfe32fd4(%esi),%ebx
f01038bb:	e8 3c 2a 00 00       	call   f01062fc <cpunum>
f01038c0:	6b c0 74             	imul   $0x74,%eax,%eax
f01038c3:	0f b6 90 20 d0 1c f0 	movzbl -0xfe32fe0(%eax),%edx
f01038ca:	0f b6 c2             	movzbl %dl,%eax
f01038cd:	89 c7                	mov    %eax,%edi
f01038cf:	c1 e7 10             	shl    $0x10,%edi
f01038d2:	b9 00 00 00 f0       	mov    $0xf0000000,%ecx
f01038d7:	29 f9                	sub    %edi,%ecx
f01038d9:	89 8e 30 d0 1c f0    	mov    %ecx,-0xfe32fd0(%esi)
f01038df:	66 c7 86 34 d0 1c f0 	movw   $0x10,-0xfe32fcc(%esi)
f01038e6:	10 00 
f01038e8:	66 c7 86 92 d0 1c f0 	movw   $0x68,-0xfe32f6e(%esi)
f01038ef:	68 00 
f01038f1:	83 c0 05             	add    $0x5,%eax
f01038f4:	66 c7 04 c5 40 23 11 	movw   $0x67,-0xfeedcc0(,%eax,8)
f01038fb:	f0 67 00 
f01038fe:	66 89 1c c5 42 23 11 	mov    %bx,-0xfeedcbe(,%eax,8)
f0103905:	f0 
f0103906:	89 d9                	mov    %ebx,%ecx
f0103908:	c1 e9 10             	shr    $0x10,%ecx
f010390b:	88 0c c5 44 23 11 f0 	mov    %cl,-0xfeedcbc(,%eax,8)
f0103912:	c6 04 c5 46 23 11 f0 	movb   $0x40,-0xfeedcba(,%eax,8)
f0103919:	40 
f010391a:	c1 eb 18             	shr    $0x18,%ebx
f010391d:	88 1c c5 47 23 11 f0 	mov    %bl,-0xfeedcb9(,%eax,8)
f0103924:	c6 04 c5 45 23 11 f0 	movb   $0x89,-0xfeedcbb(,%eax,8)
f010392b:	89 
f010392c:	0f b6 d2             	movzbl %dl,%edx
f010392f:	8d 04 d5 28 00 00 00 	lea    0x28(,%edx,8),%eax
f0103936:	e8 13 ff ff ff       	call   f010384e <ltr>
f010393b:	b8 ac 23 11 f0       	mov    $0xf01123ac,%eax
f0103940:	e8 05 ff ff ff       	call   f010384a <lidt>
f0103945:	83 c4 0c             	add    $0xc,%esp
f0103948:	5b                   	pop    %ebx
f0103949:	5e                   	pop    %esi
f010394a:	5f                   	pop    %edi
f010394b:	5d                   	pop    %ebp
f010394c:	c3                   	ret

f010394d <trap_init>:
f010394d:	55                   	push   %ebp
f010394e:	89 e5                	mov    %esp,%ebp
f0103950:	83 ec 08             	sub    $0x8,%esp
f0103953:	b8 dc 42 10 f0       	mov    $0xf01042dc,%eax
f0103958:	66 a3 80 92 18 f0    	mov    %ax,0xf0189280
f010395e:	66 c7 05 82 92 18 f0 	movw   $0x8,0xf0189282
f0103965:	08 00 
f0103967:	c6 05 84 92 18 f0 00 	movb   $0x0,0xf0189284
f010396e:	c6 05 85 92 18 f0 8e 	movb   $0x8e,0xf0189285
f0103975:	c1 e8 10             	shr    $0x10,%eax
f0103978:	66 a3 86 92 18 f0    	mov    %ax,0xf0189286
f010397e:	b8 e2 42 10 f0       	mov    $0xf01042e2,%eax
f0103983:	66 a3 88 92 18 f0    	mov    %ax,0xf0189288
f0103989:	66 c7 05 8a 92 18 f0 	movw   $0x8,0xf018928a
f0103990:	08 00 
f0103992:	c6 05 8c 92 18 f0 00 	movb   $0x0,0xf018928c
f0103999:	c6 05 8d 92 18 f0 8e 	movb   $0x8e,0xf018928d
f01039a0:	c1 e8 10             	shr    $0x10,%eax
f01039a3:	66 a3 8e 92 18 f0    	mov    %ax,0xf018928e
f01039a9:	b8 e8 42 10 f0       	mov    $0xf01042e8,%eax
f01039ae:	66 a3 90 92 18 f0    	mov    %ax,0xf0189290
f01039b4:	66 c7 05 92 92 18 f0 	movw   $0x8,0xf0189292
f01039bb:	08 00 
f01039bd:	c6 05 94 92 18 f0 00 	movb   $0x0,0xf0189294
f01039c4:	c6 05 95 92 18 f0 8e 	movb   $0x8e,0xf0189295
f01039cb:	c1 e8 10             	shr    $0x10,%eax
f01039ce:	66 a3 96 92 18 f0    	mov    %ax,0xf0189296
f01039d4:	b8 ee 42 10 f0       	mov    $0xf01042ee,%eax
f01039d9:	66 a3 98 92 18 f0    	mov    %ax,0xf0189298
f01039df:	66 c7 05 9a 92 18 f0 	movw   $0x8,0xf018929a
f01039e6:	08 00 
f01039e8:	c6 05 9c 92 18 f0 00 	movb   $0x0,0xf018929c
f01039ef:	c6 05 9d 92 18 f0 ee 	movb   $0xee,0xf018929d
f01039f6:	c1 e8 10             	shr    $0x10,%eax
f01039f9:	66 a3 9e 92 18 f0    	mov    %ax,0xf018929e
f01039ff:	b8 f4 42 10 f0       	mov    $0xf01042f4,%eax
f0103a04:	66 a3 a0 92 18 f0    	mov    %ax,0xf01892a0
f0103a0a:	66 c7 05 a2 92 18 f0 	movw   $0x8,0xf01892a2
f0103a11:	08 00 
f0103a13:	c6 05 a4 92 18 f0 00 	movb   $0x0,0xf01892a4
f0103a1a:	c6 05 a5 92 18 f0 8e 	movb   $0x8e,0xf01892a5
f0103a21:	c1 e8 10             	shr    $0x10,%eax
f0103a24:	66 a3 a6 92 18 f0    	mov    %ax,0xf01892a6
f0103a2a:	b8 fa 42 10 f0       	mov    $0xf01042fa,%eax
f0103a2f:	66 a3 a8 92 18 f0    	mov    %ax,0xf01892a8
f0103a35:	66 c7 05 aa 92 18 f0 	movw   $0x8,0xf01892aa
f0103a3c:	08 00 
f0103a3e:	c6 05 ac 92 18 f0 00 	movb   $0x0,0xf01892ac
f0103a45:	c6 05 ad 92 18 f0 8e 	movb   $0x8e,0xf01892ad
f0103a4c:	c1 e8 10             	shr    $0x10,%eax
f0103a4f:	66 a3 ae 92 18 f0    	mov    %ax,0xf01892ae
f0103a55:	b8 00 43 10 f0       	mov    $0xf0104300,%eax
f0103a5a:	66 a3 b0 92 18 f0    	mov    %ax,0xf01892b0
f0103a60:	66 c7 05 b2 92 18 f0 	movw   $0x8,0xf01892b2
f0103a67:	08 00 
f0103a69:	c6 05 b4 92 18 f0 00 	movb   $0x0,0xf01892b4
f0103a70:	c6 05 b5 92 18 f0 8e 	movb   $0x8e,0xf01892b5
f0103a77:	c1 e8 10             	shr    $0x10,%eax
f0103a7a:	66 a3 b6 92 18 f0    	mov    %ax,0xf01892b6
f0103a80:	b8 06 43 10 f0       	mov    $0xf0104306,%eax
f0103a85:	66 a3 b8 92 18 f0    	mov    %ax,0xf01892b8
f0103a8b:	66 c7 05 ba 92 18 f0 	movw   $0x8,0xf01892ba
f0103a92:	08 00 
f0103a94:	c6 05 bc 92 18 f0 00 	movb   $0x0,0xf01892bc
f0103a9b:	c6 05 bd 92 18 f0 8e 	movb   $0x8e,0xf01892bd
f0103aa2:	c1 e8 10             	shr    $0x10,%eax
f0103aa5:	66 a3 be 92 18 f0    	mov    %ax,0xf01892be
f0103aab:	b8 0c 43 10 f0       	mov    $0xf010430c,%eax
f0103ab0:	66 a3 c0 92 18 f0    	mov    %ax,0xf01892c0
f0103ab6:	66 c7 05 c2 92 18 f0 	movw   $0x8,0xf01892c2
f0103abd:	08 00 
f0103abf:	c6 05 c4 92 18 f0 00 	movb   $0x0,0xf01892c4
f0103ac6:	c6 05 c5 92 18 f0 8e 	movb   $0x8e,0xf01892c5
f0103acd:	c1 e8 10             	shr    $0x10,%eax
f0103ad0:	66 a3 c6 92 18 f0    	mov    %ax,0xf01892c6
f0103ad6:	b8 16 43 10 f0       	mov    $0xf0104316,%eax
f0103adb:	66 a3 d0 92 18 f0    	mov    %ax,0xf01892d0
f0103ae1:	66 c7 05 d2 92 18 f0 	movw   $0x8,0xf01892d2
f0103ae8:	08 00 
f0103aea:	c6 05 d4 92 18 f0 00 	movb   $0x0,0xf01892d4
f0103af1:	c6 05 d5 92 18 f0 8e 	movb   $0x8e,0xf01892d5
f0103af8:	c1 e8 10             	shr    $0x10,%eax
f0103afb:	66 a3 d6 92 18 f0    	mov    %ax,0xf01892d6
f0103b01:	b8 1a 43 10 f0       	mov    $0xf010431a,%eax
f0103b06:	66 a3 d8 92 18 f0    	mov    %ax,0xf01892d8
f0103b0c:	66 c7 05 da 92 18 f0 	movw   $0x8,0xf01892da
f0103b13:	08 00 
f0103b15:	c6 05 dc 92 18 f0 00 	movb   $0x0,0xf01892dc
f0103b1c:	c6 05 dd 92 18 f0 8e 	movb   $0x8e,0xf01892dd
f0103b23:	c1 e8 10             	shr    $0x10,%eax
f0103b26:	66 a3 de 92 18 f0    	mov    %ax,0xf01892de
f0103b2c:	b8 1e 43 10 f0       	mov    $0xf010431e,%eax
f0103b31:	66 a3 e0 92 18 f0    	mov    %ax,0xf01892e0
f0103b37:	66 c7 05 e2 92 18 f0 	movw   $0x8,0xf01892e2
f0103b3e:	08 00 
f0103b40:	c6 05 e4 92 18 f0 00 	movb   $0x0,0xf01892e4
f0103b47:	c6 05 e5 92 18 f0 8e 	movb   $0x8e,0xf01892e5
f0103b4e:	c1 e8 10             	shr    $0x10,%eax
f0103b51:	66 a3 e6 92 18 f0    	mov    %ax,0xf01892e6
f0103b57:	b8 22 43 10 f0       	mov    $0xf0104322,%eax
f0103b5c:	66 a3 e8 92 18 f0    	mov    %ax,0xf01892e8
f0103b62:	66 c7 05 ea 92 18 f0 	movw   $0x8,0xf01892ea
f0103b69:	08 00 
f0103b6b:	c6 05 ec 92 18 f0 00 	movb   $0x0,0xf01892ec
f0103b72:	c6 05 ed 92 18 f0 8e 	movb   $0x8e,0xf01892ed
f0103b79:	c1 e8 10             	shr    $0x10,%eax
f0103b7c:	66 a3 ee 92 18 f0    	mov    %ax,0xf01892ee
f0103b82:	b8 26 43 10 f0       	mov    $0xf0104326,%eax
f0103b87:	66 a3 f0 92 18 f0    	mov    %ax,0xf01892f0
f0103b8d:	66 c7 05 f2 92 18 f0 	movw   $0x8,0xf01892f2
f0103b94:	08 00 
f0103b96:	c6 05 f4 92 18 f0 00 	movb   $0x0,0xf01892f4
f0103b9d:	c6 05 f5 92 18 f0 8e 	movb   $0x8e,0xf01892f5
f0103ba4:	c1 e8 10             	shr    $0x10,%eax
f0103ba7:	66 a3 f6 92 18 f0    	mov    %ax,0xf01892f6
f0103bad:	b8 30 43 10 f0       	mov    $0xf0104330,%eax
f0103bb2:	66 a3 00 93 18 f0    	mov    %ax,0xf0189300
f0103bb8:	66 c7 05 02 93 18 f0 	movw   $0x8,0xf0189302
f0103bbf:	08 00 
f0103bc1:	c6 05 04 93 18 f0 00 	movb   $0x0,0xf0189304
f0103bc8:	c6 05 05 93 18 f0 8e 	movb   $0x8e,0xf0189305
f0103bcf:	c1 e8 10             	shr    $0x10,%eax
f0103bd2:	66 a3 06 93 18 f0    	mov    %ax,0xf0189306
f0103bd8:	b8 36 43 10 f0       	mov    $0xf0104336,%eax
f0103bdd:	66 a3 08 93 18 f0    	mov    %ax,0xf0189308
f0103be3:	66 c7 05 0a 93 18 f0 	movw   $0x8,0xf018930a
f0103bea:	08 00 
f0103bec:	c6 05 0c 93 18 f0 00 	movb   $0x0,0xf018930c
f0103bf3:	c6 05 0d 93 18 f0 8e 	movb   $0x8e,0xf018930d
f0103bfa:	c1 e8 10             	shr    $0x10,%eax
f0103bfd:	66 a3 0e 93 18 f0    	mov    %ax,0xf018930e
f0103c03:	b8 3a 43 10 f0       	mov    $0xf010433a,%eax
f0103c08:	66 a3 10 93 18 f0    	mov    %ax,0xf0189310
f0103c0e:	66 c7 05 12 93 18 f0 	movw   $0x8,0xf0189312
f0103c15:	08 00 
f0103c17:	c6 05 14 93 18 f0 00 	movb   $0x0,0xf0189314
f0103c1e:	c6 05 15 93 18 f0 8e 	movb   $0x8e,0xf0189315
f0103c25:	c1 e8 10             	shr    $0x10,%eax
f0103c28:	66 a3 16 93 18 f0    	mov    %ax,0xf0189316
f0103c2e:	b8 40 43 10 f0       	mov    $0xf0104340,%eax
f0103c33:	66 a3 18 93 18 f0    	mov    %ax,0xf0189318
f0103c39:	66 c7 05 1a 93 18 f0 	movw   $0x8,0xf018931a
f0103c40:	08 00 
f0103c42:	c6 05 1c 93 18 f0 00 	movb   $0x0,0xf018931c
f0103c49:	c6 05 1d 93 18 f0 8e 	movb   $0x8e,0xf018931d
f0103c50:	c1 e8 10             	shr    $0x10,%eax
f0103c53:	66 a3 1e 93 18 f0    	mov    %ax,0xf018931e
f0103c59:	b8 4c 43 10 f0       	mov    $0xf010434c,%eax
f0103c5e:	66 a3 00 94 18 f0    	mov    %ax,0xf0189400
f0103c64:	66 c7 05 02 94 18 f0 	movw   $0x8,0xf0189402
f0103c6b:	08 00 
f0103c6d:	c6 05 04 94 18 f0 00 	movb   $0x0,0xf0189404
f0103c74:	c6 05 05 94 18 f0 ee 	movb   $0xee,0xf0189405
f0103c7b:	c1 e8 10             	shr    $0x10,%eax
f0103c7e:	66 a3 06 94 18 f0    	mov    %ax,0xf0189406
f0103c84:	b8 46 43 10 f0       	mov    $0xf0104346,%eax
f0103c89:	66 a3 80 93 18 f0    	mov    %ax,0xf0189380
f0103c8f:	66 c7 05 82 93 18 f0 	movw   $0x8,0xf0189382
f0103c96:	08 00 
f0103c98:	c6 05 84 93 18 f0 00 	movb   $0x0,0xf0189384
f0103c9f:	c6 05 85 93 18 f0 8e 	movb   $0x8e,0xf0189385
f0103ca6:	c1 e8 10             	shr    $0x10,%eax
f0103ca9:	66 a3 86 93 18 f0    	mov    %ax,0xf0189386
f0103caf:	e8 f0 fb ff ff       	call   f01038a4 <trap_init_percpu>
f0103cb4:	c9                   	leave
f0103cb5:	c3                   	ret

f0103cb6 <print_regs>:
f0103cb6:	55                   	push   %ebp
f0103cb7:	89 e5                	mov    %esp,%ebp
f0103cb9:	53                   	push   %ebx
f0103cba:	83 ec 0c             	sub    $0xc,%esp
f0103cbd:	8b 5d 08             	mov    0x8(%ebp),%ebx
f0103cc0:	ff 33                	push   (%ebx)
f0103cc2:	68 9c 7d 10 f0       	push   $0xf0107d9c
f0103cc7:	e8 6a fb ff ff       	call   f0103836 <cprintf>
f0103ccc:	83 c4 08             	add    $0x8,%esp
f0103ccf:	ff 73 04             	push   0x4(%ebx)
f0103cd2:	68 ab 7d 10 f0       	push   $0xf0107dab
f0103cd7:	e8 5a fb ff ff       	call   f0103836 <cprintf>
f0103cdc:	83 c4 08             	add    $0x8,%esp
f0103cdf:	ff 73 08             	push   0x8(%ebx)
f0103ce2:	68 ba 7d 10 f0       	push   $0xf0107dba
f0103ce7:	e8 4a fb ff ff       	call   f0103836 <cprintf>
f0103cec:	83 c4 08             	add    $0x8,%esp
f0103cef:	ff 73 0c             	push   0xc(%ebx)
f0103cf2:	68 c9 7d 10 f0       	push   $0xf0107dc9
f0103cf7:	e8 3a fb ff ff       	call   f0103836 <cprintf>
f0103cfc:	83 c4 08             	add    $0x8,%esp
f0103cff:	ff 73 10             	push   0x10(%ebx)
f0103d02:	68 d8 7d 10 f0       	push   $0xf0107dd8
f0103d07:	e8 2a fb ff ff       	call   f0103836 <cprintf>
f0103d0c:	83 c4 08             	add    $0x8,%esp
f0103d0f:	ff 73 14             	push   0x14(%ebx)
f0103d12:	68 e7 7d 10 f0       	push   $0xf0107de7
f0103d17:	e8 1a fb ff ff       	call   f0103836 <cprintf>
f0103d1c:	83 c4 08             	add    $0x8,%esp
f0103d1f:	ff 73 18             	push   0x18(%ebx)
f0103d22:	68 f6 7d 10 f0       	push   $0xf0107df6
f0103d27:	e8 0a fb ff ff       	call   f0103836 <cprintf>
f0103d2c:	83 c4 08             	add    $0x8,%esp
f0103d2f:	ff 73 1c             	push   0x1c(%ebx)
f0103d32:	68 05 7e 10 f0       	push   $0xf0107e05
f0103d37:	e8 fa fa ff ff       	call   f0103836 <cprintf>
f0103d3c:	83 c4 10             	add    $0x10,%esp
f0103d3f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f0103d42:	c9                   	leave
f0103d43:	c3                   	ret

f0103d44 <print_trapframe>:
f0103d44:	55                   	push   %ebp
f0103d45:	89 e5                	mov    %esp,%ebp
f0103d47:	56                   	push   %esi
f0103d48:	53                   	push   %ebx
f0103d49:	8b 5d 08             	mov    0x8(%ebp),%ebx
f0103d4c:	e8 ab 25 00 00       	call   f01062fc <cpunum>
f0103d51:	83 ec 04             	sub    $0x4,%esp
f0103d54:	50                   	push   %eax
f0103d55:	53                   	push   %ebx
f0103d56:	68 3b 7e 10 f0       	push   $0xf0107e3b
f0103d5b:	e8 d6 fa ff ff       	call   f0103836 <cprintf>
f0103d60:	89 1c 24             	mov    %ebx,(%esp)
f0103d63:	e8 4e ff ff ff       	call   f0103cb6 <print_regs>
f0103d68:	83 c4 08             	add    $0x8,%esp
f0103d6b:	0f b7 43 20          	movzwl 0x20(%ebx),%eax
f0103d6f:	50                   	push   %eax
f0103d70:	68 59 7e 10 f0       	push   $0xf0107e59
f0103d75:	e8 bc fa ff ff       	call   f0103836 <cprintf>
f0103d7a:	83 c4 08             	add    $0x8,%esp
f0103d7d:	0f b7 43 24          	movzwl 0x24(%ebx),%eax
f0103d81:	50                   	push   %eax
f0103d82:	68 6c 7e 10 f0       	push   $0xf0107e6c
f0103d87:	e8 aa fa ff ff       	call   f0103836 <cprintf>
f0103d8c:	8b 73 28             	mov    0x28(%ebx),%esi
f0103d8f:	89 f0                	mov    %esi,%eax
f0103d91:	e8 cb fa ff ff       	call   f0103861 <trapname>
f0103d96:	83 c4 0c             	add    $0xc,%esp
f0103d99:	50                   	push   %eax
f0103d9a:	56                   	push   %esi
f0103d9b:	68 7f 7e 10 f0       	push   $0xf0107e7f
f0103da0:	e8 91 fa ff ff       	call   f0103836 <cprintf>
f0103da5:	83 c4 10             	add    $0x10,%esp
f0103da8:	39 1d 80 9a 18 f0    	cmp    %ebx,0xf0189a80
f0103dae:	0f 84 9f 00 00 00    	je     f0103e53 <print_trapframe+0x10f>
f0103db4:	83 ec 08             	sub    $0x8,%esp
f0103db7:	ff 73 2c             	push   0x2c(%ebx)
f0103dba:	68 a0 7e 10 f0       	push   $0xf0107ea0
f0103dbf:	e8 72 fa ff ff       	call   f0103836 <cprintf>
f0103dc4:	83 c4 10             	add    $0x10,%esp
f0103dc7:	83 7b 28 0e          	cmpl   $0xe,0x28(%ebx)
f0103dcb:	0f 85 a7 00 00 00    	jne    f0103e78 <print_trapframe+0x134>
f0103dd1:	8b 43 2c             	mov    0x2c(%ebx),%eax
f0103dd4:	a8 01                	test   $0x1,%al
f0103dd6:	b9 1f 7e 10 f0       	mov    $0xf0107e1f,%ecx
f0103ddb:	ba 14 7e 10 f0       	mov    $0xf0107e14,%edx
f0103de0:	0f 45 ca             	cmovne %edx,%ecx
f0103de3:	a8 02                	test   $0x2,%al
f0103de5:	ba 31 7e 10 f0       	mov    $0xf0107e31,%edx
f0103dea:	be 2b 7e 10 f0       	mov    $0xf0107e2b,%esi
f0103def:	0f 45 d6             	cmovne %esi,%edx
f0103df2:	a8 04                	test   $0x4,%al
f0103df4:	b8 66 7f 10 f0       	mov    $0xf0107f66,%eax
f0103df9:	be 36 7e 10 f0       	mov    $0xf0107e36,%esi
f0103dfe:	0f 45 c6             	cmovne %esi,%eax
f0103e01:	51                   	push   %ecx
f0103e02:	52                   	push   %edx
f0103e03:	50                   	push   %eax
f0103e04:	68 ae 7e 10 f0       	push   $0xf0107eae
f0103e09:	e8 28 fa ff ff       	call   f0103836 <cprintf>
f0103e0e:	83 c4 10             	add    $0x10,%esp
f0103e11:	83 ec 08             	sub    $0x8,%esp
f0103e14:	ff 73 30             	push   0x30(%ebx)
f0103e17:	68 bd 7e 10 f0       	push   $0xf0107ebd
f0103e1c:	e8 15 fa ff ff       	call   f0103836 <cprintf>
f0103e21:	83 c4 08             	add    $0x8,%esp
f0103e24:	0f b7 43 34          	movzwl 0x34(%ebx),%eax
f0103e28:	50                   	push   %eax
f0103e29:	68 cc 7e 10 f0       	push   $0xf0107ecc
f0103e2e:	e8 03 fa ff ff       	call   f0103836 <cprintf>
f0103e33:	83 c4 08             	add    $0x8,%esp
f0103e36:	ff 73 38             	push   0x38(%ebx)
f0103e39:	68 df 7e 10 f0       	push   $0xf0107edf
f0103e3e:	e8 f3 f9 ff ff       	call   f0103836 <cprintf>
f0103e43:	83 c4 10             	add    $0x10,%esp
f0103e46:	f6 43 34 03          	testb  $0x3,0x34(%ebx)
f0103e4a:	75 3e                	jne    f0103e8a <print_trapframe+0x146>
f0103e4c:	8d 65 f8             	lea    -0x8(%ebp),%esp
f0103e4f:	5b                   	pop    %ebx
f0103e50:	5e                   	pop    %esi
f0103e51:	5d                   	pop    %ebp
f0103e52:	c3                   	ret
f0103e53:	83 7b 28 0e          	cmpl   $0xe,0x28(%ebx)
f0103e57:	0f 85 57 ff ff ff    	jne    f0103db4 <print_trapframe+0x70>
f0103e5d:	e8 f0 f9 ff ff       	call   f0103852 <rcr2>
f0103e62:	83 ec 08             	sub    $0x8,%esp
f0103e65:	50                   	push   %eax
f0103e66:	68 91 7e 10 f0       	push   $0xf0107e91
f0103e6b:	e8 c6 f9 ff ff       	call   f0103836 <cprintf>
f0103e70:	83 c4 10             	add    $0x10,%esp
f0103e73:	e9 3c ff ff ff       	jmp    f0103db4 <print_trapframe+0x70>
f0103e78:	83 ec 0c             	sub    $0xc,%esp
f0103e7b:	68 ea 80 10 f0       	push   $0xf01080ea
f0103e80:	e8 b1 f9 ff ff       	call   f0103836 <cprintf>
f0103e85:	83 c4 10             	add    $0x10,%esp
f0103e88:	eb 87                	jmp    f0103e11 <print_trapframe+0xcd>
f0103e8a:	83 ec 08             	sub    $0x8,%esp
f0103e8d:	ff 73 3c             	push   0x3c(%ebx)
f0103e90:	68 ee 7e 10 f0       	push   $0xf0107eee
f0103e95:	e8 9c f9 ff ff       	call   f0103836 <cprintf>
f0103e9a:	83 c4 08             	add    $0x8,%esp
f0103e9d:	0f b7 43 40          	movzwl 0x40(%ebx),%eax
f0103ea1:	50                   	push   %eax
f0103ea2:	68 fd 7e 10 f0       	push   $0xf0107efd
f0103ea7:	e8 8a f9 ff ff       	call   f0103836 <cprintf>
f0103eac:	83 c4 10             	add    $0x10,%esp
f0103eaf:	eb 9b                	jmp    f0103e4c <print_trapframe+0x108>

f0103eb1 <page_fault_handler>:
f0103eb1:	55                   	push   %ebp
f0103eb2:	89 e5                	mov    %esp,%ebp
f0103eb4:	57                   	push   %edi
f0103eb5:	56                   	push   %esi
f0103eb6:	53                   	push   %ebx
f0103eb7:	83 ec 3c             	sub    $0x3c,%esp
f0103eba:	8b 5d 08             	mov    0x8(%ebp),%ebx
f0103ebd:	e8 90 f9 ff ff       	call   f0103852 <rcr2>
f0103ec2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f0103ec5:	f6 43 34 03          	testb  $0x3,0x34(%ebx)
f0103ec9:	0f 84 1d 01 00 00    	je     f0103fec <page_fault_handler+0x13b>
f0103ecf:	e8 28 24 00 00       	call   f01062fc <cpunum>
f0103ed4:	6b c0 74             	imul   $0x74,%eax,%eax
f0103ed7:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f0103edd:	83 78 64 00          	cmpl   $0x0,0x64(%eax)
f0103ee1:	0f 84 8d 01 00 00    	je     f0104074 <page_fault_handler+0x1c3>
f0103ee7:	e8 10 24 00 00       	call   f01062fc <cpunum>
f0103eec:	6a 06                	push   $0x6
f0103eee:	68 00 10 00 00       	push   $0x1000
f0103ef3:	68 00 f0 bf ee       	push   $0xeebff000
f0103ef8:	6b c0 74             	imul   $0x74,%eax,%eax
f0103efb:	ff b0 28 d0 1c f0    	push   -0xfe32fd8(%eax)
f0103f01:	e8 a6 ee ff ff       	call   f0102dac <user_mem_assert>
f0103f06:	8b 7b 2c             	mov    0x2c(%ebx),%edi
f0103f09:	8b 03                	mov    (%ebx),%eax
f0103f0b:	89 45 dc             	mov    %eax,-0x24(%ebp)
f0103f0e:	8b 43 04             	mov    0x4(%ebx),%eax
f0103f11:	89 45 d8             	mov    %eax,-0x28(%ebp)
f0103f14:	8b 43 08             	mov    0x8(%ebx),%eax
f0103f17:	89 45 d4             	mov    %eax,-0x2c(%ebp)
f0103f1a:	8b 43 0c             	mov    0xc(%ebx),%eax
f0103f1d:	89 45 d0             	mov    %eax,-0x30(%ebp)
f0103f20:	8b 43 10             	mov    0x10(%ebx),%eax
f0103f23:	89 45 cc             	mov    %eax,-0x34(%ebp)
f0103f26:	8b 43 14             	mov    0x14(%ebx),%eax
f0103f29:	89 45 c8             	mov    %eax,-0x38(%ebp)
f0103f2c:	8b 43 18             	mov    0x18(%ebx),%eax
f0103f2f:	89 45 c4             	mov    %eax,-0x3c(%ebp)
f0103f32:	8b 43 1c             	mov    0x1c(%ebx),%eax
f0103f35:	89 45 c0             	mov    %eax,-0x40(%ebp)
f0103f38:	8b 43 30             	mov    0x30(%ebx),%eax
f0103f3b:	89 45 e0             	mov    %eax,-0x20(%ebp)
f0103f3e:	8b 73 38             	mov    0x38(%ebx),%esi
f0103f41:	8b 53 3c             	mov    0x3c(%ebx),%edx
f0103f44:	8d 82 00 10 40 11    	lea    0x11401000(%edx),%eax
f0103f4a:	83 c4 10             	add    $0x10,%esp
f0103f4d:	3d ff 0f 00 00       	cmp    $0xfff,%eax
f0103f52:	0f 86 ab 00 00 00    	jbe    f0104003 <page_fault_handler+0x152>
f0103f58:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f0103f5b:	a3 cb ff bf ee       	mov    %eax,0xeebfffcb
f0103f60:	89 3d cf ff bf ee    	mov    %edi,0xeebfffcf
f0103f66:	8b 45 dc             	mov    -0x24(%ebp),%eax
f0103f69:	a3 d3 ff bf ee       	mov    %eax,0xeebfffd3
f0103f6e:	8b 45 d8             	mov    -0x28(%ebp),%eax
f0103f71:	a3 d7 ff bf ee       	mov    %eax,0xeebfffd7
f0103f76:	8b 45 d4             	mov    -0x2c(%ebp),%eax
f0103f79:	a3 db ff bf ee       	mov    %eax,0xeebfffdb
f0103f7e:	8b 45 d0             	mov    -0x30(%ebp),%eax
f0103f81:	a3 df ff bf ee       	mov    %eax,0xeebfffdf
f0103f86:	8b 45 cc             	mov    -0x34(%ebp),%eax
f0103f89:	a3 e3 ff bf ee       	mov    %eax,0xeebfffe3
f0103f8e:	8b 45 c8             	mov    -0x38(%ebp),%eax
f0103f91:	a3 e7 ff bf ee       	mov    %eax,0xeebfffe7
f0103f96:	8b 45 c4             	mov    -0x3c(%ebp),%eax
f0103f99:	a3 eb ff bf ee       	mov    %eax,0xeebfffeb
f0103f9e:	8b 45 c0             	mov    -0x40(%ebp),%eax
f0103fa1:	a3 ef ff bf ee       	mov    %eax,0xeebfffef
f0103fa6:	8b 45 e0             	mov    -0x20(%ebp),%eax
f0103fa9:	a3 f3 ff bf ee       	mov    %eax,0xeebffff3
f0103fae:	89 35 f7 ff bf ee    	mov    %esi,0xeebffff7
f0103fb4:	89 15 fb ff bf ee    	mov    %edx,0xeebffffb
f0103fba:	b8 cb ff bf ee       	mov    $0xeebfffcb,%eax
f0103fbf:	89 43 3c             	mov    %eax,0x3c(%ebx)
f0103fc2:	e8 35 23 00 00       	call   f01062fc <cpunum>
f0103fc7:	6b c0 74             	imul   $0x74,%eax,%eax
f0103fca:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f0103fd0:	8b 40 64             	mov    0x64(%eax),%eax
f0103fd3:	89 43 30             	mov    %eax,0x30(%ebx)
f0103fd6:	e8 21 23 00 00       	call   f01062fc <cpunum>
f0103fdb:	83 ec 0c             	sub    $0xc,%esp
f0103fde:	6b c0 74             	imul   $0x74,%eax,%eax
f0103fe1:	ff b0 28 d0 1c f0    	push   -0xfe32fd8(%eax)
f0103fe7:	e8 5f f5 ff ff       	call   f010354b <env_run>
f0103fec:	83 ec 04             	sub    $0x4,%esp
f0103fef:	68 10 7f 10 f0       	push   $0xf0107f10
f0103ff4:	68 3a 01 00 00       	push   $0x13a
f0103ff9:	68 2b 7f 10 f0       	push   $0xf0107f2b
f0103ffe:	e8 67 c0 ff ff       	call   f010006a <_panic>
f0104003:	c7 42 fc 00 00 00 00 	movl   $0x0,-0x4(%edx)
f010400a:	8d 42 c8             	lea    -0x38(%edx),%eax
f010400d:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
f0104010:	89 4a c8             	mov    %ecx,-0x38(%edx)
f0104013:	89 78 04             	mov    %edi,0x4(%eax)
f0104016:	8b 7d dc             	mov    -0x24(%ebp),%edi
f0104019:	89 78 08             	mov    %edi,0x8(%eax)
f010401c:	8b 4d d8             	mov    -0x28(%ebp),%ecx
f010401f:	89 48 0c             	mov    %ecx,0xc(%eax)
f0104022:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
f0104025:	89 48 10             	mov    %ecx,0x10(%eax)
f0104028:	8b 7d d0             	mov    -0x30(%ebp),%edi
f010402b:	89 78 14             	mov    %edi,0x14(%eax)
f010402e:	8b 4d cc             	mov    -0x34(%ebp),%ecx
f0104031:	89 48 18             	mov    %ecx,0x18(%eax)
f0104034:	8b 7d c8             	mov    -0x38(%ebp),%edi
f0104037:	89 78 1c             	mov    %edi,0x1c(%eax)
f010403a:	8b 4d c4             	mov    -0x3c(%ebp),%ecx
f010403d:	89 48 20             	mov    %ecx,0x20(%eax)
f0104040:	8b 7d c0             	mov    -0x40(%ebp),%edi
f0104043:	89 78 24             	mov    %edi,0x24(%eax)
f0104046:	8b 4d e0             	mov    -0x20(%ebp),%ecx
f0104049:	89 48 28             	mov    %ecx,0x28(%eax)
f010404c:	89 70 2c             	mov    %esi,0x2c(%eax)
f010404f:	89 50 30             	mov    %edx,0x30(%eax)
f0104052:	3d ff ef bf ee       	cmp    $0xeebfefff,%eax
f0104057:	0f 87 62 ff ff ff    	ja     f0103fbf <page_fault_handler+0x10e>
f010405d:	83 ec 04             	sub    $0x4,%esp
f0104060:	68 d4 75 10 f0       	push   $0xf01075d4
f0104065:	68 75 01 00 00       	push   $0x175
f010406a:	68 2b 7f 10 f0       	push   $0xf0107f2b
f010406f:	e8 f6 bf ff ff       	call   f010006a <_panic>
f0104074:	8b 7b 30             	mov    0x30(%ebx),%edi
f0104077:	e8 80 22 00 00       	call   f01062fc <cpunum>
f010407c:	57                   	push   %edi
f010407d:	ff 75 e4             	push   -0x1c(%ebp)
f0104080:	6b c0 74             	imul   $0x74,%eax,%eax
f0104083:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f0104089:	ff 70 48             	push   0x48(%eax)
f010408c:	68 04 76 10 f0       	push   $0xf0107604
f0104091:	e8 a0 f7 ff ff       	call   f0103836 <cprintf>
f0104096:	89 1c 24             	mov    %ebx,(%esp)
f0104099:	e8 a6 fc ff ff       	call   f0103d44 <print_trapframe>
f010409e:	e8 59 22 00 00       	call   f01062fc <cpunum>
f01040a3:	83 c4 04             	add    $0x4,%esp
f01040a6:	6b c0 74             	imul   $0x74,%eax,%eax
f01040a9:	ff b0 28 d0 1c f0    	push   -0xfe32fd8(%eax)
f01040af:	e8 14 f4 ff ff       	call   f01034c8 <env_destroy>
f01040b4:	8d 65 f4             	lea    -0xc(%ebp),%esp
f01040b7:	5b                   	pop    %ebx
f01040b8:	5e                   	pop    %esi
f01040b9:	5f                   	pop    %edi
f01040ba:	5d                   	pop    %ebp
f01040bb:	c3                   	ret

f01040bc <trap_dispatch>:
f01040bc:	55                   	push   %ebp
f01040bd:	89 e5                	mov    %esp,%ebp
f01040bf:	53                   	push   %ebx
f01040c0:	83 ec 04             	sub    $0x4,%esp
f01040c3:	89 c3                	mov    %eax,%ebx
f01040c5:	8b 40 28             	mov    0x28(%eax),%eax
f01040c8:	83 f8 0e             	cmp    $0xe,%eax
f01040cb:	74 1b                	je     f01040e8 <trap_dispatch+0x2c>
f01040cd:	83 f8 30             	cmp    $0x30,%eax
f01040d0:	74 24                	je     f01040f6 <trap_dispatch+0x3a>
f01040d2:	83 f8 03             	cmp    $0x3,%eax
f01040d5:	75 40                	jne    f0104117 <trap_dispatch+0x5b>
f01040d7:	83 ec 0c             	sub    $0xc,%esp
f01040da:	53                   	push   %ebx
f01040db:	e8 1a ca ff ff       	call   f0100afa <monitor>
f01040e0:	83 c4 10             	add    $0x10,%esp
f01040e3:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f01040e6:	c9                   	leave
f01040e7:	c3                   	ret
f01040e8:	83 ec 0c             	sub    $0xc,%esp
f01040eb:	53                   	push   %ebx
f01040ec:	e8 c0 fd ff ff       	call   f0103eb1 <page_fault_handler>
f01040f1:	83 c4 10             	add    $0x10,%esp
f01040f4:	eb ed                	jmp    f01040e3 <trap_dispatch+0x27>
f01040f6:	83 ec 08             	sub    $0x8,%esp
f01040f9:	ff 73 04             	push   0x4(%ebx)
f01040fc:	ff 33                	push   (%ebx)
f01040fe:	ff 73 10             	push   0x10(%ebx)
f0104101:	ff 73 18             	push   0x18(%ebx)
f0104104:	ff 73 14             	push   0x14(%ebx)
f0104107:	ff 73 1c             	push   0x1c(%ebx)
f010410a:	e8 5a 0f 00 00       	call   f0105069 <syscall>
f010410f:	89 43 1c             	mov    %eax,0x1c(%ebx)
f0104112:	83 c4 20             	add    $0x20,%esp
f0104115:	eb cc                	jmp    f01040e3 <trap_dispatch+0x27>
f0104117:	83 f8 27             	cmp    $0x27,%eax
f010411a:	74 33                	je     f010414f <trap_dispatch+0x93>
f010411c:	83 f8 20             	cmp    $0x20,%eax
f010411f:	74 4b                	je     f010416c <trap_dispatch+0xb0>
f0104121:	83 ec 0c             	sub    $0xc,%esp
f0104124:	53                   	push   %ebx
f0104125:	e8 1a fc ff ff       	call   f0103d44 <print_trapframe>
f010412a:	83 c4 10             	add    $0x10,%esp
f010412d:	66 83 7b 34 08       	cmpw   $0x8,0x34(%ebx)
f0104132:	74 42                	je     f0104176 <trap_dispatch+0xba>
f0104134:	e8 c3 21 00 00       	call   f01062fc <cpunum>
f0104139:	83 ec 0c             	sub    $0xc,%esp
f010413c:	6b c0 74             	imul   $0x74,%eax,%eax
f010413f:	ff b0 28 d0 1c f0    	push   -0xfe32fd8(%eax)
f0104145:	e8 7e f3 ff ff       	call   f01034c8 <env_destroy>
f010414a:	83 c4 10             	add    $0x10,%esp
f010414d:	eb 94                	jmp    f01040e3 <trap_dispatch+0x27>
f010414f:	83 ec 0c             	sub    $0xc,%esp
f0104152:	68 37 7f 10 f0       	push   $0xf0107f37
f0104157:	e8 da f6 ff ff       	call   f0103836 <cprintf>
f010415c:	89 1c 24             	mov    %ebx,(%esp)
f010415f:	e8 e0 fb ff ff       	call   f0103d44 <print_trapframe>
f0104164:	83 c4 10             	add    $0x10,%esp
f0104167:	e9 77 ff ff ff       	jmp    f01040e3 <trap_dispatch+0x27>
f010416c:	e8 d2 22 00 00       	call   f0106443 <lapic_eoi>
f0104171:	e8 60 07 00 00       	call   f01048d6 <sched_yield>
f0104176:	83 ec 04             	sub    $0x4,%esp
f0104179:	68 54 7f 10 f0       	push   $0xf0107f54
f010417e:	68 ed 00 00 00       	push   $0xed
f0104183:	68 2b 7f 10 f0       	push   $0xf0107f2b
f0104188:	e8 dd be ff ff       	call   f010006a <_panic>

f010418d <trap>:
f010418d:	55                   	push   %ebp
f010418e:	89 e5                	mov    %esp,%ebp
f0104190:	57                   	push   %edi
f0104191:	56                   	push   %esi
f0104192:	8b 75 08             	mov    0x8(%ebp),%esi
f0104195:	fc                   	cld
f0104196:	83 3d 00 90 18 f0 00 	cmpl   $0x0,0xf0189000
f010419d:	74 01                	je     f01041a0 <trap+0x13>
f010419f:	f4                   	hlt
f01041a0:	e8 57 21 00 00       	call   f01062fc <cpunum>
f01041a5:	6b c0 74             	imul   $0x74,%eax,%eax
f01041a8:	05 24 d0 1c f0       	add    $0xf01cd024,%eax
f01041ad:	ba 01 00 00 00       	mov    $0x1,%edx
f01041b2:	e8 a2 f6 ff ff       	call   f0103859 <xchg>
f01041b7:	83 f8 02             	cmp    $0x2,%eax
f01041ba:	74 4f                	je     f010420b <trap+0x7e>
f01041bc:	e8 95 f6 ff ff       	call   f0103856 <read_eflags>
f01041c1:	f6 c4 02             	test   $0x2,%ah
f01041c4:	75 4c                	jne    f0104212 <trap+0x85>
f01041c6:	0f b7 46 34          	movzwl 0x34(%esi),%eax
f01041ca:	f7 d0                	not    %eax
f01041cc:	a8 03                	test   $0x3,%al
f01041ce:	74 5b                	je     f010422b <trap+0x9e>
f01041d0:	89 35 80 9a 18 f0    	mov    %esi,0xf0189a80
f01041d6:	89 f0                	mov    %esi,%eax
f01041d8:	e8 df fe ff ff       	call   f01040bc <trap_dispatch>
f01041dd:	e8 1a 21 00 00       	call   f01062fc <cpunum>
f01041e2:	6b c0 74             	imul   $0x74,%eax,%eax
f01041e5:	83 b8 28 d0 1c f0 00 	cmpl   $0x0,-0xfe32fd8(%eax)
f01041ec:	74 18                	je     f0104206 <trap+0x79>
f01041ee:	e8 09 21 00 00       	call   f01062fc <cpunum>
f01041f3:	6b c0 74             	imul   $0x74,%eax,%eax
f01041f6:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f01041fc:	83 78 54 03          	cmpl   $0x3,0x54(%eax)
f0104200:	0f 84 bf 00 00 00    	je     f01042c5 <trap+0x138>
f0104206:	e8 cb 06 00 00       	call   f01048d6 <sched_yield>
f010420b:	e8 7f f6 ff ff       	call   f010388f <lock_kernel>
f0104210:	eb aa                	jmp    f01041bc <trap+0x2f>
f0104212:	68 6d 7f 10 f0       	push   $0xf0107f6d
f0104217:	68 34 7a 10 f0       	push   $0xf0107a34
f010421c:	68 07 01 00 00       	push   $0x107
f0104221:	68 2b 7f 10 f0       	push   $0xf0107f2b
f0104226:	e8 3f be ff ff       	call   f010006a <_panic>
f010422b:	e8 5f f6 ff ff       	call   f010388f <lock_kernel>
f0104230:	e8 c7 20 00 00       	call   f01062fc <cpunum>
f0104235:	6b c0 74             	imul   $0x74,%eax,%eax
f0104238:	83 b8 28 d0 1c f0 00 	cmpl   $0x0,-0xfe32fd8(%eax)
f010423f:	74 3e                	je     f010427f <trap+0xf2>
f0104241:	e8 b6 20 00 00       	call   f01062fc <cpunum>
f0104246:	6b c0 74             	imul   $0x74,%eax,%eax
f0104249:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f010424f:	83 78 54 01          	cmpl   $0x1,0x54(%eax)
f0104253:	74 43                	je     f0104298 <trap+0x10b>
f0104255:	e8 a2 20 00 00       	call   f01062fc <cpunum>
f010425a:	6b c0 74             	imul   $0x74,%eax,%eax
f010425d:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f0104263:	b9 11 00 00 00       	mov    $0x11,%ecx
f0104268:	89 c7                	mov    %eax,%edi
f010426a:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
f010426c:	e8 8b 20 00 00       	call   f01062fc <cpunum>
f0104271:	6b c0 74             	imul   $0x74,%eax,%eax
f0104274:	8b b0 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%esi
f010427a:	e9 51 ff ff ff       	jmp    f01041d0 <trap+0x43>
f010427f:	68 86 7f 10 f0       	push   $0xf0107f86
f0104284:	68 34 7a 10 f0       	push   $0xf0107a34
f0104289:	68 0e 01 00 00       	push   $0x10e
f010428e:	68 2b 7f 10 f0       	push   $0xf0107f2b
f0104293:	e8 d2 bd ff ff       	call   f010006a <_panic>
f0104298:	e8 5f 20 00 00       	call   f01062fc <cpunum>
f010429d:	83 ec 0c             	sub    $0xc,%esp
f01042a0:	6b c0 74             	imul   $0x74,%eax,%eax
f01042a3:	ff b0 28 d0 1c f0    	push   -0xfe32fd8(%eax)
f01042a9:	e8 c0 f0 ff ff       	call   f010336e <env_free>
f01042ae:	e8 49 20 00 00       	call   f01062fc <cpunum>
f01042b3:	6b c0 74             	imul   $0x74,%eax,%eax
f01042b6:	c7 80 28 d0 1c f0 00 	movl   $0x0,-0xfe32fd8(%eax)
f01042bd:	00 00 00 
f01042c0:	e8 11 06 00 00       	call   f01048d6 <sched_yield>
f01042c5:	e8 32 20 00 00       	call   f01062fc <cpunum>
f01042ca:	83 ec 0c             	sub    $0xc,%esp
f01042cd:	6b c0 74             	imul   $0x74,%eax,%eax
f01042d0:	ff b0 28 d0 1c f0    	push   -0xfe32fd8(%eax)
f01042d6:	e8 70 f2 ff ff       	call   f010354b <env_run>
f01042db:	90                   	nop

f01042dc <trap0>:
f01042dc:	6a 00                	push   $0x0
f01042de:	6a 00                	push   $0x0
f01042e0:	eb 70                	jmp    f0104352 <_alltraps>

f01042e2 <trap1>:
f01042e2:	6a 00                	push   $0x0
f01042e4:	6a 01                	push   $0x1
f01042e6:	eb 6a                	jmp    f0104352 <_alltraps>

f01042e8 <trap2>:
f01042e8:	6a 00                	push   $0x0
f01042ea:	6a 02                	push   $0x2
f01042ec:	eb 64                	jmp    f0104352 <_alltraps>

f01042ee <trap3>:
f01042ee:	6a 00                	push   $0x0
f01042f0:	6a 03                	push   $0x3
f01042f2:	eb 5e                	jmp    f0104352 <_alltraps>

f01042f4 <trap4>:
f01042f4:	6a 00                	push   $0x0
f01042f6:	6a 04                	push   $0x4
f01042f8:	eb 58                	jmp    f0104352 <_alltraps>

f01042fa <trap5>:
f01042fa:	6a 00                	push   $0x0
f01042fc:	6a 05                	push   $0x5
f01042fe:	eb 52                	jmp    f0104352 <_alltraps>

f0104300 <trap6>:
f0104300:	6a 00                	push   $0x0
f0104302:	6a 06                	push   $0x6
f0104304:	eb 4c                	jmp    f0104352 <_alltraps>

f0104306 <trap7>:
f0104306:	6a 00                	push   $0x0
f0104308:	6a 07                	push   $0x7
f010430a:	eb 46                	jmp    f0104352 <_alltraps>

f010430c <trap8>:
f010430c:	6a 08                	push   $0x8
f010430e:	eb 42                	jmp    f0104352 <_alltraps>

f0104310 <trap9>:
f0104310:	6a 00                	push   $0x0
f0104312:	6a 09                	push   $0x9
f0104314:	eb 3c                	jmp    f0104352 <_alltraps>

f0104316 <trap10>:
f0104316:	6a 0a                	push   $0xa
f0104318:	eb 38                	jmp    f0104352 <_alltraps>

f010431a <trap11>:
f010431a:	6a 0b                	push   $0xb
f010431c:	eb 34                	jmp    f0104352 <_alltraps>

f010431e <trap12>:
f010431e:	6a 0c                	push   $0xc
f0104320:	eb 30                	jmp    f0104352 <_alltraps>

f0104322 <trap13>:
f0104322:	6a 0d                	push   $0xd
f0104324:	eb 2c                	jmp    f0104352 <_alltraps>

f0104326 <trap14>:
f0104326:	6a 0e                	push   $0xe
f0104328:	eb 28                	jmp    f0104352 <_alltraps>

f010432a <trap15>:
f010432a:	6a 00                	push   $0x0
f010432c:	6a 0f                	push   $0xf
f010432e:	eb 22                	jmp    f0104352 <_alltraps>

f0104330 <trap16>:
f0104330:	6a 00                	push   $0x0
f0104332:	6a 10                	push   $0x10
f0104334:	eb 1c                	jmp    f0104352 <_alltraps>

f0104336 <trap17>:
f0104336:	6a 11                	push   $0x11
f0104338:	eb 18                	jmp    f0104352 <_alltraps>

f010433a <trap18>:
f010433a:	6a 00                	push   $0x0
f010433c:	6a 12                	push   $0x12
f010433e:	eb 12                	jmp    f0104352 <_alltraps>

f0104340 <trap19>:
f0104340:	6a 00                	push   $0x0
f0104342:	6a 13                	push   $0x13
f0104344:	eb 0c                	jmp    f0104352 <_alltraps>

f0104346 <trap32>:
f0104346:	6a 00                	push   $0x0
f0104348:	6a 20                	push   $0x20
f010434a:	eb 06                	jmp    f0104352 <_alltraps>

f010434c <trap48>:
f010434c:	6a 00                	push   $0x0
f010434e:	6a 30                	push   $0x30
f0104350:	eb 00                	jmp    f0104352 <_alltraps>

f0104352 <_alltraps>:
f0104352:	1e                   	push   %ds
f0104353:	06                   	push   %es
f0104354:	60                   	pusha
f0104355:	54                   	push   %esp
f0104356:	e8 32 fe ff ff       	call   f010418d <trap>

f010435b <context_switch>:
f010435b:	83 c4 04             	add    $0x4,%esp
f010435e:	8b 24 24             	mov    (%esp),%esp
f0104361:	61                   	popa
f0104362:	07                   	pop    %es
f0104363:	1f                   	pop    %ds
f0104364:	83 c4 08             	add    $0x8,%esp
f0104367:	cf                   	iret

f0104368 <spin>:
f0104368:	eb fe                	jmp    f0104368 <spin>

f010436a <lcr3>:
f010436a:	0f 22 d8             	mov    %eax,%cr3
f010436d:	c3                   	ret

f010436e <xchg>:
f010436e:	89 c1                	mov    %eax,%ecx
f0104370:	89 d0                	mov    %edx,%eax
f0104372:	f0 87 01             	lock xchg %eax,(%ecx)
f0104375:	c3                   	ret

f0104376 <_paddr>:
f0104376:	81 f9 ff ff ff ef    	cmp    $0xefffffff,%ecx
f010437c:	76 07                	jbe    f0104385 <_paddr+0xf>
f010437e:	8d 81 00 00 00 10    	lea    0x10000000(%ecx),%eax
f0104384:	c3                   	ret
f0104385:	55                   	push   %ebp
f0104386:	89 e5                	mov    %esp,%ebp
f0104388:	83 ec 08             	sub    $0x8,%esp
f010438b:	51                   	push   %ecx
f010438c:	68 f0 69 10 f0       	push   $0xf01069f0
f0104391:	52                   	push   %edx
f0104392:	50                   	push   %eax
f0104393:	e8 d2 bc ff ff       	call   f010006a <_panic>

f0104398 <unlock_kernel>:
f0104398:	55                   	push   %ebp
f0104399:	89 e5                	mov    %esp,%ebp
f010439b:	83 ec 14             	sub    $0x14,%esp
f010439e:	68 c0 23 11 f0       	push   $0xf01123c0
f01043a3:	e8 ae 22 00 00       	call   f0106656 <spin_unlock>
f01043a8:	f3 90                	pause
f01043aa:	83 c4 10             	add    $0x10,%esp
f01043ad:	c9                   	leave
f01043ae:	c3                   	ret

f01043af <get_queue>:
f01043af:	55                   	push   %ebp
f01043b0:	89 e5                	mov    %esp,%ebp
f01043b2:	8b 55 08             	mov    0x8(%ebp),%edx
f01043b5:	85 d2                	test   %edx,%edx
f01043b7:	78 19                	js     f01043d2 <get_queue+0x23>
f01043b9:	b8 a0 9a 18 f0       	mov    $0xf0189aa0,%eax
f01043be:	74 10                	je     f01043d0 <get_queue+0x21>
f01043c0:	83 fa 01             	cmp    $0x1,%edx
f01043c3:	b8 a8 aa 18 f0       	mov    $0xf018aaa8,%eax
f01043c8:	ba b0 ba 18 f0       	mov    $0xf018bab0,%edx
f01043cd:	0f 45 c2             	cmovne %edx,%eax
f01043d0:	5d                   	pop    %ebp
f01043d1:	c3                   	ret
f01043d2:	b8 00 00 00 00       	mov    $0x0,%eax
f01043d7:	eb f7                	jmp    f01043d0 <get_queue+0x21>

f01043d9 <sched_push_queue>:
f01043d9:	55                   	push   %ebp
f01043da:	89 e5                	mov    %esp,%ebp
f01043dc:	56                   	push   %esi
f01043dd:	53                   	push   %ebx
f01043de:	8b 5d 08             	mov    0x8(%ebp),%ebx
f01043e1:	83 ec 0c             	sub    $0xc,%esp
f01043e4:	89 d8                	mov    %ebx,%eax
f01043e6:	25 ff 03 00 00       	and    $0x3ff,%eax
f01043eb:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
f01043f1:	03 05 70 92 18 f0    	add    0xf0189270,%eax
f01043f7:	ff 70 7c             	push   0x7c(%eax)
f01043fa:	e8 b0 ff ff ff       	call   f01043af <get_queue>
f01043ff:	83 c4 10             	add    $0x10,%esp
f0104402:	8b 90 00 10 00 00    	mov    0x1000(%eax),%edx
f0104408:	89 d6                	mov    %edx,%esi
f010440a:	c1 fe 1f             	sar    $0x1f,%esi
f010440d:	c1 ee 16             	shr    $0x16,%esi
f0104410:	8d 0c 32             	lea    (%edx,%esi,1),%ecx
f0104413:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
f0104419:	29 f1                	sub    %esi,%ecx
f010441b:	89 1c 88             	mov    %ebx,(%eax,%ecx,4)
f010441e:	83 c2 01             	add    $0x1,%edx
f0104421:	89 90 00 10 00 00    	mov    %edx,0x1000(%eax)
f0104427:	83 05 bc ca 18 f0 01 	addl   $0x1,0xf018cabc
f010442e:	8d 65 f8             	lea    -0x8(%ebp),%esp
f0104431:	5b                   	pop    %ebx
f0104432:	5e                   	pop    %esi
f0104433:	5d                   	pop    %ebp
f0104434:	c3                   	ret

f0104435 <sched_remove_env>:
f0104435:	55                   	push   %ebp
f0104436:	89 e5                	mov    %esp,%ebp
f0104438:	57                   	push   %edi
f0104439:	56                   	push   %esi
f010443a:	53                   	push   %ebx
f010443b:	8b 55 08             	mov    0x8(%ebp),%edx
f010443e:	8b 75 0c             	mov    0xc(%ebp),%esi
f0104441:	8b 82 04 10 00 00    	mov    0x1004(%edx),%eax
f0104447:	39 f0                	cmp    %esi,%eax
f0104449:	74 2d                	je     f0104478 <sched_remove_env+0x43>
f010444b:	89 c3                	mov    %eax,%ebx
f010444d:	c1 fb 1f             	sar    $0x1f,%ebx
f0104450:	c1 eb 16             	shr    $0x16,%ebx
f0104453:	8d 0c 18             	lea    (%eax,%ebx,1),%ecx
f0104456:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
f010445c:	29 d9                	sub    %ebx,%ecx
f010445e:	8b 1c 8a             	mov    (%edx,%ecx,4),%ebx
f0104461:	8b 3c b2             	mov    (%edx,%esi,4),%edi
f0104464:	89 3c 8a             	mov    %edi,(%edx,%ecx,4)
f0104467:	89 1c b2             	mov    %ebx,(%edx,%esi,4)
f010446a:	83 c0 01             	add    $0x1,%eax
f010446d:	89 82 04 10 00 00    	mov    %eax,0x1004(%edx)
f0104473:	5b                   	pop    %ebx
f0104474:	5e                   	pop    %esi
f0104475:	5f                   	pop    %edi
f0104476:	5d                   	pop    %ebp
f0104477:	c3                   	ret
f0104478:	8d 46 01             	lea    0x1(%esi),%eax
f010447b:	eb f0                	jmp    f010446d <sched_remove_env+0x38>

f010447d <sched_destroy_env>:
f010447d:	55                   	push   %ebp
f010447e:	89 e5                	mov    %esp,%ebp
f0104480:	57                   	push   %edi
f0104481:	56                   	push   %esi
f0104482:	53                   	push   %ebx
f0104483:	83 ec 18             	sub    $0x18,%esp
f0104486:	8b 5d 08             	mov    0x8(%ebp),%ebx
f0104489:	89 d8                	mov    %ebx,%eax
f010448b:	25 ff 03 00 00       	and    $0x3ff,%eax
f0104490:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
f0104496:	03 05 70 92 18 f0    	add    0xf0189270,%eax
f010449c:	ff 70 7c             	push   0x7c(%eax)
f010449f:	e8 0b ff ff ff       	call   f01043af <get_queue>
f01044a4:	83 c4 10             	add    $0x10,%esp
f01044a7:	89 c6                	mov    %eax,%esi
f01044a9:	8b 90 04 10 00 00    	mov    0x1004(%eax),%edx
f01044af:	8b b8 00 10 00 00    	mov    0x1000(%eax),%edi
f01044b5:	eb 03                	jmp    f01044ba <sched_destroy_env+0x3d>
f01044b7:	83 c2 01             	add    $0x1,%edx
f01044ba:	39 d7                	cmp    %edx,%edi
f01044bc:	7e 2b                	jle    f01044e9 <sched_destroy_env+0x6c>
f01044be:	89 d1                	mov    %edx,%ecx
f01044c0:	c1 f9 1f             	sar    $0x1f,%ecx
f01044c3:	c1 e9 16             	shr    $0x16,%ecx
f01044c6:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
f01044c9:	25 ff 03 00 00       	and    $0x3ff,%eax
f01044ce:	29 c8                	sub    %ecx,%eax
f01044d0:	39 1c 86             	cmp    %ebx,(%esi,%eax,4)
f01044d3:	75 e2                	jne    f01044b7 <sched_destroy_env+0x3a>
f01044d5:	83 ec 08             	sub    $0x8,%esp
f01044d8:	52                   	push   %edx
f01044d9:	56                   	push   %esi
f01044da:	e8 56 ff ff ff       	call   f0104435 <sched_remove_env>
f01044df:	83 2d bc ca 18 f0 01 	subl   $0x1,0xf018cabc
f01044e6:	83 c4 10             	add    $0x10,%esp
f01044e9:	8d 65 f4             	lea    -0xc(%ebp),%esp
f01044ec:	5b                   	pop    %ebx
f01044ed:	5e                   	pop    %esi
f01044ee:	5f                   	pop    %edi
f01044ef:	5d                   	pop    %ebp
f01044f0:	c3                   	ret

f01044f1 <sched_push_env>:
f01044f1:	55                   	push   %ebp
f01044f2:	89 e5                	mov    %esp,%ebp
f01044f4:	56                   	push   %esi
f01044f5:	53                   	push   %ebx
f01044f6:	8b 5d 08             	mov    0x8(%ebp),%ebx
f01044f9:	8b 75 0c             	mov    0xc(%ebp),%esi
f01044fc:	83 ec 0c             	sub    $0xc,%esp
f01044ff:	56                   	push   %esi
f0104500:	e8 aa fe ff ff       	call   f01043af <get_queue>
f0104505:	83 c4 10             	add    $0x10,%esp
f0104508:	89 c2                	mov    %eax,%edx
f010450a:	8b 80 00 10 00 00    	mov    0x1000(%eax),%eax
f0104510:	89 c1                	mov    %eax,%ecx
f0104512:	c1 f9 1f             	sar    $0x1f,%ecx
f0104515:	c1 e9 16             	shr    $0x16,%ecx
f0104518:	01 c8                	add    %ecx,%eax
f010451a:	25 ff 03 00 00       	and    $0x3ff,%eax
f010451f:	29 c8                	sub    %ecx,%eax
f0104521:	89 d9                	mov    %ebx,%ecx
f0104523:	81 e1 ff 03 00 00    	and    $0x3ff,%ecx
f0104529:	69 c9 84 00 00 00    	imul   $0x84,%ecx,%ecx
f010452f:	03 0d 70 92 18 f0    	add    0xf0189270,%ecx
f0104535:	89 71 7c             	mov    %esi,0x7c(%ecx)
f0104538:	89 1c 82             	mov    %ebx,(%edx,%eax,4)
f010453b:	83 82 00 10 00 00 01 	addl   $0x1,0x1000(%edx)
f0104542:	8d 65 f8             	lea    -0x8(%ebp),%esp
f0104545:	5b                   	pop    %ebx
f0104546:	5e                   	pop    %esi
f0104547:	5d                   	pop    %ebp
f0104548:	c3                   	ret

f0104549 <boost_enviroments>:
f0104549:	55                   	push   %ebp
f010454a:	89 e5                	mov    %esp,%ebp
f010454c:	56                   	push   %esi
f010454d:	53                   	push   %ebx
f010454e:	83 05 c4 ca 18 f0 01 	addl   $0x1,0xf018cac4
f0104555:	83 ec 0c             	sub    $0xc,%esp
f0104558:	6a 01                	push   $0x1
f010455a:	e8 50 fe ff ff       	call   f01043af <get_queue>
f010455f:	83 c4 10             	add    $0x10,%esp
f0104562:	89 c6                	mov    %eax,%esi
f0104564:	8b 98 04 10 00 00    	mov    0x1004(%eax),%ebx
f010456a:	eb 25                	jmp    f0104591 <boost_enviroments+0x48>
f010456c:	83 ec 08             	sub    $0x8,%esp
f010456f:	6a 00                	push   $0x0
f0104571:	89 da                	mov    %ebx,%edx
f0104573:	c1 fa 1f             	sar    $0x1f,%edx
f0104576:	c1 ea 16             	shr    $0x16,%edx
f0104579:	8d 04 13             	lea    (%ebx,%edx,1),%eax
f010457c:	25 ff 03 00 00       	and    $0x3ff,%eax
f0104581:	29 d0                	sub    %edx,%eax
f0104583:	ff 34 86             	push   (%esi,%eax,4)
f0104586:	e8 66 ff ff ff       	call   f01044f1 <sched_push_env>
f010458b:	83 c3 01             	add    $0x1,%ebx
f010458e:	83 c4 10             	add    $0x10,%esp
f0104591:	3b 9e 00 10 00 00    	cmp    0x1000(%esi),%ebx
f0104597:	7c d3                	jl     f010456c <boost_enviroments+0x23>
f0104599:	83 ec 0c             	sub    $0xc,%esp
f010459c:	6a 02                	push   $0x2
f010459e:	e8 0c fe ff ff       	call   f01043af <get_queue>
f01045a3:	83 c4 10             	add    $0x10,%esp
f01045a6:	89 c6                	mov    %eax,%esi
f01045a8:	8b 98 04 10 00 00    	mov    0x1004(%eax),%ebx
f01045ae:	eb 25                	jmp    f01045d5 <boost_enviroments+0x8c>
f01045b0:	83 ec 08             	sub    $0x8,%esp
f01045b3:	6a 00                	push   $0x0
f01045b5:	89 da                	mov    %ebx,%edx
f01045b7:	c1 fa 1f             	sar    $0x1f,%edx
f01045ba:	c1 ea 16             	shr    $0x16,%edx
f01045bd:	8d 04 13             	lea    (%ebx,%edx,1),%eax
f01045c0:	25 ff 03 00 00       	and    $0x3ff,%eax
f01045c5:	29 d0                	sub    %edx,%eax
f01045c7:	ff 34 86             	push   (%esi,%eax,4)
f01045ca:	e8 22 ff ff ff       	call   f01044f1 <sched_push_env>
f01045cf:	83 c3 01             	add    $0x1,%ebx
f01045d2:	83 c4 10             	add    $0x10,%esp
f01045d5:	3b 9e 00 10 00 00    	cmp    0x1000(%esi),%ebx
f01045db:	7c d3                	jl     f01045b0 <boost_enviroments+0x67>
f01045dd:	c7 05 a8 ba 18 f0 00 	movl   $0x0,0xf018baa8
f01045e4:	00 00 00 
f01045e7:	c7 05 ac ba 18 f0 00 	movl   $0x0,0xf018baac
f01045ee:	00 00 00 
f01045f1:	c7 05 b0 ca 18 f0 00 	movl   $0x0,0xf018cab0
f01045f8:	00 00 00 
f01045fb:	c7 05 b4 ca 18 f0 00 	movl   $0x0,0xf018cab4
f0104602:	00 00 00 
f0104605:	8d 65 f8             	lea    -0x8(%ebp),%esp
f0104608:	5b                   	pop    %ebx
f0104609:	5e                   	pop    %esi
f010460a:	5d                   	pop    %ebp
f010460b:	c3                   	ret

f010460c <sched_halt>:
f010460c:	55                   	push   %ebp
f010460d:	89 e5                	mov    %esp,%ebp
f010460f:	53                   	push   %ebx
f0104610:	83 ec 04             	sub    $0x4,%esp
f0104613:	83 05 c0 ca 18 f0 01 	addl   $0x1,0xf018cac0
f010461a:	a1 70 92 18 f0       	mov    0xf0189270,%eax
f010461f:	8d 50 54             	lea    0x54(%eax),%edx
f0104622:	b9 00 00 00 00       	mov    $0x0,%ecx
f0104627:	8b 02                	mov    (%edx),%eax
f0104629:	83 e8 01             	sub    $0x1,%eax
f010462c:	81 c2 84 00 00 00    	add    $0x84,%edx
f0104632:	83 f8 02             	cmp    $0x2,%eax
f0104635:	0f 86 ca 00 00 00    	jbe    f0104705 <sched_halt+0xf9>
f010463b:	83 c1 01             	add    $0x1,%ecx
f010463e:	81 f9 00 04 00 00    	cmp    $0x400,%ecx
f0104644:	75 e1                	jne    f0104627 <sched_halt+0x1b>
f0104646:	83 ec 0c             	sub    $0xc,%esp
f0104649:	68 98 76 10 f0       	push   $0xf0107698
f010464e:	e8 e3 f1 ff ff       	call   f0103836 <cprintf>
f0104653:	83 c4 08             	add    $0x8,%esp
f0104656:	ff 35 c8 ca 18 f0    	push   0xf018cac8
f010465c:	68 c4 76 10 f0       	push   $0xf01076c4
f0104661:	e8 d0 f1 ff ff       	call   f0103836 <cprintf>
f0104666:	c7 04 24 f0 76 10 f0 	movl   $0xf01076f0,(%esp)
f010466d:	e8 c4 f1 ff ff       	call   f0103836 <cprintf>
f0104672:	83 c4 10             	add    $0x10,%esp
f0104675:	bb 00 00 00 00       	mov    $0x0,%ebx
f010467a:	eb 0e                	jmp    f010468a <sched_halt+0x7e>
f010467c:	81 c3 84 00 00 00    	add    $0x84,%ebx
f0104682:	81 fb 00 10 02 00    	cmp    $0x21000,%ebx
f0104688:	74 36                	je     f01046c0 <sched_halt+0xb4>
f010468a:	a1 70 92 18 f0       	mov    0xf0189270,%eax
f010468f:	8b 44 18 48          	mov    0x48(%eax,%ebx,1),%eax
f0104693:	85 c0                	test   %eax,%eax
f0104695:	74 e5                	je     f010467c <sched_halt+0x70>
f0104697:	83 ec 08             	sub    $0x8,%esp
f010469a:	50                   	push   %eax
f010469b:	68 d0 80 10 f0       	push   $0xf01080d0
f01046a0:	e8 91 f1 ff ff       	call   f0103836 <cprintf>
f01046a5:	83 c4 08             	add    $0x8,%esp
f01046a8:	a1 70 92 18 f0       	mov    0xf0189270,%eax
f01046ad:	ff 74 18 58          	push   0x58(%eax,%ebx,1)
f01046b1:	68 dd 80 10 f0       	push   $0xf01080dd
f01046b6:	e8 7b f1 ff ff       	call   f0103836 <cprintf>
f01046bb:	83 c4 10             	add    $0x10,%esp
f01046be:	eb bc                	jmp    f010467c <sched_halt+0x70>
f01046c0:	83 ec 0c             	sub    $0xc,%esp
f01046c3:	68 ea 80 10 f0       	push   $0xf01080ea
f01046c8:	e8 69 f1 ff ff       	call   f0103836 <cprintf>
f01046cd:	83 c4 08             	add    $0x8,%esp
f01046d0:	ff 35 c4 ca 18 f0    	push   0xf018cac4
f01046d6:	68 28 76 10 f0       	push   $0xf0107628
f01046db:	e8 56 f1 ff ff       	call   f0103836 <cprintf>
f01046e0:	83 c4 08             	add    $0x8,%esp
f01046e3:	ff 35 c0 ca 18 f0    	push   0xf018cac0
f01046e9:	68 64 76 10 f0       	push   $0xf0107664
f01046ee:	e8 43 f1 ff ff       	call   f0103836 <cprintf>
f01046f3:	83 c4 10             	add    $0x10,%esp
f01046f6:	83 ec 0c             	sub    $0xc,%esp
f01046f9:	6a 00                	push   $0x0
f01046fb:	e8 fa c3 ff ff       	call   f0100afa <monitor>
f0104700:	83 c4 10             	add    $0x10,%esp
f0104703:	eb f1                	jmp    f01046f6 <sched_halt+0xea>
f0104705:	e8 f2 1b 00 00       	call   f01062fc <cpunum>
f010470a:	6b c0 74             	imul   $0x74,%eax,%eax
f010470d:	c7 80 28 d0 1c f0 00 	movl   $0x0,-0xfe32fd8(%eax)
f0104714:	00 00 00 
f0104717:	8b 0d 5c 92 18 f0    	mov    0xf018925c,%ecx
f010471d:	ba 32 01 00 00       	mov    $0x132,%edx
f0104722:	b8 ec 80 10 f0       	mov    $0xf01080ec,%eax
f0104727:	e8 4a fc ff ff       	call   f0104376 <_paddr>
f010472c:	e8 39 fc ff ff       	call   f010436a <lcr3>
f0104731:	e8 c6 1b 00 00       	call   f01062fc <cpunum>
f0104736:	6b c0 74             	imul   $0x74,%eax,%eax
f0104739:	05 24 d0 1c f0       	add    $0xf01cd024,%eax
f010473e:	ba 02 00 00 00       	mov    $0x2,%edx
f0104743:	e8 26 fc ff ff       	call   f010436e <xchg>
f0104748:	e8 4b fc ff ff       	call   f0104398 <unlock_kernel>
f010474d:	e8 aa 1b 00 00       	call   f01062fc <cpunum>
f0104752:	6b c0 74             	imul   $0x74,%eax,%eax
f0104755:	8b 80 30 d0 1c f0    	mov    -0xfe32fd0(%eax),%eax
f010475b:	bd 00 00 00 00       	mov    $0x0,%ebp
f0104760:	89 c4                	mov    %eax,%esp
f0104762:	6a 00                	push   $0x0
f0104764:	6a 00                	push   $0x0
f0104766:	fb                   	sti
f0104767:	f4                   	hlt
f0104768:	eb fd                	jmp    f0104767 <sched_halt+0x15b>
f010476a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f010476d:	c9                   	leave
f010476e:	c3                   	ret

f010476f <priority_queue>:
f010476f:	55                   	push   %ebp
f0104770:	89 e5                	mov    %esp,%ebp
f0104772:	57                   	push   %edi
f0104773:	56                   	push   %esi
f0104774:	53                   	push   %ebx
f0104775:	83 ec 1c             	sub    $0x1c,%esp
f0104778:	e8 7f 1b 00 00       	call   f01062fc <cpunum>
f010477d:	8b 1d 70 92 18 f0    	mov    0xf0189270,%ebx
f0104783:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
f010478a:	e9 9a 00 00 00       	jmp    f0104829 <priority_queue+0xba>
f010478f:	83 c2 01             	add    $0x1,%edx
f0104792:	39 d7                	cmp    %edx,%edi
f0104794:	0f 8e 83 00 00 00    	jle    f010481d <priority_queue+0xae>
f010479a:	89 d1                	mov    %edx,%ecx
f010479c:	c1 f9 1f             	sar    $0x1f,%ecx
f010479f:	c1 e9 16             	shr    $0x16,%ecx
f01047a2:	8d 04 0a             	lea    (%edx,%ecx,1),%eax
f01047a5:	25 ff 03 00 00       	and    $0x3ff,%eax
f01047aa:	29 c8                	sub    %ecx,%eax
f01047ac:	8b 04 86             	mov    (%esi,%eax,4),%eax
f01047af:	25 ff 03 00 00       	and    $0x3ff,%eax
f01047b4:	69 c0 84 00 00 00    	imul   $0x84,%eax,%eax
f01047ba:	83 7c 03 54 02       	cmpl   $0x2,0x54(%ebx,%eax,1)
f01047bf:	75 ce                	jne    f010478f <priority_queue+0x20>
f01047c1:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
f01047c5:	0f 84 8b 00 00 00    	je     f0104856 <priority_queue+0xe7>
f01047cb:	8b 96 04 10 00 00    	mov    0x1004(%esi),%edx
f01047d1:	8b 86 00 10 00 00    	mov    0x1000(%esi),%eax
f01047d7:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f01047da:	8b 0d 70 92 18 f0    	mov    0xf0189270,%ecx
f01047e0:	39 55 e4             	cmp    %edx,-0x1c(%ebp)
f01047e3:	0f 8e e5 00 00 00    	jle    f01048ce <priority_queue+0x15f>
f01047e9:	89 d3                	mov    %edx,%ebx
f01047eb:	c1 fb 1f             	sar    $0x1f,%ebx
f01047ee:	c1 eb 16             	shr    $0x16,%ebx
f01047f1:	8d 04 1a             	lea    (%edx,%ebx,1),%eax
f01047f4:	25 ff 03 00 00       	and    $0x3ff,%eax
f01047f9:	29 d8                	sub    %ebx,%eax
f01047fb:	8b 3c 86             	mov    (%esi,%eax,4),%edi
f01047fe:	89 fb                	mov    %edi,%ebx
f0104800:	81 e3 ff 03 00 00    	and    $0x3ff,%ebx
f0104806:	69 db 84 00 00 00    	imul   $0x84,%ebx,%ebx
f010480c:	01 cb                	add    %ecx,%ebx
f010480e:	83 7b 54 02          	cmpl   $0x2,0x54(%ebx)
f0104812:	0f 84 83 00 00 00    	je     f010489b <priority_queue+0x12c>
f0104818:	83 c2 01             	add    $0x1,%edx
f010481b:	eb c3                	jmp    f01047e0 <priority_queue+0x71>
f010481d:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
f0104821:	8b 45 e0             	mov    -0x20(%ebp),%eax
f0104824:	83 f8 03             	cmp    $0x3,%eax
f0104827:	74 21                	je     f010484a <priority_queue+0xdb>
f0104829:	83 ec 0c             	sub    $0xc,%esp
f010482c:	ff 75 e0             	push   -0x20(%ebp)
f010482f:	e8 7b fb ff ff       	call   f01043af <get_queue>
f0104834:	83 c4 10             	add    $0x10,%esp
f0104837:	89 c6                	mov    %eax,%esi
f0104839:	8b 90 04 10 00 00    	mov    0x1004(%eax),%edx
f010483f:	8b b8 00 10 00 00    	mov    0x1000(%eax),%edi
f0104845:	e9 48 ff ff ff       	jmp    f0104792 <priority_queue+0x23>
f010484a:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
f0104851:	be 00 00 00 00       	mov    $0x0,%esi
f0104856:	e8 a1 1a 00 00       	call   f01062fc <cpunum>
f010485b:	6b c0 74             	imul   $0x74,%eax,%eax
f010485e:	83 b8 28 d0 1c f0 00 	cmpl   $0x0,-0xfe32fd8(%eax)
f0104865:	74 14                	je     f010487b <priority_queue+0x10c>
f0104867:	e8 90 1a 00 00       	call   f01062fc <cpunum>
f010486c:	6b c0 74             	imul   $0x74,%eax,%eax
f010486f:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f0104875:	83 78 54 03          	cmpl   $0x3,0x54(%eax)
f0104879:	74 0a                	je     f0104885 <priority_queue+0x116>
f010487b:	e8 8c fd ff ff       	call   f010460c <sched_halt>
f0104880:	e9 46 ff ff ff       	jmp    f01047cb <priority_queue+0x5c>
f0104885:	e8 72 1a 00 00       	call   f01062fc <cpunum>
f010488a:	83 ec 0c             	sub    $0xc,%esp
f010488d:	6b c0 74             	imul   $0x74,%eax,%eax
f0104890:	ff b0 28 d0 1c f0    	push   -0xfe32fd8(%eax)
f0104896:	e8 b0 ec ff ff       	call   f010354b <env_run>
f010489b:	83 ec 08             	sub    $0x8,%esp
f010489e:	50                   	push   %eax
f010489f:	56                   	push   %esi
f01048a0:	e8 90 fb ff ff       	call   f0104435 <sched_remove_env>
f01048a5:	83 c4 08             	add    $0x8,%esp
f01048a8:	8b 75 e0             	mov    -0x20(%ebp),%esi
f01048ab:	85 f6                	test   %esi,%esi
f01048ad:	b8 01 00 00 00       	mov    $0x1,%eax
f01048b2:	0f 4e c6             	cmovle %esi,%eax
f01048b5:	83 c0 01             	add    $0x1,%eax
f01048b8:	50                   	push   %eax
f01048b9:	57                   	push   %edi
f01048ba:	e8 32 fc ff ff       	call   f01044f1 <sched_push_env>
f01048bf:	83 05 b8 ca 18 f0 01 	addl   $0x1,0xf018cab8
f01048c6:	89 1c 24             	mov    %ebx,(%esp)
f01048c9:	e8 7d ec ff ff       	call   f010354b <env_run>
f01048ce:	8d 65 f4             	lea    -0xc(%ebp),%esp
f01048d1:	5b                   	pop    %ebx
f01048d2:	5e                   	pop    %esi
f01048d3:	5f                   	pop    %edi
f01048d4:	5d                   	pop    %ebp
f01048d5:	c3                   	ret

f01048d6 <sched_yield>:
f01048d6:	55                   	push   %ebp
f01048d7:	89 e5                	mov    %esp,%ebp
f01048d9:	53                   	push   %ebx
f01048da:	83 ec 04             	sub    $0x4,%esp
f01048dd:	83 05 c8 ca 18 f0 01 	addl   $0x1,0xf018cac8
f01048e4:	e8 13 1a 00 00       	call   f01062fc <cpunum>
f01048e9:	6b c0 74             	imul   $0x74,%eax,%eax
f01048ec:	ba 00 00 00 00       	mov    $0x0,%edx
f01048f1:	83 b8 28 d0 1c f0 00 	cmpl   $0x0,-0xfe32fd8(%eax)
f01048f8:	74 1a                	je     f0104914 <sched_yield+0x3e>
f01048fa:	e8 fd 19 00 00       	call   f01062fc <cpunum>
f01048ff:	6b c0 74             	imul   $0x74,%eax,%eax
f0104902:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f0104908:	8b 50 48             	mov    0x48(%eax),%edx
f010490b:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
f0104911:	83 c2 01             	add    $0x1,%edx
f0104914:	8b 1d 70 92 18 f0    	mov    0xf0189270,%ebx
f010491a:	b9 01 04 00 00       	mov    $0x401,%ecx
f010491f:	83 e9 01             	sub    $0x1,%ecx
f0104922:	74 2e                	je     f0104952 <sched_yield+0x7c>
f0104924:	69 c2 84 00 00 00    	imul   $0x84,%edx,%eax
f010492a:	01 d8                	add    %ebx,%eax
f010492c:	83 78 54 02          	cmpl   $0x2,0x54(%eax)
f0104930:	74 17                	je     f0104949 <sched_yield+0x73>
f0104932:	83 c2 01             	add    $0x1,%edx
f0104935:	89 d0                	mov    %edx,%eax
f0104937:	c1 f8 1f             	sar    $0x1f,%eax
f010493a:	c1 e8 16             	shr    $0x16,%eax
f010493d:	01 c2                	add    %eax,%edx
f010493f:	81 e2 ff 03 00 00    	and    $0x3ff,%edx
f0104945:	29 c2                	sub    %eax,%edx
f0104947:	eb d6                	jmp    f010491f <sched_yield+0x49>
f0104949:	83 ec 0c             	sub    $0xc,%esp
f010494c:	50                   	push   %eax
f010494d:	e8 f9 eb ff ff       	call   f010354b <env_run>
f0104952:	e8 a5 19 00 00       	call   f01062fc <cpunum>
f0104957:	6b c0 74             	imul   $0x74,%eax,%eax
f010495a:	83 b8 28 d0 1c f0 00 	cmpl   $0x0,-0xfe32fd8(%eax)
f0104961:	74 14                	je     f0104977 <sched_yield+0xa1>
f0104963:	e8 94 19 00 00       	call   f01062fc <cpunum>
f0104968:	6b c0 74             	imul   $0x74,%eax,%eax
f010496b:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f0104971:	83 78 54 03          	cmpl   $0x3,0x54(%eax)
f0104975:	74 2c                	je     f01049a3 <sched_yield+0xcd>
f0104977:	e8 90 fc ff ff       	call   f010460c <sched_halt>
f010497c:	e8 7b 19 00 00       	call   f01062fc <cpunum>
f0104981:	6b c0 74             	imul   $0x74,%eax,%eax
f0104984:	83 b8 28 d0 1c f0 00 	cmpl   $0x0,-0xfe32fd8(%eax)
f010498b:	74 2c                	je     f01049b9 <sched_yield+0xe3>
f010498d:	e8 6a 19 00 00       	call   f01062fc <cpunum>
f0104992:	83 ec 0c             	sub    $0xc,%esp
f0104995:	6b c0 74             	imul   $0x74,%eax,%eax
f0104998:	ff b0 28 d0 1c f0    	push   -0xfe32fd8(%eax)
f010499e:	e8 a8 eb ff ff       	call   f010354b <env_run>
f01049a3:	e8 54 19 00 00       	call   f01062fc <cpunum>
f01049a8:	83 ec 0c             	sub    $0xc,%esp
f01049ab:	6b c0 74             	imul   $0x74,%eax,%eax
f01049ae:	ff b0 28 d0 1c f0    	push   -0xfe32fd8(%eax)
f01049b4:	e8 92 eb ff ff       	call   f010354b <env_run>
f01049b9:	e8 4e fc ff ff       	call   f010460c <sched_halt>
f01049be:	83 ec 04             	sub    $0x4,%esp
f01049c1:	68 f9 80 10 f0       	push   $0xf01080f9
f01049c6:	68 02 01 00 00       	push   $0x102
f01049cb:	68 ec 80 10 f0       	push   $0xf01080ec
f01049d0:	e8 95 b6 ff ff       	call   f010006a <_panic>

f01049d5 <check_perm>:
f01049d5:	89 c1                	mov    %eax,%ecx
f01049d7:	81 e1 f8 f1 ff ff    	and    $0xfffff1f8,%ecx
f01049dd:	75 2e                	jne    f0104a0d <check_perm+0x38>
f01049df:	55                   	push   %ebp
f01049e0:	89 e5                	mov    %esp,%ebp
f01049e2:	53                   	push   %ebx
f01049e3:	89 c3                	mov    %eax,%ebx
f01049e5:	f7 d3                	not    %ebx
f01049e7:	f6 c3 05             	test   $0x5,%bl
f01049ea:	75 29                	jne    f0104a15 <check_perm+0x40>
f01049ec:	85 d2                	test   %edx,%edx
f01049ee:	74 35                	je     f0104a25 <check_perm+0x50>
f01049f0:	8b 12                	mov    (%edx),%edx
f01049f2:	85 d2                	test   %edx,%edx
f01049f4:	74 05                	je     f01049fb <check_perm+0x26>
f01049f6:	f6 c2 01             	test   $0x1,%dl
f01049f9:	74 21                	je     f0104a1c <check_perm+0x47>
f01049fb:	83 e0 02             	and    $0x2,%eax
f01049fe:	74 23                	je     f0104a23 <check_perm+0x4e>
f0104a00:	f6 c2 02             	test   $0x2,%dl
f0104a03:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
f0104a08:	0f 44 c8             	cmove  %eax,%ecx
f0104a0b:	eb 18                	jmp    f0104a25 <check_perm+0x50>
f0104a0d:	b9 fd ff ff ff       	mov    $0xfffffffd,%ecx
f0104a12:	89 c8                	mov    %ecx,%eax
f0104a14:	c3                   	ret
f0104a15:	b9 fd ff ff ff       	mov    $0xfffffffd,%ecx
f0104a1a:	eb 09                	jmp    f0104a25 <check_perm+0x50>
f0104a1c:	b9 fd ff ff ff       	mov    $0xfffffffd,%ecx
f0104a21:	eb 02                	jmp    f0104a25 <check_perm+0x50>
f0104a23:	89 c1                	mov    %eax,%ecx
f0104a25:	89 c8                	mov    %ecx,%eax
f0104a27:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f0104a2a:	c9                   	leave
f0104a2b:	c3                   	ret

f0104a2c <sys_getenvid>:
f0104a2c:	55                   	push   %ebp
f0104a2d:	89 e5                	mov    %esp,%ebp
f0104a2f:	83 ec 08             	sub    $0x8,%esp
f0104a32:	e8 c5 18 00 00       	call   f01062fc <cpunum>
f0104a37:	6b c0 74             	imul   $0x74,%eax,%eax
f0104a3a:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f0104a40:	8b 40 48             	mov    0x48(%eax),%eax
f0104a43:	c9                   	leave
f0104a44:	c3                   	ret

f0104a45 <sys_cputs>:
f0104a45:	55                   	push   %ebp
f0104a46:	89 e5                	mov    %esp,%ebp
f0104a48:	56                   	push   %esi
f0104a49:	53                   	push   %ebx
f0104a4a:	89 c6                	mov    %eax,%esi
f0104a4c:	89 d3                	mov    %edx,%ebx
f0104a4e:	e8 a9 18 00 00       	call   f01062fc <cpunum>
f0104a53:	6a 07                	push   $0x7
f0104a55:	53                   	push   %ebx
f0104a56:	56                   	push   %esi
f0104a57:	6b c0 74             	imul   $0x74,%eax,%eax
f0104a5a:	ff b0 28 d0 1c f0    	push   -0xfe32fd8(%eax)
f0104a60:	e8 47 e3 ff ff       	call   f0102dac <user_mem_assert>
f0104a65:	83 c4 0c             	add    $0xc,%esp
f0104a68:	56                   	push   %esi
f0104a69:	53                   	push   %ebx
f0104a6a:	68 0b 81 10 f0       	push   $0xf010810b
f0104a6f:	e8 c2 ed ff ff       	call   f0103836 <cprintf>
f0104a74:	83 c4 10             	add    $0x10,%esp
f0104a77:	8d 65 f8             	lea    -0x8(%ebp),%esp
f0104a7a:	5b                   	pop    %ebx
f0104a7b:	5e                   	pop    %esi
f0104a7c:	5d                   	pop    %ebp
f0104a7d:	c3                   	ret

f0104a7e <sys_env_set_status>:
f0104a7e:	55                   	push   %ebp
f0104a7f:	89 e5                	mov    %esp,%ebp
f0104a81:	53                   	push   %ebx
f0104a82:	83 ec 14             	sub    $0x14,%esp
f0104a85:	89 d3                	mov    %edx,%ebx
f0104a87:	8d 52 fe             	lea    -0x2(%edx),%edx
f0104a8a:	f7 c2 fd ff ff ff    	test   $0xfffffffd,%edx
f0104a90:	75 21                	jne    f0104ab3 <sys_env_set_status+0x35>
f0104a92:	83 ec 04             	sub    $0x4,%esp
f0104a95:	6a 01                	push   $0x1
f0104a97:	8d 55 f4             	lea    -0xc(%ebp),%edx
f0104a9a:	52                   	push   %edx
f0104a9b:	50                   	push   %eax
f0104a9c:	e8 16 e6 ff ff       	call   f01030b7 <envid2env>
f0104aa1:	83 c4 10             	add    $0x10,%esp
f0104aa4:	85 c0                	test   %eax,%eax
f0104aa6:	75 06                	jne    f0104aae <sys_env_set_status+0x30>
f0104aa8:	8b 55 f4             	mov    -0xc(%ebp),%edx
f0104aab:	89 5a 54             	mov    %ebx,0x54(%edx)
f0104aae:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f0104ab1:	c9                   	leave
f0104ab2:	c3                   	ret
f0104ab3:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
f0104ab8:	eb f4                	jmp    f0104aae <sys_env_set_status+0x30>

f0104aba <sys_env_set_pgfault_upcall>:
f0104aba:	55                   	push   %ebp
f0104abb:	89 e5                	mov    %esp,%ebp
f0104abd:	56                   	push   %esi
f0104abe:	53                   	push   %ebx
f0104abf:	83 ec 14             	sub    $0x14,%esp
f0104ac2:	89 d6                	mov    %edx,%esi
f0104ac4:	6a 01                	push   $0x1
f0104ac6:	8d 55 f4             	lea    -0xc(%ebp),%edx
f0104ac9:	52                   	push   %edx
f0104aca:	50                   	push   %eax
f0104acb:	e8 e7 e5 ff ff       	call   f01030b7 <envid2env>
f0104ad0:	89 c3                	mov    %eax,%ebx
f0104ad2:	83 c4 10             	add    $0x10,%esp
f0104ad5:	85 c0                	test   %eax,%eax
f0104ad7:	74 09                	je     f0104ae2 <sys_env_set_pgfault_upcall+0x28>
f0104ad9:	89 d8                	mov    %ebx,%eax
f0104adb:	8d 65 f8             	lea    -0x8(%ebp),%esp
f0104ade:	5b                   	pop    %ebx
f0104adf:	5e                   	pop    %esi
f0104ae0:	5d                   	pop    %ebp
f0104ae1:	c3                   	ret
f0104ae2:	6a 05                	push   $0x5
f0104ae4:	68 00 10 00 00       	push   $0x1000
f0104ae9:	56                   	push   %esi
f0104aea:	ff 75 f4             	push   -0xc(%ebp)
f0104aed:	e8 ba e2 ff ff       	call   f0102dac <user_mem_assert>
f0104af2:	8b 45 f4             	mov    -0xc(%ebp),%eax
f0104af5:	89 70 64             	mov    %esi,0x64(%eax)
f0104af8:	83 c4 10             	add    $0x10,%esp
f0104afb:	eb dc                	jmp    f0104ad9 <sys_env_set_pgfault_upcall+0x1f>

f0104afd <sys_get_priority_from_envid>:
f0104afd:	55                   	push   %ebp
f0104afe:	89 e5                	mov    %esp,%ebp
f0104b00:	83 ec 1c             	sub    $0x1c,%esp
f0104b03:	6a 00                	push   $0x0
f0104b05:	8d 55 f4             	lea    -0xc(%ebp),%edx
f0104b08:	52                   	push   %edx
f0104b09:	50                   	push   %eax
f0104b0a:	e8 a8 e5 ff ff       	call   f01030b7 <envid2env>
f0104b0f:	83 c4 10             	add    $0x10,%esp
f0104b12:	85 c0                	test   %eax,%eax
f0104b14:	75 06                	jne    f0104b1c <sys_get_priority_from_envid+0x1f>
f0104b16:	8b 45 f4             	mov    -0xc(%ebp),%eax
f0104b19:	8b 40 7c             	mov    0x7c(%eax),%eax
f0104b1c:	c9                   	leave
f0104b1d:	c3                   	ret

f0104b1e <sys_env_destroy>:
f0104b1e:	55                   	push   %ebp
f0104b1f:	89 e5                	mov    %esp,%ebp
f0104b21:	53                   	push   %ebx
f0104b22:	83 ec 18             	sub    $0x18,%esp
f0104b25:	6a 01                	push   $0x1
f0104b27:	8d 55 f4             	lea    -0xc(%ebp),%edx
f0104b2a:	52                   	push   %edx
f0104b2b:	50                   	push   %eax
f0104b2c:	e8 86 e5 ff ff       	call   f01030b7 <envid2env>
f0104b31:	83 c4 10             	add    $0x10,%esp
f0104b34:	85 c0                	test   %eax,%eax
f0104b36:	78 4b                	js     f0104b83 <sys_env_destroy+0x65>
f0104b38:	e8 bf 17 00 00       	call   f01062fc <cpunum>
f0104b3d:	8b 55 f4             	mov    -0xc(%ebp),%edx
f0104b40:	6b c0 74             	imul   $0x74,%eax,%eax
f0104b43:	39 90 28 d0 1c f0    	cmp    %edx,-0xfe32fd8(%eax)
f0104b49:	74 3d                	je     f0104b88 <sys_env_destroy+0x6a>
f0104b4b:	8b 5a 48             	mov    0x48(%edx),%ebx
f0104b4e:	e8 a9 17 00 00       	call   f01062fc <cpunum>
f0104b53:	83 ec 04             	sub    $0x4,%esp
f0104b56:	53                   	push   %ebx
f0104b57:	6b c0 74             	imul   $0x74,%eax,%eax
f0104b5a:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f0104b60:	ff 70 48             	push   0x48(%eax)
f0104b63:	68 2b 81 10 f0       	push   $0xf010812b
f0104b68:	e8 c9 ec ff ff       	call   f0103836 <cprintf>
f0104b6d:	83 c4 10             	add    $0x10,%esp
f0104b70:	83 ec 0c             	sub    $0xc,%esp
f0104b73:	ff 75 f4             	push   -0xc(%ebp)
f0104b76:	e8 4d e9 ff ff       	call   f01034c8 <env_destroy>
f0104b7b:	83 c4 10             	add    $0x10,%esp
f0104b7e:	b8 00 00 00 00       	mov    $0x0,%eax
f0104b83:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f0104b86:	c9                   	leave
f0104b87:	c3                   	ret
f0104b88:	e8 6f 17 00 00       	call   f01062fc <cpunum>
f0104b8d:	83 ec 08             	sub    $0x8,%esp
f0104b90:	6b c0 74             	imul   $0x74,%eax,%eax
f0104b93:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f0104b99:	ff 70 48             	push   0x48(%eax)
f0104b9c:	68 10 81 10 f0       	push   $0xf0108110
f0104ba1:	e8 90 ec ff ff       	call   f0103836 <cprintf>
f0104ba6:	83 c4 10             	add    $0x10,%esp
f0104ba9:	eb c5                	jmp    f0104b70 <sys_env_destroy+0x52>

f0104bab <sys_cgetc>:
f0104bab:	55                   	push   %ebp
f0104bac:	89 e5                	mov    %esp,%ebp
f0104bae:	83 ec 08             	sub    $0x8,%esp
f0104bb1:	e8 af bc ff ff       	call   f0100865 <cons_getc>
f0104bb6:	c9                   	leave
f0104bb7:	c3                   	ret

f0104bb8 <sys_exofork>:
f0104bb8:	55                   	push   %ebp
f0104bb9:	89 e5                	mov    %esp,%ebp
f0104bbb:	57                   	push   %edi
f0104bbc:	56                   	push   %esi
f0104bbd:	83 ec 10             	sub    $0x10,%esp
f0104bc0:	e8 37 17 00 00       	call   f01062fc <cpunum>
f0104bc5:	83 ec 08             	sub    $0x8,%esp
f0104bc8:	6b c0 74             	imul   $0x74,%eax,%eax
f0104bcb:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f0104bd1:	ff 70 48             	push   0x48(%eax)
f0104bd4:	8d 45 f4             	lea    -0xc(%ebp),%eax
f0104bd7:	50                   	push   %eax
f0104bd8:	e8 f5 e5 ff ff       	call   f01031d2 <env_alloc>
f0104bdd:	83 c4 10             	add    $0x10,%esp
f0104be0:	85 c0                	test   %eax,%eax
f0104be2:	74 07                	je     f0104beb <sys_exofork+0x33>
f0104be4:	8d 65 f8             	lea    -0x8(%ebp),%esp
f0104be7:	5e                   	pop    %esi
f0104be8:	5f                   	pop    %edi
f0104be9:	5d                   	pop    %ebp
f0104bea:	c3                   	ret
f0104beb:	8b 45 f4             	mov    -0xc(%ebp),%eax
f0104bee:	c7 40 54 04 00 00 00 	movl   $0x4,0x54(%eax)
f0104bf5:	e8 02 17 00 00       	call   f01062fc <cpunum>
f0104bfa:	6b c0 74             	imul   $0x74,%eax,%eax
f0104bfd:	8b b0 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%esi
f0104c03:	8b 45 f4             	mov    -0xc(%ebp),%eax
f0104c06:	b9 11 00 00 00       	mov    $0x11,%ecx
f0104c0b:	89 c7                	mov    %eax,%edi
f0104c0d:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
f0104c0f:	c7 40 1c 00 00 00 00 	movl   $0x0,0x1c(%eax)
f0104c16:	8b 40 48             	mov    0x48(%eax),%eax
f0104c19:	eb c9                	jmp    f0104be4 <sys_exofork+0x2c>

f0104c1b <env_page_alloc>:
f0104c1b:	55                   	push   %ebp
f0104c1c:	89 e5                	mov    %esp,%ebp
f0104c1e:	57                   	push   %edi
f0104c1f:	56                   	push   %esi
f0104c20:	53                   	push   %ebx
f0104c21:	83 ec 0c             	sub    $0xc,%esp
f0104c24:	89 c6                	mov    %eax,%esi
f0104c26:	89 d7                	mov    %edx,%edi
f0104c28:	89 cb                	mov    %ecx,%ebx
f0104c2a:	ba 00 00 00 00       	mov    $0x0,%edx
f0104c2f:	89 c8                	mov    %ecx,%eax
f0104c31:	e8 9f fd ff ff       	call   f01049d5 <check_perm>
f0104c36:	85 c0                	test   %eax,%eax
f0104c38:	78 1f                	js     f0104c59 <env_page_alloc+0x3e>
f0104c3a:	83 ec 0c             	sub    $0xc,%esp
f0104c3d:	6a 01                	push   $0x1
f0104c3f:	e8 29 c7 ff ff       	call   f010136d <page_alloc>
f0104c44:	83 c4 10             	add    $0x10,%esp
f0104c47:	85 c0                	test   %eax,%eax
f0104c49:	74 16                	je     f0104c61 <env_page_alloc+0x46>
f0104c4b:	53                   	push   %ebx
f0104c4c:	57                   	push   %edi
f0104c4d:	50                   	push   %eax
f0104c4e:	ff 76 60             	push   0x60(%esi)
f0104c51:	e8 01 ce ff ff       	call   f0101a57 <page_insert>
f0104c56:	83 c4 10             	add    $0x10,%esp
f0104c59:	8d 65 f4             	lea    -0xc(%ebp),%esp
f0104c5c:	5b                   	pop    %ebx
f0104c5d:	5e                   	pop    %esi
f0104c5e:	5f                   	pop    %edi
f0104c5f:	5d                   	pop    %ebp
f0104c60:	c3                   	ret
f0104c61:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
f0104c66:	eb f1                	jmp    f0104c59 <env_page_alloc+0x3e>

f0104c68 <sys_page_alloc>:
f0104c68:	81 fa ff ff bf ee    	cmp    $0xeebfffff,%edx
f0104c6e:	77 42                	ja     f0104cb2 <sys_page_alloc+0x4a>
f0104c70:	55                   	push   %ebp
f0104c71:	89 e5                	mov    %esp,%ebp
f0104c73:	56                   	push   %esi
f0104c74:	53                   	push   %ebx
f0104c75:	83 ec 10             	sub    $0x10,%esp
f0104c78:	89 d3                	mov    %edx,%ebx
f0104c7a:	89 ce                	mov    %ecx,%esi
f0104c7c:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
f0104c82:	75 34                	jne    f0104cb8 <sys_page_alloc+0x50>
f0104c84:	83 ec 04             	sub    $0x4,%esp
f0104c87:	6a 01                	push   $0x1
f0104c89:	8d 55 f4             	lea    -0xc(%ebp),%edx
f0104c8c:	52                   	push   %edx
f0104c8d:	50                   	push   %eax
f0104c8e:	e8 24 e4 ff ff       	call   f01030b7 <envid2env>
f0104c93:	83 c4 10             	add    $0x10,%esp
f0104c96:	85 c0                	test   %eax,%eax
f0104c98:	74 07                	je     f0104ca1 <sys_page_alloc+0x39>
f0104c9a:	8d 65 f8             	lea    -0x8(%ebp),%esp
f0104c9d:	5b                   	pop    %ebx
f0104c9e:	5e                   	pop    %esi
f0104c9f:	5d                   	pop    %ebp
f0104ca0:	c3                   	ret
f0104ca1:	83 ce 05             	or     $0x5,%esi
f0104ca4:	89 f1                	mov    %esi,%ecx
f0104ca6:	89 da                	mov    %ebx,%edx
f0104ca8:	8b 45 f4             	mov    -0xc(%ebp),%eax
f0104cab:	e8 6b ff ff ff       	call   f0104c1b <env_page_alloc>
f0104cb0:	eb e8                	jmp    f0104c9a <sys_page_alloc+0x32>
f0104cb2:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
f0104cb7:	c3                   	ret
f0104cb8:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
f0104cbd:	eb db                	jmp    f0104c9a <sys_page_alloc+0x32>

f0104cbf <env_page_map>:
f0104cbf:	55                   	push   %ebp
f0104cc0:	89 e5                	mov    %esp,%ebp
f0104cc2:	56                   	push   %esi
f0104cc3:	53                   	push   %ebx
f0104cc4:	83 ec 14             	sub    $0x14,%esp
f0104cc7:	89 cb                	mov    %ecx,%ebx
f0104cc9:	8b 75 0c             	mov    0xc(%ebp),%esi
f0104ccc:	8d 4d f4             	lea    -0xc(%ebp),%ecx
f0104ccf:	51                   	push   %ecx
f0104cd0:	52                   	push   %edx
f0104cd1:	ff 70 60             	push   0x60(%eax)
f0104cd4:	e8 ee cb ff ff       	call   f01018c7 <page_lookup>
f0104cd9:	83 c4 10             	add    $0x10,%esp
f0104cdc:	85 c0                	test   %eax,%eax
f0104cde:	74 29                	je     f0104d09 <env_page_map+0x4a>
f0104ce0:	89 c2                	mov    %eax,%edx
f0104ce2:	8b 45 f4             	mov    -0xc(%ebp),%eax
f0104ce5:	8b 00                	mov    (%eax),%eax
f0104ce7:	83 e0 02             	and    $0x2,%eax
f0104cea:	f7 d0                	not    %eax
f0104cec:	21 f0                	and    %esi,%eax
f0104cee:	a8 02                	test   $0x2,%al
f0104cf0:	75 1e                	jne    f0104d10 <env_page_map+0x51>
f0104cf2:	56                   	push   %esi
f0104cf3:	ff 75 08             	push   0x8(%ebp)
f0104cf6:	52                   	push   %edx
f0104cf7:	ff 73 60             	push   0x60(%ebx)
f0104cfa:	e8 58 cd ff ff       	call   f0101a57 <page_insert>
f0104cff:	83 c4 10             	add    $0x10,%esp
f0104d02:	8d 65 f8             	lea    -0x8(%ebp),%esp
f0104d05:	5b                   	pop    %ebx
f0104d06:	5e                   	pop    %esi
f0104d07:	5d                   	pop    %ebp
f0104d08:	c3                   	ret
f0104d09:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
f0104d0e:	eb f2                	jmp    f0104d02 <env_page_map+0x43>
f0104d10:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
f0104d15:	eb eb                	jmp    f0104d02 <env_page_map+0x43>

f0104d17 <sys_page_map>:
f0104d17:	55                   	push   %ebp
f0104d18:	89 e5                	mov    %esp,%ebp
f0104d1a:	57                   	push   %edi
f0104d1b:	56                   	push   %esi
f0104d1c:	53                   	push   %ebx
f0104d1d:	83 ec 1c             	sub    $0x1c,%esp
f0104d20:	8b 7d 08             	mov    0x8(%ebp),%edi
f0104d23:	81 fa ff ff bf ee    	cmp    $0xeebfffff,%edx
f0104d29:	77 6d                	ja     f0104d98 <sys_page_map+0x81>
f0104d2b:	89 d3                	mov    %edx,%ebx
f0104d2d:	89 ce                	mov    %ecx,%esi
f0104d2f:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
f0104d35:	75 68                	jne    f0104d9f <sys_page_map+0x88>
f0104d37:	81 ff ff ff bf ee    	cmp    $0xeebfffff,%edi
f0104d3d:	77 67                	ja     f0104da6 <sys_page_map+0x8f>
f0104d3f:	f7 c7 ff 0f 00 00    	test   $0xfff,%edi
f0104d45:	75 66                	jne    f0104dad <sys_page_map+0x96>
f0104d47:	83 ec 04             	sub    $0x4,%esp
f0104d4a:	6a 01                	push   $0x1
f0104d4c:	8d 55 e4             	lea    -0x1c(%ebp),%edx
f0104d4f:	52                   	push   %edx
f0104d50:	50                   	push   %eax
f0104d51:	e8 61 e3 ff ff       	call   f01030b7 <envid2env>
f0104d56:	83 c4 10             	add    $0x10,%esp
f0104d59:	85 c0                	test   %eax,%eax
f0104d5b:	74 08                	je     f0104d65 <sys_page_map+0x4e>
f0104d5d:	8d 65 f4             	lea    -0xc(%ebp),%esp
f0104d60:	5b                   	pop    %ebx
f0104d61:	5e                   	pop    %esi
f0104d62:	5f                   	pop    %edi
f0104d63:	5d                   	pop    %ebp
f0104d64:	c3                   	ret
f0104d65:	83 ec 04             	sub    $0x4,%esp
f0104d68:	6a 01                	push   $0x1
f0104d6a:	8d 45 e0             	lea    -0x20(%ebp),%eax
f0104d6d:	50                   	push   %eax
f0104d6e:	56                   	push   %esi
f0104d6f:	e8 43 e3 ff ff       	call   f01030b7 <envid2env>
f0104d74:	83 c4 10             	add    $0x10,%esp
f0104d77:	85 c0                	test   %eax,%eax
f0104d79:	75 e2                	jne    f0104d5d <sys_page_map+0x46>
f0104d7b:	83 ec 08             	sub    $0x8,%esp
f0104d7e:	8b 45 0c             	mov    0xc(%ebp),%eax
f0104d81:	83 c8 05             	or     $0x5,%eax
f0104d84:	50                   	push   %eax
f0104d85:	57                   	push   %edi
f0104d86:	8b 4d e0             	mov    -0x20(%ebp),%ecx
f0104d89:	89 da                	mov    %ebx,%edx
f0104d8b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f0104d8e:	e8 2c ff ff ff       	call   f0104cbf <env_page_map>
f0104d93:	83 c4 10             	add    $0x10,%esp
f0104d96:	eb c5                	jmp    f0104d5d <sys_page_map+0x46>
f0104d98:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
f0104d9d:	eb be                	jmp    f0104d5d <sys_page_map+0x46>
f0104d9f:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
f0104da4:	eb b7                	jmp    f0104d5d <sys_page_map+0x46>
f0104da6:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
f0104dab:	eb b0                	jmp    f0104d5d <sys_page_map+0x46>
f0104dad:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
f0104db2:	eb a9                	jmp    f0104d5d <sys_page_map+0x46>

f0104db4 <sys_ipc_try_send>:
f0104db4:	55                   	push   %ebp
f0104db5:	89 e5                	mov    %esp,%ebp
f0104db7:	57                   	push   %edi
f0104db8:	56                   	push   %esi
f0104db9:	53                   	push   %ebx
f0104dba:	83 ec 30             	sub    $0x30,%esp
f0104dbd:	89 d7                	mov    %edx,%edi
f0104dbf:	89 ce                	mov    %ecx,%esi
f0104dc1:	6a 00                	push   $0x0
f0104dc3:	8d 55 e4             	lea    -0x1c(%ebp),%edx
f0104dc6:	52                   	push   %edx
f0104dc7:	50                   	push   %eax
f0104dc8:	e8 ea e2 ff ff       	call   f01030b7 <envid2env>
f0104dcd:	89 c3                	mov    %eax,%ebx
f0104dcf:	83 c4 10             	add    $0x10,%esp
f0104dd2:	85 c0                	test   %eax,%eax
f0104dd4:	0f 85 93 00 00 00    	jne    f0104e6d <sys_ipc_try_send+0xb9>
f0104dda:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f0104ddd:	80 78 68 00          	cmpb   $0x0,0x68(%eax)
f0104de1:	0f 84 90 00 00 00    	je     f0104e77 <sys_ipc_try_send+0xc3>
f0104de7:	81 fe ff ff bf ee    	cmp    $0xeebfffff,%esi
f0104ded:	77 4b                	ja     f0104e3a <sys_ipc_try_send+0x86>
f0104def:	f7 c6 ff 0f 00 00    	test   $0xfff,%esi
f0104df5:	0f 85 83 00 00 00    	jne    f0104e7e <sys_ipc_try_send+0xca>
f0104dfb:	e8 fc 14 00 00       	call   f01062fc <cpunum>
f0104e00:	83 ec 04             	sub    $0x4,%esp
f0104e03:	8d 55 e0             	lea    -0x20(%ebp),%edx
f0104e06:	52                   	push   %edx
f0104e07:	56                   	push   %esi
f0104e08:	6b c0 74             	imul   $0x74,%eax,%eax
f0104e0b:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f0104e11:	ff 70 60             	push   0x60(%eax)
f0104e14:	e8 ae ca ff ff       	call   f01018c7 <page_lookup>
f0104e19:	8b 45 e0             	mov    -0x20(%ebp),%eax
f0104e1c:	8b 00                	mov    (%eax),%eax
f0104e1e:	83 c4 10             	add    $0x10,%esp
f0104e21:	85 c0                	test   %eax,%eax
f0104e23:	74 76                	je     f0104e9b <sys_ipc_try_send+0xe7>
f0104e25:	a8 01                	test   $0x1,%al
f0104e27:	74 5c                	je     f0104e85 <sys_ipc_try_send+0xd1>
f0104e29:	f6 45 08 02          	testb  $0x2,0x8(%ebp)
f0104e2d:	74 72                	je     f0104ea1 <sys_ipc_try_send+0xed>
f0104e2f:	a8 02                	test   $0x2,%al
f0104e31:	75 6e                	jne    f0104ea1 <sys_ipc_try_send+0xed>
f0104e33:	bb fd ff ff ff       	mov    $0xfffffffd,%ebx
f0104e38:	eb 33                	jmp    f0104e6d <sys_ipc_try_send+0xb9>
f0104e3a:	c7 40 78 00 00 00 00 	movl   $0x0,0x78(%eax)
f0104e41:	e8 b6 14 00 00       	call   f01062fc <cpunum>
f0104e46:	8b 55 e4             	mov    -0x1c(%ebp),%edx
f0104e49:	6b c0 74             	imul   $0x74,%eax,%eax
f0104e4c:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f0104e52:	8b 40 48             	mov    0x48(%eax),%eax
f0104e55:	89 42 74             	mov    %eax,0x74(%edx)
f0104e58:	c6 42 68 00          	movb   $0x0,0x68(%edx)
f0104e5c:	89 7a 70             	mov    %edi,0x70(%edx)
f0104e5f:	c7 42 1c 00 00 00 00 	movl   $0x0,0x1c(%edx)
f0104e66:	c7 42 54 02 00 00 00 	movl   $0x2,0x54(%edx)
f0104e6d:	89 d8                	mov    %ebx,%eax
f0104e6f:	8d 65 f4             	lea    -0xc(%ebp),%esp
f0104e72:	5b                   	pop    %ebx
f0104e73:	5e                   	pop    %esi
f0104e74:	5f                   	pop    %edi
f0104e75:	5d                   	pop    %ebp
f0104e76:	c3                   	ret
f0104e77:	bb f9 ff ff ff       	mov    $0xfffffff9,%ebx
f0104e7c:	eb ef                	jmp    f0104e6d <sys_ipc_try_send+0xb9>
f0104e7e:	bb fd ff ff ff       	mov    $0xfffffffd,%ebx
f0104e83:	eb e8                	jmp    f0104e6d <sys_ipc_try_send+0xb9>
f0104e85:	bb fd ff ff ff       	mov    $0xfffffffd,%ebx
f0104e8a:	eb e1                	jmp    f0104e6d <sys_ipc_try_send+0xb9>
f0104e8c:	89 c3                	mov    %eax,%ebx
f0104e8e:	eb dd                	jmp    f0104e6d <sys_ipc_try_send+0xb9>
f0104e90:	89 c3                	mov    %eax,%ebx
f0104e92:	eb d9                	jmp    f0104e6d <sys_ipc_try_send+0xb9>
f0104e94:	bb fd ff ff ff       	mov    $0xfffffffd,%ebx
f0104e99:	eb d2                	jmp    f0104e6d <sys_ipc_try_send+0xb9>
f0104e9b:	f6 45 08 02          	testb  $0x2,0x8(%ebp)
f0104e9f:	75 f3                	jne    f0104e94 <sys_ipc_try_send+0xe0>
f0104ea1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f0104ea4:	8b 50 6c             	mov    0x6c(%eax),%edx
f0104ea7:	85 d2                	test   %edx,%edx
f0104ea9:	74 96                	je     f0104e41 <sys_ipc_try_send+0x8d>
f0104eab:	8b 4d 08             	mov    0x8(%ebp),%ecx
f0104eae:	83 c9 05             	or     $0x5,%ecx
f0104eb1:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
f0104eb4:	e8 62 fd ff ff       	call   f0104c1b <env_page_alloc>
f0104eb9:	85 c0                	test   %eax,%eax
f0104ebb:	78 cf                	js     f0104e8c <sys_ipc_try_send+0xd8>
f0104ebd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f0104ec0:	89 45 d0             	mov    %eax,-0x30(%ebp)
f0104ec3:	8b 50 6c             	mov    0x6c(%eax),%edx
f0104ec6:	89 55 cc             	mov    %edx,-0x34(%ebp)
f0104ec9:	e8 2e 14 00 00       	call   f01062fc <cpunum>
f0104ece:	6b c0 74             	imul   $0x74,%eax,%eax
f0104ed1:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f0104ed7:	83 ec 08             	sub    $0x8,%esp
f0104eda:	ff 75 d4             	push   -0x2c(%ebp)
f0104edd:	ff 75 cc             	push   -0x34(%ebp)
f0104ee0:	8b 4d d0             	mov    -0x30(%ebp),%ecx
f0104ee3:	89 f2                	mov    %esi,%edx
f0104ee5:	e8 d5 fd ff ff       	call   f0104cbf <env_page_map>
f0104eea:	83 c4 10             	add    $0x10,%esp
f0104eed:	85 c0                	test   %eax,%eax
f0104eef:	78 9f                	js     f0104e90 <sys_ipc_try_send+0xdc>
f0104ef1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f0104ef4:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
f0104ef7:	89 48 78             	mov    %ecx,0x78(%eax)
f0104efa:	e9 42 ff ff ff       	jmp    f0104e41 <sys_ipc_try_send+0x8d>

f0104eff <sys_page_unmap>:
f0104eff:	55                   	push   %ebp
f0104f00:	89 e5                	mov    %esp,%ebp
f0104f02:	56                   	push   %esi
f0104f03:	53                   	push   %ebx
f0104f04:	83 ec 10             	sub    $0x10,%esp
f0104f07:	81 fa ff ff bf ee    	cmp    $0xeebfffff,%edx
f0104f0d:	77 3f                	ja     f0104f4e <sys_page_unmap+0x4f>
f0104f0f:	89 d3                	mov    %edx,%ebx
f0104f11:	f7 c2 ff 0f 00 00    	test   $0xfff,%edx
f0104f17:	75 3c                	jne    f0104f55 <sys_page_unmap+0x56>
f0104f19:	83 ec 04             	sub    $0x4,%esp
f0104f1c:	6a 01                	push   $0x1
f0104f1e:	8d 55 f4             	lea    -0xc(%ebp),%edx
f0104f21:	52                   	push   %edx
f0104f22:	50                   	push   %eax
f0104f23:	e8 8f e1 ff ff       	call   f01030b7 <envid2env>
f0104f28:	89 c6                	mov    %eax,%esi
f0104f2a:	83 c4 10             	add    $0x10,%esp
f0104f2d:	85 c0                	test   %eax,%eax
f0104f2f:	74 09                	je     f0104f3a <sys_page_unmap+0x3b>
f0104f31:	89 f0                	mov    %esi,%eax
f0104f33:	8d 65 f8             	lea    -0x8(%ebp),%esp
f0104f36:	5b                   	pop    %ebx
f0104f37:	5e                   	pop    %esi
f0104f38:	5d                   	pop    %ebp
f0104f39:	c3                   	ret
f0104f3a:	83 ec 08             	sub    $0x8,%esp
f0104f3d:	53                   	push   %ebx
f0104f3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
f0104f41:	ff 70 60             	push   0x60(%eax)
f0104f44:	e8 f6 c9 ff ff       	call   f010193f <page_remove>
f0104f49:	83 c4 10             	add    $0x10,%esp
f0104f4c:	eb e3                	jmp    f0104f31 <sys_page_unmap+0x32>
f0104f4e:	be fd ff ff ff       	mov    $0xfffffffd,%esi
f0104f53:	eb dc                	jmp    f0104f31 <sys_page_unmap+0x32>
f0104f55:	be fd ff ff ff       	mov    $0xfffffffd,%esi
f0104f5a:	eb d5                	jmp    f0104f31 <sys_page_unmap+0x32>

f0104f5c <sys_env_set_priority>:
f0104f5c:	55                   	push   %ebp
f0104f5d:	89 e5                	mov    %esp,%ebp
f0104f5f:	56                   	push   %esi
f0104f60:	53                   	push   %ebx
f0104f61:	83 ec 10             	sub    $0x10,%esp
f0104f64:	83 fa 03             	cmp    $0x3,%edx
f0104f67:	77 79                	ja     f0104fe2 <sys_env_set_priority+0x86>
f0104f69:	89 d3                	mov    %edx,%ebx
f0104f6b:	83 ec 04             	sub    $0x4,%esp
f0104f6e:	6a 00                	push   $0x0
f0104f70:	8d 55 f4             	lea    -0xc(%ebp),%edx
f0104f73:	52                   	push   %edx
f0104f74:	50                   	push   %eax
f0104f75:	e8 3d e1 ff ff       	call   f01030b7 <envid2env>
f0104f7a:	83 c4 10             	add    $0x10,%esp
f0104f7d:	85 c0                	test   %eax,%eax
f0104f7f:	75 68                	jne    f0104fe9 <sys_env_set_priority+0x8d>
f0104f81:	e8 76 13 00 00       	call   f01062fc <cpunum>
f0104f86:	8b 55 f4             	mov    -0xc(%ebp),%edx
f0104f89:	6b c0 74             	imul   $0x74,%eax,%eax
f0104f8c:	39 90 28 d0 1c f0    	cmp    %edx,-0xfe32fd8(%eax)
f0104f92:	74 16                	je     f0104faa <sys_env_set_priority+0x4e>
f0104f94:	8b 72 4c             	mov    0x4c(%edx),%esi
f0104f97:	e8 60 13 00 00       	call   f01062fc <cpunum>
f0104f9c:	6b c0 74             	imul   $0x74,%eax,%eax
f0104f9f:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f0104fa5:	3b 70 48             	cmp    0x48(%eax),%esi
f0104fa8:	75 46                	jne    f0104ff0 <sys_env_set_priority+0x94>
f0104faa:	8b 55 f4             	mov    -0xc(%ebp),%edx
f0104fad:	8b 42 7c             	mov    0x7c(%edx),%eax
f0104fb0:	39 d8                	cmp    %ebx,%eax
f0104fb2:	74 25                	je     f0104fd9 <sys_env_set_priority+0x7d>
f0104fb4:	7f 41                	jg     f0104ff7 <sys_env_set_priority+0x9b>
f0104fb6:	83 ec 0c             	sub    $0xc,%esp
f0104fb9:	ff 72 48             	push   0x48(%edx)
f0104fbc:	e8 bc f4 ff ff       	call   f010447d <sched_destroy_env>
f0104fc1:	83 c4 08             	add    $0x8,%esp
f0104fc4:	53                   	push   %ebx
f0104fc5:	8b 45 f4             	mov    -0xc(%ebp),%eax
f0104fc8:	ff 70 48             	push   0x48(%eax)
f0104fcb:	e8 21 f5 ff ff       	call   f01044f1 <sched_push_env>
f0104fd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
f0104fd3:	89 58 7c             	mov    %ebx,0x7c(%eax)
f0104fd6:	83 c4 10             	add    $0x10,%esp
f0104fd9:	89 d8                	mov    %ebx,%eax
f0104fdb:	8d 65 f8             	lea    -0x8(%ebp),%esp
f0104fde:	5b                   	pop    %ebx
f0104fdf:	5e                   	pop    %esi
f0104fe0:	5d                   	pop    %ebp
f0104fe1:	c3                   	ret
f0104fe2:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
f0104fe7:	eb f0                	jmp    f0104fd9 <sys_env_set_priority+0x7d>
f0104fe9:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
f0104fee:	eb e9                	jmp    f0104fd9 <sys_env_set_priority+0x7d>
f0104ff0:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
f0104ff5:	eb e2                	jmp    f0104fd9 <sys_env_set_priority+0x7d>
f0104ff7:	bb ff ff ff ff       	mov    $0xffffffff,%ebx
f0104ffc:	eb db                	jmp    f0104fd9 <sys_env_set_priority+0x7d>

f0104ffe <sys_yield>:
f0104ffe:	55                   	push   %ebp
f0104fff:	89 e5                	mov    %esp,%ebp
f0105001:	83 ec 08             	sub    $0x8,%esp
f0105004:	e8 cd f8 ff ff       	call   f01048d6 <sched_yield>

f0105009 <sys_ipc_recv>:
f0105009:	55                   	push   %ebp
f010500a:	89 e5                	mov    %esp,%ebp
f010500c:	53                   	push   %ebx
f010500d:	83 ec 04             	sub    $0x4,%esp
f0105010:	89 c3                	mov    %eax,%ebx
f0105012:	e8 e5 12 00 00       	call   f01062fc <cpunum>
f0105017:	6b c0 74             	imul   $0x74,%eax,%eax
f010501a:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f0105020:	c6 40 68 01          	movb   $0x1,0x68(%eax)
f0105024:	81 fb ff ff bf ee    	cmp    $0xeebfffff,%ebx
f010502a:	77 08                	ja     f0105034 <sys_ipc_recv+0x2b>
f010502c:	f7 c3 ff 0f 00 00    	test   $0xfff,%ebx
f0105032:	74 0a                	je     f010503e <sys_ipc_recv+0x35>
f0105034:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
f0105039:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f010503c:	c9                   	leave
f010503d:	c3                   	ret
f010503e:	e8 b9 12 00 00       	call   f01062fc <cpunum>
f0105043:	6b c0 74             	imul   $0x74,%eax,%eax
f0105046:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f010504c:	89 58 6c             	mov    %ebx,0x6c(%eax)
f010504f:	e8 a8 12 00 00       	call   f01062fc <cpunum>
f0105054:	6b c0 74             	imul   $0x74,%eax,%eax
f0105057:	8b 80 28 d0 1c f0    	mov    -0xfe32fd8(%eax),%eax
f010505d:	c7 40 54 04 00 00 00 	movl   $0x4,0x54(%eax)
f0105064:	e8 95 ff ff ff       	call   f0104ffe <sys_yield>

f0105069 <syscall>:
f0105069:	55                   	push   %ebp
f010506a:	89 e5                	mov    %esp,%ebp
f010506c:	83 ec 08             	sub    $0x8,%esp
f010506f:	8b 45 08             	mov    0x8(%ebp),%eax
f0105072:	83 f8 0f             	cmp    $0xf,%eax
f0105075:	0f 87 d6 00 00 00    	ja     f0105151 <syscall+0xe8>
f010507b:	ff 24 85 30 85 10 f0 	jmp    *-0xfef7ad0(,%eax,4)
f0105082:	8b 55 10             	mov    0x10(%ebp),%edx
f0105085:	8b 45 0c             	mov    0xc(%ebp),%eax
f0105088:	e8 b8 f9 ff ff       	call   f0104a45 <sys_cputs>
f010508d:	b8 00 00 00 00       	mov    $0x0,%eax
f0105092:	c9                   	leave
f0105093:	c3                   	ret
f0105094:	e8 93 f9 ff ff       	call   f0104a2c <sys_getenvid>
f0105099:	eb f7                	jmp    f0105092 <syscall+0x29>
f010509b:	8b 45 0c             	mov    0xc(%ebp),%eax
f010509e:	e8 7b fa ff ff       	call   f0104b1e <sys_env_destroy>
f01050a3:	eb ed                	jmp    f0105092 <syscall+0x29>
f01050a5:	e8 01 fb ff ff       	call   f0104bab <sys_cgetc>
f01050aa:	eb e6                	jmp    f0105092 <syscall+0x29>
f01050ac:	e8 07 fb ff ff       	call   f0104bb8 <sys_exofork>
f01050b1:	eb df                	jmp    f0105092 <syscall+0x29>
f01050b3:	8b 55 10             	mov    0x10(%ebp),%edx
f01050b6:	8b 45 0c             	mov    0xc(%ebp),%eax
f01050b9:	e8 c0 f9 ff ff       	call   f0104a7e <sys_env_set_status>
f01050be:	eb d2                	jmp    f0105092 <syscall+0x29>
f01050c0:	8b 4d 14             	mov    0x14(%ebp),%ecx
f01050c3:	8b 55 10             	mov    0x10(%ebp),%edx
f01050c6:	8b 45 0c             	mov    0xc(%ebp),%eax
f01050c9:	e8 9a fb ff ff       	call   f0104c68 <sys_page_alloc>
f01050ce:	eb c2                	jmp    f0105092 <syscall+0x29>
f01050d0:	83 ec 08             	sub    $0x8,%esp
f01050d3:	ff 75 1c             	push   0x1c(%ebp)
f01050d6:	ff 75 18             	push   0x18(%ebp)
f01050d9:	8b 4d 14             	mov    0x14(%ebp),%ecx
f01050dc:	8b 55 10             	mov    0x10(%ebp),%edx
f01050df:	8b 45 0c             	mov    0xc(%ebp),%eax
f01050e2:	e8 30 fc ff ff       	call   f0104d17 <sys_page_map>
f01050e7:	83 c4 10             	add    $0x10,%esp
f01050ea:	eb a6                	jmp    f0105092 <syscall+0x29>
f01050ec:	8b 55 10             	mov    0x10(%ebp),%edx
f01050ef:	8b 45 0c             	mov    0xc(%ebp),%eax
f01050f2:	e8 08 fe ff ff       	call   f0104eff <sys_page_unmap>
f01050f7:	eb 99                	jmp    f0105092 <syscall+0x29>
f01050f9:	8b 45 0c             	mov    0xc(%ebp),%eax
f01050fc:	e8 08 ff ff ff       	call   f0105009 <sys_ipc_recv>
f0105101:	eb 8f                	jmp    f0105092 <syscall+0x29>
f0105103:	83 ec 0c             	sub    $0xc,%esp
f0105106:	ff 75 18             	push   0x18(%ebp)
f0105109:	8b 4d 14             	mov    0x14(%ebp),%ecx
f010510c:	8b 55 10             	mov    0x10(%ebp),%edx
f010510f:	8b 45 0c             	mov    0xc(%ebp),%eax
f0105112:	e8 9d fc ff ff       	call   f0104db4 <sys_ipc_try_send>
f0105117:	83 c4 10             	add    $0x10,%esp
f010511a:	e9 73 ff ff ff       	jmp    f0105092 <syscall+0x29>
f010511f:	8b 55 10             	mov    0x10(%ebp),%edx
f0105122:	8b 45 0c             	mov    0xc(%ebp),%eax
f0105125:	e8 90 f9 ff ff       	call   f0104aba <sys_env_set_pgfault_upcall>
f010512a:	e9 63 ff ff ff       	jmp    f0105092 <syscall+0x29>
f010512f:	8b 45 0c             	mov    0xc(%ebp),%eax
f0105132:	e8 c6 f9 ff ff       	call   f0104afd <sys_get_priority_from_envid>
f0105137:	e9 56 ff ff ff       	jmp    f0105092 <syscall+0x29>
f010513c:	8b 55 10             	mov    0x10(%ebp),%edx
f010513f:	8b 45 0c             	mov    0xc(%ebp),%eax
f0105142:	e8 15 fe ff ff       	call   f0104f5c <sys_env_set_priority>
f0105147:	e9 46 ff ff ff       	jmp    f0105092 <syscall+0x29>
f010514c:	e8 ad fe ff ff       	call   f0104ffe <sys_yield>
f0105151:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
f0105156:	e9 37 ff ff ff       	jmp    f0105092 <syscall+0x29>

f010515b <stab_binsearch>:
f010515b:	55                   	push   %ebp
f010515c:	89 e5                	mov    %esp,%ebp
f010515e:	57                   	push   %edi
f010515f:	56                   	push   %esi
f0105160:	53                   	push   %ebx
f0105161:	83 ec 14             	sub    $0x14,%esp
f0105164:	89 45 f0             	mov    %eax,-0x10(%ebp)
f0105167:	89 55 e4             	mov    %edx,-0x1c(%ebp)
f010516a:	89 4d e0             	mov    %ecx,-0x20(%ebp)
f010516d:	8b 1a                	mov    (%edx),%ebx
f010516f:	8b 09                	mov    (%ecx),%ecx
f0105171:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
f0105178:	eb 4f                	jmp    f01051c9 <stab_binsearch+0x6e>
f010517a:	83 e8 01             	sub    $0x1,%eax
f010517d:	39 c3                	cmp    %eax,%ebx
f010517f:	0f 8f cc 00 00 00    	jg     f0105251 <stab_binsearch+0xf6>
f0105185:	0f b6 0a             	movzbl (%edx),%ecx
f0105188:	83 ea 0c             	sub    $0xc,%edx
f010518b:	39 f1                	cmp    %esi,%ecx
f010518d:	75 eb                	jne    f010517a <stab_binsearch+0x1f>
f010518f:	8b 4d ec             	mov    -0x14(%ebp),%ecx
f0105192:	89 75 08             	mov    %esi,0x8(%ebp)
f0105195:	8d 14 40             	lea    (%eax,%eax,2),%edx
f0105198:	8b 75 f0             	mov    -0x10(%ebp),%esi
f010519b:	8b 54 96 08          	mov    0x8(%esi,%edx,4),%edx
f010519f:	3b 55 0c             	cmp    0xc(%ebp),%edx
f01051a2:	72 16                	jb     f01051ba <stab_binsearch+0x5f>
f01051a4:	39 55 0c             	cmp    %edx,0xc(%ebp)
f01051a7:	73 48                	jae    f01051f1 <stab_binsearch+0x96>
f01051a9:	8d 48 ff             	lea    -0x1(%eax),%ecx
f01051ac:	8b 45 e0             	mov    -0x20(%ebp),%eax
f01051af:	89 08                	mov    %ecx,(%eax)
f01051b1:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
f01051b8:	eb 0f                	jmp    f01051c9 <stab_binsearch+0x6e>
f01051ba:	8b 75 e4             	mov    -0x1c(%ebp),%esi
f01051bd:	89 06                	mov    %eax,(%esi)
f01051bf:	8d 5f 01             	lea    0x1(%edi),%ebx
f01051c2:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
f01051c9:	39 cb                	cmp    %ecx,%ebx
f01051cb:	7f 38                	jg     f0105205 <stab_binsearch+0xaa>
f01051cd:	8d 04 0b             	lea    (%ebx,%ecx,1),%eax
f01051d0:	89 c2                	mov    %eax,%edx
f01051d2:	c1 ea 1f             	shr    $0x1f,%edx
f01051d5:	01 d0                	add    %edx,%eax
f01051d7:	89 c7                	mov    %eax,%edi
f01051d9:	d1 ff                	sar    $1,%edi
f01051db:	83 e0 fe             	and    $0xfffffffe,%eax
f01051de:	01 f8                	add    %edi,%eax
f01051e0:	8b 55 f0             	mov    -0x10(%ebp),%edx
f01051e3:	8d 54 82 04          	lea    0x4(%edx,%eax,4),%edx
f01051e7:	89 f8                	mov    %edi,%eax
f01051e9:	89 4d ec             	mov    %ecx,-0x14(%ebp)
f01051ec:	8b 75 08             	mov    0x8(%ebp),%esi
f01051ef:	eb 8c                	jmp    f010517d <stab_binsearch+0x22>
f01051f1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f01051f4:	89 07                	mov    %eax,(%edi)
f01051f6:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
f01051fa:	89 c3                	mov    %eax,%ebx
f01051fc:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
f0105203:	eb c4                	jmp    f01051c9 <stab_binsearch+0x6e>
f0105205:	8b 75 08             	mov    0x8(%ebp),%esi
f0105208:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
f010520c:	75 15                	jne    f0105223 <stab_binsearch+0xc8>
f010520e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f0105211:	8b 00                	mov    (%eax),%eax
f0105213:	83 e8 01             	sub    $0x1,%eax
f0105216:	8b 7d e0             	mov    -0x20(%ebp),%edi
f0105219:	89 07                	mov    %eax,(%edi)
f010521b:	83 c4 14             	add    $0x14,%esp
f010521e:	5b                   	pop    %ebx
f010521f:	5e                   	pop    %esi
f0105220:	5f                   	pop    %edi
f0105221:	5d                   	pop    %ebp
f0105222:	c3                   	ret
f0105223:	8b 45 e0             	mov    -0x20(%ebp),%eax
f0105226:	8b 00                	mov    (%eax),%eax
f0105228:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f010522b:	8b 0f                	mov    (%edi),%ecx
f010522d:	8d 14 40             	lea    (%eax,%eax,2),%edx
f0105230:	8b 7d f0             	mov    -0x10(%ebp),%edi
f0105233:	8d 54 97 04          	lea    0x4(%edi,%edx,4),%edx
f0105237:	39 c1                	cmp    %eax,%ecx
f0105239:	7d 0f                	jge    f010524a <stab_binsearch+0xef>
f010523b:	0f b6 1a             	movzbl (%edx),%ebx
f010523e:	83 ea 0c             	sub    $0xc,%edx
f0105241:	39 f3                	cmp    %esi,%ebx
f0105243:	74 05                	je     f010524a <stab_binsearch+0xef>
f0105245:	83 e8 01             	sub    $0x1,%eax
f0105248:	eb ed                	jmp    f0105237 <stab_binsearch+0xdc>
f010524a:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f010524d:	89 07                	mov    %eax,(%edi)
f010524f:	eb ca                	jmp    f010521b <stab_binsearch+0xc0>
f0105251:	8b 4d ec             	mov    -0x14(%ebp),%ecx
f0105254:	89 75 08             	mov    %esi,0x8(%ebp)
f0105257:	8d 5f 01             	lea    0x1(%edi),%ebx
f010525a:	e9 6a ff ff ff       	jmp    f01051c9 <stab_binsearch+0x6e>

f010525f <debuginfo_eip>:
f010525f:	55                   	push   %ebp
f0105260:	89 e5                	mov    %esp,%ebp
f0105262:	57                   	push   %edi
f0105263:	56                   	push   %esi
f0105264:	53                   	push   %ebx
f0105265:	83 ec 3c             	sub    $0x3c,%esp
f0105268:	8b 45 0c             	mov    0xc(%ebp),%eax
f010526b:	c7 00 43 81 10 f0    	movl   $0xf0108143,(%eax)
f0105271:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
f0105278:	c7 40 08 43 81 10 f0 	movl   $0xf0108143,0x8(%eax)
f010527f:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
f0105286:	8b 7d 08             	mov    0x8(%ebp),%edi
f0105289:	89 78 10             	mov    %edi,0x10(%eax)
f010528c:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)
f0105293:	81 ff ff ff 7f ef    	cmp    $0xef7fffff,%edi
f0105299:	0f 86 35 01 00 00    	jbe    f01053d4 <debuginfo_eip+0x175>
f010529f:	c7 45 c0 05 87 10 f0 	movl   $0xf0108705,-0x40(%ebp)
f01052a6:	c7 45 bc 05 87 10 f0 	movl   $0xf0108705,-0x44(%ebp)
f01052ad:	be 04 87 10 f0       	mov    $0xf0108704,%esi
f01052b2:	c7 45 c4 04 87 10 f0 	movl   $0xf0108704,-0x3c(%ebp)
f01052b9:	8b 4d c0             	mov    -0x40(%ebp),%ecx
f01052bc:	39 4d bc             	cmp    %ecx,-0x44(%ebp)
f01052bf:	0f 83 4c 02 00 00    	jae    f0105511 <debuginfo_eip+0x2b2>
f01052c5:	80 79 ff 00          	cmpb   $0x0,-0x1(%ecx)
f01052c9:	0f 85 49 02 00 00    	jne    f0105518 <debuginfo_eip+0x2b9>
f01052cf:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
f01052d6:	8b 7d c4             	mov    -0x3c(%ebp),%edi
f01052d9:	29 fe                	sub    %edi,%esi
f01052db:	c1 fe 02             	sar    $0x2,%esi
f01052de:	69 c6 ab aa aa aa    	imul   $0xaaaaaaab,%esi,%eax
f01052e4:	83 e8 01             	sub    $0x1,%eax
f01052e7:	89 45 e0             	mov    %eax,-0x20(%ebp)
f01052ea:	83 ec 08             	sub    $0x8,%esp
f01052ed:	ff 75 08             	push   0x8(%ebp)
f01052f0:	6a 64                	push   $0x64
f01052f2:	8d 45 e0             	lea    -0x20(%ebp),%eax
f01052f5:	89 c1                	mov    %eax,%ecx
f01052f7:	8d 55 e4             	lea    -0x1c(%ebp),%edx
f01052fa:	89 f8                	mov    %edi,%eax
f01052fc:	e8 5a fe ff ff       	call   f010515b <stab_binsearch>
f0105301:	8b 75 e4             	mov    -0x1c(%ebp),%esi
f0105304:	83 c4 10             	add    $0x10,%esp
f0105307:	85 f6                	test   %esi,%esi
f0105309:	0f 84 10 02 00 00    	je     f010551f <debuginfo_eip+0x2c0>
f010530f:	89 75 dc             	mov    %esi,-0x24(%ebp)
f0105312:	8b 5d e0             	mov    -0x20(%ebp),%ebx
f0105315:	89 5d d8             	mov    %ebx,-0x28(%ebp)
f0105318:	83 ec 08             	sub    $0x8,%esp
f010531b:	ff 75 08             	push   0x8(%ebp)
f010531e:	6a 24                	push   $0x24
f0105320:	8d 45 d8             	lea    -0x28(%ebp),%eax
f0105323:	89 c1                	mov    %eax,%ecx
f0105325:	8d 55 dc             	lea    -0x24(%ebp),%edx
f0105328:	89 7d c4             	mov    %edi,-0x3c(%ebp)
f010532b:	89 f8                	mov    %edi,%eax
f010532d:	e8 29 fe ff ff       	call   f010515b <stab_binsearch>
f0105332:	8b 55 dc             	mov    -0x24(%ebp),%edx
f0105335:	89 55 b8             	mov    %edx,-0x48(%ebp)
f0105338:	8b 7d d8             	mov    -0x28(%ebp),%edi
f010533b:	83 c4 10             	add    $0x10,%esp
f010533e:	39 fa                	cmp    %edi,%edx
f0105340:	0f 8f 38 01 00 00    	jg     f010547e <debuginfo_eip+0x21f>
f0105346:	8d 04 52             	lea    (%edx,%edx,2),%eax
f0105349:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
f010534c:	8d 14 83             	lea    (%ebx,%eax,4),%edx
f010534f:	8b 02                	mov    (%edx),%eax
f0105351:	8b 4d c0             	mov    -0x40(%ebp),%ecx
f0105354:	8b 5d bc             	mov    -0x44(%ebp),%ebx
f0105357:	29 d9                	sub    %ebx,%ecx
f0105359:	39 c8                	cmp    %ecx,%eax
f010535b:	73 08                	jae    f0105365 <debuginfo_eip+0x106>
f010535d:	01 d8                	add    %ebx,%eax
f010535f:	8b 5d 0c             	mov    0xc(%ebp),%ebx
f0105362:	89 43 08             	mov    %eax,0x8(%ebx)
f0105365:	8b 42 08             	mov    0x8(%edx),%eax
f0105368:	29 45 08             	sub    %eax,0x8(%ebp)
f010536b:	8b 55 b8             	mov    -0x48(%ebp),%edx
f010536e:	89 fb                	mov    %edi,%ebx
f0105370:	8b 4d 0c             	mov    0xc(%ebp),%ecx
f0105373:	89 41 10             	mov    %eax,0x10(%ecx)
f0105376:	89 55 d4             	mov    %edx,-0x2c(%ebp)
f0105379:	89 5d d0             	mov    %ebx,-0x30(%ebp)
f010537c:	83 ec 08             	sub    $0x8,%esp
f010537f:	6a 3a                	push   $0x3a
f0105381:	ff 71 08             	push   0x8(%ecx)
f0105384:	e8 f2 08 00 00       	call   f0105c7b <strfind>
f0105389:	8b 5d 0c             	mov    0xc(%ebp),%ebx
f010538c:	2b 43 08             	sub    0x8(%ebx),%eax
f010538f:	89 43 0c             	mov    %eax,0xc(%ebx)
f0105392:	83 c4 08             	add    $0x8,%esp
f0105395:	ff 75 08             	push   0x8(%ebp)
f0105398:	6a 44                	push   $0x44
f010539a:	8d 4d d0             	lea    -0x30(%ebp),%ecx
f010539d:	8d 55 d4             	lea    -0x2c(%ebp),%edx
f01053a0:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
f01053a3:	89 d8                	mov    %ebx,%eax
f01053a5:	e8 b1 fd ff ff       	call   f010515b <stab_binsearch>
f01053aa:	8b 45 d4             	mov    -0x2c(%ebp),%eax
f01053ad:	83 c4 10             	add    $0x10,%esp
f01053b0:	3b 45 d0             	cmp    -0x30(%ebp),%eax
f01053b3:	7f 0e                	jg     f01053c3 <debuginfo_eip+0x164>
f01053b5:	8d 14 40             	lea    (%eax,%eax,2),%edx
f01053b8:	0f b7 54 93 06       	movzwl 0x6(%ebx,%edx,4),%edx
f01053bd:	8b 5d 0c             	mov    0xc(%ebp),%ebx
f01053c0:	89 53 04             	mov    %edx,0x4(%ebx)
f01053c3:	89 c2                	mov    %eax,%edx
f01053c5:	8d 04 40             	lea    (%eax,%eax,2),%eax
f01053c8:	8b 5d c4             	mov    -0x3c(%ebp),%ebx
f01053cb:	8d 44 83 04          	lea    0x4(%ebx,%eax,4),%eax
f01053cf:	e9 ba 00 00 00       	jmp    f010548e <debuginfo_eip+0x22f>
f01053d4:	e8 23 0f 00 00       	call   f01062fc <cpunum>
f01053d9:	6a 00                	push   $0x0
f01053db:	6a 10                	push   $0x10
f01053dd:	68 00 00 20 00       	push   $0x200000
f01053e2:	6b c0 74             	imul   $0x74,%eax,%eax
f01053e5:	ff b0 28 d0 1c f0    	push   -0xfe32fd8(%eax)
f01053eb:	e8 2e d9 ff ff       	call   f0102d1e <user_mem_check>
f01053f0:	83 c4 10             	add    $0x10,%esp
f01053f3:	85 c0                	test   %eax,%eax
f01053f5:	0f 85 08 01 00 00    	jne    f0105503 <debuginfo_eip+0x2a4>
f01053fb:	8b 3d 00 00 20 00    	mov    0x200000,%edi
f0105401:	89 7d c4             	mov    %edi,-0x3c(%ebp)
f0105404:	8b 35 04 00 20 00    	mov    0x200004,%esi
f010540a:	8b 1d 08 00 20 00    	mov    0x200008,%ebx
f0105410:	89 5d bc             	mov    %ebx,-0x44(%ebp)
f0105413:	8b 15 0c 00 20 00    	mov    0x20000c,%edx
f0105419:	89 55 c0             	mov    %edx,-0x40(%ebp)
f010541c:	e8 db 0e 00 00       	call   f01062fc <cpunum>
f0105421:	89 c2                	mov    %eax,%edx
f0105423:	6a 00                	push   $0x0
f0105425:	89 f0                	mov    %esi,%eax
f0105427:	29 f8                	sub    %edi,%eax
f0105429:	c1 f8 02             	sar    $0x2,%eax
f010542c:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
f0105432:	50                   	push   %eax
f0105433:	57                   	push   %edi
f0105434:	6b d2 74             	imul   $0x74,%edx,%edx
f0105437:	ff b2 28 d0 1c f0    	push   -0xfe32fd8(%edx)
f010543d:	e8 dc d8 ff ff       	call   f0102d1e <user_mem_check>
f0105442:	83 c4 10             	add    $0x10,%esp
f0105445:	85 c0                	test   %eax,%eax
f0105447:	0f 85 bd 00 00 00    	jne    f010550a <debuginfo_eip+0x2ab>
f010544d:	e8 aa 0e 00 00       	call   f01062fc <cpunum>
f0105452:	6a 00                	push   $0x0
f0105454:	8b 55 c0             	mov    -0x40(%ebp),%edx
f0105457:	29 da                	sub    %ebx,%edx
f0105459:	52                   	push   %edx
f010545a:	53                   	push   %ebx
f010545b:	6b c0 74             	imul   $0x74,%eax,%eax
f010545e:	ff b0 28 d0 1c f0    	push   -0xfe32fd8(%eax)
f0105464:	e8 b5 d8 ff ff       	call   f0102d1e <user_mem_check>
f0105469:	83 c4 10             	add    $0x10,%esp
f010546c:	85 c0                	test   %eax,%eax
f010546e:	0f 84 45 fe ff ff    	je     f01052b9 <debuginfo_eip+0x5a>
f0105474:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
f0105479:	e9 ad 00 00 00       	jmp    f010552b <debuginfo_eip+0x2cc>
f010547e:	8b 45 08             	mov    0x8(%ebp),%eax
f0105481:	89 f2                	mov    %esi,%edx
f0105483:	e9 e8 fe ff ff       	jmp    f0105370 <debuginfo_eip+0x111>
f0105488:	83 ea 01             	sub    $0x1,%edx
f010548b:	83 e8 0c             	sub    $0xc,%eax
f010548e:	39 d6                	cmp    %edx,%esi
f0105490:	7f 34                	jg     f01054c6 <debuginfo_eip+0x267>
f0105492:	0f b6 08             	movzbl (%eax),%ecx
f0105495:	80 f9 84             	cmp    $0x84,%cl
f0105498:	74 0b                	je     f01054a5 <debuginfo_eip+0x246>
f010549a:	80 f9 64             	cmp    $0x64,%cl
f010549d:	75 e9                	jne    f0105488 <debuginfo_eip+0x229>
f010549f:	83 78 04 00          	cmpl   $0x0,0x4(%eax)
f01054a3:	74 e3                	je     f0105488 <debuginfo_eip+0x229>
f01054a5:	8d 04 52             	lea    (%edx,%edx,2),%eax
f01054a8:	8b 75 c4             	mov    -0x3c(%ebp),%esi
f01054ab:	8b 14 86             	mov    (%esi,%eax,4),%edx
f01054ae:	8b 45 c0             	mov    -0x40(%ebp),%eax
f01054b1:	8b 75 bc             	mov    -0x44(%ebp),%esi
f01054b4:	29 f0                	sub    %esi,%eax
f01054b6:	39 c2                	cmp    %eax,%edx
f01054b8:	73 0c                	jae    f01054c6 <debuginfo_eip+0x267>
f01054ba:	8b 45 bc             	mov    -0x44(%ebp),%eax
f01054bd:	01 d0                	add    %edx,%eax
f01054bf:	89 c2                	mov    %eax,%edx
f01054c1:	8b 45 0c             	mov    0xc(%ebp),%eax
f01054c4:	89 10                	mov    %edx,(%eax)
f01054c6:	b8 00 00 00 00       	mov    $0x0,%eax
f01054cb:	8b 75 b8             	mov    -0x48(%ebp),%esi
f01054ce:	39 fe                	cmp    %edi,%esi
f01054d0:	7d 59                	jge    f010552b <debuginfo_eip+0x2cc>
f01054d2:	89 f0                	mov    %esi,%eax
f01054d4:	83 c0 01             	add    $0x1,%eax
f01054d7:	8d 14 40             	lea    (%eax,%eax,2),%edx
f01054da:	8b 75 c4             	mov    -0x3c(%ebp),%esi
f01054dd:	8d 54 96 04          	lea    0x4(%esi,%edx,4),%edx
f01054e1:	8b 5d 0c             	mov    0xc(%ebp),%ebx
f01054e4:	eb 04                	jmp    f01054ea <debuginfo_eip+0x28b>
f01054e6:	83 43 14 01          	addl   $0x1,0x14(%ebx)
f01054ea:	39 c7                	cmp    %eax,%edi
f01054ec:	7e 38                	jle    f0105526 <debuginfo_eip+0x2c7>
f01054ee:	0f b6 0a             	movzbl (%edx),%ecx
f01054f1:	83 c0 01             	add    $0x1,%eax
f01054f4:	83 c2 0c             	add    $0xc,%edx
f01054f7:	80 f9 a0             	cmp    $0xa0,%cl
f01054fa:	74 ea                	je     f01054e6 <debuginfo_eip+0x287>
f01054fc:	b8 00 00 00 00       	mov    $0x0,%eax
f0105501:	eb 28                	jmp    f010552b <debuginfo_eip+0x2cc>
f0105503:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
f0105508:	eb 21                	jmp    f010552b <debuginfo_eip+0x2cc>
f010550a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
f010550f:	eb 1a                	jmp    f010552b <debuginfo_eip+0x2cc>
f0105511:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
f0105516:	eb 13                	jmp    f010552b <debuginfo_eip+0x2cc>
f0105518:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
f010551d:	eb 0c                	jmp    f010552b <debuginfo_eip+0x2cc>
f010551f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
f0105524:	eb 05                	jmp    f010552b <debuginfo_eip+0x2cc>
f0105526:	b8 00 00 00 00       	mov    $0x0,%eax
f010552b:	8d 65 f4             	lea    -0xc(%ebp),%esp
f010552e:	5b                   	pop    %ebx
f010552f:	5e                   	pop    %esi
f0105530:	5f                   	pop    %edi
f0105531:	5d                   	pop    %ebp
f0105532:	c3                   	ret

f0105533 <printnum>:
f0105533:	55                   	push   %ebp
f0105534:	89 e5                	mov    %esp,%ebp
f0105536:	57                   	push   %edi
f0105537:	56                   	push   %esi
f0105538:	53                   	push   %ebx
f0105539:	83 ec 1c             	sub    $0x1c,%esp
f010553c:	89 c7                	mov    %eax,%edi
f010553e:	89 d6                	mov    %edx,%esi
f0105540:	8b 45 08             	mov    0x8(%ebp),%eax
f0105543:	8b 55 0c             	mov    0xc(%ebp),%edx
f0105546:	89 d1                	mov    %edx,%ecx
f0105548:	89 c2                	mov    %eax,%edx
f010554a:	89 45 d8             	mov    %eax,-0x28(%ebp)
f010554d:	89 4d dc             	mov    %ecx,-0x24(%ebp)
f0105550:	8b 45 10             	mov    0x10(%ebp),%eax
f0105553:	8b 5d 14             	mov    0x14(%ebp),%ebx
f0105556:	89 45 e0             	mov    %eax,-0x20(%ebp)
f0105559:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
f0105560:	39 c2                	cmp    %eax,%edx
f0105562:	1b 4d e4             	sbb    -0x1c(%ebp),%ecx
f0105565:	72 3e                	jb     f01055a5 <printnum+0x72>
f0105567:	83 ec 0c             	sub    $0xc,%esp
f010556a:	ff 75 18             	push   0x18(%ebp)
f010556d:	83 eb 01             	sub    $0x1,%ebx
f0105570:	53                   	push   %ebx
f0105571:	50                   	push   %eax
f0105572:	83 ec 08             	sub    $0x8,%esp
f0105575:	ff 75 e4             	push   -0x1c(%ebp)
f0105578:	ff 75 e0             	push   -0x20(%ebp)
f010557b:	ff 75 dc             	push   -0x24(%ebp)
f010557e:	ff 75 d8             	push   -0x28(%ebp)
f0105581:	e8 ba 11 00 00       	call   f0106740 <__udivdi3>
f0105586:	83 c4 18             	add    $0x18,%esp
f0105589:	52                   	push   %edx
f010558a:	50                   	push   %eax
f010558b:	89 f2                	mov    %esi,%edx
f010558d:	89 f8                	mov    %edi,%eax
f010558f:	e8 9f ff ff ff       	call   f0105533 <printnum>
f0105594:	83 c4 20             	add    $0x20,%esp
f0105597:	eb 13                	jmp    f01055ac <printnum+0x79>
f0105599:	83 ec 08             	sub    $0x8,%esp
f010559c:	56                   	push   %esi
f010559d:	ff 75 18             	push   0x18(%ebp)
f01055a0:	ff d7                	call   *%edi
f01055a2:	83 c4 10             	add    $0x10,%esp
f01055a5:	83 eb 01             	sub    $0x1,%ebx
f01055a8:	85 db                	test   %ebx,%ebx
f01055aa:	7f ed                	jg     f0105599 <printnum+0x66>
f01055ac:	83 ec 08             	sub    $0x8,%esp
f01055af:	56                   	push   %esi
f01055b0:	83 ec 04             	sub    $0x4,%esp
f01055b3:	ff 75 e4             	push   -0x1c(%ebp)
f01055b6:	ff 75 e0             	push   -0x20(%ebp)
f01055b9:	ff 75 dc             	push   -0x24(%ebp)
f01055bc:	ff 75 d8             	push   -0x28(%ebp)
f01055bf:	e8 9c 12 00 00       	call   f0106860 <__umoddi3>
f01055c4:	83 c4 14             	add    $0x14,%esp
f01055c7:	0f be 80 4d 81 10 f0 	movsbl -0xfef7eb3(%eax),%eax
f01055ce:	50                   	push   %eax
f01055cf:	ff d7                	call   *%edi
f01055d1:	83 c4 10             	add    $0x10,%esp
f01055d4:	8d 65 f4             	lea    -0xc(%ebp),%esp
f01055d7:	5b                   	pop    %ebx
f01055d8:	5e                   	pop    %esi
f01055d9:	5f                   	pop    %edi
f01055da:	5d                   	pop    %ebp
f01055db:	c3                   	ret

f01055dc <getuint>:
f01055dc:	83 fa 01             	cmp    $0x1,%edx
f01055df:	7f 13                	jg     f01055f4 <getuint+0x18>
f01055e1:	85 d2                	test   %edx,%edx
f01055e3:	74 1c                	je     f0105601 <getuint+0x25>
f01055e5:	8b 10                	mov    (%eax),%edx
f01055e7:	8d 4a 04             	lea    0x4(%edx),%ecx
f01055ea:	89 08                	mov    %ecx,(%eax)
f01055ec:	8b 02                	mov    (%edx),%eax
f01055ee:	ba 00 00 00 00       	mov    $0x0,%edx
f01055f3:	c3                   	ret
f01055f4:	8b 10                	mov    (%eax),%edx
f01055f6:	8d 4a 08             	lea    0x8(%edx),%ecx
f01055f9:	89 08                	mov    %ecx,(%eax)
f01055fb:	8b 02                	mov    (%edx),%eax
f01055fd:	8b 52 04             	mov    0x4(%edx),%edx
f0105600:	c3                   	ret
f0105601:	8b 10                	mov    (%eax),%edx
f0105603:	8d 4a 04             	lea    0x4(%edx),%ecx
f0105606:	89 08                	mov    %ecx,(%eax)
f0105608:	8b 02                	mov    (%edx),%eax
f010560a:	ba 00 00 00 00       	mov    $0x0,%edx
f010560f:	c3                   	ret

f0105610 <getint>:
f0105610:	83 fa 01             	cmp    $0x1,%edx
f0105613:	7f 0f                	jg     f0105624 <getint+0x14>
f0105615:	85 d2                	test   %edx,%edx
f0105617:	74 18                	je     f0105631 <getint+0x21>
f0105619:	8b 10                	mov    (%eax),%edx
f010561b:	8d 4a 04             	lea    0x4(%edx),%ecx
f010561e:	89 08                	mov    %ecx,(%eax)
f0105620:	8b 02                	mov    (%edx),%eax
f0105622:	99                   	cltd
f0105623:	c3                   	ret
f0105624:	8b 10                	mov    (%eax),%edx
f0105626:	8d 4a 08             	lea    0x8(%edx),%ecx
f0105629:	89 08                	mov    %ecx,(%eax)
f010562b:	8b 02                	mov    (%edx),%eax
f010562d:	8b 52 04             	mov    0x4(%edx),%edx
f0105630:	c3                   	ret
f0105631:	8b 10                	mov    (%eax),%edx
f0105633:	8d 4a 04             	lea    0x4(%edx),%ecx
f0105636:	89 08                	mov    %ecx,(%eax)
f0105638:	8b 02                	mov    (%edx),%eax
f010563a:	99                   	cltd
f010563b:	c3                   	ret

f010563c <sprintputch>:
f010563c:	55                   	push   %ebp
f010563d:	89 e5                	mov    %esp,%ebp
f010563f:	8b 45 0c             	mov    0xc(%ebp),%eax
f0105642:	83 40 08 01          	addl   $0x1,0x8(%eax)
f0105646:	8b 10                	mov    (%eax),%edx
f0105648:	3b 50 04             	cmp    0x4(%eax),%edx
f010564b:	73 0a                	jae    f0105657 <sprintputch+0x1b>
f010564d:	8d 4a 01             	lea    0x1(%edx),%ecx
f0105650:	89 08                	mov    %ecx,(%eax)
f0105652:	8b 45 08             	mov    0x8(%ebp),%eax
f0105655:	88 02                	mov    %al,(%edx)
f0105657:	5d                   	pop    %ebp
f0105658:	c3                   	ret

f0105659 <printfmt>:
f0105659:	55                   	push   %ebp
f010565a:	89 e5                	mov    %esp,%ebp
f010565c:	83 ec 08             	sub    $0x8,%esp
f010565f:	8d 45 14             	lea    0x14(%ebp),%eax
f0105662:	50                   	push   %eax
f0105663:	ff 75 10             	push   0x10(%ebp)
f0105666:	ff 75 0c             	push   0xc(%ebp)
f0105669:	ff 75 08             	push   0x8(%ebp)
f010566c:	e8 05 00 00 00       	call   f0105676 <vprintfmt>
f0105671:	83 c4 10             	add    $0x10,%esp
f0105674:	c9                   	leave
f0105675:	c3                   	ret

f0105676 <vprintfmt>:
f0105676:	55                   	push   %ebp
f0105677:	89 e5                	mov    %esp,%ebp
f0105679:	57                   	push   %edi
f010567a:	56                   	push   %esi
f010567b:	53                   	push   %ebx
f010567c:	83 ec 2c             	sub    $0x2c,%esp
f010567f:	8b 5d 08             	mov    0x8(%ebp),%ebx
f0105682:	8b 75 0c             	mov    0xc(%ebp),%esi
f0105685:	8b 7d 10             	mov    0x10(%ebp),%edi
f0105688:	eb 0a                	jmp    f0105694 <vprintfmt+0x1e>
f010568a:	83 ec 08             	sub    $0x8,%esp
f010568d:	56                   	push   %esi
f010568e:	50                   	push   %eax
f010568f:	ff d3                	call   *%ebx
f0105691:	83 c4 10             	add    $0x10,%esp
f0105694:	83 c7 01             	add    $0x1,%edi
f0105697:	0f b6 47 ff          	movzbl -0x1(%edi),%eax
f010569b:	83 f8 25             	cmp    $0x25,%eax
f010569e:	74 0c                	je     f01056ac <vprintfmt+0x36>
f01056a0:	85 c0                	test   %eax,%eax
f01056a2:	75 e6                	jne    f010568a <vprintfmt+0x14>
f01056a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
f01056a7:	5b                   	pop    %ebx
f01056a8:	5e                   	pop    %esi
f01056a9:	5f                   	pop    %edi
f01056aa:	5d                   	pop    %ebp
f01056ab:	c3                   	ret
f01056ac:	c6 45 d7 20          	movb   $0x20,-0x29(%ebp)
f01056b0:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
f01056b7:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
f01056be:	c7 45 e0 ff ff ff ff 	movl   $0xffffffff,-0x20(%ebp)
f01056c5:	b9 00 00 00 00       	mov    $0x0,%ecx
f01056ca:	8d 47 01             	lea    0x1(%edi),%eax
f01056cd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f01056d0:	0f b6 17             	movzbl (%edi),%edx
f01056d3:	8d 42 dd             	lea    -0x23(%edx),%eax
f01056d6:	3c 55                	cmp    $0x55,%al
f01056d8:	0f 87 c3 02 00 00    	ja     f01059a1 <vprintfmt+0x32b>
f01056de:	0f b6 c0             	movzbl %al,%eax
f01056e1:	ff 24 85 80 85 10 f0 	jmp    *-0xfef7a80(,%eax,4)
f01056e8:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f01056eb:	c6 45 d7 2d          	movb   $0x2d,-0x29(%ebp)
f01056ef:	eb d9                	jmp    f01056ca <vprintfmt+0x54>
f01056f1:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f01056f4:	c6 45 d7 30          	movb   $0x30,-0x29(%ebp)
f01056f8:	eb d0                	jmp    f01056ca <vprintfmt+0x54>
f01056fa:	0f b6 d2             	movzbl %dl,%edx
f01056fd:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f0105700:	b8 00 00 00 00       	mov    $0x0,%eax
f0105705:	89 4d e4             	mov    %ecx,-0x1c(%ebp)
f0105708:	8d 04 80             	lea    (%eax,%eax,4),%eax
f010570b:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
f010570f:	0f be 17             	movsbl (%edi),%edx
f0105712:	8d 4a d0             	lea    -0x30(%edx),%ecx
f0105715:	83 f9 09             	cmp    $0x9,%ecx
f0105718:	77 52                	ja     f010576c <vprintfmt+0xf6>
f010571a:	83 c7 01             	add    $0x1,%edi
f010571d:	eb e9                	jmp    f0105708 <vprintfmt+0x92>
f010571f:	8b 45 14             	mov    0x14(%ebp),%eax
f0105722:	8d 50 04             	lea    0x4(%eax),%edx
f0105725:	89 55 14             	mov    %edx,0x14(%ebp)
f0105728:	8b 00                	mov    (%eax),%eax
f010572a:	89 45 d0             	mov    %eax,-0x30(%ebp)
f010572d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f0105730:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
f0105734:	79 94                	jns    f01056ca <vprintfmt+0x54>
f0105736:	8b 45 d0             	mov    -0x30(%ebp),%eax
f0105739:	89 45 e0             	mov    %eax,-0x20(%ebp)
f010573c:	c7 45 d0 ff ff ff ff 	movl   $0xffffffff,-0x30(%ebp)
f0105743:	eb 85                	jmp    f01056ca <vprintfmt+0x54>
f0105745:	8b 55 e0             	mov    -0x20(%ebp),%edx
f0105748:	85 d2                	test   %edx,%edx
f010574a:	b8 00 00 00 00       	mov    $0x0,%eax
f010574f:	0f 49 c2             	cmovns %edx,%eax
f0105752:	89 45 e0             	mov    %eax,-0x20(%ebp)
f0105755:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f0105758:	e9 6d ff ff ff       	jmp    f01056ca <vprintfmt+0x54>
f010575d:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f0105760:	c7 45 d8 01 00 00 00 	movl   $0x1,-0x28(%ebp)
f0105767:	e9 5e ff ff ff       	jmp    f01056ca <vprintfmt+0x54>
f010576c:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
f010576f:	89 45 d0             	mov    %eax,-0x30(%ebp)
f0105772:	eb bc                	jmp    f0105730 <vprintfmt+0xba>
f0105774:	83 c1 01             	add    $0x1,%ecx
f0105777:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f010577a:	e9 4b ff ff ff       	jmp    f01056ca <vprintfmt+0x54>
f010577f:	8b 45 14             	mov    0x14(%ebp),%eax
f0105782:	8d 50 04             	lea    0x4(%eax),%edx
f0105785:	89 55 14             	mov    %edx,0x14(%ebp)
f0105788:	83 ec 08             	sub    $0x8,%esp
f010578b:	56                   	push   %esi
f010578c:	ff 30                	push   (%eax)
f010578e:	ff d3                	call   *%ebx
f0105790:	83 c4 10             	add    $0x10,%esp
f0105793:	e9 a0 01 00 00       	jmp    f0105938 <vprintfmt+0x2c2>
f0105798:	8b 45 14             	mov    0x14(%ebp),%eax
f010579b:	8d 50 04             	lea    0x4(%eax),%edx
f010579e:	89 55 14             	mov    %edx,0x14(%ebp)
f01057a1:	8b 10                	mov    (%eax),%edx
f01057a3:	89 d0                	mov    %edx,%eax
f01057a5:	f7 d8                	neg    %eax
f01057a7:	0f 48 c2             	cmovs  %edx,%eax
f01057aa:	83 f8 08             	cmp    $0x8,%eax
f01057ad:	7f 20                	jg     f01057cf <vprintfmt+0x159>
f01057af:	8b 14 85 e0 86 10 f0 	mov    -0xfef7920(,%eax,4),%edx
f01057b6:	85 d2                	test   %edx,%edx
f01057b8:	74 15                	je     f01057cf <vprintfmt+0x159>
f01057ba:	52                   	push   %edx
f01057bb:	68 46 7a 10 f0       	push   $0xf0107a46
f01057c0:	56                   	push   %esi
f01057c1:	53                   	push   %ebx
f01057c2:	e8 92 fe ff ff       	call   f0105659 <printfmt>
f01057c7:	83 c4 10             	add    $0x10,%esp
f01057ca:	e9 69 01 00 00       	jmp    f0105938 <vprintfmt+0x2c2>
f01057cf:	50                   	push   %eax
f01057d0:	68 65 81 10 f0       	push   $0xf0108165
f01057d5:	56                   	push   %esi
f01057d6:	53                   	push   %ebx
f01057d7:	e8 7d fe ff ff       	call   f0105659 <printfmt>
f01057dc:	83 c4 10             	add    $0x10,%esp
f01057df:	e9 54 01 00 00       	jmp    f0105938 <vprintfmt+0x2c2>
f01057e4:	8b 45 14             	mov    0x14(%ebp),%eax
f01057e7:	8d 50 04             	lea    0x4(%eax),%edx
f01057ea:	89 55 14             	mov    %edx,0x14(%ebp)
f01057ed:	8b 08                	mov    (%eax),%ecx
f01057ef:	85 c9                	test   %ecx,%ecx
f01057f1:	b8 5e 81 10 f0       	mov    $0xf010815e,%eax
f01057f6:	0f 45 c1             	cmovne %ecx,%eax
f01057f9:	89 45 cc             	mov    %eax,-0x34(%ebp)
f01057fc:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
f0105800:	7e 06                	jle    f0105808 <vprintfmt+0x192>
f0105802:	80 7d d7 2d          	cmpb   $0x2d,-0x29(%ebp)
f0105806:	75 0b                	jne    f0105813 <vprintfmt+0x19d>
f0105808:	8b 4d cc             	mov    -0x34(%ebp),%ecx
f010580b:	8b 7d d0             	mov    -0x30(%ebp),%edi
f010580e:	89 5d 08             	mov    %ebx,0x8(%ebp)
f0105811:	eb 5c                	jmp    f010586f <vprintfmt+0x1f9>
f0105813:	83 ec 08             	sub    $0x8,%esp
f0105816:	ff 75 d0             	push   -0x30(%ebp)
f0105819:	ff 75 cc             	push   -0x34(%ebp)
f010581c:	e8 02 03 00 00       	call   f0105b23 <strnlen>
f0105821:	89 c2                	mov    %eax,%edx
f0105823:	8b 45 e0             	mov    -0x20(%ebp),%eax
f0105826:	29 d0                	sub    %edx,%eax
f0105828:	83 c4 10             	add    $0x10,%esp
f010582b:	0f be 7d d7          	movsbl -0x29(%ebp),%edi
f010582f:	89 45 e0             	mov    %eax,-0x20(%ebp)
f0105832:	89 5d 08             	mov    %ebx,0x8(%ebp)
f0105835:	89 c3                	mov    %eax,%ebx
f0105837:	eb 0e                	jmp    f0105847 <vprintfmt+0x1d1>
f0105839:	83 ec 08             	sub    $0x8,%esp
f010583c:	56                   	push   %esi
f010583d:	57                   	push   %edi
f010583e:	ff 55 08             	call   *0x8(%ebp)
f0105841:	83 eb 01             	sub    $0x1,%ebx
f0105844:	83 c4 10             	add    $0x10,%esp
f0105847:	85 db                	test   %ebx,%ebx
f0105849:	7f ee                	jg     f0105839 <vprintfmt+0x1c3>
f010584b:	8b 45 e0             	mov    -0x20(%ebp),%eax
f010584e:	8b 5d 08             	mov    0x8(%ebp),%ebx
f0105851:	85 c0                	test   %eax,%eax
f0105853:	ba 00 00 00 00       	mov    $0x0,%edx
f0105858:	0f 49 d0             	cmovns %eax,%edx
f010585b:	29 d0                	sub    %edx,%eax
f010585d:	89 45 e0             	mov    %eax,-0x20(%ebp)
f0105860:	eb a6                	jmp    f0105808 <vprintfmt+0x192>
f0105862:	83 ec 08             	sub    $0x8,%esp
f0105865:	56                   	push   %esi
f0105866:	52                   	push   %edx
f0105867:	ff 55 08             	call   *0x8(%ebp)
f010586a:	83 c4 10             	add    $0x10,%esp
f010586d:	89 d9                	mov    %ebx,%ecx
f010586f:	8d 59 01             	lea    0x1(%ecx),%ebx
f0105872:	0f b6 43 ff          	movzbl -0x1(%ebx),%eax
f0105876:	0f be d0             	movsbl %al,%edx
f0105879:	85 d2                	test   %edx,%edx
f010587b:	74 28                	je     f01058a5 <vprintfmt+0x22f>
f010587d:	85 ff                	test   %edi,%edi
f010587f:	78 05                	js     f0105886 <vprintfmt+0x210>
f0105881:	83 ef 01             	sub    $0x1,%edi
f0105884:	78 2e                	js     f01058b4 <vprintfmt+0x23e>
f0105886:	83 7d d8 00          	cmpl   $0x0,-0x28(%ebp)
f010588a:	74 d6                	je     f0105862 <vprintfmt+0x1ec>
f010588c:	0f be c0             	movsbl %al,%eax
f010588f:	83 e8 20             	sub    $0x20,%eax
f0105892:	83 f8 5e             	cmp    $0x5e,%eax
f0105895:	76 cb                	jbe    f0105862 <vprintfmt+0x1ec>
f0105897:	83 ec 08             	sub    $0x8,%esp
f010589a:	56                   	push   %esi
f010589b:	6a 3f                	push   $0x3f
f010589d:	ff 55 08             	call   *0x8(%ebp)
f01058a0:	83 c4 10             	add    $0x10,%esp
f01058a3:	eb c8                	jmp    f010586d <vprintfmt+0x1f7>
f01058a5:	8b 5d 08             	mov    0x8(%ebp),%ebx
f01058a8:	8b 7d cc             	mov    -0x34(%ebp),%edi
f01058ab:	8b 45 e0             	mov    -0x20(%ebp),%eax
f01058ae:	01 c7                	add    %eax,%edi
f01058b0:	29 cf                	sub    %ecx,%edi
f01058b2:	eb 13                	jmp    f01058c7 <vprintfmt+0x251>
f01058b4:	8b 5d 08             	mov    0x8(%ebp),%ebx
f01058b7:	eb ef                	jmp    f01058a8 <vprintfmt+0x232>
f01058b9:	83 ec 08             	sub    $0x8,%esp
f01058bc:	56                   	push   %esi
f01058bd:	6a 20                	push   $0x20
f01058bf:	ff d3                	call   *%ebx
f01058c1:	83 ef 01             	sub    $0x1,%edi
f01058c4:	83 c4 10             	add    $0x10,%esp
f01058c7:	85 ff                	test   %edi,%edi
f01058c9:	7f ee                	jg     f01058b9 <vprintfmt+0x243>
f01058cb:	eb 6b                	jmp    f0105938 <vprintfmt+0x2c2>
f01058cd:	89 ca                	mov    %ecx,%edx
f01058cf:	8d 45 14             	lea    0x14(%ebp),%eax
f01058d2:	e8 39 fd ff ff       	call   f0105610 <getint>
f01058d7:	89 45 d8             	mov    %eax,-0x28(%ebp)
f01058da:	89 55 dc             	mov    %edx,-0x24(%ebp)
f01058dd:	85 d2                	test   %edx,%edx
f01058df:	78 0b                	js     f01058ec <vprintfmt+0x276>
f01058e1:	89 d1                	mov    %edx,%ecx
f01058e3:	89 c2                	mov    %eax,%edx
f01058e5:	bf 0a 00 00 00       	mov    $0xa,%edi
f01058ea:	eb 32                	jmp    f010591e <vprintfmt+0x2a8>
f01058ec:	83 ec 08             	sub    $0x8,%esp
f01058ef:	56                   	push   %esi
f01058f0:	6a 2d                	push   $0x2d
f01058f2:	ff d3                	call   *%ebx
f01058f4:	8b 55 d8             	mov    -0x28(%ebp),%edx
f01058f7:	8b 4d dc             	mov    -0x24(%ebp),%ecx
f01058fa:	f7 da                	neg    %edx
f01058fc:	83 d1 00             	adc    $0x0,%ecx
f01058ff:	f7 d9                	neg    %ecx
f0105901:	83 c4 10             	add    $0x10,%esp
f0105904:	bf 0a 00 00 00       	mov    $0xa,%edi
f0105909:	eb 13                	jmp    f010591e <vprintfmt+0x2a8>
f010590b:	89 ca                	mov    %ecx,%edx
f010590d:	8d 45 14             	lea    0x14(%ebp),%eax
f0105910:	e8 c7 fc ff ff       	call   f01055dc <getuint>
f0105915:	89 d1                	mov    %edx,%ecx
f0105917:	89 c2                	mov    %eax,%edx
f0105919:	bf 0a 00 00 00       	mov    $0xa,%edi
f010591e:	83 ec 0c             	sub    $0xc,%esp
f0105921:	0f be 45 d7          	movsbl -0x29(%ebp),%eax
f0105925:	50                   	push   %eax
f0105926:	ff 75 e0             	push   -0x20(%ebp)
f0105929:	57                   	push   %edi
f010592a:	51                   	push   %ecx
f010592b:	52                   	push   %edx
f010592c:	89 f2                	mov    %esi,%edx
f010592e:	89 d8                	mov    %ebx,%eax
f0105930:	e8 fe fb ff ff       	call   f0105533 <printnum>
f0105935:	83 c4 20             	add    $0x20,%esp
f0105938:	8b 7d e4             	mov    -0x1c(%ebp),%edi
f010593b:	e9 54 fd ff ff       	jmp    f0105694 <vprintfmt+0x1e>
f0105940:	89 ca                	mov    %ecx,%edx
f0105942:	8d 45 14             	lea    0x14(%ebp),%eax
f0105945:	e8 92 fc ff ff       	call   f01055dc <getuint>
f010594a:	89 d1                	mov    %edx,%ecx
f010594c:	89 c2                	mov    %eax,%edx
f010594e:	bf 08 00 00 00       	mov    $0x8,%edi
f0105953:	eb c9                	jmp    f010591e <vprintfmt+0x2a8>
f0105955:	83 ec 08             	sub    $0x8,%esp
f0105958:	56                   	push   %esi
f0105959:	6a 30                	push   $0x30
f010595b:	ff d3                	call   *%ebx
f010595d:	83 c4 08             	add    $0x8,%esp
f0105960:	56                   	push   %esi
f0105961:	6a 78                	push   $0x78
f0105963:	ff d3                	call   *%ebx
f0105965:	8b 45 14             	mov    0x14(%ebp),%eax
f0105968:	8d 50 04             	lea    0x4(%eax),%edx
f010596b:	89 55 14             	mov    %edx,0x14(%ebp)
f010596e:	8b 10                	mov    (%eax),%edx
f0105970:	b9 00 00 00 00       	mov    $0x0,%ecx
f0105975:	83 c4 10             	add    $0x10,%esp
f0105978:	bf 10 00 00 00       	mov    $0x10,%edi
f010597d:	eb 9f                	jmp    f010591e <vprintfmt+0x2a8>
f010597f:	89 ca                	mov    %ecx,%edx
f0105981:	8d 45 14             	lea    0x14(%ebp),%eax
f0105984:	e8 53 fc ff ff       	call   f01055dc <getuint>
f0105989:	89 d1                	mov    %edx,%ecx
f010598b:	89 c2                	mov    %eax,%edx
f010598d:	bf 10 00 00 00       	mov    $0x10,%edi
f0105992:	eb 8a                	jmp    f010591e <vprintfmt+0x2a8>
f0105994:	83 ec 08             	sub    $0x8,%esp
f0105997:	56                   	push   %esi
f0105998:	6a 25                	push   $0x25
f010599a:	ff d3                	call   *%ebx
f010599c:	83 c4 10             	add    $0x10,%esp
f010599f:	eb 97                	jmp    f0105938 <vprintfmt+0x2c2>
f01059a1:	83 ec 08             	sub    $0x8,%esp
f01059a4:	56                   	push   %esi
f01059a5:	6a 25                	push   $0x25
f01059a7:	ff d3                	call   *%ebx
f01059a9:	83 c4 10             	add    $0x10,%esp
f01059ac:	89 f8                	mov    %edi,%eax
f01059ae:	80 78 ff 25          	cmpb   $0x25,-0x1(%eax)
f01059b2:	74 05                	je     f01059b9 <vprintfmt+0x343>
f01059b4:	83 e8 01             	sub    $0x1,%eax
f01059b7:	eb f5                	jmp    f01059ae <vprintfmt+0x338>
f01059b9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f01059bc:	e9 77 ff ff ff       	jmp    f0105938 <vprintfmt+0x2c2>

f01059c1 <vsnprintf>:
f01059c1:	55                   	push   %ebp
f01059c2:	89 e5                	mov    %esp,%ebp
f01059c4:	83 ec 18             	sub    $0x18,%esp
f01059c7:	8b 45 08             	mov    0x8(%ebp),%eax
f01059ca:	8b 55 0c             	mov    0xc(%ebp),%edx
f01059cd:	89 45 ec             	mov    %eax,-0x14(%ebp)
f01059d0:	8d 4c 10 ff          	lea    -0x1(%eax,%edx,1),%ecx
f01059d4:	89 4d f0             	mov    %ecx,-0x10(%ebp)
f01059d7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
f01059de:	85 c0                	test   %eax,%eax
f01059e0:	74 26                	je     f0105a08 <vsnprintf+0x47>
f01059e2:	85 d2                	test   %edx,%edx
f01059e4:	7e 22                	jle    f0105a08 <vsnprintf+0x47>
f01059e6:	ff 75 14             	push   0x14(%ebp)
f01059e9:	ff 75 10             	push   0x10(%ebp)
f01059ec:	8d 45 ec             	lea    -0x14(%ebp),%eax
f01059ef:	50                   	push   %eax
f01059f0:	68 3c 56 10 f0       	push   $0xf010563c
f01059f5:	e8 7c fc ff ff       	call   f0105676 <vprintfmt>
f01059fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
f01059fd:	c6 00 00             	movb   $0x0,(%eax)
f0105a00:	8b 45 f4             	mov    -0xc(%ebp),%eax
f0105a03:	83 c4 10             	add    $0x10,%esp
f0105a06:	c9                   	leave
f0105a07:	c3                   	ret
f0105a08:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
f0105a0d:	eb f7                	jmp    f0105a06 <vsnprintf+0x45>

f0105a0f <snprintf>:
f0105a0f:	55                   	push   %ebp
f0105a10:	89 e5                	mov    %esp,%ebp
f0105a12:	83 ec 08             	sub    $0x8,%esp
f0105a15:	8d 45 14             	lea    0x14(%ebp),%eax
f0105a18:	50                   	push   %eax
f0105a19:	ff 75 10             	push   0x10(%ebp)
f0105a1c:	ff 75 0c             	push   0xc(%ebp)
f0105a1f:	ff 75 08             	push   0x8(%ebp)
f0105a22:	e8 9a ff ff ff       	call   f01059c1 <vsnprintf>
f0105a27:	c9                   	leave
f0105a28:	c3                   	ret

f0105a29 <readline>:
f0105a29:	55                   	push   %ebp
f0105a2a:	89 e5                	mov    %esp,%ebp
f0105a2c:	57                   	push   %edi
f0105a2d:	56                   	push   %esi
f0105a2e:	53                   	push   %ebx
f0105a2f:	83 ec 0c             	sub    $0xc,%esp
f0105a32:	8b 45 08             	mov    0x8(%ebp),%eax
f0105a35:	85 c0                	test   %eax,%eax
f0105a37:	74 11                	je     f0105a4a <readline+0x21>
f0105a39:	83 ec 08             	sub    $0x8,%esp
f0105a3c:	50                   	push   %eax
f0105a3d:	68 46 7a 10 f0       	push   $0xf0107a46
f0105a42:	e8 ef dd ff ff       	call   f0103836 <cprintf>
f0105a47:	83 c4 10             	add    $0x10,%esp
f0105a4a:	83 ec 0c             	sub    $0xc,%esp
f0105a4d:	6a 00                	push   $0x0
f0105a4f:	e8 a6 ae ff ff       	call   f01008fa <iscons>
f0105a54:	89 c7                	mov    %eax,%edi
f0105a56:	83 c4 10             	add    $0x10,%esp
f0105a59:	be 00 00 00 00       	mov    $0x0,%esi
f0105a5e:	eb 3f                	jmp    f0105a9f <readline+0x76>
f0105a60:	83 ec 08             	sub    $0x8,%esp
f0105a63:	50                   	push   %eax
f0105a64:	68 01 82 10 f0       	push   $0xf0108201
f0105a69:	e8 c8 dd ff ff       	call   f0103836 <cprintf>
f0105a6e:	83 c4 10             	add    $0x10,%esp
f0105a71:	b8 00 00 00 00       	mov    $0x0,%eax
f0105a76:	8d 65 f4             	lea    -0xc(%ebp),%esp
f0105a79:	5b                   	pop    %ebx
f0105a7a:	5e                   	pop    %esi
f0105a7b:	5f                   	pop    %edi
f0105a7c:	5d                   	pop    %ebp
f0105a7d:	c3                   	ret
f0105a7e:	85 ff                	test   %edi,%edi
f0105a80:	75 05                	jne    f0105a87 <readline+0x5e>
f0105a82:	83 ee 01             	sub    $0x1,%esi
f0105a85:	eb 18                	jmp    f0105a9f <readline+0x76>
f0105a87:	83 ec 0c             	sub    $0xc,%esp
f0105a8a:	6a 08                	push   $0x8
f0105a8c:	e8 48 ae ff ff       	call   f01008d9 <cputchar>
f0105a91:	83 c4 10             	add    $0x10,%esp
f0105a94:	eb ec                	jmp    f0105a82 <readline+0x59>
f0105a96:	88 9e e0 ca 18 f0    	mov    %bl,-0xfe73520(%esi)
f0105a9c:	8d 76 01             	lea    0x1(%esi),%esi
f0105a9f:	e8 45 ae ff ff       	call   f01008e9 <getchar>
f0105aa4:	89 c3                	mov    %eax,%ebx
f0105aa6:	85 c0                	test   %eax,%eax
f0105aa8:	78 b6                	js     f0105a60 <readline+0x37>
f0105aaa:	83 f8 08             	cmp    $0x8,%eax
f0105aad:	0f 94 c0             	sete   %al
f0105ab0:	83 fb 7f             	cmp    $0x7f,%ebx
f0105ab3:	0f 94 c2             	sete   %dl
f0105ab6:	08 d0                	or     %dl,%al
f0105ab8:	74 04                	je     f0105abe <readline+0x95>
f0105aba:	85 f6                	test   %esi,%esi
f0105abc:	7f c0                	jg     f0105a7e <readline+0x55>
f0105abe:	83 fb 1f             	cmp    $0x1f,%ebx
f0105ac1:	7e 1a                	jle    f0105add <readline+0xb4>
f0105ac3:	81 fe fe 03 00 00    	cmp    $0x3fe,%esi
f0105ac9:	7f 12                	jg     f0105add <readline+0xb4>
f0105acb:	85 ff                	test   %edi,%edi
f0105acd:	74 c7                	je     f0105a96 <readline+0x6d>
f0105acf:	83 ec 0c             	sub    $0xc,%esp
f0105ad2:	53                   	push   %ebx
f0105ad3:	e8 01 ae ff ff       	call   f01008d9 <cputchar>
f0105ad8:	83 c4 10             	add    $0x10,%esp
f0105adb:	eb b9                	jmp    f0105a96 <readline+0x6d>
f0105add:	83 fb 0a             	cmp    $0xa,%ebx
f0105ae0:	74 05                	je     f0105ae7 <readline+0xbe>
f0105ae2:	83 fb 0d             	cmp    $0xd,%ebx
f0105ae5:	75 b8                	jne    f0105a9f <readline+0x76>
f0105ae7:	85 ff                	test   %edi,%edi
f0105ae9:	75 11                	jne    f0105afc <readline+0xd3>
f0105aeb:	c6 86 e0 ca 18 f0 00 	movb   $0x0,-0xfe73520(%esi)
f0105af2:	b8 e0 ca 18 f0       	mov    $0xf018cae0,%eax
f0105af7:	e9 7a ff ff ff       	jmp    f0105a76 <readline+0x4d>
f0105afc:	83 ec 0c             	sub    $0xc,%esp
f0105aff:	6a 0a                	push   $0xa
f0105b01:	e8 d3 ad ff ff       	call   f01008d9 <cputchar>
f0105b06:	83 c4 10             	add    $0x10,%esp
f0105b09:	eb e0                	jmp    f0105aeb <readline+0xc2>

f0105b0b <strlen>:
f0105b0b:	55                   	push   %ebp
f0105b0c:	89 e5                	mov    %esp,%ebp
f0105b0e:	8b 55 08             	mov    0x8(%ebp),%edx
f0105b11:	b8 00 00 00 00       	mov    $0x0,%eax
f0105b16:	eb 03                	jmp    f0105b1b <strlen+0x10>
f0105b18:	83 c0 01             	add    $0x1,%eax
f0105b1b:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
f0105b1f:	75 f7                	jne    f0105b18 <strlen+0xd>
f0105b21:	5d                   	pop    %ebp
f0105b22:	c3                   	ret

f0105b23 <strnlen>:
f0105b23:	55                   	push   %ebp
f0105b24:	89 e5                	mov    %esp,%ebp
f0105b26:	8b 4d 08             	mov    0x8(%ebp),%ecx
f0105b29:	8b 55 0c             	mov    0xc(%ebp),%edx
f0105b2c:	b8 00 00 00 00       	mov    $0x0,%eax
f0105b31:	eb 03                	jmp    f0105b36 <strnlen+0x13>
f0105b33:	83 c0 01             	add    $0x1,%eax
f0105b36:	39 d0                	cmp    %edx,%eax
f0105b38:	74 08                	je     f0105b42 <strnlen+0x1f>
f0105b3a:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
f0105b3e:	75 f3                	jne    f0105b33 <strnlen+0x10>
f0105b40:	89 c2                	mov    %eax,%edx
f0105b42:	89 d0                	mov    %edx,%eax
f0105b44:	5d                   	pop    %ebp
f0105b45:	c3                   	ret

f0105b46 <strcpy>:
f0105b46:	55                   	push   %ebp
f0105b47:	89 e5                	mov    %esp,%ebp
f0105b49:	53                   	push   %ebx
f0105b4a:	8b 4d 08             	mov    0x8(%ebp),%ecx
f0105b4d:	8b 5d 0c             	mov    0xc(%ebp),%ebx
f0105b50:	b8 00 00 00 00       	mov    $0x0,%eax
f0105b55:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
f0105b59:	88 14 01             	mov    %dl,(%ecx,%eax,1)
f0105b5c:	83 c0 01             	add    $0x1,%eax
f0105b5f:	84 d2                	test   %dl,%dl
f0105b61:	75 f2                	jne    f0105b55 <strcpy+0xf>
f0105b63:	89 c8                	mov    %ecx,%eax
f0105b65:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f0105b68:	c9                   	leave
f0105b69:	c3                   	ret

f0105b6a <strcat>:
f0105b6a:	55                   	push   %ebp
f0105b6b:	89 e5                	mov    %esp,%ebp
f0105b6d:	53                   	push   %ebx
f0105b6e:	83 ec 10             	sub    $0x10,%esp
f0105b71:	8b 5d 08             	mov    0x8(%ebp),%ebx
f0105b74:	53                   	push   %ebx
f0105b75:	e8 91 ff ff ff       	call   f0105b0b <strlen>
f0105b7a:	83 c4 08             	add    $0x8,%esp
f0105b7d:	ff 75 0c             	push   0xc(%ebp)
f0105b80:	01 d8                	add    %ebx,%eax
f0105b82:	50                   	push   %eax
f0105b83:	e8 be ff ff ff       	call   f0105b46 <strcpy>
f0105b88:	89 d8                	mov    %ebx,%eax
f0105b8a:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f0105b8d:	c9                   	leave
f0105b8e:	c3                   	ret

f0105b8f <strncpy>:
f0105b8f:	55                   	push   %ebp
f0105b90:	89 e5                	mov    %esp,%ebp
f0105b92:	56                   	push   %esi
f0105b93:	53                   	push   %ebx
f0105b94:	8b 75 08             	mov    0x8(%ebp),%esi
f0105b97:	8b 55 0c             	mov    0xc(%ebp),%edx
f0105b9a:	89 f3                	mov    %esi,%ebx
f0105b9c:	03 5d 10             	add    0x10(%ebp),%ebx
f0105b9f:	89 f0                	mov    %esi,%eax
f0105ba1:	eb 0f                	jmp    f0105bb2 <strncpy+0x23>
f0105ba3:	83 c0 01             	add    $0x1,%eax
f0105ba6:	0f b6 0a             	movzbl (%edx),%ecx
f0105ba9:	88 48 ff             	mov    %cl,-0x1(%eax)
f0105bac:	80 f9 01             	cmp    $0x1,%cl
f0105baf:	83 da ff             	sbb    $0xffffffff,%edx
f0105bb2:	39 d8                	cmp    %ebx,%eax
f0105bb4:	75 ed                	jne    f0105ba3 <strncpy+0x14>
f0105bb6:	89 f0                	mov    %esi,%eax
f0105bb8:	5b                   	pop    %ebx
f0105bb9:	5e                   	pop    %esi
f0105bba:	5d                   	pop    %ebp
f0105bbb:	c3                   	ret

f0105bbc <strlcpy>:
f0105bbc:	55                   	push   %ebp
f0105bbd:	89 e5                	mov    %esp,%ebp
f0105bbf:	56                   	push   %esi
f0105bc0:	53                   	push   %ebx
f0105bc1:	8b 75 08             	mov    0x8(%ebp),%esi
f0105bc4:	8b 4d 0c             	mov    0xc(%ebp),%ecx
f0105bc7:	8b 55 10             	mov    0x10(%ebp),%edx
f0105bca:	89 f0                	mov    %esi,%eax
f0105bcc:	85 d2                	test   %edx,%edx
f0105bce:	74 21                	je     f0105bf1 <strlcpy+0x35>
f0105bd0:	8d 44 16 ff          	lea    -0x1(%esi,%edx,1),%eax
f0105bd4:	89 f2                	mov    %esi,%edx
f0105bd6:	eb 09                	jmp    f0105be1 <strlcpy+0x25>
f0105bd8:	83 c1 01             	add    $0x1,%ecx
f0105bdb:	83 c2 01             	add    $0x1,%edx
f0105bde:	88 5a ff             	mov    %bl,-0x1(%edx)
f0105be1:	39 c2                	cmp    %eax,%edx
f0105be3:	74 09                	je     f0105bee <strlcpy+0x32>
f0105be5:	0f b6 19             	movzbl (%ecx),%ebx
f0105be8:	84 db                	test   %bl,%bl
f0105bea:	75 ec                	jne    f0105bd8 <strlcpy+0x1c>
f0105bec:	89 d0                	mov    %edx,%eax
f0105bee:	c6 00 00             	movb   $0x0,(%eax)
f0105bf1:	29 f0                	sub    %esi,%eax
f0105bf3:	5b                   	pop    %ebx
f0105bf4:	5e                   	pop    %esi
f0105bf5:	5d                   	pop    %ebp
f0105bf6:	c3                   	ret

f0105bf7 <strcmp>:
f0105bf7:	55                   	push   %ebp
f0105bf8:	89 e5                	mov    %esp,%ebp
f0105bfa:	8b 4d 08             	mov    0x8(%ebp),%ecx
f0105bfd:	8b 55 0c             	mov    0xc(%ebp),%edx
f0105c00:	eb 06                	jmp    f0105c08 <strcmp+0x11>
f0105c02:	83 c1 01             	add    $0x1,%ecx
f0105c05:	83 c2 01             	add    $0x1,%edx
f0105c08:	0f b6 01             	movzbl (%ecx),%eax
f0105c0b:	84 c0                	test   %al,%al
f0105c0d:	74 04                	je     f0105c13 <strcmp+0x1c>
f0105c0f:	3a 02                	cmp    (%edx),%al
f0105c11:	74 ef                	je     f0105c02 <strcmp+0xb>
f0105c13:	0f b6 c0             	movzbl %al,%eax
f0105c16:	0f b6 12             	movzbl (%edx),%edx
f0105c19:	29 d0                	sub    %edx,%eax
f0105c1b:	5d                   	pop    %ebp
f0105c1c:	c3                   	ret

f0105c1d <strncmp>:
f0105c1d:	55                   	push   %ebp
f0105c1e:	89 e5                	mov    %esp,%ebp
f0105c20:	53                   	push   %ebx
f0105c21:	8b 45 08             	mov    0x8(%ebp),%eax
f0105c24:	8b 4d 0c             	mov    0xc(%ebp),%ecx
f0105c27:	8b 55 10             	mov    0x10(%ebp),%edx
f0105c2a:	eb 09                	jmp    f0105c35 <strncmp+0x18>
f0105c2c:	83 ea 01             	sub    $0x1,%edx
f0105c2f:	83 c0 01             	add    $0x1,%eax
f0105c32:	83 c1 01             	add    $0x1,%ecx
f0105c35:	85 d2                	test   %edx,%edx
f0105c37:	74 18                	je     f0105c51 <strncmp+0x34>
f0105c39:	0f b6 18             	movzbl (%eax),%ebx
f0105c3c:	84 db                	test   %bl,%bl
f0105c3e:	74 04                	je     f0105c44 <strncmp+0x27>
f0105c40:	3a 19                	cmp    (%ecx),%bl
f0105c42:	74 e8                	je     f0105c2c <strncmp+0xf>
f0105c44:	0f b6 00             	movzbl (%eax),%eax
f0105c47:	0f b6 11             	movzbl (%ecx),%edx
f0105c4a:	29 d0                	sub    %edx,%eax
f0105c4c:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f0105c4f:	c9                   	leave
f0105c50:	c3                   	ret
f0105c51:	b8 00 00 00 00       	mov    $0x0,%eax
f0105c56:	eb f4                	jmp    f0105c4c <strncmp+0x2f>

f0105c58 <strchr>:
f0105c58:	55                   	push   %ebp
f0105c59:	89 e5                	mov    %esp,%ebp
f0105c5b:	8b 45 08             	mov    0x8(%ebp),%eax
f0105c5e:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
f0105c62:	eb 03                	jmp    f0105c67 <strchr+0xf>
f0105c64:	83 c0 01             	add    $0x1,%eax
f0105c67:	0f b6 10             	movzbl (%eax),%edx
f0105c6a:	84 d2                	test   %dl,%dl
f0105c6c:	74 06                	je     f0105c74 <strchr+0x1c>
f0105c6e:	38 ca                	cmp    %cl,%dl
f0105c70:	75 f2                	jne    f0105c64 <strchr+0xc>
f0105c72:	eb 05                	jmp    f0105c79 <strchr+0x21>
f0105c74:	b8 00 00 00 00       	mov    $0x0,%eax
f0105c79:	5d                   	pop    %ebp
f0105c7a:	c3                   	ret

f0105c7b <strfind>:
f0105c7b:	55                   	push   %ebp
f0105c7c:	89 e5                	mov    %esp,%ebp
f0105c7e:	8b 45 08             	mov    0x8(%ebp),%eax
f0105c81:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
f0105c85:	0f b6 10             	movzbl (%eax),%edx
f0105c88:	38 ca                	cmp    %cl,%dl
f0105c8a:	74 09                	je     f0105c95 <strfind+0x1a>
f0105c8c:	84 d2                	test   %dl,%dl
f0105c8e:	74 05                	je     f0105c95 <strfind+0x1a>
f0105c90:	83 c0 01             	add    $0x1,%eax
f0105c93:	eb f0                	jmp    f0105c85 <strfind+0xa>
f0105c95:	5d                   	pop    %ebp
f0105c96:	c3                   	ret

f0105c97 <memset>:
f0105c97:	55                   	push   %ebp
f0105c98:	89 e5                	mov    %esp,%ebp
f0105c9a:	57                   	push   %edi
f0105c9b:	8b 55 08             	mov    0x8(%ebp),%edx
f0105c9e:	8b 4d 10             	mov    0x10(%ebp),%ecx
f0105ca1:	85 c9                	test   %ecx,%ecx
f0105ca3:	74 24                	je     f0105cc9 <memset+0x32>
f0105ca5:	89 d0                	mov    %edx,%eax
f0105ca7:	09 c8                	or     %ecx,%eax
f0105ca9:	a8 03                	test   $0x3,%al
f0105cab:	75 14                	jne    f0105cc1 <memset+0x2a>
f0105cad:	0f b6 45 0c          	movzbl 0xc(%ebp),%eax
f0105cb1:	69 c0 01 01 01 01    	imul   $0x1010101,%eax,%eax
f0105cb7:	c1 e9 02             	shr    $0x2,%ecx
f0105cba:	89 d7                	mov    %edx,%edi
f0105cbc:	fc                   	cld
f0105cbd:	f3 ab                	rep stos %eax,%es:(%edi)
f0105cbf:	eb 08                	jmp    f0105cc9 <memset+0x32>
f0105cc1:	89 d7                	mov    %edx,%edi
f0105cc3:	8b 45 0c             	mov    0xc(%ebp),%eax
f0105cc6:	fc                   	cld
f0105cc7:	f3 aa                	rep stos %al,%es:(%edi)
f0105cc9:	89 d0                	mov    %edx,%eax
f0105ccb:	8b 7d fc             	mov    -0x4(%ebp),%edi
f0105cce:	c9                   	leave
f0105ccf:	c3                   	ret

f0105cd0 <memmove>:
f0105cd0:	55                   	push   %ebp
f0105cd1:	89 e5                	mov    %esp,%ebp
f0105cd3:	57                   	push   %edi
f0105cd4:	56                   	push   %esi
f0105cd5:	8b 45 08             	mov    0x8(%ebp),%eax
f0105cd8:	8b 75 0c             	mov    0xc(%ebp),%esi
f0105cdb:	8b 4d 10             	mov    0x10(%ebp),%ecx
f0105cde:	39 c6                	cmp    %eax,%esi
f0105ce0:	73 32                	jae    f0105d14 <memmove+0x44>
f0105ce2:	8d 14 0e             	lea    (%esi,%ecx,1),%edx
f0105ce5:	39 d0                	cmp    %edx,%eax
f0105ce7:	73 2b                	jae    f0105d14 <memmove+0x44>
f0105ce9:	8d 3c 08             	lea    (%eax,%ecx,1),%edi
f0105cec:	89 fe                	mov    %edi,%esi
f0105cee:	09 ce                	or     %ecx,%esi
f0105cf0:	09 d6                	or     %edx,%esi
f0105cf2:	f7 c6 03 00 00 00    	test   $0x3,%esi
f0105cf8:	75 0e                	jne    f0105d08 <memmove+0x38>
f0105cfa:	83 ef 04             	sub    $0x4,%edi
f0105cfd:	8d 72 fc             	lea    -0x4(%edx),%esi
f0105d00:	c1 e9 02             	shr    $0x2,%ecx
f0105d03:	fd                   	std
f0105d04:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
f0105d06:	eb 09                	jmp    f0105d11 <memmove+0x41>
f0105d08:	83 ef 01             	sub    $0x1,%edi
f0105d0b:	8d 72 ff             	lea    -0x1(%edx),%esi
f0105d0e:	fd                   	std
f0105d0f:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
f0105d11:	fc                   	cld
f0105d12:	eb 1a                	jmp    f0105d2e <memmove+0x5e>
f0105d14:	89 c2                	mov    %eax,%edx
f0105d16:	09 ca                	or     %ecx,%edx
f0105d18:	09 f2                	or     %esi,%edx
f0105d1a:	f6 c2 03             	test   $0x3,%dl
f0105d1d:	75 0a                	jne    f0105d29 <memmove+0x59>
f0105d1f:	c1 e9 02             	shr    $0x2,%ecx
f0105d22:	89 c7                	mov    %eax,%edi
f0105d24:	fc                   	cld
f0105d25:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
f0105d27:	eb 05                	jmp    f0105d2e <memmove+0x5e>
f0105d29:	89 c7                	mov    %eax,%edi
f0105d2b:	fc                   	cld
f0105d2c:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
f0105d2e:	5e                   	pop    %esi
f0105d2f:	5f                   	pop    %edi
f0105d30:	5d                   	pop    %ebp
f0105d31:	c3                   	ret

f0105d32 <memcpy>:
f0105d32:	55                   	push   %ebp
f0105d33:	89 e5                	mov    %esp,%ebp
f0105d35:	83 ec 0c             	sub    $0xc,%esp
f0105d38:	ff 75 10             	push   0x10(%ebp)
f0105d3b:	ff 75 0c             	push   0xc(%ebp)
f0105d3e:	ff 75 08             	push   0x8(%ebp)
f0105d41:	e8 8a ff ff ff       	call   f0105cd0 <memmove>
f0105d46:	c9                   	leave
f0105d47:	c3                   	ret

f0105d48 <memcmp>:
f0105d48:	55                   	push   %ebp
f0105d49:	89 e5                	mov    %esp,%ebp
f0105d4b:	56                   	push   %esi
f0105d4c:	53                   	push   %ebx
f0105d4d:	8b 45 08             	mov    0x8(%ebp),%eax
f0105d50:	8b 55 0c             	mov    0xc(%ebp),%edx
f0105d53:	89 c6                	mov    %eax,%esi
f0105d55:	03 75 10             	add    0x10(%ebp),%esi
f0105d58:	eb 06                	jmp    f0105d60 <memcmp+0x18>
f0105d5a:	83 c0 01             	add    $0x1,%eax
f0105d5d:	83 c2 01             	add    $0x1,%edx
f0105d60:	39 f0                	cmp    %esi,%eax
f0105d62:	74 14                	je     f0105d78 <memcmp+0x30>
f0105d64:	0f b6 08             	movzbl (%eax),%ecx
f0105d67:	0f b6 1a             	movzbl (%edx),%ebx
f0105d6a:	38 d9                	cmp    %bl,%cl
f0105d6c:	74 ec                	je     f0105d5a <memcmp+0x12>
f0105d6e:	0f b6 c1             	movzbl %cl,%eax
f0105d71:	0f b6 db             	movzbl %bl,%ebx
f0105d74:	29 d8                	sub    %ebx,%eax
f0105d76:	eb 05                	jmp    f0105d7d <memcmp+0x35>
f0105d78:	b8 00 00 00 00       	mov    $0x0,%eax
f0105d7d:	5b                   	pop    %ebx
f0105d7e:	5e                   	pop    %esi
f0105d7f:	5d                   	pop    %ebp
f0105d80:	c3                   	ret

f0105d81 <memfind>:
f0105d81:	55                   	push   %ebp
f0105d82:	89 e5                	mov    %esp,%ebp
f0105d84:	8b 45 08             	mov    0x8(%ebp),%eax
f0105d87:	8b 4d 0c             	mov    0xc(%ebp),%ecx
f0105d8a:	89 c2                	mov    %eax,%edx
f0105d8c:	03 55 10             	add    0x10(%ebp),%edx
f0105d8f:	eb 03                	jmp    f0105d94 <memfind+0x13>
f0105d91:	83 c0 01             	add    $0x1,%eax
f0105d94:	39 d0                	cmp    %edx,%eax
f0105d96:	73 04                	jae    f0105d9c <memfind+0x1b>
f0105d98:	38 08                	cmp    %cl,(%eax)
f0105d9a:	75 f5                	jne    f0105d91 <memfind+0x10>
f0105d9c:	5d                   	pop    %ebp
f0105d9d:	c3                   	ret

f0105d9e <strtol>:
f0105d9e:	55                   	push   %ebp
f0105d9f:	89 e5                	mov    %esp,%ebp
f0105da1:	57                   	push   %edi
f0105da2:	56                   	push   %esi
f0105da3:	53                   	push   %ebx
f0105da4:	8b 55 08             	mov    0x8(%ebp),%edx
f0105da7:	8b 5d 10             	mov    0x10(%ebp),%ebx
f0105daa:	eb 03                	jmp    f0105daf <strtol+0x11>
f0105dac:	83 c2 01             	add    $0x1,%edx
f0105daf:	0f b6 02             	movzbl (%edx),%eax
f0105db2:	3c 20                	cmp    $0x20,%al
f0105db4:	74 f6                	je     f0105dac <strtol+0xe>
f0105db6:	3c 09                	cmp    $0x9,%al
f0105db8:	74 f2                	je     f0105dac <strtol+0xe>
f0105dba:	3c 2b                	cmp    $0x2b,%al
f0105dbc:	74 2a                	je     f0105de8 <strtol+0x4a>
f0105dbe:	bf 00 00 00 00       	mov    $0x0,%edi
f0105dc3:	3c 2d                	cmp    $0x2d,%al
f0105dc5:	74 2b                	je     f0105df2 <strtol+0x54>
f0105dc7:	f7 c3 ef ff ff ff    	test   $0xffffffef,%ebx
f0105dcd:	75 0f                	jne    f0105dde <strtol+0x40>
f0105dcf:	80 3a 30             	cmpb   $0x30,(%edx)
f0105dd2:	74 28                	je     f0105dfc <strtol+0x5e>
f0105dd4:	85 db                	test   %ebx,%ebx
f0105dd6:	b8 0a 00 00 00       	mov    $0xa,%eax
f0105ddb:	0f 44 d8             	cmove  %eax,%ebx
f0105dde:	b9 00 00 00 00       	mov    $0x0,%ecx
f0105de3:	89 5d 10             	mov    %ebx,0x10(%ebp)
f0105de6:	eb 46                	jmp    f0105e2e <strtol+0x90>
f0105de8:	83 c2 01             	add    $0x1,%edx
f0105deb:	bf 00 00 00 00       	mov    $0x0,%edi
f0105df0:	eb d5                	jmp    f0105dc7 <strtol+0x29>
f0105df2:	83 c2 01             	add    $0x1,%edx
f0105df5:	bf 01 00 00 00       	mov    $0x1,%edi
f0105dfa:	eb cb                	jmp    f0105dc7 <strtol+0x29>
f0105dfc:	80 7a 01 78          	cmpb   $0x78,0x1(%edx)
f0105e00:	74 0e                	je     f0105e10 <strtol+0x72>
f0105e02:	85 db                	test   %ebx,%ebx
f0105e04:	75 d8                	jne    f0105dde <strtol+0x40>
f0105e06:	83 c2 01             	add    $0x1,%edx
f0105e09:	bb 08 00 00 00       	mov    $0x8,%ebx
f0105e0e:	eb ce                	jmp    f0105dde <strtol+0x40>
f0105e10:	83 c2 02             	add    $0x2,%edx
f0105e13:	bb 10 00 00 00       	mov    $0x10,%ebx
f0105e18:	eb c4                	jmp    f0105dde <strtol+0x40>
f0105e1a:	0f be c0             	movsbl %al,%eax
f0105e1d:	83 e8 30             	sub    $0x30,%eax
f0105e20:	3b 45 10             	cmp    0x10(%ebp),%eax
f0105e23:	7d 3a                	jge    f0105e5f <strtol+0xc1>
f0105e25:	83 c2 01             	add    $0x1,%edx
f0105e28:	0f af 4d 10          	imul   0x10(%ebp),%ecx
f0105e2c:	01 c1                	add    %eax,%ecx
f0105e2e:	0f b6 02             	movzbl (%edx),%eax
f0105e31:	8d 70 d0             	lea    -0x30(%eax),%esi
f0105e34:	89 f3                	mov    %esi,%ebx
f0105e36:	80 fb 09             	cmp    $0x9,%bl
f0105e39:	76 df                	jbe    f0105e1a <strtol+0x7c>
f0105e3b:	8d 70 9f             	lea    -0x61(%eax),%esi
f0105e3e:	89 f3                	mov    %esi,%ebx
f0105e40:	80 fb 19             	cmp    $0x19,%bl
f0105e43:	77 08                	ja     f0105e4d <strtol+0xaf>
f0105e45:	0f be c0             	movsbl %al,%eax
f0105e48:	83 e8 57             	sub    $0x57,%eax
f0105e4b:	eb d3                	jmp    f0105e20 <strtol+0x82>
f0105e4d:	8d 70 bf             	lea    -0x41(%eax),%esi
f0105e50:	89 f3                	mov    %esi,%ebx
f0105e52:	80 fb 19             	cmp    $0x19,%bl
f0105e55:	77 08                	ja     f0105e5f <strtol+0xc1>
f0105e57:	0f be c0             	movsbl %al,%eax
f0105e5a:	83 e8 37             	sub    $0x37,%eax
f0105e5d:	eb c1                	jmp    f0105e20 <strtol+0x82>
f0105e5f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
f0105e63:	74 05                	je     f0105e6a <strtol+0xcc>
f0105e65:	8b 45 0c             	mov    0xc(%ebp),%eax
f0105e68:	89 10                	mov    %edx,(%eax)
f0105e6a:	89 c8                	mov    %ecx,%eax
f0105e6c:	f7 d8                	neg    %eax
f0105e6e:	85 ff                	test   %edi,%edi
f0105e70:	0f 45 c8             	cmovne %eax,%ecx
f0105e73:	89 c8                	mov    %ecx,%eax
f0105e75:	5b                   	pop    %ebx
f0105e76:	5e                   	pop    %esi
f0105e77:	5f                   	pop    %edi
f0105e78:	5d                   	pop    %ebp
f0105e79:	c3                   	ret
f0105e7a:	66 90                	xchg   %ax,%ax

f0105e7c <mpentry_start>:
f0105e7c:	fa                   	cli
f0105e7d:	31 c0                	xor    %eax,%eax
f0105e7f:	8e d8                	mov    %eax,%ds
f0105e81:	8e c0                	mov    %eax,%es
f0105e83:	8e d0                	mov    %eax,%ss
f0105e85:	0f 01 16             	lgdtl  (%esi)
f0105e88:	7c 70                	jl     f0105efa <gdtdesc+0x2>
f0105e8a:	0f 20 c0             	mov    %cr0,%eax
f0105e8d:	66 83 c8 01          	or     $0x1,%ax
f0105e91:	0f 22 c0             	mov    %eax,%cr0
f0105e94:	66 ea 20 70 00 00    	ljmpw  $0x0,$0x7020
f0105e9a:	08 00                	or     %al,(%eax)

f0105e9c <start32>:
f0105e9c:	66 b8 10 00          	mov    $0x10,%ax
f0105ea0:	8e d8                	mov    %eax,%ds
f0105ea2:	8e c0                	mov    %eax,%es
f0105ea4:	8e d0                	mov    %eax,%ss
f0105ea6:	66 b8 00 00          	mov    $0x0,%ax
f0105eaa:	8e e0                	mov    %eax,%fs
f0105eac:	8e e8                	mov    %eax,%gs
f0105eae:	b8 00 10 11 00       	mov    $0x111000,%eax
f0105eb3:	0f 22 d8             	mov    %eax,%cr3
f0105eb6:	0f 20 e0             	mov    %cr4,%eax
f0105eb9:	83 c8 10             	or     $0x10,%eax
f0105ebc:	0f 22 e0             	mov    %eax,%cr4
f0105ebf:	0f 20 c0             	mov    %cr0,%eax
f0105ec2:	0d 01 00 01 80       	or     $0x80010001,%eax
f0105ec7:	0f 22 c0             	mov    %eax,%cr0
f0105eca:	8b 25 04 90 18 f0    	mov    0xf0189004,%esp
f0105ed0:	bd 00 00 00 00       	mov    $0x0,%ebp
f0105ed5:	b8 39 02 10 f0       	mov    $0xf0100239,%eax
f0105eda:	ff d0                	call   *%eax

f0105edc <spin>:
f0105edc:	eb fe                	jmp    f0105edc <spin>
f0105ede:	66 90                	xchg   %ax,%ax

f0105ee0 <gdt>:
	...
f0105ee8:	ff                   	(bad)
f0105ee9:	ff 00                	incl   (%eax)
f0105eeb:	00 00                	add    %al,(%eax)
f0105eed:	9a cf 00 ff ff 00 00 	lcall  $0x0,$0xffff00cf
f0105ef4:	00                   	.byte 0
f0105ef5:	92                   	xchg   %eax,%edx
f0105ef6:	cf                   	iret
	...

f0105ef8 <gdtdesc>:
f0105ef8:	17                   	pop    %ss
f0105ef9:	00 64 70 00          	add    %ah,0x0(%eax,%esi,2)
	...

f0105efe <mpentry_end>:
f0105efe:	90                   	nop

f0105eff <inb>:
f0105eff:	89 c2                	mov    %eax,%edx
f0105f01:	ec                   	in     (%dx),%al
f0105f02:	c3                   	ret

f0105f03 <outb>:
f0105f03:	89 c1                	mov    %eax,%ecx
f0105f05:	89 d0                	mov    %edx,%eax
f0105f07:	89 ca                	mov    %ecx,%edx
f0105f09:	ee                   	out    %al,(%dx)
f0105f0a:	c3                   	ret

f0105f0b <sum>:
f0105f0b:	55                   	push   %ebp
f0105f0c:	89 e5                	mov    %esp,%ebp
f0105f0e:	56                   	push   %esi
f0105f0f:	53                   	push   %ebx
f0105f10:	89 c6                	mov    %eax,%esi
f0105f12:	b8 00 00 00 00       	mov    $0x0,%eax
f0105f17:	b9 00 00 00 00       	mov    $0x0,%ecx
f0105f1c:	eb 09                	jmp    f0105f27 <sum+0x1c>
f0105f1e:	0f b6 1c 0e          	movzbl (%esi,%ecx,1),%ebx
f0105f22:	01 d8                	add    %ebx,%eax
f0105f24:	83 c1 01             	add    $0x1,%ecx
f0105f27:	39 d1                	cmp    %edx,%ecx
f0105f29:	7c f3                	jl     f0105f1e <sum+0x13>
f0105f2b:	5b                   	pop    %ebx
f0105f2c:	5e                   	pop    %esi
f0105f2d:	5d                   	pop    %ebp
f0105f2e:	c3                   	ret

f0105f2f <_kaddr>:
f0105f2f:	55                   	push   %ebp
f0105f30:	89 e5                	mov    %esp,%ebp
f0105f32:	53                   	push   %ebx
f0105f33:	83 ec 04             	sub    $0x4,%esp
f0105f36:	89 cb                	mov    %ecx,%ebx
f0105f38:	c1 eb 0c             	shr    $0xc,%ebx
f0105f3b:	3b 1d 60 92 18 f0    	cmp    0xf0189260,%ebx
f0105f41:	73 0b                	jae    f0105f4e <_kaddr+0x1f>
f0105f43:	8d 81 00 00 00 f0    	lea    -0x10000000(%ecx),%eax
f0105f49:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f0105f4c:	c9                   	leave
f0105f4d:	c3                   	ret
f0105f4e:	51                   	push   %ecx
f0105f4f:	68 cc 69 10 f0       	push   $0xf01069cc
f0105f54:	52                   	push   %edx
f0105f55:	50                   	push   %eax
f0105f56:	e8 0f a1 ff ff       	call   f010006a <_panic>

f0105f5b <mpsearch1>:
f0105f5b:	55                   	push   %ebp
f0105f5c:	89 e5                	mov    %esp,%ebp
f0105f5e:	57                   	push   %edi
f0105f5f:	56                   	push   %esi
f0105f60:	53                   	push   %ebx
f0105f61:	83 ec 0c             	sub    $0xc,%esp
f0105f64:	89 c7                	mov    %eax,%edi
f0105f66:	89 d6                	mov    %edx,%esi
f0105f68:	89 c1                	mov    %eax,%ecx
f0105f6a:	ba 56 00 00 00       	mov    $0x56,%edx
f0105f6f:	b8 11 82 10 f0       	mov    $0xf0108211,%eax
f0105f74:	e8 b6 ff ff ff       	call   f0105f2f <_kaddr>
f0105f79:	89 c3                	mov    %eax,%ebx
f0105f7b:	8d 0c 3e             	lea    (%esi,%edi,1),%ecx
f0105f7e:	ba 56 00 00 00       	mov    $0x56,%edx
f0105f83:	b8 11 82 10 f0       	mov    $0xf0108211,%eax
f0105f88:	e8 a2 ff ff ff       	call   f0105f2f <_kaddr>
f0105f8d:	89 c6                	mov    %eax,%esi
f0105f8f:	eb 03                	jmp    f0105f94 <mpsearch1+0x39>
f0105f91:	83 c3 10             	add    $0x10,%ebx
f0105f94:	39 f3                	cmp    %esi,%ebx
f0105f96:	73 29                	jae    f0105fc1 <mpsearch1+0x66>
f0105f98:	83 ec 04             	sub    $0x4,%esp
f0105f9b:	6a 04                	push   $0x4
f0105f9d:	68 21 82 10 f0       	push   $0xf0108221
f0105fa2:	53                   	push   %ebx
f0105fa3:	e8 a0 fd ff ff       	call   f0105d48 <memcmp>
f0105fa8:	83 c4 10             	add    $0x10,%esp
f0105fab:	85 c0                	test   %eax,%eax
f0105fad:	75 e2                	jne    f0105f91 <mpsearch1+0x36>
f0105faf:	ba 10 00 00 00       	mov    $0x10,%edx
f0105fb4:	89 d8                	mov    %ebx,%eax
f0105fb6:	e8 50 ff ff ff       	call   f0105f0b <sum>
f0105fbb:	84 c0                	test   %al,%al
f0105fbd:	75 d2                	jne    f0105f91 <mpsearch1+0x36>
f0105fbf:	eb 05                	jmp    f0105fc6 <mpsearch1+0x6b>
f0105fc1:	bb 00 00 00 00       	mov    $0x0,%ebx
f0105fc6:	89 d8                	mov    %ebx,%eax
f0105fc8:	8d 65 f4             	lea    -0xc(%ebp),%esp
f0105fcb:	5b                   	pop    %ebx
f0105fcc:	5e                   	pop    %esi
f0105fcd:	5f                   	pop    %edi
f0105fce:	5d                   	pop    %ebp
f0105fcf:	c3                   	ret

f0105fd0 <mpsearch>:
f0105fd0:	55                   	push   %ebp
f0105fd1:	89 e5                	mov    %esp,%ebp
f0105fd3:	83 ec 08             	sub    $0x8,%esp
f0105fd6:	b9 00 04 00 00       	mov    $0x400,%ecx
f0105fdb:	ba 6e 00 00 00       	mov    $0x6e,%edx
f0105fe0:	b8 11 82 10 f0       	mov    $0xf0108211,%eax
f0105fe5:	e8 45 ff ff ff       	call   f0105f2f <_kaddr>
f0105fea:	0f b7 50 0e          	movzwl 0xe(%eax),%edx
f0105fee:	85 d2                	test   %edx,%edx
f0105ff0:	74 24                	je     f0106016 <mpsearch+0x46>
f0105ff2:	89 d0                	mov    %edx,%eax
f0105ff4:	c1 e0 04             	shl    $0x4,%eax
f0105ff7:	ba 00 04 00 00       	mov    $0x400,%edx
f0105ffc:	e8 5a ff ff ff       	call   f0105f5b <mpsearch1>
f0106001:	85 c0                	test   %eax,%eax
f0106003:	75 0f                	jne    f0106014 <mpsearch+0x44>
f0106005:	ba 00 00 01 00       	mov    $0x10000,%edx
f010600a:	b8 00 00 0f 00       	mov    $0xf0000,%eax
f010600f:	e8 47 ff ff ff       	call   f0105f5b <mpsearch1>
f0106014:	c9                   	leave
f0106015:	c3                   	ret
f0106016:	0f b7 40 13          	movzwl 0x13(%eax),%eax
f010601a:	c1 e0 0a             	shl    $0xa,%eax
f010601d:	2d 00 04 00 00       	sub    $0x400,%eax
f0106022:	ba 00 04 00 00       	mov    $0x400,%edx
f0106027:	e8 2f ff ff ff       	call   f0105f5b <mpsearch1>
f010602c:	85 c0                	test   %eax,%eax
f010602e:	75 e4                	jne    f0106014 <mpsearch+0x44>
f0106030:	eb d3                	jmp    f0106005 <mpsearch+0x35>

f0106032 <mpconfig>:
f0106032:	55                   	push   %ebp
f0106033:	89 e5                	mov    %esp,%ebp
f0106035:	57                   	push   %edi
f0106036:	56                   	push   %esi
f0106037:	53                   	push   %ebx
f0106038:	83 ec 1c             	sub    $0x1c,%esp
f010603b:	89 45 e4             	mov    %eax,-0x1c(%ebp)
f010603e:	e8 8d ff ff ff       	call   f0105fd0 <mpsearch>
f0106043:	89 c6                	mov    %eax,%esi
f0106045:	85 c0                	test   %eax,%eax
f0106047:	0f 84 ef 00 00 00    	je     f010613c <mpconfig+0x10a>
f010604d:	8b 48 04             	mov    0x4(%eax),%ecx
f0106050:	85 c9                	test   %ecx,%ecx
f0106052:	74 6e                	je     f01060c2 <mpconfig+0x90>
f0106054:	80 78 0b 00          	cmpb   $0x0,0xb(%eax)
f0106058:	75 68                	jne    f01060c2 <mpconfig+0x90>
f010605a:	ba 8f 00 00 00       	mov    $0x8f,%edx
f010605f:	b8 11 82 10 f0       	mov    $0xf0108211,%eax
f0106064:	e8 c6 fe ff ff       	call   f0105f2f <_kaddr>
f0106069:	89 c3                	mov    %eax,%ebx
f010606b:	83 ec 04             	sub    $0x4,%esp
f010606e:	6a 04                	push   $0x4
f0106070:	68 26 82 10 f0       	push   $0xf0108226
f0106075:	50                   	push   %eax
f0106076:	e8 cd fc ff ff       	call   f0105d48 <memcmp>
f010607b:	83 c4 10             	add    $0x10,%esp
f010607e:	85 c0                	test   %eax,%eax
f0106080:	75 57                	jne    f01060d9 <mpconfig+0xa7>
f0106082:	0f b7 7b 04          	movzwl 0x4(%ebx),%edi
f0106086:	0f b7 d7             	movzwl %di,%edx
f0106089:	89 d8                	mov    %ebx,%eax
f010608b:	e8 7b fe ff ff       	call   f0105f0b <sum>
f0106090:	84 c0                	test   %al,%al
f0106092:	75 5c                	jne    f01060f0 <mpconfig+0xbe>
f0106094:	0f b6 43 06          	movzbl 0x6(%ebx),%eax
f0106098:	3c 01                	cmp    $0x1,%al
f010609a:	74 04                	je     f01060a0 <mpconfig+0x6e>
f010609c:	3c 04                	cmp    $0x4,%al
f010609e:	75 67                	jne    f0106107 <mpconfig+0xd5>
f01060a0:	0f b7 53 28          	movzwl 0x28(%ebx),%edx
f01060a4:	0f b7 c7             	movzwl %di,%eax
f01060a7:	01 d8                	add    %ebx,%eax
f01060a9:	e8 5d fe ff ff       	call   f0105f0b <sum>
f01060ae:	02 43 2a             	add    0x2a(%ebx),%al
f01060b1:	75 6f                	jne    f0106122 <mpconfig+0xf0>
f01060b3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f01060b6:	89 30                	mov    %esi,(%eax)
f01060b8:	89 d8                	mov    %ebx,%eax
f01060ba:	8d 65 f4             	lea    -0xc(%ebp),%esp
f01060bd:	5b                   	pop    %ebx
f01060be:	5e                   	pop    %esi
f01060bf:	5f                   	pop    %edi
f01060c0:	5d                   	pop    %ebp
f01060c1:	c3                   	ret
f01060c2:	83 ec 0c             	sub    $0xc,%esp
f01060c5:	68 18 77 10 f0       	push   $0xf0107718
f01060ca:	e8 67 d7 ff ff       	call   f0103836 <cprintf>
f01060cf:	83 c4 10             	add    $0x10,%esp
f01060d2:	bb 00 00 00 00       	mov    $0x0,%ebx
f01060d7:	eb df                	jmp    f01060b8 <mpconfig+0x86>
f01060d9:	83 ec 0c             	sub    $0xc,%esp
f01060dc:	68 48 77 10 f0       	push   $0xf0107748
f01060e1:	e8 50 d7 ff ff       	call   f0103836 <cprintf>
f01060e6:	83 c4 10             	add    $0x10,%esp
f01060e9:	bb 00 00 00 00       	mov    $0x0,%ebx
f01060ee:	eb c8                	jmp    f01060b8 <mpconfig+0x86>
f01060f0:	83 ec 0c             	sub    $0xc,%esp
f01060f3:	68 7c 77 10 f0       	push   $0xf010777c
f01060f8:	e8 39 d7 ff ff       	call   f0103836 <cprintf>
f01060fd:	83 c4 10             	add    $0x10,%esp
f0106100:	bb 00 00 00 00       	mov    $0x0,%ebx
f0106105:	eb b1                	jmp    f01060b8 <mpconfig+0x86>
f0106107:	83 ec 08             	sub    $0x8,%esp
f010610a:	0f b6 c0             	movzbl %al,%eax
f010610d:	50                   	push   %eax
f010610e:	68 a0 77 10 f0       	push   $0xf01077a0
f0106113:	e8 1e d7 ff ff       	call   f0103836 <cprintf>
f0106118:	83 c4 10             	add    $0x10,%esp
f010611b:	bb 00 00 00 00       	mov    $0x0,%ebx
f0106120:	eb 96                	jmp    f01060b8 <mpconfig+0x86>
f0106122:	83 ec 0c             	sub    $0xc,%esp
f0106125:	68 c0 77 10 f0       	push   $0xf01077c0
f010612a:	e8 07 d7 ff ff       	call   f0103836 <cprintf>
f010612f:	83 c4 10             	add    $0x10,%esp
f0106132:	bb 00 00 00 00       	mov    $0x0,%ebx
f0106137:	e9 7c ff ff ff       	jmp    f01060b8 <mpconfig+0x86>
f010613c:	89 c3                	mov    %eax,%ebx
f010613e:	e9 75 ff ff ff       	jmp    f01060b8 <mpconfig+0x86>

f0106143 <mp_init>:
f0106143:	55                   	push   %ebp
f0106144:	89 e5                	mov    %esp,%ebp
f0106146:	57                   	push   %edi
f0106147:	56                   	push   %esi
f0106148:	53                   	push   %ebx
f0106149:	83 ec 1c             	sub    $0x1c,%esp
f010614c:	c7 05 08 d0 1c f0 20 	movl   $0xf01cd020,0xf01cd008
f0106153:	d0 1c f0 
f0106156:	8d 45 e4             	lea    -0x1c(%ebp),%eax
f0106159:	e8 d4 fe ff ff       	call   f0106032 <mpconfig>
f010615e:	85 c0                	test   %eax,%eax
f0106160:	0f 84 e5 00 00 00    	je     f010624b <mp_init+0x108>
f0106166:	89 c7                	mov    %eax,%edi
f0106168:	c7 05 04 d0 1c f0 01 	movl   $0x1,0xf01cd004
f010616f:	00 00 00 
f0106172:	8b 40 24             	mov    0x24(%eax),%eax
f0106175:	a3 c4 d3 1c f0       	mov    %eax,0xf01cd3c4
f010617a:	8d 77 2c             	lea    0x2c(%edi),%esi
f010617d:	bb 00 00 00 00       	mov    $0x0,%ebx
f0106182:	eb 38                	jmp    f01061bc <mp_init+0x79>
f0106184:	f6 46 03 02          	testb  $0x2,0x3(%esi)
f0106188:	74 11                	je     f010619b <mp_init+0x58>
f010618a:	6b 05 00 d0 1c f0 74 	imul   $0x74,0xf01cd000,%eax
f0106191:	05 20 d0 1c f0       	add    $0xf01cd020,%eax
f0106196:	a3 08 d0 1c f0       	mov    %eax,0xf01cd008
f010619b:	a1 00 d0 1c f0       	mov    0xf01cd000,%eax
f01061a0:	83 f8 07             	cmp    $0x7,%eax
f01061a3:	7f 33                	jg     f01061d8 <mp_init+0x95>
f01061a5:	6b d0 74             	imul   $0x74,%eax,%edx
f01061a8:	88 82 20 d0 1c f0    	mov    %al,-0xfe32fe0(%edx)
f01061ae:	83 c0 01             	add    $0x1,%eax
f01061b1:	a3 00 d0 1c f0       	mov    %eax,0xf01cd000
f01061b6:	83 c6 14             	add    $0x14,%esi
f01061b9:	83 c3 01             	add    $0x1,%ebx
f01061bc:	0f b7 47 22          	movzwl 0x22(%edi),%eax
f01061c0:	39 c3                	cmp    %eax,%ebx
f01061c2:	73 4f                	jae    f0106213 <mp_init+0xd0>
f01061c4:	0f b6 06             	movzbl (%esi),%eax
f01061c7:	84 c0                	test   %al,%al
f01061c9:	74 b9                	je     f0106184 <mp_init+0x41>
f01061cb:	8d 50 ff             	lea    -0x1(%eax),%edx
f01061ce:	80 fa 03             	cmp    $0x3,%dl
f01061d1:	77 1c                	ja     f01061ef <mp_init+0xac>
f01061d3:	83 c6 08             	add    $0x8,%esi
f01061d6:	eb e1                	jmp    f01061b9 <mp_init+0x76>
f01061d8:	83 ec 08             	sub    $0x8,%esp
f01061db:	0f b6 46 01          	movzbl 0x1(%esi),%eax
f01061df:	50                   	push   %eax
f01061e0:	68 f0 77 10 f0       	push   $0xf01077f0
f01061e5:	e8 4c d6 ff ff       	call   f0103836 <cprintf>
f01061ea:	83 c4 10             	add    $0x10,%esp
f01061ed:	eb c7                	jmp    f01061b6 <mp_init+0x73>
f01061ef:	83 ec 08             	sub    $0x8,%esp
f01061f2:	0f b6 c0             	movzbl %al,%eax
f01061f5:	50                   	push   %eax
f01061f6:	68 18 78 10 f0       	push   $0xf0107818
f01061fb:	e8 36 d6 ff ff       	call   f0103836 <cprintf>
f0106200:	c7 05 04 d0 1c f0 00 	movl   $0x0,0xf01cd004
f0106207:	00 00 00 
f010620a:	0f b7 5f 22          	movzwl 0x22(%edi),%ebx
f010620e:	83 c4 10             	add    $0x10,%esp
f0106211:	eb a6                	jmp    f01061b9 <mp_init+0x76>
f0106213:	a1 08 d0 1c f0       	mov    0xf01cd008,%eax
f0106218:	c7 40 04 01 00 00 00 	movl   $0x1,0x4(%eax)
f010621f:	83 3d 04 d0 1c f0 00 	cmpl   $0x0,0xf01cd004
f0106226:	74 2b                	je     f0106253 <mp_init+0x110>
f0106228:	83 ec 04             	sub    $0x4,%esp
f010622b:	ff 35 00 d0 1c f0    	push   0xf01cd000
f0106231:	0f b6 00             	movzbl (%eax),%eax
f0106234:	50                   	push   %eax
f0106235:	68 2b 82 10 f0       	push   $0xf010822b
f010623a:	e8 f7 d5 ff ff       	call   f0103836 <cprintf>
f010623f:	83 c4 10             	add    $0x10,%esp
f0106242:	8b 45 e4             	mov    -0x1c(%ebp),%eax
f0106245:	80 78 0c 00          	cmpb   $0x0,0xc(%eax)
f0106249:	75 2e                	jne    f0106279 <mp_init+0x136>
f010624b:	8d 65 f4             	lea    -0xc(%ebp),%esp
f010624e:	5b                   	pop    %ebx
f010624f:	5e                   	pop    %esi
f0106250:	5f                   	pop    %edi
f0106251:	5d                   	pop    %ebp
f0106252:	c3                   	ret
f0106253:	c7 05 00 d0 1c f0 01 	movl   $0x1,0xf01cd000
f010625a:	00 00 00 
f010625d:	c7 05 c4 d3 1c f0 00 	movl   $0x0,0xf01cd3c4
f0106264:	00 00 00 
f0106267:	83 ec 0c             	sub    $0xc,%esp
f010626a:	68 38 78 10 f0       	push   $0xf0107838
f010626f:	e8 c2 d5 ff ff       	call   f0103836 <cprintf>
f0106274:	83 c4 10             	add    $0x10,%esp
f0106277:	eb d2                	jmp    f010624b <mp_init+0x108>
f0106279:	83 ec 0c             	sub    $0xc,%esp
f010627c:	68 64 78 10 f0       	push   $0xf0107864
f0106281:	e8 b0 d5 ff ff       	call   f0103836 <cprintf>
f0106286:	ba 70 00 00 00       	mov    $0x70,%edx
f010628b:	b8 22 00 00 00       	mov    $0x22,%eax
f0106290:	e8 6e fc ff ff       	call   f0105f03 <outb>
f0106295:	b8 23 00 00 00       	mov    $0x23,%eax
f010629a:	e8 60 fc ff ff       	call   f0105eff <inb>
f010629f:	83 c8 01             	or     $0x1,%eax
f01062a2:	0f b6 d0             	movzbl %al,%edx
f01062a5:	b8 23 00 00 00       	mov    $0x23,%eax
f01062aa:	e8 54 fc ff ff       	call   f0105f03 <outb>
f01062af:	83 c4 10             	add    $0x10,%esp
f01062b2:	eb 97                	jmp    f010624b <mp_init+0x108>

f01062b4 <outb>:
f01062b4:	89 c1                	mov    %eax,%ecx
f01062b6:	89 d0                	mov    %edx,%eax
f01062b8:	89 ca                	mov    %ecx,%edx
f01062ba:	ee                   	out    %al,(%dx)
f01062bb:	c3                   	ret

f01062bc <lapicw>:
f01062bc:	8b 0d c0 d3 1c f0    	mov    0xf01cd3c0,%ecx
f01062c2:	8d 04 81             	lea    (%ecx,%eax,4),%eax
f01062c5:	89 10                	mov    %edx,(%eax)
f01062c7:	a1 c0 d3 1c f0       	mov    0xf01cd3c0,%eax
f01062cc:	8b 40 20             	mov    0x20(%eax),%eax
f01062cf:	c3                   	ret

f01062d0 <_kaddr>:
f01062d0:	55                   	push   %ebp
f01062d1:	89 e5                	mov    %esp,%ebp
f01062d3:	53                   	push   %ebx
f01062d4:	83 ec 04             	sub    $0x4,%esp
f01062d7:	89 cb                	mov    %ecx,%ebx
f01062d9:	c1 eb 0c             	shr    $0xc,%ebx
f01062dc:	3b 1d 60 92 18 f0    	cmp    0xf0189260,%ebx
f01062e2:	73 0b                	jae    f01062ef <_kaddr+0x1f>
f01062e4:	8d 81 00 00 00 f0    	lea    -0x10000000(%ecx),%eax
f01062ea:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f01062ed:	c9                   	leave
f01062ee:	c3                   	ret
f01062ef:	51                   	push   %ecx
f01062f0:	68 cc 69 10 f0       	push   $0xf01069cc
f01062f5:	52                   	push   %edx
f01062f6:	50                   	push   %eax
f01062f7:	e8 6e 9d ff ff       	call   f010006a <_panic>

f01062fc <cpunum>:
f01062fc:	8b 15 c0 d3 1c f0    	mov    0xf01cd3c0,%edx
f0106302:	b8 00 00 00 00       	mov    $0x0,%eax
f0106307:	85 d2                	test   %edx,%edx
f0106309:	74 06                	je     f0106311 <cpunum+0x15>
f010630b:	8b 42 20             	mov    0x20(%edx),%eax
f010630e:	c1 e8 18             	shr    $0x18,%eax
f0106311:	c3                   	ret

f0106312 <lapic_init>:
f0106312:	a1 c4 d3 1c f0       	mov    0xf01cd3c4,%eax
f0106317:	85 c0                	test   %eax,%eax
f0106319:	75 01                	jne    f010631c <lapic_init+0xa>
f010631b:	c3                   	ret
f010631c:	55                   	push   %ebp
f010631d:	89 e5                	mov    %esp,%ebp
f010631f:	83 ec 10             	sub    $0x10,%esp
f0106322:	68 00 10 00 00       	push   $0x1000
f0106327:	50                   	push   %eax
f0106328:	e8 32 ba ff ff       	call   f0101d5f <mmio_map_region>
f010632d:	a3 c0 d3 1c f0       	mov    %eax,0xf01cd3c0
f0106332:	ba 27 01 00 00       	mov    $0x127,%edx
f0106337:	b8 3c 00 00 00       	mov    $0x3c,%eax
f010633c:	e8 7b ff ff ff       	call   f01062bc <lapicw>
f0106341:	ba 0b 00 00 00       	mov    $0xb,%edx
f0106346:	b8 f8 00 00 00       	mov    $0xf8,%eax
f010634b:	e8 6c ff ff ff       	call   f01062bc <lapicw>
f0106350:	ba 20 00 02 00       	mov    $0x20020,%edx
f0106355:	b8 c8 00 00 00       	mov    $0xc8,%eax
f010635a:	e8 5d ff ff ff       	call   f01062bc <lapicw>
f010635f:	ba 80 96 98 00       	mov    $0x989680,%edx
f0106364:	b8 e0 00 00 00       	mov    $0xe0,%eax
f0106369:	e8 4e ff ff ff       	call   f01062bc <lapicw>
f010636e:	e8 89 ff ff ff       	call   f01062fc <cpunum>
f0106373:	6b c0 74             	imul   $0x74,%eax,%eax
f0106376:	05 20 d0 1c f0       	add    $0xf01cd020,%eax
f010637b:	83 c4 10             	add    $0x10,%esp
f010637e:	39 05 08 d0 1c f0    	cmp    %eax,0xf01cd008
f0106384:	74 0f                	je     f0106395 <lapic_init+0x83>
f0106386:	ba 00 00 01 00       	mov    $0x10000,%edx
f010638b:	b8 d4 00 00 00       	mov    $0xd4,%eax
f0106390:	e8 27 ff ff ff       	call   f01062bc <lapicw>
f0106395:	ba 00 00 01 00       	mov    $0x10000,%edx
f010639a:	b8 d8 00 00 00       	mov    $0xd8,%eax
f010639f:	e8 18 ff ff ff       	call   f01062bc <lapicw>
f01063a4:	a1 c0 d3 1c f0       	mov    0xf01cd3c0,%eax
f01063a9:	8b 40 30             	mov    0x30(%eax),%eax
f01063ac:	a9 00 00 fc 00       	test   $0xfc0000,%eax
f01063b1:	75 7c                	jne    f010642f <lapic_init+0x11d>
f01063b3:	ba 33 00 00 00       	mov    $0x33,%edx
f01063b8:	b8 dc 00 00 00       	mov    $0xdc,%eax
f01063bd:	e8 fa fe ff ff       	call   f01062bc <lapicw>
f01063c2:	ba 00 00 00 00       	mov    $0x0,%edx
f01063c7:	b8 a0 00 00 00       	mov    $0xa0,%eax
f01063cc:	e8 eb fe ff ff       	call   f01062bc <lapicw>
f01063d1:	ba 00 00 00 00       	mov    $0x0,%edx
f01063d6:	b8 a0 00 00 00       	mov    $0xa0,%eax
f01063db:	e8 dc fe ff ff       	call   f01062bc <lapicw>
f01063e0:	ba 00 00 00 00       	mov    $0x0,%edx
f01063e5:	b8 2c 00 00 00       	mov    $0x2c,%eax
f01063ea:	e8 cd fe ff ff       	call   f01062bc <lapicw>
f01063ef:	ba 00 00 00 00       	mov    $0x0,%edx
f01063f4:	b8 c4 00 00 00       	mov    $0xc4,%eax
f01063f9:	e8 be fe ff ff       	call   f01062bc <lapicw>
f01063fe:	ba 00 85 08 00       	mov    $0x88500,%edx
f0106403:	b8 c0 00 00 00       	mov    $0xc0,%eax
f0106408:	e8 af fe ff ff       	call   f01062bc <lapicw>
f010640d:	8b 15 c0 d3 1c f0    	mov    0xf01cd3c0,%edx
f0106413:	8b 82 00 03 00 00    	mov    0x300(%edx),%eax
f0106419:	f6 c4 10             	test   $0x10,%ah
f010641c:	75 f5                	jne    f0106413 <lapic_init+0x101>
f010641e:	ba 00 00 00 00       	mov    $0x0,%edx
f0106423:	b8 20 00 00 00       	mov    $0x20,%eax
f0106428:	e8 8f fe ff ff       	call   f01062bc <lapicw>
f010642d:	c9                   	leave
f010642e:	c3                   	ret
f010642f:	ba 00 00 01 00       	mov    $0x10000,%edx
f0106434:	b8 d0 00 00 00       	mov    $0xd0,%eax
f0106439:	e8 7e fe ff ff       	call   f01062bc <lapicw>
f010643e:	e9 70 ff ff ff       	jmp    f01063b3 <lapic_init+0xa1>

f0106443 <lapic_eoi>:
f0106443:	83 3d c0 d3 1c f0 00 	cmpl   $0x0,0xf01cd3c0
f010644a:	74 17                	je     f0106463 <lapic_eoi+0x20>
f010644c:	55                   	push   %ebp
f010644d:	89 e5                	mov    %esp,%ebp
f010644f:	83 ec 08             	sub    $0x8,%esp
f0106452:	ba 00 00 00 00       	mov    $0x0,%edx
f0106457:	b8 2c 00 00 00       	mov    $0x2c,%eax
f010645c:	e8 5b fe ff ff       	call   f01062bc <lapicw>
f0106461:	c9                   	leave
f0106462:	c3                   	ret
f0106463:	c3                   	ret

f0106464 <lapic_startap>:
f0106464:	55                   	push   %ebp
f0106465:	89 e5                	mov    %esp,%ebp
f0106467:	56                   	push   %esi
f0106468:	53                   	push   %ebx
f0106469:	8b 75 08             	mov    0x8(%ebp),%esi
f010646c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
f010646f:	ba 0f 00 00 00       	mov    $0xf,%edx
f0106474:	b8 70 00 00 00       	mov    $0x70,%eax
f0106479:	e8 36 fe ff ff       	call   f01062b4 <outb>
f010647e:	ba 0a 00 00 00       	mov    $0xa,%edx
f0106483:	b8 71 00 00 00       	mov    $0x71,%eax
f0106488:	e8 27 fe ff ff       	call   f01062b4 <outb>
f010648d:	b9 67 04 00 00       	mov    $0x467,%ecx
f0106492:	ba 98 00 00 00       	mov    $0x98,%edx
f0106497:	b8 48 82 10 f0       	mov    $0xf0108248,%eax
f010649c:	e8 2f fe ff ff       	call   f01062d0 <_kaddr>
f01064a1:	66 c7 00 00 00       	movw   $0x0,(%eax)
f01064a6:	89 da                	mov    %ebx,%edx
f01064a8:	c1 ea 04             	shr    $0x4,%edx
f01064ab:	66 89 50 02          	mov    %dx,0x2(%eax)
f01064af:	c1 e6 18             	shl    $0x18,%esi
f01064b2:	89 f2                	mov    %esi,%edx
f01064b4:	b8 c4 00 00 00       	mov    $0xc4,%eax
f01064b9:	e8 fe fd ff ff       	call   f01062bc <lapicw>
f01064be:	ba 00 c5 00 00       	mov    $0xc500,%edx
f01064c3:	b8 c0 00 00 00       	mov    $0xc0,%eax
f01064c8:	e8 ef fd ff ff       	call   f01062bc <lapicw>
f01064cd:	ba 00 85 00 00       	mov    $0x8500,%edx
f01064d2:	b8 c0 00 00 00       	mov    $0xc0,%eax
f01064d7:	e8 e0 fd ff ff       	call   f01062bc <lapicw>
f01064dc:	c1 eb 0c             	shr    $0xc,%ebx
f01064df:	80 cf 06             	or     $0x6,%bh
f01064e2:	89 f2                	mov    %esi,%edx
f01064e4:	b8 c4 00 00 00       	mov    $0xc4,%eax
f01064e9:	e8 ce fd ff ff       	call   f01062bc <lapicw>
f01064ee:	89 da                	mov    %ebx,%edx
f01064f0:	b8 c0 00 00 00       	mov    $0xc0,%eax
f01064f5:	e8 c2 fd ff ff       	call   f01062bc <lapicw>
f01064fa:	89 f2                	mov    %esi,%edx
f01064fc:	b8 c4 00 00 00       	mov    $0xc4,%eax
f0106501:	e8 b6 fd ff ff       	call   f01062bc <lapicw>
f0106506:	89 da                	mov    %ebx,%edx
f0106508:	b8 c0 00 00 00       	mov    $0xc0,%eax
f010650d:	e8 aa fd ff ff       	call   f01062bc <lapicw>
f0106512:	5b                   	pop    %ebx
f0106513:	5e                   	pop    %esi
f0106514:	5d                   	pop    %ebp
f0106515:	c3                   	ret

f0106516 <lapic_ipi>:
f0106516:	55                   	push   %ebp
f0106517:	89 e5                	mov    %esp,%ebp
f0106519:	83 ec 08             	sub    $0x8,%esp
f010651c:	8b 55 08             	mov    0x8(%ebp),%edx
f010651f:	81 ca 00 00 0c 00    	or     $0xc0000,%edx
f0106525:	b8 c0 00 00 00       	mov    $0xc0,%eax
f010652a:	e8 8d fd ff ff       	call   f01062bc <lapicw>
f010652f:	8b 15 c0 d3 1c f0    	mov    0xf01cd3c0,%edx
f0106535:	8b 82 00 03 00 00    	mov    0x300(%edx),%eax
f010653b:	f6 c4 10             	test   $0x10,%ah
f010653e:	75 f5                	jne    f0106535 <lapic_ipi+0x1f>
f0106540:	c9                   	leave
f0106541:	c3                   	ret

f0106542 <xchg>:
f0106542:	89 c1                	mov    %eax,%ecx
f0106544:	89 d0                	mov    %edx,%eax
f0106546:	f0 87 01             	lock xchg %eax,(%ecx)
f0106549:	c3                   	ret

f010654a <get_caller_pcs>:
f010654a:	89 ea                	mov    %ebp,%edx
f010654c:	b9 00 00 00 00       	mov    $0x0,%ecx
f0106551:	81 fa ff ff 7f ef    	cmp    $0xef7fffff,%edx
f0106557:	76 3b                	jbe    f0106594 <get_caller_pcs+0x4a>
f0106559:	83 f9 09             	cmp    $0x9,%ecx
f010655c:	7f 36                	jg     f0106594 <get_caller_pcs+0x4a>
f010655e:	55                   	push   %ebp
f010655f:	89 e5                	mov    %esp,%ebp
f0106561:	53                   	push   %ebx
f0106562:	8b 5a 04             	mov    0x4(%edx),%ebx
f0106565:	89 1c 88             	mov    %ebx,(%eax,%ecx,4)
f0106568:	8b 12                	mov    (%edx),%edx
f010656a:	83 c1 01             	add    $0x1,%ecx
f010656d:	81 fa ff ff 7f ef    	cmp    $0xef7fffff,%edx
f0106573:	76 05                	jbe    f010657a <get_caller_pcs+0x30>
f0106575:	83 f9 09             	cmp    $0x9,%ecx
f0106578:	7e e8                	jle    f0106562 <get_caller_pcs+0x18>
f010657a:	8d 14 88             	lea    (%eax,%ecx,4),%edx
f010657d:	83 c0 28             	add    $0x28,%eax
f0106580:	eb 09                	jmp    f010658b <get_caller_pcs+0x41>
f0106582:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
f0106588:	83 c2 04             	add    $0x4,%edx
f010658b:	39 c2                	cmp    %eax,%edx
f010658d:	75 f3                	jne    f0106582 <get_caller_pcs+0x38>
f010658f:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f0106592:	c9                   	leave
f0106593:	c3                   	ret
f0106594:	8d 14 88             	lea    (%eax,%ecx,4),%edx
f0106597:	83 c0 28             	add    $0x28,%eax
f010659a:	eb 09                	jmp    f01065a5 <get_caller_pcs+0x5b>
f010659c:	c7 02 00 00 00 00    	movl   $0x0,(%edx)
f01065a2:	83 c2 04             	add    $0x4,%edx
f01065a5:	39 c2                	cmp    %eax,%edx
f01065a7:	75 f3                	jne    f010659c <get_caller_pcs+0x52>
f01065a9:	c3                   	ret

f01065aa <holding>:
f01065aa:	83 38 00             	cmpl   $0x0,(%eax)
f01065ad:	75 06                	jne    f01065b5 <holding+0xb>
f01065af:	b8 00 00 00 00       	mov    $0x0,%eax
f01065b4:	c3                   	ret
f01065b5:	55                   	push   %ebp
f01065b6:	89 e5                	mov    %esp,%ebp
f01065b8:	53                   	push   %ebx
f01065b9:	83 ec 04             	sub    $0x4,%esp
f01065bc:	8b 58 08             	mov    0x8(%eax),%ebx
f01065bf:	e8 38 fd ff ff       	call   f01062fc <cpunum>
f01065c4:	6b c0 74             	imul   $0x74,%eax,%eax
f01065c7:	05 20 d0 1c f0       	add    $0xf01cd020,%eax
f01065cc:	39 c3                	cmp    %eax,%ebx
f01065ce:	0f 94 c0             	sete   %al
f01065d1:	0f b6 c0             	movzbl %al,%eax
f01065d4:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f01065d7:	c9                   	leave
f01065d8:	c3                   	ret

f01065d9 <__spin_initlock>:
f01065d9:	55                   	push   %ebp
f01065da:	89 e5                	mov    %esp,%ebp
f01065dc:	8b 45 08             	mov    0x8(%ebp),%eax
f01065df:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
f01065e5:	8b 55 0c             	mov    0xc(%ebp),%edx
f01065e8:	89 50 04             	mov    %edx,0x4(%eax)
f01065eb:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
f01065f2:	5d                   	pop    %ebp
f01065f3:	c3                   	ret

f01065f4 <spin_lock>:
f01065f4:	55                   	push   %ebp
f01065f5:	89 e5                	mov    %esp,%ebp
f01065f7:	53                   	push   %ebx
f01065f8:	83 ec 04             	sub    $0x4,%esp
f01065fb:	8b 5d 08             	mov    0x8(%ebp),%ebx
f01065fe:	89 d8                	mov    %ebx,%eax
f0106600:	e8 a5 ff ff ff       	call   f01065aa <holding>
f0106605:	85 c0                	test   %eax,%eax
f0106607:	74 20                	je     f0106629 <spin_lock+0x35>
f0106609:	8b 5b 04             	mov    0x4(%ebx),%ebx
f010660c:	e8 eb fc ff ff       	call   f01062fc <cpunum>
f0106611:	83 ec 0c             	sub    $0xc,%esp
f0106614:	53                   	push   %ebx
f0106615:	50                   	push   %eax
f0106616:	68 a8 78 10 f0       	push   $0xf01078a8
f010661b:	6a 41                	push   $0x41
f010661d:	68 55 82 10 f0       	push   $0xf0108255
f0106622:	e8 43 9a ff ff       	call   f010006a <_panic>
f0106627:	f3 90                	pause
f0106629:	ba 01 00 00 00       	mov    $0x1,%edx
f010662e:	89 d8                	mov    %ebx,%eax
f0106630:	e8 0d ff ff ff       	call   f0106542 <xchg>
f0106635:	85 c0                	test   %eax,%eax
f0106637:	75 ee                	jne    f0106627 <spin_lock+0x33>
f0106639:	e8 be fc ff ff       	call   f01062fc <cpunum>
f010663e:	6b c0 74             	imul   $0x74,%eax,%eax
f0106641:	05 20 d0 1c f0       	add    $0xf01cd020,%eax
f0106646:	89 43 08             	mov    %eax,0x8(%ebx)
f0106649:	8d 43 0c             	lea    0xc(%ebx),%eax
f010664c:	e8 f9 fe ff ff       	call   f010654a <get_caller_pcs>
f0106651:	8b 5d fc             	mov    -0x4(%ebp),%ebx
f0106654:	c9                   	leave
f0106655:	c3                   	ret

f0106656 <spin_unlock>:
f0106656:	55                   	push   %ebp
f0106657:	89 e5                	mov    %esp,%ebp
f0106659:	57                   	push   %edi
f010665a:	56                   	push   %esi
f010665b:	53                   	push   %ebx
f010665c:	83 ec 5c             	sub    $0x5c,%esp
f010665f:	8b 75 08             	mov    0x8(%ebp),%esi
f0106662:	89 f0                	mov    %esi,%eax
f0106664:	e8 41 ff ff ff       	call   f01065aa <holding>
f0106669:	85 c0                	test   %eax,%eax
f010666b:	74 22                	je     f010668f <spin_unlock+0x39>
f010666d:	c7 46 0c 00 00 00 00 	movl   $0x0,0xc(%esi)
f0106674:	c7 46 08 00 00 00 00 	movl   $0x0,0x8(%esi)
f010667b:	ba 00 00 00 00       	mov    $0x0,%edx
f0106680:	89 f0                	mov    %esi,%eax
f0106682:	e8 bb fe ff ff       	call   f0106542 <xchg>
f0106687:	8d 65 f4             	lea    -0xc(%ebp),%esp
f010668a:	5b                   	pop    %ebx
f010668b:	5e                   	pop    %esi
f010668c:	5f                   	pop    %edi
f010668d:	5d                   	pop    %ebp
f010668e:	c3                   	ret
f010668f:	83 ec 04             	sub    $0x4,%esp
f0106692:	6a 28                	push   $0x28
f0106694:	8d 46 0c             	lea    0xc(%esi),%eax
f0106697:	50                   	push   %eax
f0106698:	8d 5d c0             	lea    -0x40(%ebp),%ebx
f010669b:	53                   	push   %ebx
f010669c:	e8 2f f6 ff ff       	call   f0105cd0 <memmove>
f01066a1:	8b 46 08             	mov    0x8(%esi),%eax
f01066a4:	0f b6 38             	movzbl (%eax),%edi
f01066a7:	8b 76 04             	mov    0x4(%esi),%esi
f01066aa:	e8 4d fc ff ff       	call   f01062fc <cpunum>
f01066af:	57                   	push   %edi
f01066b0:	56                   	push   %esi
f01066b1:	50                   	push   %eax
f01066b2:	68 d4 78 10 f0       	push   $0xf01078d4
f01066b7:	e8 7a d1 ff ff       	call   f0103836 <cprintf>
f01066bc:	8d 7d e8             	lea    -0x18(%ebp),%edi
f01066bf:	83 c4 20             	add    $0x20,%esp
f01066c2:	8d 75 a8             	lea    -0x58(%ebp),%esi
f01066c5:	eb 1c                	jmp    f01066e3 <spin_unlock+0x8d>
f01066c7:	83 ec 08             	sub    $0x8,%esp
f01066ca:	8b 45 a4             	mov    -0x5c(%ebp),%eax
f01066cd:	ff 30                	push   (%eax)
f01066cf:	68 7c 82 10 f0       	push   $0xf010827c
f01066d4:	e8 5d d1 ff ff       	call   f0103836 <cprintf>
f01066d9:	83 c4 10             	add    $0x10,%esp
f01066dc:	83 c3 04             	add    $0x4,%ebx
f01066df:	39 fb                	cmp    %edi,%ebx
f01066e1:	74 44                	je     f0106727 <spin_unlock+0xd1>
f01066e3:	89 5d a4             	mov    %ebx,-0x5c(%ebp)
f01066e6:	8b 03                	mov    (%ebx),%eax
f01066e8:	85 c0                	test   %eax,%eax
f01066ea:	74 3b                	je     f0106727 <spin_unlock+0xd1>
f01066ec:	83 ec 08             	sub    $0x8,%esp
f01066ef:	56                   	push   %esi
f01066f0:	50                   	push   %eax
f01066f1:	e8 69 eb ff ff       	call   f010525f <debuginfo_eip>
f01066f6:	83 c4 10             	add    $0x10,%esp
f01066f9:	85 c0                	test   %eax,%eax
f01066fb:	78 ca                	js     f01066c7 <spin_unlock+0x71>
f01066fd:	8b 45 a4             	mov    -0x5c(%ebp),%eax
f0106700:	8b 00                	mov    (%eax),%eax
f0106702:	83 ec 04             	sub    $0x4,%esp
f0106705:	89 c2                	mov    %eax,%edx
f0106707:	2b 55 b8             	sub    -0x48(%ebp),%edx
f010670a:	52                   	push   %edx
f010670b:	ff 75 b0             	push   -0x50(%ebp)
f010670e:	ff 75 b4             	push   -0x4c(%ebp)
f0106711:	ff 75 ac             	push   -0x54(%ebp)
f0106714:	ff 75 a8             	push   -0x58(%ebp)
f0106717:	50                   	push   %eax
f0106718:	68 65 82 10 f0       	push   $0xf0108265
f010671d:	e8 14 d1 ff ff       	call   f0103836 <cprintf>
f0106722:	83 c4 20             	add    $0x20,%esp
f0106725:	eb b5                	jmp    f01066dc <spin_unlock+0x86>
f0106727:	83 ec 04             	sub    $0x4,%esp
f010672a:	68 84 82 10 f0       	push   $0xf0108284
f010672f:	6a 6f                	push   $0x6f
f0106731:	68 55 82 10 f0       	push   $0xf0108255
f0106736:	e8 2f 99 ff ff       	call   f010006a <_panic>
f010673b:	66 90                	xchg   %ax,%ax
f010673d:	66 90                	xchg   %ax,%ax
f010673f:	90                   	nop

f0106740 <__udivdi3>:
f0106740:	f3 0f 1e fb          	endbr32
f0106744:	55                   	push   %ebp
f0106745:	57                   	push   %edi
f0106746:	56                   	push   %esi
f0106747:	53                   	push   %ebx
f0106748:	83 ec 1c             	sub    $0x1c,%esp
f010674b:	8b 44 24 3c          	mov    0x3c(%esp),%eax
f010674f:	8b 6c 24 30          	mov    0x30(%esp),%ebp
f0106753:	8b 74 24 34          	mov    0x34(%esp),%esi
f0106757:	8b 5c 24 38          	mov    0x38(%esp),%ebx
f010675b:	85 c0                	test   %eax,%eax
f010675d:	75 19                	jne    f0106778 <__udivdi3+0x38>
f010675f:	39 de                	cmp    %ebx,%esi
f0106761:	73 4d                	jae    f01067b0 <__udivdi3+0x70>
f0106763:	31 ff                	xor    %edi,%edi
f0106765:	89 e8                	mov    %ebp,%eax
f0106767:	89 f2                	mov    %esi,%edx
f0106769:	f7 f3                	div    %ebx
f010676b:	89 fa                	mov    %edi,%edx
f010676d:	83 c4 1c             	add    $0x1c,%esp
f0106770:	5b                   	pop    %ebx
f0106771:	5e                   	pop    %esi
f0106772:	5f                   	pop    %edi
f0106773:	5d                   	pop    %ebp
f0106774:	c3                   	ret
f0106775:	8d 76 00             	lea    0x0(%esi),%esi
f0106778:	39 c6                	cmp    %eax,%esi
f010677a:	73 14                	jae    f0106790 <__udivdi3+0x50>
f010677c:	31 ff                	xor    %edi,%edi
f010677e:	31 c0                	xor    %eax,%eax
f0106780:	89 fa                	mov    %edi,%edx
f0106782:	83 c4 1c             	add    $0x1c,%esp
f0106785:	5b                   	pop    %ebx
f0106786:	5e                   	pop    %esi
f0106787:	5f                   	pop    %edi
f0106788:	5d                   	pop    %ebp
f0106789:	c3                   	ret
f010678a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f0106790:	0f bd f8             	bsr    %eax,%edi
f0106793:	83 f7 1f             	xor    $0x1f,%edi
f0106796:	75 48                	jne    f01067e0 <__udivdi3+0xa0>
f0106798:	39 f0                	cmp    %esi,%eax
f010679a:	72 06                	jb     f01067a2 <__udivdi3+0x62>
f010679c:	31 c0                	xor    %eax,%eax
f010679e:	39 dd                	cmp    %ebx,%ebp
f01067a0:	72 de                	jb     f0106780 <__udivdi3+0x40>
f01067a2:	b8 01 00 00 00       	mov    $0x1,%eax
f01067a7:	eb d7                	jmp    f0106780 <__udivdi3+0x40>
f01067a9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
f01067b0:	89 d9                	mov    %ebx,%ecx
f01067b2:	85 db                	test   %ebx,%ebx
f01067b4:	75 0b                	jne    f01067c1 <__udivdi3+0x81>
f01067b6:	b8 01 00 00 00       	mov    $0x1,%eax
f01067bb:	31 d2                	xor    %edx,%edx
f01067bd:	f7 f3                	div    %ebx
f01067bf:	89 c1                	mov    %eax,%ecx
f01067c1:	31 d2                	xor    %edx,%edx
f01067c3:	89 f0                	mov    %esi,%eax
f01067c5:	f7 f1                	div    %ecx
f01067c7:	89 c6                	mov    %eax,%esi
f01067c9:	89 e8                	mov    %ebp,%eax
f01067cb:	89 f7                	mov    %esi,%edi
f01067cd:	f7 f1                	div    %ecx
f01067cf:	89 fa                	mov    %edi,%edx
f01067d1:	83 c4 1c             	add    $0x1c,%esp
f01067d4:	5b                   	pop    %ebx
f01067d5:	5e                   	pop    %esi
f01067d6:	5f                   	pop    %edi
f01067d7:	5d                   	pop    %ebp
f01067d8:	c3                   	ret
f01067d9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
f01067e0:	89 f9                	mov    %edi,%ecx
f01067e2:	ba 20 00 00 00       	mov    $0x20,%edx
f01067e7:	29 fa                	sub    %edi,%edx
f01067e9:	d3 e0                	shl    %cl,%eax
f01067eb:	89 44 24 08          	mov    %eax,0x8(%esp)
f01067ef:	89 d1                	mov    %edx,%ecx
f01067f1:	89 d8                	mov    %ebx,%eax
f01067f3:	d3 e8                	shr    %cl,%eax
f01067f5:	89 c1                	mov    %eax,%ecx
f01067f7:	8b 44 24 08          	mov    0x8(%esp),%eax
f01067fb:	09 c1                	or     %eax,%ecx
f01067fd:	89 f0                	mov    %esi,%eax
f01067ff:	89 4c 24 08          	mov    %ecx,0x8(%esp)
f0106803:	89 f9                	mov    %edi,%ecx
f0106805:	d3 e3                	shl    %cl,%ebx
f0106807:	89 d1                	mov    %edx,%ecx
f0106809:	d3 e8                	shr    %cl,%eax
f010680b:	89 f9                	mov    %edi,%ecx
f010680d:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
f0106811:	89 eb                	mov    %ebp,%ebx
f0106813:	d3 e6                	shl    %cl,%esi
f0106815:	89 d1                	mov    %edx,%ecx
f0106817:	d3 eb                	shr    %cl,%ebx
f0106819:	09 f3                	or     %esi,%ebx
f010681b:	89 c6                	mov    %eax,%esi
f010681d:	89 f2                	mov    %esi,%edx
f010681f:	89 d8                	mov    %ebx,%eax
f0106821:	f7 74 24 08          	divl   0x8(%esp)
f0106825:	89 d6                	mov    %edx,%esi
f0106827:	89 c3                	mov    %eax,%ebx
f0106829:	f7 64 24 0c          	mull   0xc(%esp)
f010682d:	39 d6                	cmp    %edx,%esi
f010682f:	72 1f                	jb     f0106850 <__udivdi3+0x110>
f0106831:	89 f9                	mov    %edi,%ecx
f0106833:	d3 e5                	shl    %cl,%ebp
f0106835:	39 c5                	cmp    %eax,%ebp
f0106837:	73 04                	jae    f010683d <__udivdi3+0xfd>
f0106839:	39 d6                	cmp    %edx,%esi
f010683b:	74 13                	je     f0106850 <__udivdi3+0x110>
f010683d:	89 d8                	mov    %ebx,%eax
f010683f:	31 ff                	xor    %edi,%edi
f0106841:	e9 3a ff ff ff       	jmp    f0106780 <__udivdi3+0x40>
f0106846:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
f010684d:	00 
f010684e:	66 90                	xchg   %ax,%ax
f0106850:	8d 43 ff             	lea    -0x1(%ebx),%eax
f0106853:	31 ff                	xor    %edi,%edi
f0106855:	e9 26 ff ff ff       	jmp    f0106780 <__udivdi3+0x40>
f010685a:	66 90                	xchg   %ax,%ax
f010685c:	66 90                	xchg   %ax,%ax
f010685e:	66 90                	xchg   %ax,%ax

f0106860 <__umoddi3>:
f0106860:	f3 0f 1e fb          	endbr32
f0106864:	55                   	push   %ebp
f0106865:	57                   	push   %edi
f0106866:	56                   	push   %esi
f0106867:	53                   	push   %ebx
f0106868:	83 ec 1c             	sub    $0x1c,%esp
f010686b:	8b 5c 24 34          	mov    0x34(%esp),%ebx
f010686f:	8b 44 24 3c          	mov    0x3c(%esp),%eax
f0106873:	8b 74 24 30          	mov    0x30(%esp),%esi
f0106877:	8b 7c 24 38          	mov    0x38(%esp),%edi
f010687b:	89 da                	mov    %ebx,%edx
f010687d:	85 c0                	test   %eax,%eax
f010687f:	75 17                	jne    f0106898 <__umoddi3+0x38>
f0106881:	39 fb                	cmp    %edi,%ebx
f0106883:	73 53                	jae    f01068d8 <__umoddi3+0x78>
f0106885:	89 f0                	mov    %esi,%eax
f0106887:	f7 f7                	div    %edi
f0106889:	89 d0                	mov    %edx,%eax
f010688b:	31 d2                	xor    %edx,%edx
f010688d:	83 c4 1c             	add    $0x1c,%esp
f0106890:	5b                   	pop    %ebx
f0106891:	5e                   	pop    %esi
f0106892:	5f                   	pop    %edi
f0106893:	5d                   	pop    %ebp
f0106894:	c3                   	ret
f0106895:	8d 76 00             	lea    0x0(%esi),%esi
f0106898:	89 f1                	mov    %esi,%ecx
f010689a:	39 c3                	cmp    %eax,%ebx
f010689c:	73 12                	jae    f01068b0 <__umoddi3+0x50>
f010689e:	89 f0                	mov    %esi,%eax
f01068a0:	83 c4 1c             	add    $0x1c,%esp
f01068a3:	5b                   	pop    %ebx
f01068a4:	5e                   	pop    %esi
f01068a5:	5f                   	pop    %edi
f01068a6:	5d                   	pop    %ebp
f01068a7:	c3                   	ret
f01068a8:	2e 8d b4 26 00 00 00 	lea    %cs:0x0(%esi,%eiz,1),%esi
f01068af:	00 
f01068b0:	0f bd e8             	bsr    %eax,%ebp
f01068b3:	83 f5 1f             	xor    $0x1f,%ebp
f01068b6:	75 48                	jne    f0106900 <__umoddi3+0xa0>
f01068b8:	39 d8                	cmp    %ebx,%eax
f01068ba:	0f 82 d0 00 00 00    	jb     f0106990 <__umoddi3+0x130>
f01068c0:	39 fe                	cmp    %edi,%esi
f01068c2:	0f 83 c8 00 00 00    	jae    f0106990 <__umoddi3+0x130>
f01068c8:	89 c8                	mov    %ecx,%eax
f01068ca:	83 c4 1c             	add    $0x1c,%esp
f01068cd:	5b                   	pop    %ebx
f01068ce:	5e                   	pop    %esi
f01068cf:	5f                   	pop    %edi
f01068d0:	5d                   	pop    %ebp
f01068d1:	c3                   	ret
f01068d2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
f01068d8:	89 f9                	mov    %edi,%ecx
f01068da:	85 ff                	test   %edi,%edi
f01068dc:	75 0b                	jne    f01068e9 <__umoddi3+0x89>
f01068de:	b8 01 00 00 00       	mov    $0x1,%eax
f01068e3:	31 d2                	xor    %edx,%edx
f01068e5:	f7 f7                	div    %edi
f01068e7:	89 c1                	mov    %eax,%ecx
f01068e9:	89 d8                	mov    %ebx,%eax
f01068eb:	31 d2                	xor    %edx,%edx
f01068ed:	f7 f1                	div    %ecx
f01068ef:	89 f0                	mov    %esi,%eax
f01068f1:	f7 f1                	div    %ecx
f01068f3:	89 d0                	mov    %edx,%eax
f01068f5:	31 d2                	xor    %edx,%edx
f01068f7:	eb 94                	jmp    f010688d <__umoddi3+0x2d>
f01068f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
f0106900:	89 e9                	mov    %ebp,%ecx
f0106902:	ba 20 00 00 00       	mov    $0x20,%edx
f0106907:	29 ea                	sub    %ebp,%edx
f0106909:	d3 e0                	shl    %cl,%eax
f010690b:	89 44 24 08          	mov    %eax,0x8(%esp)
f010690f:	89 d1                	mov    %edx,%ecx
f0106911:	89 f8                	mov    %edi,%eax
f0106913:	d3 e8                	shr    %cl,%eax
f0106915:	89 54 24 04          	mov    %edx,0x4(%esp)
f0106919:	8b 54 24 04          	mov    0x4(%esp),%edx
f010691d:	89 c1                	mov    %eax,%ecx
f010691f:	8b 44 24 08          	mov    0x8(%esp),%eax
f0106923:	09 c1                	or     %eax,%ecx
f0106925:	89 d8                	mov    %ebx,%eax
f0106927:	89 4c 24 08          	mov    %ecx,0x8(%esp)
f010692b:	89 e9                	mov    %ebp,%ecx
f010692d:	d3 e7                	shl    %cl,%edi
f010692f:	89 d1                	mov    %edx,%ecx
f0106931:	d3 e8                	shr    %cl,%eax
f0106933:	89 e9                	mov    %ebp,%ecx
f0106935:	89 7c 24 0c          	mov    %edi,0xc(%esp)
f0106939:	d3 e3                	shl    %cl,%ebx
f010693b:	89 c7                	mov    %eax,%edi
f010693d:	89 d1                	mov    %edx,%ecx
f010693f:	89 f0                	mov    %esi,%eax
f0106941:	d3 e8                	shr    %cl,%eax
f0106943:	89 fa                	mov    %edi,%edx
f0106945:	89 e9                	mov    %ebp,%ecx
f0106947:	09 d8                	or     %ebx,%eax
f0106949:	d3 e6                	shl    %cl,%esi
f010694b:	f7 74 24 08          	divl   0x8(%esp)
f010694f:	89 d3                	mov    %edx,%ebx
f0106951:	f7 64 24 0c          	mull   0xc(%esp)
f0106955:	89 c7                	mov    %eax,%edi
f0106957:	89 d1                	mov    %edx,%ecx
f0106959:	39 d3                	cmp    %edx,%ebx
f010695b:	72 06                	jb     f0106963 <__umoddi3+0x103>
f010695d:	75 10                	jne    f010696f <__umoddi3+0x10f>
f010695f:	39 c6                	cmp    %eax,%esi
f0106961:	73 0c                	jae    f010696f <__umoddi3+0x10f>
f0106963:	2b 44 24 0c          	sub    0xc(%esp),%eax
f0106967:	1b 54 24 08          	sbb    0x8(%esp),%edx
f010696b:	89 d1                	mov    %edx,%ecx
f010696d:	89 c7                	mov    %eax,%edi
f010696f:	89 f2                	mov    %esi,%edx
f0106971:	29 fa                	sub    %edi,%edx
f0106973:	19 cb                	sbb    %ecx,%ebx
f0106975:	0f b6 4c 24 04       	movzbl 0x4(%esp),%ecx
f010697a:	89 d8                	mov    %ebx,%eax
f010697c:	d3 e0                	shl    %cl,%eax
f010697e:	89 e9                	mov    %ebp,%ecx
f0106980:	d3 ea                	shr    %cl,%edx
f0106982:	d3 eb                	shr    %cl,%ebx
f0106984:	09 d0                	or     %edx,%eax
f0106986:	89 da                	mov    %ebx,%edx
f0106988:	83 c4 1c             	add    $0x1c,%esp
f010698b:	5b                   	pop    %ebx
f010698c:	5e                   	pop    %esi
f010698d:	5f                   	pop    %edi
f010698e:	5d                   	pop    %ebp
f010698f:	c3                   	ret
f0106990:	89 da                	mov    %ebx,%edx
f0106992:	89 f1                	mov    %esi,%ecx
f0106994:	29 f9                	sub    %edi,%ecx
f0106996:	19 c2                	sbb    %eax,%edx
f0106998:	89 c8                	mov    %ecx,%eax
f010699a:	e9 2b ff ff ff       	jmp    f01068ca <__umoddi3+0x6a>
