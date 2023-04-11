Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A52944C
	for <nil-migration@lists.linux.dev>; Tue, 11 Apr 2023 18:16:52 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-54f64b29207so65698397b3.8
        for <nil-migration@lists.linux.dev>; Tue, 11 Apr 2023 11:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681237011; x=1683829011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7rx3MgpBWYFSw0IirP1+4MZNl+aKRUmf8h7Qo2lJm8=;
        b=S3112uF+4GQy7gKSiXJxNvtx2OI4It5Ba8y7K6Zlh2IZg7chsB4d1xXVoKrIYqk/Cm
         53QdztjZKBzFZR5lL6R2hzkrWMcf49kvC2lxDKEgzs94VBOcWPDG0HQZ/Iwz7W+wZv8X
         fH36ODJlGH+FswwmMEG2CMrOmnwDkdfy1JL2zv4eMVqPpTvzXB28yYKcJqJE/45Vu0Ql
         pe77Q95qrnrgWWXNwpMy8XWxP+YZUDa/93vHsPA559ME3U4eGLXa78rw9z0k3ZLKQ6pi
         QN2J9vLArOFXqQxgKCOd9n0UcW2SN1oMtkxJaxOO0KK+bqP8e35WWNAxeQSpoPlCpUp7
         IZew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681237011; x=1683829011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7rx3MgpBWYFSw0IirP1+4MZNl+aKRUmf8h7Qo2lJm8=;
        b=Qr1OpAApRr1Evx3A2O/7ZB6XIUpdkEVnFy8kYhMpLODoUwD9GfRFDtsB/L9uaIKG/8
         SJC7kvfxeu86WBDj+6237Iy4x1fmCTwO66DGC1J/y17EY6Egce8tT7i7Iq0p8dIgF0RZ
         WPP0b2odvA9QlS/gClhFtymgh1UWBOaPnF0s0ujnsXNSly6AV6O7S8gfA865b2au+yEj
         sEi5fEEM1oI9qghXy8FzLkI5ZQcfsIkBgfF8tPeVWzuG8k7Bd8ziT5vvsxHqp5oNE4Ti
         Opj7TY1nE8o3+yze8i3rLyxdsm2K71GbAnNxSnCaStp2seRlhlXdek+8yG8ieiFGwwGz
         tLnw==
X-Gm-Message-State: AAQBX9cJ4RiZvsuXJhHAOARbWAW2uFHR6HNrM+9AZoCe1sfEArIp3Ae4
	xNIqb1qmc7ne6bl41+d3WX3SEQIOnvjW6tRWL9A=
X-Google-Smtp-Source: AKy350bk2xxu1tDGXhk5Y8qSXEyqsuZLUfelqtG8xI5ro+bRGOPOOTZ5RlCWKatjpuuotajOsg3SOGxmjxwAPjijamo=
X-Received: by 2002:a81:aa14:0:b0:54f:2ad:91c5 with SMTP id
 i20-20020a81aa14000000b0054f02ad91c5mr5288660ywh.3.1681237011487; Tue, 11 Apr
 2023 11:16:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nil-migration@lists.linux.dev
List-Id: <nil-migration.lists.linux.dev>
List-Subscribe: <mailto:nil-migration+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nil-migration+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5d1156eb-02ae-a6cc-54bb-db3df3ca0597@stancevic.com>
In-Reply-To: <5d1156eb-02ae-a6cc-54bb-db3df3ca0597@stancevic.com>
From: RAGHU H <raghuhack78@gmail.com>
Date: Tue, 11 Apr 2023 23:46:40 +0530
Message-ID: <CAGWUp4rVEeUCwyuAc5LqgSbr_SVv4oNGy6vVdNDB+5vrH5AYVw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BLSF=2FMM=2FBPF_TOPIC=5D_BoF_VM_live_migration_over_CX?=
	=?UTF-8?Q?L_memory=E2=80=8B?=
To: Dragan Stancevic <dragan@stancevic.com>
Cc: lsf-pc@lists.linux-foundation.org, nil-migration@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dragan

Please add me to the discussion!

Regards
Raghu

On Sat, Apr 8, 2023 at 2:56=E2=80=AFAM Dragan Stancevic <dragan@stancevic.c=
om> wrote:
>
> Hi folks-
>
> if it's not too late for the schedule...
>
> I am starting to tackle VM live migration and hypervisor clustering over
> switched CXL memory[1][2], intended for cloud virtualization types of loa=
ds.
>
> I'd be interested in doing a small BoF session with some slides and get
> into a discussion/brainstorming with other people that deal with VM/LM
> cloud loads. Among other things to discuss would be page migrations over
> switched CXL memory, shared in-memory ABI to allow VM hand-off between
> hypervisors, etc...
>
> A few of us discussed some of this under the ZONE_XMEM thread, but I
> figured it might be better to start a separate thread.
>
> If there is interested, thank you.
>
>
> [1]. High-level overview available at http://nil-migration.org/
> [2]. Based on CXL spec 3.0
>
> --
> Peace can only come as a natural consequence
> of universal enlightenment -Dr. Nikola Tesla
