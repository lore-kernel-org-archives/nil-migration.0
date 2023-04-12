Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB796121
	for <nil-migration@lists.linux.dev>; Wed, 12 Apr 2023 15:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681314661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b8Udey6gD7hkKCelqudc6L+j8l+ybiTD+45ym6JKdjU=;
	b=FJ+poiIS3d9DVkP4Ebn+VqdmBJ2Hi5B5kJhY881ArE8ndsN7ELiJqkSzsD7JV9mHM/8DXO
	uCqKx/2OiRKIuuD++GlHimm8CBuDNtP6GYW5NxQjaGKwo08O06uKEP37ZNgsM90BVbprlv
	gVozZd+y58ZM58o+MjUR4u5nV7DneIo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638-wjI6hGQ_MtCcMghuMrurUg-1; Wed, 12 Apr 2023 11:50:58 -0400
X-MC-Unique: wjI6hGQ_MtCcMghuMrurUg-1
Received: by mail-wr1-f71.google.com with SMTP id s18-20020adfa292000000b002f562b8b12bso29674wra.0
        for <nil-migration@lists.linux.dev>; Wed, 12 Apr 2023 08:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681314657; x=1683906657;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b8Udey6gD7hkKCelqudc6L+j8l+ybiTD+45ym6JKdjU=;
        b=cPdPjdQOL1xGtlV3KhW1g1z2DalcOA3fVT0QkQItKBbKIaR41OTKRFGg/IIneG0vdm
         dcS1HhYsLsy9iHlLiuaab//KQe31JXf1WVf5LwmXBe0q+rDJvf03OQOWa22q/q4W7B6K
         OSu5fClRka3I7Gcsrm4TgHius5dJdF54FArWuGXLm5q34kAnySABDvjklc7HKJPiA/4v
         4vaOUd9x/rqpN3Uip12goWc5LnzK7/XxqVdPB8GeCOqHBS0iQ0/eryot4MtSmsSTIoy9
         yGt4VrmyhU63MFYH4zerbrzZLs/eGRqPEh64TtwDvkaLTqkIJ92N2C3xe0Vh0RbOO0Gx
         Eitw==
X-Gm-Message-State: AAQBX9cSLjf6Sbrejw5/hGrT2GjU6WgztjFaTgayc/eSY7ebu4uyve2g
	X1Yu4Cv9Icej0CWhVX75ejEKXa6gMjMMlAdh7KVcNyRbVxKW0yPRSsOJPxSew2SIdM0SVRYxipn
	Hfi8tlS3OxXJsIpG6UnUJsIs97w==
X-Received: by 2002:a7b:c3c8:0:b0:3ed:f5b5:37fc with SMTP id t8-20020a7bc3c8000000b003edf5b537fcmr2353181wmj.1.1681314657048;
        Wed, 12 Apr 2023 08:50:57 -0700 (PDT)
X-Google-Smtp-Source: AKy350bwlS0al9uG2dSdIlKmYUi9C35HoaEAtA4olxB/jHjibws68jMXRqEnTf209NkApV4poz1+tg==
X-Received: by 2002:a7b:c3c8:0:b0:3ed:f5b5:37fc with SMTP id t8-20020a7bc3c8000000b003edf5b537fcmr2353169wmj.1.1681314656717;
        Wed, 12 Apr 2023 08:50:56 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:4b00:c6fa:b613:dbdc:ab? (p200300cbc7024b00c6fab613dbdc00ab.dip0.t-ipconnect.de. [2003:cb:c702:4b00:c6fa:b613:dbdc:ab])
        by smtp.gmail.com with ESMTPSA id c9-20020a05600c0a4900b003ee6aa4e6a9sm2935483wmq.5.2023.04.12.08.50.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 08:50:56 -0700 (PDT)
Message-ID: <efe5dad7-8e58-b416-8108-bb692c726302@redhat.com>
Date: Wed, 12 Apr 2023 17:50:55 +0200
Precedence: bulk
X-Mailing-List: nil-migration@lists.linux.dev
List-Id: <nil-migration.lists.linux.dev>
List-Subscribe: <mailto:nil-migration+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nil-migration+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
To: Gregory Price <gregory.price@memverge.com>
Cc: "Huang, Ying" <ying.huang@intel.com>,
 Dragan Stancevic <dragan@stancevic.com>, lsf-pc@lists.linux-foundation.org,
 nil-migration@lists.linux.dev, linux-cxl@vger.kernel.org, linux-mm@kvack.org
