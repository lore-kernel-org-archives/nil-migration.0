Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B3F15A7
	for <nil-migration@lists.linux.dev>; Tue, 11 Apr 2023 06:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681195367; x=1712731367;
  h=from:to:cc:subject:references:date:in-reply-to:
   message-id:mime-version;
  bh=ws3OIFgdCaaVGrg+ov7NA8iMejO4xMcRaURgYYOOSM8=;
  b=KvVZH1VwXj7wPUw3u2GFwwEzJWkAmTptuR6lSYQQIAp6MhoYXRQx1ynO
   xvGlp+O26jAJ377T+V2RzZhXNn1MLrR/sBY2WHf4UjTmrq3fknzmQ3Eio
   BElWHQay7EmSRtWIs9iAeCRG7aCZ8qWg+3Uz0NfgpAI2L/O6sEpEiCKlC
   Z41MiQP/YN909eWo/2kFYmgJA9jIGzF5FeRrr1RnOrLNbWVjzoQP5myiq
   vfahOnNSwe7ggv+marRm7LGKLrkb4qS2xyLLXlGyvHsvx5VeuPf6kmioy
   Kazw6zWuEZjzKSWtlAJYUUYcvXD7MXeJevAHscuBCpvnqmnN9AIOsVa6A
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="341027781"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="341027781"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 23:42:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="1018255338"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="1018255338"
Received: from yhuang6-desk2.sh.intel.com (HELO yhuang6-desk2.ccr.corp.intel.com) ([10.238.208.55])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 23:42:18 -0700
From: "Huang, Ying" <ying.huang@intel.com>
To: Gregory Price <gregory.price@memverge.com>
Cc: Dragan Stancevic <dragan@stancevic.com>,
  lsf-pc@lists.linux-foundation.org,  nil-migration@lists.linux.dev,
  linux-cxl@vger.kernel.org,  linux-mm@kvack.org
Subject: Re: [LSF/MM/BPF TOPIC] BoF VM live migration over CXL =?utf-8?Q?m?=
 =?utf-8?Q?emory=E2=80=8B?=
References: <5d1156eb-02ae-a6cc-54bb-db3df3ca0597@stancevic.com>
	<ZDCv3lxLbquITy8M@memverge.com>
Date: Tue, 11 Apr 2023 14:37:50 +0800
In-Reply-To: <ZDCv3lxLbquITy8M@memverge.com> (Gregory Price's message of "Fri,
	7 Apr 2023 20:05:50 -0400")
Message-ID: <87v8i22abl.fsf@yhuang6-desk2.ccr.corp.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: nil-migration@lists.linux.dev
List-Id: <nil-migration.lists.linux.dev>
List-Subscribe: <mailto:nil-migration+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nil-migration+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Gregory Price <gregory.price@memverge.com> writes:

[snip]

> 2. During the migration process, the memory needs to be forced not to be
>    migrated to another node by other means (tiering software, swap,
>    etc).  The obvious way of doing this would be to migrate and
>    temporarily pin the page... but going back to problem #1 we see that
>    ZONE_MOVABLE and Pinning are mutually exclusive.  So that's
>    troublesome.

Can we use memory policy (cpusets, mbind(), set_mempolicy(), etc.) to
avoid move pages out of CXL.mem node?  Now, there are gaps in tiering,
but I think it is fixable.

Best Regards,
Huang, Ying

[snip]
