import { PrismaClient, Prisma, User } from '@prisma/client'
import prisma from './client'


it('should create 1 order with an existing customer', async () => {
    let user: Prisma.UserCreateInput = {
        email: 'hyungeun.jin@naver.com'
    };

    let createdUser = await prisma.user.create({
        data: user
    });

    console.log('✨ 1 user successfully created!')

    expect(createdUser).toHaveProperty('id', 1);
});