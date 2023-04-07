Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B716AFE7
	for <nil-migration@lists.linux.dev>; Fri,  7 Apr 2023 22:24:01 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id y69so6873313ybe.2
        for <nil-migration@lists.linux.dev>; Fri, 07 Apr 2023 15:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680906241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bvf3MWEQMEfK9l+qtvdnMnbC3l5JejEx7dkk53z/8TE=;
        b=GuEyeS5RXgO1+6zaEPKjGBshS8EnNlWBiytCcVT5bJZ3A7+kk4+kn7i05PVMB0aaL+
         FKYUwu5mmQZUwQ8lduZMhNDfwjXE7W0338LNK/ChXuUqnsEGG1RiKdVXF1mmNtMkaxEZ
         D0+Cj/XKI1wQcChiuUjmAsfFn/8xgsvsDW00OAEteCJQ5prmfNVqm2OIQfupsI0Xtv0C
         lqNa6ijlmNjMFWwJQFLrvonXWasGSanie09BqspDxwSWabzyaAhTjsCQgdyJFq7CtL7V
         4TTGcb88TwLFS6ZsR5M6VEKDIPRyjtpLjCeVgzABEapUQGuKRlazK/2QZmBBVTFJ2VYQ
         EKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680906241;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bvf3MWEQMEfK9l+qtvdnMnbC3l5JejEx7dkk53z/8TE=;
        b=XaPnSfo4ADWUVTgiFJt6zlhewaJ1b2qHwEz5VUOpUUvExKRraaeATOwV8YfWyTnNJC
         o/8dceXvn90ocd58Oq4VEnaghYOmhLw4da9UaPf16kBlGQ0j5F/viQKe0dK6gbkSrtzr
         N/XYUQOCl8aDj7V4w0NKeo3rEa4tPy8XUaVtKlryiMV62E5j8AfYRxk7DyZ70Lx/7hKW
         muxp7OKTXTsLaCFn8r5OsjfJEfKbqSoAeFsBqErdskiuPUtRlWdXu6rZ/rZ5XWC3In6V
         QE7W+NtVfkDsLYDBsZtF12zsswBSepiHrjyCWTTPYHfTOWZVutsJSB3vtt2JHID29xAY
         J+zQ==
X-Gm-Message-State: AAQBX9caNk2iq62b1zn8DjIgAXSfopAibL6PLfx6yQqUWtxDE70/bvPU
	Ytr7esvb1b469bRg4NlqKcw/NzSwIKKNfXgdfX/98w==
X-Google-Smtp-Source: AKy350Y6Rkpcq75A5segkxblbg32RhYnioBKRTfMOHFt/eNpONDcF4WQ1RsCHQ8O7pehwaVni+1xlgj59i7JK4mJosE=
X-Received: by 2002:a25:cad1:0:b0:b78:4788:525b with SMTP id
 a200-20020a25cad1000000b00b784788525bmr2649501ybg.0.1680906240805; Fri, 07
 Apr 2023 15:24:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: nil-migration@lists.linux.dev
List-Id: <nil-migration.lists.linux.dev>
List-Subscribe: <mailto:nil-migration+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nil-migration+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <5d1156eb-02ae-a6cc-54bb-db3df3ca0597@stancevic.com>
In-Reply-To: <5d1156eb-02ae-a6cc-54bb-db3df3ca0597@stancevic.com>
From: James Houghton <jthoughton@google.com>
Date: Fri, 7 Apr 2023 18:23:24 -0400
Message-ID: <CADrL8HXLEd8PsCn0y7hfFNsGPoV8nyXokL-_wmmXE=TuV6ML=g@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_=5BLSF=2FMM=2FBPF_TOPIC=5D_BoF_VM_live_migration_over_CX?=
	=?UTF-8?Q?L_memory=E2=80=8B?=
To: Dragan Stancevic <dragan@stancevic.com>
Cc: lsf-pc@lists.linux-foundation.org, nil-migration@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-mm@kvack.org, 
	David Rientjes <rientjes@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 7, 2023 at 5:05=E2=80=AFPM Dragan Stancevic <dragan@stancevic.c=
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

Hi Dragan,

Thanks for bringing up this topic. I'd be very interested to be part
of this BoF, as I'm also interested in using CXL.mem as a live
migration mechanism.

- James

>
>
> [1]. High-level overview available at http://nil-migration.org/
> [2]. Based on CXL spec 3.0
>
> --
> Peace can only come as a natural consequence
> of universal enlightenment -Dr. Nikola Tesla
>
