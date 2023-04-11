Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB8E944C
	for <nil-migration@lists.linux.dev>; Tue, 11 Apr 2023 18:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681236054; x=1712772054;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=vmA3xk4DjZmDJu8SYkGhKpH80tDfxKa0abTU4/7ZjRU=;
  b=jJlWlnHvKYJGlHtopGkZkFYPT87RYfQjCFxh/0b4LlYZQqhy4fB/xIZz
   mRdqA3zhrQQb2nnVcvlOFxzjn1CGXJ+324CJivPxXB7U6qPZktmRtXosG
   ztlJgfyHEtlNXt4o48LH37B8lixoBehe+o0bTgrZie+LSP7FnOqbQN/Bs
   BnJOCi8joU9JTYQ9jt3hyUWYaCUEDbO3Vfga1Gu2y1D6M3qIOD2y2kDhv
   Zjqq6YzgPeC9pohdQb4HOOft9yWAae3vFEpq5WzGvM8H4hgFQFVDDE/q5
   tRQckVj3cbJzzzdmvJ8XNdzu65jM+aqebzLop3KI7t73CCHMUP/gdw9y6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="343699520"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="343699520"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 11:00:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="757942293"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="757942293"
Received: from gtryonx-mobl.amr.corp.intel.com (HELO [10.209.72.81]) ([10.209.72.81])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 11:00:03 -0700
Message-ID: <14a601ea-8cf8-bb9c-a87a-63567c5aba5b@intel.com>
Date: Tue, 11 Apr 2023 11:00:02 -0700
Precedence: bulk
X-Mailing-List: nil-migration@lists.linux.dev
List-Id: <nil-migration.lists.linux.dev>
List-Subscribe: <mailto:nil-migration+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nil-migration+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: =?UTF-8?Q?Re=3a_=5bLSF/MM/BPF_TOPIC=5d_BoF_VM_live_migration_over_C?=
 =?UTF-8?B?WEwgbWVtb3J54oCL?=
Content-Language: en-US
To: Dragan Stancevic <dragan@stancevic.com>, lsf-pc@lists.linux-foundation.org
Cc: nil-migration@lists.linux.dev, linux-cxl@vger.kernel.org,
 linux-mm@kvack.org
References: <5d1156eb-02ae-a6cc-54bb-db3df3ca0597@stancevic.com>
From: Dave Hansen <dave.hansen@intel.com>
In-Reply-To: <5d1156eb-02ae-a6cc-54bb-db3df3ca0597@stancevic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/7/23 14:05, Dragan Stancevic wrote:
> I'd be interested in doing a small BoF session with some slides and get
> into a discussion/brainstorming with other people that deal with VM/LM
> cloud loads. Among other things to discuss would be page migrations over
> switched CXL memory, shared in-memory ABI to allow VM hand-off between
> hypervisors, etc...

How would 'struct page' or other kernel metadata be handled?

I assume you'd want a really big CXL memory device with as many hosts
connected to it as is feasible.  But, in order to hand the memory off
from one host to another, both would need to have metadata for it at
_some_ point.

So, do all hosts have metadata for the whole CXL memory device all the
time?  Or, would they create the metadata (hotplug) when a VM is
migrated in and destroy it (hot unplug) when a VM is migrated out?

That gets back to the granularity question discussed elsewhere in the
thread.  How would the metadata allocation granularity interact with the
page allocation granularity?  How would fragmentation be avoided so that
hosts don't eat up all their RAM with unused metadata?
