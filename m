Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC73881F
	for <nil-migration@lists.linux.dev>; Wed,  1 Mar 2023 19:19:50 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id t4so1434148ybg.11
        for <nil-migration@lists.linux.dev>; Wed, 01 Mar 2023 11:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=contractor.linuxfoundation.org; s=google;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=EKrjc/IB9v/b9KJ0GahMmcGC/Rqw0A9GNZ1HbJS9p6oUCg0MYNrG9MpKtVqGkCxJvu
         MX9hRmx7VxjCXaTSCa3vVNZsCJg7B+bw6jNPMobOkKyaSHebOTFS964oHGU2YTu1u7Mg
         Qw0JH48rvtY5CUod+M+VzjUFRwiJab5yvsvr/S5SCkumznK8jVaaR3AZ7TrIDc1iyT78
         ilaXoBRZ27oL80KXgeZSx4ANvzpxju2zcW9gTJ8ogrq9lSrOHufPRovfbttiYWoglPgm
         AeZVkVD8KnnHbGbhMbSbwCX9QLLrUDR24XIxcxjoJkn/kml1C/K2YkMC0SKk8/iVVfQR
         O9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Onvocl7z9tTV39RCCW1Yld6Uw1oloVdWrBn7K39z6I=;
        b=trCa7uYzTMPuEA9lbatb7r+3I+qRiJmKOirI1X7Etgv+25J1suLnEvHKt8jOg2KKYl
         w6GwB5JLbyPimDjpkpj/zo/VgY1anyOTxtIk88+MKhv87rweymDfbraMNI63Awy4UYYc
         JI2S5SVLmedKRPT2Jcm5RlPCLMmWM7GOZf4kcUV05Gz4gbVd++2QMvPTF+ecqza8ptbL
         PWxFnc3B0tV+V0fJ2/9wNmNR7nZyd4x2gwQHo1rdQ5w2XLZlVs3zpDMd6Kg04a7GMe6M
         mLs189Wp3EOiZKAluGt6Yc3PLwRXIAzWs3TNandLXnnUIMQ9W7/VleWdNBsPTfxYri3X
         M6hQ==
X-Gm-Message-State: AO0yUKVRiEs5fD+rQHwvewrvlZQZ6qOfdulQgB/vcQ5RzP7X14SM5qZT
	vM52gcVJBNbQpC5Ckn2c11VQA8+5hLlwvlH0RWrflUzKi2T+N1E/
X-Google-Smtp-Source: AK7set/ZdEc4VXxka6DbPtKJ6W8qCLaZUvImYROE+WEi2DC4lWWlR3X+BlRXrvjxYxt2L2WvuvkIu5xSoDjNG2kEfD8=
X-Received: by 2002:a25:5d0d:0:b0:a8e:a80:ba40 with SMTP id
 r13-20020a255d0d000000b00a8e0a80ba40mr4123334ybb.8.1677698389524; Wed, 01 Mar
 2023 11:19:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: nil-migration@lists.linux.dev
List-Id: <nil-migration.lists.linux.dev>
List-Subscribe: <mailto:nil-migration+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nil-migration+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Shyam Kumar <skachukattu@contractor.linuxfoundation.org>
Date: Thu, 2 Mar 2023 00:49:38 +0530
Message-ID: <CAH=dH98kF2_WgaxXdqTWB7guxdUFzv+7UztHR3HL6UtWPpfQLA@mail.gmail.com>
Subject: Test Mail
To: nil-migration@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello:

 This is a test message to test successful delivery and start the
 archive for the list. Please ignore.

-- 
Regards
Shyam Kumar
The Linux Foundation Core Projects