References: <5d1156eb-02ae-a6cc-54bb-db3df3ca0597@stancevic.com>
 <ZDCv3lxLbquITy8M@memverge.com>
 <87v8i22abl.fsf@yhuang6-desk2.ccr.corp.intel.com>
 <ZDV+f7+QH5W/vXAt@memverge.com>
 <87bkjtzu7e.fsf@yhuang6-desk2.ccr.corp.intel.com>
 <f4f9eedf-c514-3388-29ad-dcb497a19303@redhat.com>
 <ZDbNoNN0nkzn4xe6@memverge.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: =?UTF-8?Q?Re=3a_=5bLSF/MM/BPF_TOPIC=5d_BoF_VM_live_migration_over_C?=
 =?UTF-8?B?WEwgbWVtb3J54oCL?=
In-Reply-To: <ZDbNoNN0nkzn4xe6@memverge.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.04.23 17:26, Gregory Price wrote:
> On Wed, Apr 12, 2023 at 10:38:04AM +0200, David Hildenbrand wrote:
>> On 12.04.23 04:54, Huang, Ying wrote:
>>> Gregory Price <gregory.price@memverge.com> writes:
>>>
>>>> On Tue, Apr 11, 2023 at 02:37:50PM +0800, Huang, Ying wrote:
>>>>> Gregory Price <gregory.price@memverge.com> writes:
>>>>>
>>>>> [snip]
>>>>>
>>>>>> 2. During the migration process, the memory needs to be forced not to be
>>>>>>      migrated to another node by other means (tiering software, swap,
>>>>>>      etc).  The obvious way of doing this would be to migrate and
>>>>>>      temporarily pin the page... but going back to problem #1 we see that
>>>>>>      ZONE_MOVABLE and Pinning are mutually exclusive.  So that's
>>>>>>      troublesome.
>>>>>
>>>>> Can we use memory policy (cpusets, mbind(), set_mempolicy(), etc.) to
>>>>> avoid move pages out of CXL.mem node?  Now, there are gaps in tiering,
>>>>> but I think it is fixable.
>>>>>
>>>>> Best Regards,
>>>>> Huang, Ying
>>>>>
>>>>> [snip]
>>>>
>>>> That feels like a hack/bodge rather than a proper solution to me.
>>>>
>>>> Maybe this is an affirmative argument for the creation of an EXMEM
>>>> zone.
>>>
>>> Let's start with requirements.  What is the requirements for a new zone
>>> type?
>>
>> I'm stills scratching my head regarding this. I keep hearing all different
>> kind of statements that just add more confusions "we want it to be
>> hotunpluggable" "we want to allow for long-term pinning memory" "but we
>> still want it to be movable" "we want to place some unmovable allocations on
>> it". Huh?
>>
>> Just to clarify: ZONE_MOVABLE allows for pinning. It just doesn't allow for
>> long-term pinning of memory.
>>
> 
> I apologize for the confusion, this is my fault.  I had assumed that
> since dax regions can't be pinned, subsequent nodes backed by a dax
> device could not be pinned.  In testing this, this is not the case.
> 
> Re: long-term pinning, can you be more explicit as to what is considered
> long-term?  Minutes? hours? days? etc

long-term: possibly forever, controlled by user space. In practice, 
anything longer than ~10 seconds ( best guess :) ). There can be 
long-term pinnings that are of very short duration, we just don't know 
what user space is up to and when it will decide to unpin.

Assume user space requests to trigger read/write of a user space page to 
a file: the page is pinned, DMA is started, once DMA completes the page 
is unpinned. Short-term. User space does not control how long the page 
remains pinned.

In contrast:

Example #1: mapping VM guest memory into an IOMMU using vfio for PCI 
passthrough requires pinning the pages. Until user space decides to 
unmap the pages from the IOMMU, the pages will remain pinned. -> long-term

Example #2: mapping a user space address range into an IOMMU to 
repeatedly perform RDMA using that address range requires pinning the 
pages. Until user space decides to unregister that range, the pages 
remain pinned. -> long-term

Example #3: registering a user space address range with io_uring as a 
fixed buffer, such that io_uring OPS can avoid the page table walks by 
simply using the pinned pages that were looked up once. As long as the 
fixed buffer remains registered, the pages stay pinned. -> long-term

-- 
Thanks,

David / dhildenb

