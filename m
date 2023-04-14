Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA427C
	for <nil-migration@lists.linux.dev>; Fri, 14 Apr 2023 05:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681450753; x=1712986753;
  h=from:to:cc:subject:references:date:in-reply-to:
   message-id:mime-version;
  bh=O1LRDFz3R3Vdf4KXd96xJLQIEE7mfukbxNtrhi8lDHE=;
  b=hVcImZl+uJ++1XKFd0ivhxxAjQiGIInVS297Nmv7YNJEqSj964RZ12cG
   6fBdwA4CiIp0GI9LH08yc05QbhuXONRpu1eKwfudz/oWb9P3KvX1SjZSi
   48xi17FRymep/iBID/8lhO227xnQJKMgOuPkIrXGJBsiRxv6Sthe48FwF
   HIbBJ+TJSF/lTj9RxVWhBbtkJW5VM+qIkLojW559NXDmMOEaWN7PR+h2R
   HPhBE1RjFuMFDs3nRU8S1YgR4E+++C6jSkcWZW1KRg2qdeGEaS9BgytPg
   eUzltKkyMZJwkwUxRg6lABDAr9sjHW/I+lUN8lUbicHApdnr8eH3inYC/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="324014976"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="324014976"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 22:39:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="864074929"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="864074929"
Received: from yhuang6-desk2.sh.intel.com (HELO yhuang6-desk2.ccr.corp.intel.com) ([10.238.208.55])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 22:39:09 -0700
From: "Huang, Ying" <ying.huang@intel.com>
To: Dragan Stancevic <dragan@stancevic.com>
Cc: Gregory Price <gregory.price@memverge.com>,
  lsf-pc@lists.linux-foundation.org,  nil-migration@lists.linux.dev,
  linux-cxl@vger.kernel.org,  linux-mm@kvack.org
Subject: Re: [LSF/MM/BPF TOPIC] BoF VM live migration over CXL =?utf-8?Q?m?=
 =?utf-8?Q?emory=E2=80=8B?=
References: <5d1156eb-02ae-a6cc-54bb-db3df3ca0597@stancevic.com>
	<ZDCv3lxLbquITy8M@memverge.com>
	<87v8i22abl.fsf@yhuang6-desk2.ccr.corp.intel.com>
	<4a1e74f5-284f-7bfe-6a79-42b44909ca23@stancevic.com>
Date: Fri, 14 Apr 2023 13:35:50 +0800
In-Reply-To: <4a1e74f5-284f-7bfe-6a79-42b44909ca23@stancevic.com> (Dragan
	Stancevic's message of "Thu, 13 Apr 2023 22:33:24 -0500")
Message-ID: <87r0sn10w9.fsf@yhuang6-desk2.ccr.corp.intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Precedence: bulk
X-Mailing-List: nil-migration@lists.linux.dev
List-Id: <nil-migration.lists.linux.dev>
List-Subscribe: <mailto:nil-migration+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nil-migration+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Dragan Stancevic <dragan@stancevic.com> writes:

> On 4/11/23 01:37, Huang, Ying wrote:
>> Gregory Price <gregory.price@memverge.com> writes:
>> [snip]
>> 
>>> 2. During the migration process, the memory needs to be forced not to be
>>>     migrated to another node by other means (tiering software, swap,
>>>     etc).  The obvious way of doing this would be to migrate and
>>>     temporarily pin the page... but going back to problem #1 we see that
>>>     ZONE_MOVABLE and Pinning are mutually exclusive.  So that's
>>>     troublesome.
>> Can we use memory policy (cpusets, mbind(), set_mempolicy(), etc.)
>> to
>> avoid move pages out of CXL.mem node?  Now, there are gaps in tiering,
>> but I think it is fixable.
>
>
> Hmmm, I don't know about cpusets. For mbind, are you thinking
> something along the lines of MPOL_MF_MOVE_ALL? I guess it does have
> that deterministic placement, but this would have to be called from
> the process itself. Unlike migrate_pages which takes a pid.

You can still use migrate_pages(2).  But after that, if you want to
prevent the pages to be migrated out of CXL.mem, you can use some kind
of memory policy, such as cpusets, mbind(), set_mempolicy().

Best Regards,
Huang, Ying

> Same for set_mempolicy, right?
>
> I mean I guess, if some of this needs to be added into qemu it's not
> the end of the word...
>
>
>> Best Regards,
>> Huang, Ying
>> [snip]
>> 
