Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4D32F24
	for <nil-migration@lists.linux.dev>; Wed, 12 Apr 2023 08:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681288688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ti3j3d9k9vuAnWKNJ1m/mxjRXId1YNvSwaENJe/WWtQ=;
	b=OCSdn8Xlsvw4yrIdbVWNUryvx7uExTYmAaObPmwoE+XEXHe+n+kWg2q/XpPfeYfd6mdvQU
	BpndXTiiWK/atfJ7PdcFTI2Uc/NIN0jJ2QHJjLdGLDP43x6hMpj8RFL0VPclIJU/T/D9uo
	hUg9jnX2jWNsF4bWHP9dTGYKDU1RLyc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-c5ilr7bIPpqWyFjg3e1Quw-1; Wed, 12 Apr 2023 04:38:07 -0400
X-MC-Unique: c5ilr7bIPpqWyFjg3e1Quw-1
Received: by mail-wm1-f72.google.com with SMTP id m7-20020a05600c3b0700b003ee112e6df1so2720479wms.2
        for <nil-migration@lists.linux.dev>; Wed, 12 Apr 2023 01:38:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681288686; x=1683880686;
        h=content-transfer-encoding:in-reply-to:subject:organization:from
         :references:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ti3j3d9k9vuAnWKNJ1m/mxjRXId1YNvSwaENJe/WWtQ=;
        b=S5EZr23XEYSQWySPkbbS0pS7udJ6NDE7dujcbatzboKbsZSNZ5V93B79eWK+MZrG2N
         CNWYxKTyE8B1Y7yRyMepTC5TRB3dKe2FOOyG34+CtWhmEB9IOoK6ylBpaYdwBU24TUCs
         z8dzCIUlymlGygvc9l4ZGHcpktUSnQAPx43O14sLYz3QImVu/4HbR/VHJoYQS2rNZ7JF
         CbhBdGcwXhYLuVMU3Q2VRmV+qI/fL9F0ITRmc7pRjp5tj1E9QeYxtEUgZPEvUE88pUkY
         eQPkOt8Ldzffzabpbk1pbrMFn3Nt7CKLXI3vzHOjzHKOlkB74uipY1WsljOXv98zFZnt
         ZHBA==
X-Gm-Message-State: AAQBX9fq5DyYl0sWaPUbOfRqkgNcuFIXBJO0RbCbAOmCDF7Mj898Phx3
	tMjbnp+3kpluw/v+edbeAZstxVHibWEKbDh7bxnzVMwIzXz5ICJv2mFPRZ8u214p54BETaXoOxw
	ZEs3J9p2JlElMgZNIcyh7oYx+bg==
X-Received: by 2002:a7b:c386:0:b0:3ed:8780:f265 with SMTP id s6-20020a7bc386000000b003ed8780f265mr12154014wmj.21.1681288686324;
        Wed, 12 Apr 2023 01:38:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350a6zjmQhTioVzjwahDEwgvxsQMm7XPDrFYXNSLu8OiEDGDN4wH+L1RNsifRWzHOhrdD4rdeRA==
X-Received: by 2002:a7b:c386:0:b0:3ed:8780:f265 with SMTP id s6-20020a7bc386000000b003ed8780f265mr12154002wmj.21.1681288685934;
        Wed, 12 Apr 2023 01:38:05 -0700 (PDT)
Received: from ?IPV6:2003:cb:c702:4b00:c6fa:b613:dbdc:ab? (p200300cbc7024b00c6fab613dbdc00ab.dip0.t-ipconnect.de. [2003:cb:c702:4b00:c6fa:b613:dbdc:ab])
        by smtp.gmail.com with ESMTPSA id o3-20020a05600c4fc300b003ee1e07a14asm1548735wmq.45.2023.04.12.01.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 01:38:05 -0700 (PDT)
Message-ID: <f4f9eedf-c514-3388-29ad-dcb497a19303@redhat.com>
Date: Wed, 12 Apr 2023 10:38:04 +0200
Precedence: bulk
X-Mailing-List: nil-migration@lists.linux.dev
List-Id: <nil-migration.lists.linux.dev>
List-Subscribe: <mailto:nil-migration+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nil-migration+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
To: "Huang, Ying" <ying.huang@intel.com>,
 Gregory Price <gregory.price@memverge.com>
Cc: Dragan Stancevic <dragan@stancevic.com>,
 lsf-pc@lists.linux-foundation.org, nil-migration@lists.linux.dev,
 linux-cxl@vger.kernel.org, linux-mm@kvack.org
References: <5d1156eb-02ae-a6cc-54bb-db3df3ca0597@stancevic.com>
 <ZDCv3lxLbquITy8M@memverge.com>
 <87v8i22abl.fsf@yhuang6-desk2.ccr.corp.intel.com>
 <ZDV+f7+QH5W/vXAt@memverge.com>
 <87bkjtzu7e.fsf@yhuang6-desk2.ccr.corp.intel.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: =?UTF-8?Q?Re=3a_=5bLSF/MM/BPF_TOPIC=5d_BoF_VM_live_migration_over_C?=
 =?UTF-8?B?WEwgbWVtb3J54oCL?=
In-Reply-To: <87bkjtzu7e.fsf@yhuang6-desk2.ccr.corp.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.04.23 04:54, Huang, Ying wrote:
> Gregory Price <gregory.price@memverge.com> writes:
> 
>> On Tue, Apr 11, 2023 at 02:37:50PM +0800, Huang, Ying wrote:
>>> Gregory Price <gregory.price@memverge.com> writes:
>>>
>>> [snip]
>>>
>>>> 2. During the migration process, the memory needs to be forced not to be
>>>>     migrated to another node by other means (tiering software, swap,
>>>>     etc).  The obvious way of doing this would be to migrate and
>>>>     temporarily pin the page... but going back to problem #1 we see that
>>>>     ZONE_MOVABLE and Pinning are mutually exclusive.  So that's
>>>>     troublesome.
>>>
>>> Can we use memory policy (cpusets, mbind(), set_mempolicy(), etc.) to
>>> avoid move pages out of CXL.mem node?  Now, there are gaps in tiering,
>>> but I think it is fixable.
>>>
>>> Best Regards,
>>> Huang, Ying
>>>
>>> [snip]
>>
>> That feels like a hack/bodge rather than a proper solution to me.
>>
>> Maybe this is an affirmative argument for the creation of an EXMEM
>> zone.
> 
> Let's start with requirements.  What is the requirements for a new zone
> type?

I'm stills scratching my head regarding this. I keep hearing all 
different kind of statements that just add more confusions "we want it 
to be hotunpluggable" "we want to allow for long-term pinning memory" 
"but we still want it to be movable" "we want to place some unmovable 
allocations on it". Huh?

Just to clarify: ZONE_MOVABLE allows for pinning. It just doesn't allow 
for long-term pinning of memory.

For good reason, because long-term pinning of memory is just the worst 
(memory waste, fragmentation, overcommit) and instead of finding new 
ways to *avoid* long-term pinnings, we're coming up with advanced 
concepts to work-around the fundamental property of long-term pinnings.

We want all memory to be long-term pinnable and we want all memory to be 
movable/hotunpluggable. That's not going to work.

If you'd ask me today, my prediction is that ZONE_EXMEM is not going to 
happen.

-- 
Thanks,

David / dhildenb

