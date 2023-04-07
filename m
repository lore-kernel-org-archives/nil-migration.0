Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C002B6ADB
	for <nil-migration@lists.linux.dev>; Fri,  7 Apr 2023 23:17:46 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1a1b23f49e2so253515ad.0
        for <nil-migration@lists.linux.dev>; Fri, 07 Apr 2023 16:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680909466;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XRUtTEKX+n7UBbsK34WbxjxwX6QenHFH+gAQ+uuZMvs=;
        b=lKqMBgOn/2L7pcyqMHT2eybjOcP9+WrO4JGoXpODVzQKKq0cyHN5uqhxQIsCNm3yID
         FOLKOh2QsVt3+3Byg26XjfMkU9tPMDF0uJWsdTC10WQfOQhILFf6GHW7QdMi5EljxUKb
         Kc4WjKPeQP255du4grmjZ/WXgPChWt12y3Cr3spDVYtbcQQiEJbagDK0G8staZdQCX2v
         eVRHsKvJ/S236edTXf140NYVlnbE5yv2YRQpQbffAMGobWcC9i/1ZuLahdbvVAGBWGY0
         8gYHBLYgXv4q5srmonNkBSEr6Xh45sDq1PoJQXKurPSaWR4kKcqBiiCJuEs6OZ8lZWTG
         FNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680909466;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XRUtTEKX+n7UBbsK34WbxjxwX6QenHFH+gAQ+uuZMvs=;
        b=yFtzipBPv8E+synlFJqj7FuWHy+PLszlh1YohuGUFLrqCFrrE3T5Ji/VWnYNWhG2oJ
         b9YJGfGMmdtJR8L+pnXqaa7eHnc2LbTH/sDpdKJNGRqyB0JTEVgQZUzu1tTlnHjDXFfY
         24r69c2TnGuPPaBkYLfBvKqW+t5Ow5DsTN8tC9v9io4RBnpbsWloAVugvAB72l6X7hLl
         7aRDWxUPTyG0ZDsiYlZfwCdxKKeJ3nk+pscM8o2q1SZJZCxe4E1HP5pkzTewaQRjS0E9
         QiRWT+kbVu2fJCA955JZq6SIlD4NBBBm07/txA4n4R3bF5P3H7geKI79cyDa/ZxHnIg4
         v4pw==
X-Gm-Message-State: AAQBX9dmogmwKb1ELCGujkEs1qsLjR3fEgDicXRHhzLgkII3k7+vg3wp
	TxjNywmlDh9nMlcdmiYaFO2Log==
X-Google-Smtp-Source: AKy350ZpcbUrgvuGPFXz/OtUlAC2vJPwb2ngTOqGzeYD0kNEzBS+0fzA61GYdCXF3G7egyVrye5AEg==
X-Received: by 2002:a17:903:50e:b0:1a1:e93c:8932 with SMTP id jn14-20020a170903050e00b001a1e93c8932mr31422plb.15.1680909465933;
        Fri, 07 Apr 2023 16:17:45 -0700 (PDT)
Received: from [2620:0:1008:11:ca86:d1ff:e8ce:81ad] ([2620:0:1008:11:ca86:d1ff:e8ce:81ad])
        by smtp.gmail.com with ESMTPSA id e18-20020aa78c52000000b0062a474cd46asm3514937pfd.137.2023.04.07.16.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Apr 2023 16:17:45 -0700 (PDT)
Date: Fri, 7 Apr 2023 16:17:44 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: James Houghton <jthoughton@google.com>, 
    Dragan Stancevic <dragan@stancevic.com>
cc: lsf-pc@lists.linux-foundation.org, nil-migration@lists.linux.dev, 
    linux-cxl@vger.kernel.org, linux-mm@kvack.org
Subject: =?UTF-8?Q?Re=3A_=5BLSF=2FMM=2FBPF_TOPIC=5D_BoF_VM_live_migrat?=
 =?UTF-8?Q?ion_over_CXL_memory=E2=80=8B?=
In-Reply-To: <CADrL8HXLEd8PsCn0y7hfFNsGPoV8nyXokL-_wmmXE=TuV6ML=g@mail.gmail.com>
Message-ID: <8fada43c-8319-4d1a-9614-3ac3c76d59f3@google.com>
References: <5d1156eb-02ae-a6cc-54bb-db3df3ca0597@stancevic.com> <CADrL8HXLEd8PsCn0y7hfFNsGPoV8nyXokL-_wmmXE=TuV6ML=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: nil-migration@lists.linux.dev
List-Id: <nil-migration.lists.linux.dev>
List-Subscribe: <mailto:nil-migration+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nil-migration+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="2003089352-936004858-1680909465=:3318474"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--2003089352-936004858-1680909465=:3318474
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 7 Apr 2023, James Houghton wrote:

> On Fri, Apr 7, 2023 at 5:05 PM Dragan Stancevic <dragan@stancevic.com> wrote:
> >
> > Hi folks-
> >
> > if it's not too late for the schedule...
> >
> > I am starting to tackle VM live migration and hypervisor clustering over
> > switched CXL memory[1][2], intended for cloud virtualization types of loads.
> >
> > I'd be interested in doing a small BoF session with some slides and get
> > into a discussion/brainstorming with other people that deal with VM/LM
> > cloud loads. Among other things to discuss would be page migrations over
> > switched CXL memory, shared in-memory ABI to allow VM hand-off between
> > hypervisors, etc...
> >
> > A few of us discussed some of this under the ZONE_XMEM thread, but I
> > figured it might be better to start a separate thread.
> >
> > If there is interested, thank you.
> 
> Hi Dragan,
> 
> Thanks for bringing up this topic. I'd be very interested to be part
> of this BoF, as I'm also interested in using CXL.mem as a live
> migration mechanism.
> 

Thanks for cc'ing me, this would be very interesting to talk about.  Count 
me in!

> > [1]. High-level overview available at http://nil-migration.org/
> > [2]. Based on CXL spec 3.0
> >

Dragan: I'm curious about the reference to CXL spec 3.0 here, is there 
something specific about 3.0 that this work depends on or should we be 
good-to-go with 2.0 as well?  (Are you referring to 3.0 for security 
extensions?)
--2003089352-936004858-1680909465=:3318474--
